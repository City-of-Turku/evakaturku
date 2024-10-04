package fi.turku.evakaturku.payment.service

import org.junit.jupiter.api.Disabled
import org.junit.jupiter.api.Test
import org.mockito.kotlin.any
import org.mockito.kotlin.mock
import org.mockito.kotlin.verify
import org.mockito.kotlin.whenever

class SapPaymentGeneratorTest {
    val paymentChecker = PaymentChecker()
    val mockMarshaller = mock<PaymentMarshaller>()
    val mockIdocGenerator = mock<IdocGenerator>()
    val sapPaymentGenerator = SapPaymentGenerator(paymentChecker, mockMarshaller, mockIdocGenerator)
    val mockFetcher = mock<PreschoolValuesFetcher>()

    @Test
    @Disabled
    fun `should generate XML for a payment`() {
        val payment = validPayment()

        val result = sapPaymentGenerator.generatePayments(listOf(payment), mockFetcher)

        assert(result.paymentStrings.count() == 1)
    }

    @Test
    @Disabled
    fun `should set some values`() {
        val payment = validPayment()

        val result = sapPaymentGenerator.generatePayments(listOf(payment), mockFetcher)
        val resultString = result.paymentStrings[0]
        assert(resultString == "something")
    }

    @Test
    fun `should use full preschool accounting amount`() {
        val payment = validPayment()
        val unit = payment.unit.id
        whenever(mockFetcher.fetchPreschoolers(any())).thenReturn(mapOf(unit to 10))
        whenever(mockFetcher.fetchPreschoolAccountingAmount(any())).thenReturn(451)
        whenever(mockFetcher.fetchUnitLanguages(any())).thenReturn(mapOf(unit to "fi"))
        whenever(mockIdocGenerator.generate(any(), any(), any())).thenReturn(FIDCCP02.IDOC())
        whenever(mockMarshaller.marshal(any())).thenReturn("XML")

        sapPaymentGenerator.generatePayments(listOf(payment), mockFetcher)

        verify(mockIdocGenerator).generate(payment, 4510, "fi")
    }
}
