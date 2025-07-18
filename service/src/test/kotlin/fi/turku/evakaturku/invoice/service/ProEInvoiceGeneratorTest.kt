// SPDX-FileCopyrightText: 2023-2025 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.invoice.service

internal class ProEInvoiceGeneratorTest {
    /*
    val financeDateProvider = mock<FinanceDateProvider>()
    val proEInvoiceGenerator = ProEInvoiceGenerator(InvoiceChecker(), financeDateProvider)

    @BeforeEach
    fun setup() {
        whenever(financeDateProvider.currentDate()).thenReturn("20220505")
        whenever(financeDateProvider.previousMonth()).thenReturn("04.2022")
    }

    @Test
    fun `should return successfully created invoices in success list`() {

        val invoice = validInvoice()
        val invoiceList = listOf(invoice, invoice)

        val generationResult = proEInvoiceGenerator.generateInvoice(invoiceList)
        assertEquals(generationResult.sendResult.succeeded, invoiceList)
        assertEquals(generationResult.sendResult.manuallySent, listOf<InvoiceDetailed>())
        assertEquals(generationResult.sendResult.failed, listOf<InvoiceDetailed>())
    }

    @Test
    fun `should return manually sent invoices in manually list`() {

        val restrictedInvoice = validInvoice().copy(headOfFamily = personWithRestrictedDetails())
        val invoiceWithoutSsn = validInvoice().copy(headOfFamily = personWithoutSSN())
        val invoiceList = listOf(restrictedInvoice, invoiceWithoutSsn)

        val generationResult = proEInvoiceGenerator.generateInvoice(invoiceList)
        assertEquals(generationResult.sendResult.succeeded, listOf<InvoiceDetailed>())
        assertEquals(generationResult.sendResult.manuallySent, invoiceList)
        assertEquals(generationResult.sendResult.failed, listOf<InvoiceDetailed>())
    }

    @Test
    fun `should format invoice rows according to data and formatting`() {

        val format = listOf(
                InvoiceField(InvoiceFieldName.INVOICE_IDENTIFIER, FieldType.ALPHANUMERIC, 1, 11),
                InvoiceField(InvoiceFieldName.CLIENT_NAME1, FieldType.ALPHANUMERIC, 12, 30),
                InvoiceField(InvoiceFieldName.INCLUDED_LATE_PAYMENT_INTEREST, FieldType.NUMERIC, 42, 6, 2)
        )
        val invoiceData = InvoiceData()

        invoiceData.setAlphanumericValue(InvoiceFieldName.INVOICE_IDENTIFIER, "121212A121A")
        invoiceData.setAlphanumericValue(InvoiceFieldName.CLIENT_NAME1, "Jokunen Jaska")
        invoiceData.setNumericValue(InvoiceFieldName.INCLUDED_LATE_PAYMENT_INTEREST, 42)

        val result = proEInvoiceGenerator.generateRow(format, invoiceData)

        assertEquals(result, "121212A121AJokunen Jaska                 00004200\n")
    }

    @Test
    fun `should check that invoice format is a proper one also with invoice function number`() {

        val invoice = validInvoice()
        val longNamedInvoice = validInvoice().copy(headOfFamily = personWithLongName())
        val invoiceList = listOf(invoice, longNamedInvoice)

        val generationResult = proEInvoiceGenerator.generateInvoice(invoiceList)

        var correctInvoice = object {}.javaClass.getResource("/invoice-client/CorrectProEInvoice.txt")?.readText()

        assertEquals(correctInvoice, generationResult.invoiceString)
    }
*/
}
