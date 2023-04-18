package fi.turku.evakaturku.payment.service

import fi.espoo.evaka.daycare.CareType
import fi.espoo.evaka.invoicing.domain.Payment
import fi.espoo.evaka.invoicing.domain.PaymentIntegrationClient
import fi.espoo.evaka.shared.DaycareId
import fi.espoo.evaka.shared.db.Database
import fi.espoo.evaka.shared.domain.DateRange
import fi.turku.evakaturku.util.FinanceDateProvider
import jakarta.xml.bind.JAXBContext
import jakarta.xml.bind.JAXBException
import jakarta.xml.bind.Marshaller
import org.springframework.stereotype.Component
import java.io.StringWriter
import java.lang.Math.min
import java.time.format.DateTimeFormatter
import java.util.*

@Component
class SapPaymentGenerator(private val paymentChecker: PaymentChecker, val financeDateProvider: FinanceDateProvider) {

    data class Result(
        val sendResult: PaymentIntegrationClient.SendResult = PaymentIntegrationClient.SendResult(),
        val paymentStrings: MutableList<String> = mutableListOf()
    )

    data class UnitPreSchoolers(
        val unitId: DaycareId,
        val preSchoolers: Int
    )

    data class UnitLanguage(
        val unitId: DaycareId,
        val language: String
    )

    fun Database.Read.fetchPreschoolers(payments: List<Payment>): List<UnitPreSchoolers> {
        val units: MutableList<DaycareId> = mutableListOf()
        payments.forEach { units.add(it.unit.id) }

        return createQuery(
            """
            SELECT placement_unit_id as unitId,count(placement_type) as preSchoolers
            FROM voucher_value_report_decision
            JOIN voucher_value_decision ON voucher_value_report_decision.decision_id = voucher_value_decision.id
            WHERE voucher_value_report_decision.realized_period && :period
            AND voucher_value_decision.placement_unit_id = ANY(:ids)
            AND voucher_value_decision.placement_type in ('PRESCHOOL','PRESCHOOL_DAYCARE')
            AND voucher_value_report_decision.type='ORIGINAL'
            GROUP BY voucher_value_decision.placement_unit_id;
        """
        )
            .bind("ids", units)
            .bind("period", payments[0].period)
            .mapTo<UnitPreSchoolers>()
            .toList()
    }

    fun Database.Read.fetchUnitLanguages(payments: List<Payment>): List<UnitLanguage> {
        val units: MutableList<DaycareId> = mutableListOf()
        payments.forEach { units.add(it.unit.id) }

        return createQuery(
            """
            SELECT id as unitId,language
            FROM daycare
            WHERE daycare.id = ANY(:ids)
        """
        )
            .bind("ids", units)
            .mapTo<UnitLanguage>()
            .toList()
    }

    fun Database.Read.fetchPreschoolAccountingAmount(period: DateRange): Int {
        return createQuery(
            """
            SELECT base_value
            FROM service_need_option_voucher_value
            WHERE service_need_option_id=(
                SELECT id
                FROM service_need_option
                WHERE default_option=true
                AND valid_placement_type='PRESCHOOL')
            AND validity @> :date;
        """
        )
            .bind("date", period.start)
            .mapTo<Int>()
            // this should only ever return one row with one value
            .first()
    }

