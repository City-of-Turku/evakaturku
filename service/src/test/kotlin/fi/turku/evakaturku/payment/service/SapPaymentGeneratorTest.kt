package fi.turku.evakaturku.payment.service

import fi.turku.evakaturku.invoice.service.ORDERS05
import fi.turku.evakaturku.util.FinanceDateProvider
import jakarta.xml.bind.JAXBContext
import jakarta.xml.bind.Marshaller
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Disabled
import org.junit.jupiter.api.Test
import java.io.StringWriter
import org.mockito.kotlin.mock
import fi.espoo.evaka.shared.db.Database

class SapPaymentGeneratorTest {

    val paymentChecker = PaymentChecker()
    val financeDateProvider = FinanceDateProvider()
    val sapPaymentGenerator = SapPaymentGenerator(paymentChecker, financeDateProvider)
    val mockDb = mock<Database.Transaction>()

    @Test
    @Disabled    fun `should generate XML for a payment`() {
        val payment = validPayment()

        val result = sapPaymentGenerator.generatePayments(listOf(payment), 52400, mockDb)

        assert(result.paymentStrings.count() == 1)
    }


    @Test
    @Disabled
    fun `should set some values`() {
        val payment = validPayment()

        val result = sapPaymentGenerator.generatePayments(listOf(payment), 52400, mockDb)
        val resultString = result.paymentStrings[0]
        assert(resultString == "something")
    }
}