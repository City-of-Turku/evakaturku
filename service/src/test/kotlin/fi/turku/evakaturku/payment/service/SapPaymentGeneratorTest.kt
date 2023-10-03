package fi.turku.evakaturku.payment.service

import fi.espoo.evaka.shared.db.Database
import fi.espoo.evaka.shared.domain.DateRange
import fi.turku.evakaturku.util.FinanceDateProvider
import org.junit.jupiter.api.Disabled
import org.junit.jupiter.api.Test
import org.mockito.kotlin.any
import org.mockito.kotlin.mock
import org.mockito.kotlin.verify
import org.mockito.kotlin.whenever
import java.time.LocalDate

class SapPaymentGeneratorTest {

    val paymentChecker = PaymentChecker()
    val financeDateProvider = FinanceDateProvider()
    val mockMarshaller = mock<PaymentMarshaller>()
    val mockIdocGenerator = mock<IdocGenerator>()
    val sapPaymentGenerator = SapPaymentGenerator(paymentChecker, mockMarshaller, mockIdocGenerator)
    val mockDb = mock<Database.Transaction>()
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
    fun `should use full preschool accounting amount when it is not August`() {
        val payment = validPayment()
        val unit = payment.unit.id
        val payments = listOf(payment)
        whenever(mockFetcher.fetchPreschoolers(any())).thenReturn(mapOf(unit to 10))
        whenever(mockFetcher.fetchPreschoolAccountingAmount(any())).thenReturn(451)
        whenever(mockFetcher.fetchUnitLanguages(any())).thenReturn(mapOf(unit to "fi"))
        whenever(mockIdocGenerator.generate(any(), any(), any())).thenReturn(FIDCCP02.IDOC())
        whenever(mockMarshaller.marshal(any())).thenReturn("XML")

        val result = sapPaymentGenerator.generatePayments(listOf(payment), mockFetcher)

        verify(mockIdocGenerator).generate(payment, 4510, "fi")
    }

    @Test
    fun `should halve the preschool accounting amount and round up in August`() {
        val payment = validPayment().copy(period = DateRange(LocalDate.of(2022, 8, 1), LocalDate.of(2022, 8, 31)))
        val unit = payment.unit.id
        val payments = listOf(payment)
        whenever(mockFetcher.fetchPreschoolers(any())).thenReturn(mapOf(unit to 10))
        whenever(mockFetcher.fetchPreschoolAccountingAmount(any())).thenReturn(451)
        whenever(mockFetcher.fetchUnitLanguages(any())).thenReturn(mapOf(unit to "fi"))
        whenever(mockIdocGenerator.generate(any(), any(), any())).thenReturn(FIDCCP02.IDOC())
        whenever(mockMarshaller.marshal(any())).thenReturn("XML")

        val result = sapPaymentGenerator.generatePayments(listOf(payment), mockFetcher)

        verify(mockIdocGenerator).generate(payment, 2260, "fi")
    }
}
