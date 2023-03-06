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
            // idocs.add(generateIdoc(it))
            idocs.add(generateIdoc())
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

    // private fun generateIdoc(payment: Payment): FIDCCP02.IDOC {
    fun generateIdoc(): FIDCCP02.IDOC {
        // TODO: mapping here
        return FIDCCP02.IDOC()
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
