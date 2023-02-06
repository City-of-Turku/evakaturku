package fi.ouka.evakaoulu.invoice.service

import fi.turku.evakaturku.invoice.service.InvoiceChecker
import org.junit.jupiter.api.Test

internal class InvoiceCheckerTest {
    @Test
    fun `should return true for Invoices with restricted head of family details`() {
        val invoice = validInvoice().copy(headOfFamily = personWithRestrictedDetails())
        val invoiceChecker = InvoiceChecker()

        assert(invoiceChecker.shouldSendManually(invoice) == true)
    }

    @Test
    fun `should return true for Invoices without head of family SSN`() {
        val invoice = validInvoice().copy(headOfFamily = personWithoutSSN())
        val invoiceChecker = InvoiceChecker()

        assert(invoiceChecker.shouldSendManually(invoice) == true)
    }

    @Test
    fun `should return false for Invoices without restricted head of family details and with head of family SSN`() {
        val invoice = validInvoice()
        val invoiceChecker = InvoiceChecker()

        assert(invoiceChecker.shouldSendManually(invoice) == false)
    }
}

