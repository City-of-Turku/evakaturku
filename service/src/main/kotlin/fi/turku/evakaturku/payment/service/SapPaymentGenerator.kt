package fi.turku.evakaturku.payment.service

import fi.espoo.evaka.daycare.CareType
import fi.espoo.evaka.invoicing.domain.Payment
import fi.espoo.evaka.invoicing.domain.PaymentIntegrationClient
import jakarta.xml.bind.JAXBException
import org.springframework.stereotype.Component
import java.lang.Math.min
import java.time.format.DateTimeFormatter
import java.util.*

@Component
class SapPaymentGenerator(private val paymentChecker: PaymentChecker, private val paymentMarshaller: PaymentMarshaller) {

    data class Result(
        val sendResult: PaymentIntegrationClient.SendResult = PaymentIntegrationClient.SendResult(),
        val paymentStrings: MutableList<String> = mutableListOf()
    )

    fun generatePayments(payments: List<Payment>, preschoolValues: PreschoolValuesFetcher): Result {
        var successList = mutableListOf<Payment>()
        var failedList = mutableListOf<Payment>()

        val paymentStrings = mutableListOf<String>()

        val preSchoolerMap = preschoolValues.fetchPreschoolers(payments)
        val languageMap = preschoolValues.fetchUnitLanguages(payments)
        val preSchoolAccountingAmount = preschoolValues.fetchPreschoolAccountingAmount(payments[0].period)

        val (failed, succeeded) = payments.partition { payment -> paymentChecker.shouldFail(payment) }
        failedList.addAll(failed)

        succeeded.forEach {
            var preSchoolAmount = (preSchoolerMap[it.unit.id] ?: 0) * preSchoolAccountingAmount
            if (it.period.start.monthValue == 8) {
                preSchoolAmount /= 2
            }
            val language = languageMap[it.unit.id] ?: "fi"
            val idocs: MutableList<FIDCCP02.IDOC> = mutableListOf()
            idocs.add(generateIdoc(it, preSchoolAmount, language))

            try {
                paymentStrings.add(paymentMarshaller.marshal(idocs))
                successList.add(it)
            } catch (e: JAXBException) {
                failedList.add(it)
            }
        }

        return Result(PaymentIntegrationClient.SendResult(successList, failedList), paymentStrings)
    }

    fun generateIdoc(payment: Payment, preSchoolAmount: Int, language: String): FIDCCP02.IDOC {
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
        var formattedRowNumber = "%07d".format(payment.number)
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
}
