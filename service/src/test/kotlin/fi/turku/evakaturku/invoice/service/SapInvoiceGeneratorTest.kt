package fi.turku.evakaturku.invoice.service

import fi.ouka.evakaoulu.invoice.service.validInvoice
import fi.turku.evakaturku.util.FinanceDateProvider
import org.junit.Test
import org.junit.jupiter.api.Assertions.*

class SapInvoiceGeneratorTest {


    @Test
    fun `TABNAM should be constant`() {

        val invoiceGenerator = SapInvoiceGenerator(InvoiceChecker(), FinanceDateProvider())
        val invoiceList = listOf(validInvoice())
        val invoiceString = invoiceGenerator.generateInvoice(invoiceList).invoiceString
        assert(invoiceString.contains("<TABNAM>EDI_DC40</TABNAM>"))
    }
}