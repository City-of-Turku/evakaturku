package fi.turku.evakaturku.payment.service

import fi.espoo.evaka.invoicing.domain.Payment
import fi.espoo.evaka.invoicing.domain.PaymentIntegrationClient
import fi.turku.evakaturku.util.FinanceDateProvider
import jakarta.xml.bind.JAXBContext
import jakarta.xml.bind.JAXBException
import jakarta.xml.bind.Marshaller
import org.springframework.stereotype.Component
import java.io.StringWriter
import java.time.format.DateTimeFormatter
import java.util.*

@Component
class SapPaymentGenerator(private val paymentChecker: PaymentChecker, val financeDateProvider: FinanceDateProvider) {

    data class Result(
        val sendResult: PaymentIntegrationClient.SendResult = PaymentIntegrationClient.SendResult(),
        val paymentStrings: MutableList<String> = mutableListOf()
    )

    fun generatePayments(payments: List<Payment> ): Result {
        var successList = mutableListOf<Payment>()
        var failedList = mutableListOf<Payment>()

        val paymentStrings = mutableListOf<String>()

        val (failed, succeeded) = payments.partition { payment -> paymentChecker.shouldFail(payment) }
        failedList.addAll(failed)

        val idocs: MutableList<FIDCCP02.IDOC> = mutableListOf()
        var identifier = 1
        succeeded.forEach {
            idocs.add(generateIdoc(it, identifier)) //TODO: Add identifier for every invoice
            successList.add(it)
            identifier++
        }

        try {
            paymentStrings.add(marshalPayments(idocs))
            print(paymentStrings[0])
        }
        catch (e: JAXBException) {
            failedList.addAll(successList)
            successList.clear()
        }

        return Result(PaymentIntegrationClient.SendResult(successList, failedList), paymentStrings)
    }

    fun generateIdoc(payment: Payment, identifier: Int): FIDCCP02.IDOC {
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

        //E1FIKPF
        val e1FIKPF = FIDCCP02.IDOC.E1FIKPF()
        e1FIKPF.segment = "1"
        e1FIKPF.bukrs = "1002"
        val dateTimeFormatterMonthYear = DateTimeFormatter.ofPattern("MMyy")
        e1FIKPF.gjahr = payment.paymentDate?.format(dateTimeFormatterMonthYear)
        e1FIKPF.blart = "KR"
        val dateTimeFormatterYearMonthDay = DateTimeFormatter.ofPattern("yyyyMMdd")
        e1FIKPF.bldat = payment.paymentDate?.format(dateTimeFormatterYearMonthDay)
        var previousMonth = payment.dueDate?.minusMonths(1)
        e1FIKPF.budat = previousMonth?.format(dateTimeFormatterYearMonthDay)
        val dateTimeFormatterMonth = DateTimeFormatter.ofPattern("MM")
        e1FIKPF.monat = payment.paymentDate?.format(dateTimeFormatterMonth)
        val dateTimeFormatterE1FIKPFYearMonth = DateTimeFormatter.ofPattern("yyyyMM")
        var formattedRowNumber = "%08d".format(identifier)
        e1FIKPF.xblnr = "VAK" + payment.paymentDate?.format(dateTimeFormatterE1FIKPFYearMonth) + formattedRowNumber
        e1FIKPF.bktxt = "eVAKA"
        e1FIKPF.waers = "EUR"
        e1FIKPF.glvor = "RFBU"
        idoc.e1FIKPF = e1FIKPF

        //E1FISEG
        val e1FISEGlist : MutableList<FIDCCP02.IDOC.E1FIKPF.E1FISEG> = mutableListOf()
        val e1FISEG = FIDCCP02.IDOC.E1FIKPF.E1FISEG()
        e1FISEG.segment = "1"
        e1FISEG.buzei = "001"
        e1FISEG.bschl = "31"
        e1FISEG.shkzg = "H"
        e1FISEG.wrbtr = String.format(Locale.ENGLISH,"%.2f", payment.amount.toDouble() / 100)
        e1FISEG.sgtxt = "eVAKA " + payment.paymentDate?.format(dateTimeFormatterMonth) + "/" + payment.paymentDate?.year
        e1FISEG.xref3 = ""
        val e1FINBU = FIDCCP02.IDOC.E1FIKPF.E1FISEG.E1FINBU()
        e1FINBU.segment = "1"
        e1FINBU.zfbdt = payment.dueDate?.format(dateTimeFormatterYearMonthDay)
        e1FINBU.zterm = "T000"
        e1FINBU.skfbt = String.format(Locale.ENGLISH,"%.2f", payment.amount.toDouble() / 100)
        e1FINBU.reserve = payment.unit.businessId + ";" + payment.unit.iban

        e1FISEG.e1FINBU = e1FINBU
        e1FISEGlist.add(e1FISEG)

        val e1FISEG_2 = FIDCCP02.IDOC.E1FIKPF.E1FISEG()
        e1FISEG_2.segment = "1"
        e1FISEG_2.buzei = "002"
        e1FISEG_2.bschl = "40"
        e1FISEG_2.shkzg = "S"
        e1FISEG_2.mwskz = "P4"
        e1FISEG_2.wrbtr = String.format(Locale.ENGLISH,"%.2f", payment.amount.toDouble() / 100)
        val rowTextWithDaycareName = "eVAKA " + payment.paymentDate?.format(dateTimeFormatterMonth) + "/" + payment.paymentDate?.year + " " + payment.unit.name
        e1FISEG_2.sgtxt = rowTextWithDaycareName //TODO: only first 50 chars
        e1FISEG_2.kokrs = "1000"
        e1FISEG_2.kostl = "0000031440" //TODO: check from customer are we using "Toimittajanumero" field for this?
        e1FISEG_2.aufnr = "000000000000"
        e1FISEG_2.hkont = "0000431500"
        //e1FISEG_2.matnr = "" TODO: asked if we are providing empty value or no value at all
        e1FISEG_2.prctr = ""





        e1FISEGlist.add(e1FISEG_2)

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
