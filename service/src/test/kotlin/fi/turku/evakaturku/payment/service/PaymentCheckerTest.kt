package fi.turku.evakaturku.payment.service

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

class PaymentCheckerTest {

    private val paymentChecker = PaymentChecker()

    @Test
    fun `should fail if provider's iban is null`() {
        val payment = validPayment().copy(unit = validPaymentUnit().copy(iban = null))
        assertThat(paymentChecker.shouldFail(payment)).isTrue
    }

    @Test
    fun `should fail if provider's business ID is null`() {
        val payment = validPayment().copy(unit = validPaymentUnit().copy(businessId = null))
        assertThat(paymentChecker.shouldFail(payment)).isTrue
    }

    @Test
    fun `should fail if provider's provider ID is null`() {
        val payment = validPayment().copy(unit = validPaymentUnit().copy(providerId = null))
        assertThat(paymentChecker.shouldFail(payment)).isTrue
    }

    @Test
    fun `should fail if amount is zero`() {
        val payment = validPayment().copy(amount = 0)
        assertThat(paymentChecker.shouldFail(payment)).isTrue
    }

    @Test
    fun `should fail if amount is less than zero`() {
        val payment = validPayment().copy(amount = -4200)
        assertThat(paymentChecker.shouldFail(payment)).isTrue
    }

    @Test
    fun `should not fail if none of the failing conditions apply`() {
        val payment = validPayment()
        assertThat(paymentChecker.shouldFail(payment)).isFalse
    }
}