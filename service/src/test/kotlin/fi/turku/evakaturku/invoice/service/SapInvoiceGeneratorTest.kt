package fi.turku.evakaturku.invoice.service

import fi.ouka.evakaoulu.invoice.service.validInvoice
import fi.turku.evakaturku.util.FinanceDateProvider
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

class SapInvoiceGeneratorTest {

    fun assertTag(tag: String) {

        val invoiceGenerator = SapInvoiceGenerator(InvoiceChecker(), FinanceDateProvider())
        val invoiceList = listOf(validInvoice())
        val invoiceString = invoiceGenerator.generateInvoice(invoiceList).invoiceString

        assert(invoiceString.contains('<' + tag + '>'))
        assert(invoiceString.contains("</" + tag + '>'))
    }

    fun assertExpectedString(expectedString: String) {
        val invoiceGenerator = SapInvoiceGenerator(InvoiceChecker(), FinanceDateProvider())
        val invoiceList = listOf(validInvoice())
        val invoiceString = invoiceGenerator.generateInvoice(invoiceList).invoiceString
        assert(invoiceString.contains(expectedString))
    }

    fun assertElement(element: String, value: String) {
        val expectedString = '<' + element + '>' + value + "</" + element + '>'
        assertExpectedString(expectedString)
    }

    fun assertEmptyElement(tag: String) {
        assertElement(tag, "")
    }


    @Test
    fun `invoiceGenerator result should have ORDERS05 root element`() {

        assertTag("ORDERS05")
    }

    @Test
    fun `invoiceGenerator result should have IDOC element`() {

        assertTag("IDOC")
    }

    @Test
    fun `TABNAM should have constant value of EDI_DC40`() {
        assertElement("TABNAM", "EDI_DC40")
    }

    @Test
    fun `DIRECT should have constant value of 2`() {
        assertElement("DIRECT", "2")
    }


    @Test
    fun `IDOCTYP should have constant value of ORDRES05`() {
        assertElement("IDOCTYP", "ORDERS05")
    }

    @Test
    fun `SNDPOR should be empty element`() {
        assertEmptyElement("SNDPOR")
    }
}