    fun generatePayments(payments: List<Payment>, tx: Database.Transaction): Result {
        var successList = mutableListOf<Payment>()
        var failedList = mutableListOf<Payment>()

        val paymentStrings = mutableListOf<String>()

        val preSchoolerMap: MutableMap<DaycareId, UnitPreSchoolers> = mutableMapOf()
        tx.fetchPreschoolers(payments).forEach { preSchoolerMap[it.unitId] = it }
        val languageMap: MutableMap<DaycareId, UnitLanguage> = mutableMapOf()
        tx.fetchUnitLanguages(payments).forEach { languageMap[it.unitId] = it }
        val preSchoolAccountingAmount = tx.fetchPreschoolAccountingAmount(payments[0].period)

        val (failed, succeeded) = payments.partition { payment -> paymentChecker.shouldFail(payment) }
        failedList.addAll(failed)

        var identifier = 1
        succeeded.forEach {
            var preSchoolAmount = (preSchoolerMap[it.unit.id]?.preSchoolers ?: 0) * preSchoolAccountingAmount
            if (it.period.start.monthValue == 8) {
                preSchoolAmount /= 2
            }
            val language = languageMap[it.unit.id]?.language ?: "fi"
            val idocs: MutableList<FIDCCP02.IDOC> = mutableListOf()
            idocs.add(generateIdoc(it, identifier, preSchoolAmount, language))
            identifier++

            try {
                paymentStrings.add(marshalPayments(idocs))
                successList.add(it)
            } catch (e: JAXBException) {
                failedList.add(it)
            }
        }

        return Result(PaymentIntegrationClient.SendResult(successList, failedList), paymentStrings)
    }

