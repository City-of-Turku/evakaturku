package fi.turku.evakaturku.payment.service

import fi.espoo.evaka.daycare.CareType
import fi.espoo.evaka.invoicing.domain.InvoiceDetailed
import fi.espoo.evaka.invoicing.domain.Payment
import fi.espoo.evaka.invoicing.domain.PaymentIntegrationClient
import fi.turku.evakaturku.invoice.service.ORDERS05
import fi.turku.evakaturku.util.FieldType
import fi.turku.evakaturku.util.FinanceDateProvider
import jakarta.xml.bind.JAXBContext
import jakarta.xml.bind.JAXBException
import jakarta.xml.bind.Marshaller
import org.springframework.stereotype.Component
import java.io.StringWriter
import java.time.LocalDate
import java.time.format.DateTimeFormatter

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
        succeeded.forEach {
            idocs.add(generateIdoc(it, "1")) //TODO: Add identifier for every invoice
            //idocs.add(generateIdoc())
            successList.add(it)
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

    fun generateIdoc(payment: Payment, identifier: String): FIDCCP02.IDOC {
    //fun generateIdoc(): FIDCCP02.IDOC {
        // TODO: mapping here
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
        val dateTimeFormatterE1FIKPF = DateTimeFormatter.ofPattern("MMyy")
        e1FIKPF.gjahr = payment.paymentDate?.format(dateTimeFormatterE1FIKPF)
        e1FIKPF.blart = "KR"
        val dateTimeFormatterE1FIKPFYearMonthDay = DateTimeFormatter.ofPattern("yyyyMMdd")
        e1FIKPF.bldat = payment.paymentDate?.format(dateTimeFormatterE1FIKPFYearMonthDay)

        e1FIKPF.budat = payment.dueDate?.format(dateTimeFormatterE1FIKPFYearMonthDay)
        val dateTimeFormatterE1FIKPFMonth = DateTimeFormatter.ofPattern("MM")
        e1FIKPF.monat = payment.paymentDate?.format(dateTimeFormatterE1FIKPFMonth)
        val dateTimeFormatterE1FIKPFYearMonth = DateTimeFormatter.ofPattern("yyyyMM")
        //var formattedRowNumber = "%08d".format(identifier)
        e1FIKPF.xblnr = "VAK" + payment.paymentDate?.format(dateTimeFormatterE1FIKPFYearMonth) + "formattedRowNumber"



        idoc.e1FIKPF = e1FIKPF


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
