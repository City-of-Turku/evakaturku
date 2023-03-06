package fi.turku.evakaturku.payment.service

import fi.turku.evakaturku.invoice.service.ORDERS05
import fi.turku.evakaturku.util.FinanceDateProvider
import jakarta.xml.bind.JAXBContext
import jakarta.xml.bind.Marshaller
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import java.io.StringWriter

class SapPaymentGeneratorTest {

    val paymentChecker = PaymentChecker()
    val financeDateProvider = FinanceDateProvider()
    val sapPaymentGenerator = SapPaymentGenerator(paymentChecker, financeDateProvider)

    @Test
    fun `should generate XML for a payment`() {
        val payment = validPayment()

        val result = sapPaymentGenerator.generatePayments(listOf(payment))

        assert(result.paymentStrings.count() == 1)
    }

    @Test
    fun `should set some values`() {
        val payment = validPayment()

        val result = sapPaymentGenerator.generatePayments(listOf(payment))
        val resultString = result.paymentStrings[0]
        assert(resultString == "something")
    }
}