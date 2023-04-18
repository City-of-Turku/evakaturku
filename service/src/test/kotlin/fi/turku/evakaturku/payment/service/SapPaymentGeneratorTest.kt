package fi.turku.evakaturku.payment.service

import fi.espoo.evaka.shared.db.Database
import fi.turku.evakaturku.util.FinanceDateProvider
import org.junit.jupiter.api.Disabled
import org.junit.jupiter.api.Test
import org.mockito.kotlin.mock

class SapPaymentGeneratorTest {

    val paymentChecker = PaymentChecker()
    val financeDateProvider = FinanceDateProvider()
    val sapPaymentGenerator = SapPaymentGenerator(paymentChecker, financeDateProvider)
    val mockDb = mock<Database.Transaction>()

    @Test
    @Disabled
    fun `should generate XML for a payment`() {
        val payment = validPayment()

        val result = sapPaymentGenerator.generatePayments(listOf(payment), mockDb)

        assert(result.paymentStrings.count() == 1)
    }

    @Test
    @Disabled
    fun `should set some values`() {
        val payment = validPayment()

        val result = sapPaymentGenerator.generatePayments(listOf(payment), mockDb)
        val resultString = result.paymentStrings[0]
        assert(resultString == "something")
    }
}
