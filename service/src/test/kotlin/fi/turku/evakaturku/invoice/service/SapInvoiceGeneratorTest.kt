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
        val pattern = Regex(expectedString)
        assert(pattern.containsMatchIn(invoiceString))
    }

    fun assertElement(element: String, value: String) {
        val expectedString = '<' + element + '>' + value + "</" + element + '>'
        assertExpectedString(expectedString)
    }

    fun assertEmptyElement(tag: String) {
        assertElement(tag, "")
    }

    //EDIDC40 - Segment

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
    fun `IDOCTYP should have constant value of ORDERS05`() {
        assertElement("IDOCTYP", "ORDERS05")
    }

    @Test
    fun `MESTYP should have constant value of ORDERS`() {
        assertElement("MESTYP", "ORDERS")
    }

    @Test
    fun `SNDPOR should be empty element`() {
        assertEmptyElement("SNDPOR")
    }

    @Test
    fun `SNDPRT should have constant value of LS`() {
        assertElement("SNDPRT", "LS")
    }

    @Test
    fun `SNDPRN should have constant value of VAK_1002`() {
        assertElement("SNDPRN", "VAK_1002")
    }

    @Test
    fun `RCVPOR should be empty element`() {
        assertEmptyElement("RCVPOR")
    }

    @Test
    fun `RCVPRT should be empty element`() {
        assertEmptyElement("RCVPRT")
    }

    @Test
    fun `RCVPRN should be empty element`() {
        assertEmptyElement("RCVPRN")
    }

    //E1EDK01 - Segment
    @Test
    fun `ZTERM should be empty element`() {
        assertEmptyElement("ZTERM")
    }
    @Test
    fun `AUGRU should be empty element`() {
        assertEmptyElement("AUGRU")
    }

    //E1EDK14 - Segment

    fun `QUALF should have constant value of 006`() {
        assertElement("QUALF", "006")
    }

    @Test
    fun `ORGID should have constant value of 2E`() {
        assertElement("ORGID", "2E")
    }

    @Test
    fun `QUALF should have constant value of 007`() {
        assertElement("QUALF", "007")
    }

    @Test
    fun `ORGID should have constant value of 22`() {
        assertElement("ORGID", "22")
    }

    @Test
    fun `QUALF should have constant value of 008`() {
        assertElement("QUALF", "008")
    }

    @Test
    fun `ORGID should have constant value of 2100`() {
        assertElement("ORGID", "2100")
    }

    @Test
    fun `QUALF should have constant value of 012`() {
        assertElement("QUALF", "012")
    }

    @Test
    fun `ORGID should have constant value of ZMT`() {
        assertElement("ORGID", "ZMT")
    }

    @Test
    fun `QUALF should have constant value of 016`() {
        assertElement("QUALF", "016")
    }

    @Test
    fun `ORGID should have constant value of A010`() {
        assertElement("ORGID", "A010")
    }

    @Test
    fun `QUALF should have constant value of 019`() {
        assertElement("QUALF", "019")
    }

    @Test
    fun `ORGID should have constant value of VAK`() {
        assertElement("ORGID", "VAK")
    }

    // E1EDK03 - segment
    @Test
    fun `IDDAT should have constant value of 016`() {
        assertElement("IDDAT", "016")
    }

    @Test
    fun `DATUM should have constant format of yyyyMMdd`() {
        assertElement("DATUM", "\\d{8}")
    }

    @Test
    fun `IDDAT should have constant value of 024`() {
        assertElement("IDDAT", "024")
    }

}