    fun generateIdoc(payment: Payment, identifier: Int, preSchoolAmount: Int, language: String): FIDCCP02.IDOC {
        val idoc = FIDCCP02.IDOC()
        idoc.begin = "1"

        // EDI_DC40
        val edidc40 = FIDCCP02.IDOC.EDIDC40()
        edidc40.segment = "1"
        edidc40.tabnam = "EDI_DC40"
        edidc40.direct = "2"
        edidc40.idoctyp = "FIDCCP02"
        edidc40.mestyp = "FIDCC2"
        edidc40.sndpor = ""
        edidc40.sndprt = "LS"
        edidc40.sndprn = "VAK_1002"
        edidc40.rcvpor = ""
        edidc40.rcvprt = "LS"
        edidc40.rcvprn = ""
        idoc.edidc40 = edidc40

        // E1FIKPF
        val e1FIKPF = FIDCCP02.IDOC.E1FIKPF()
        e1FIKPF.segment = "1"
        e1FIKPF.bukrs = "1002"
        val dateTimeFormatterYear = DateTimeFormatter.ofPattern("yyyy")
        e1FIKPF.gjahr = payment.paymentDate?.format(dateTimeFormatterYear)
        e1FIKPF.blart = "KR"
        val dateTimeFormatterYearMonthDay = DateTimeFormatter.ofPattern("yyyyMMdd")
        e1FIKPF.bldat = payment.paymentDate?.format(dateTimeFormatterYearMonthDay)
        var previousMonth = payment.dueDate?.minusMonths(1)
        e1FIKPF.budat = previousMonth?.format(dateTimeFormatterYearMonthDay)
        val dateTimeFormatterMonth = DateTimeFormatter.ofPattern("MM")
        e1FIKPF.monat = previousMonth?.format(dateTimeFormatterMonth)
        val dateTimeFormatterE1FIKPFYearMonth = DateTimeFormatter.ofPattern("yyyyMM")
        var formattedRowNumber = "%07d".format(identifier)
        e1FIKPF.xblnr = "VAK" + previousMonth?.format(dateTimeFormatterE1FIKPFYearMonth) + formattedRowNumber
        e1FIKPF.bktxt = "eVAKA"
        e1FIKPF.waers = "EUR"
        e1FIKPF.glvor = "RFBU"
        idoc.e1FIKPF = e1FIKPF

        // E1FISEG
        val e1FISEGlist: MutableList<FIDCCP02.IDOC.E1FIKPF.E1FISEG> = mutableListOf()
        val e1FISEG = FIDCCP02.IDOC.E1FIKPF.E1FISEG()
        e1FISEG.segment = "1"
        e1FISEG.buzei = "001"
        e1FISEG.bschl = "31"
        e1FISEG.shkzg = "H"
        e1FISEG.wrbtr = String.format(Locale.ENGLISH, "%.2f", payment.amount.toDouble() / 100)
        e1FISEG.sgtxt = "eVAKA " + previousMonth?.format(dateTimeFormatterMonth) + "/" + payment.paymentDate?.year
        e1FISEG.xref3 = ""
        val e1FINBU = FIDCCP02.IDOC.E1FIKPF.E1FISEG.E1FINBU()
        e1FINBU.segment = "1"
        e1FINBU.zfbdt = payment.dueDate?.format(dateTimeFormatterYearMonthDay)
        e1FINBU.zterm = "T000"
        e1FINBU.skfbt = String.format(Locale.ENGLISH, "%.2f", payment.amount.toDouble() / 100)
        e1FINBU.reserve = payment.unit.businessId + ";" + payment.unit.iban?.replace(" ", "")

        e1FISEG.e1FINBU = e1FINBU
        e1FISEGlist.add(e1FISEG)

        val e1FISEG_2 = FIDCCP02.IDOC.E1FIKPF.E1FISEG()
        e1FISEG_2.segment = "1"
        e1FISEG_2.buzei = "002"
        e1FISEG_2.bschl = "40"
        e1FISEG_2.shkzg = "S"
        e1FISEG_2.mwskz = "P4"
        var daycareAmount = payment.amount - preSchoolAmount
        e1FISEG_2.wrbtr = String.format(Locale.ENGLISH, "%.2f", daycareAmount.toDouble() / 100)
        val rowTextWithDaycareName = "eVAKA " + previousMonth?.format(dateTimeFormatterMonth) + "/" + payment.paymentDate?.year + " " + payment.unit.name
        e1FISEG_2.sgtxt = rowTextWithDaycareName.substring(0, min(rowTextWithDaycareName.length, 35))
        e1FISEG_2.kokrs = "1000"
        if (payment.unit.careType.contains(CareType.FAMILY)) {
            e1FISEG_2.kostl = "0000031442"
        } else if (payment.unit.careType.contains(CareType.GROUP_FAMILY)) {
            e1FISEG_2.kostl = "0000031444"
        } else {
            if (language == "sv") {
                e1FISEG_2.kostl = "0000031441"
            } else {
                e1FISEG_2.kostl = "0000031440"
            }
        }
        e1FISEG_2.aufnr = "000000000000"
        e1FISEG_2.hkont = "0000431500"
        e1FISEG_2.prctr = ""
        e1FISEGlist.add(e1FISEG_2)

        if (preSchoolAmount > 0) {
            val e1FISEG_3 = FIDCCP02.IDOC.E1FIKPF.E1FISEG()
            e1FISEG_3.segment = "1"
            e1FISEG_3.buzei = "003"
            e1FISEG_3.bschl = "40"
            e1FISEG_3.shkzg = "S"
            e1FISEG_3.mwskz = "P4"
            e1FISEG_3.wrbtr = String.format(Locale.ENGLISH, "%.2f", preSchoolAmount.toDouble() / 100)
            e1FISEG_3.sgtxt = rowTextWithDaycareName.substring(0, min(rowTextWithDaycareName.length, 35))
            e1FISEG_3.kokrs = "1000"
            e1FISEG_3.kostl = "0000031410"
            e1FISEG_3.aufnr = "000000000000"
            e1FISEG_3.hkont = "0000430800"
            e1FISEG_3.prctr = ""
            e1FISEGlist.add(e1FISEG_3)
        }

        idoc.e1FIKPF.e1FISEG = e1FISEGlist
        return idoc
    }

    fun marshalPayments(idocs: List<FIDCCP02.IDOC>): String {
        val contextObj: JAXBContext = JAXBContext.newInstance(FIDCCP02::class.java)

        val marshallerObj: Marshaller = contextObj.createMarshaller()
        marshallerObj.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true)

        val fidccp02 = fi.turku.evakaturku.payment.service.FIDCCP02()
        fidccp02.idoc = idocs

        val stringWriter = StringWriter()
        marshallerObj.marshal(fidccp02, stringWriter)
        return stringWriter.toString()
    }
}
