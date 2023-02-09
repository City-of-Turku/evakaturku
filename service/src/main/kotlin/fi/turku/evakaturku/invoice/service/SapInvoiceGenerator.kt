// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.invoice.service

import fi.espoo.evaka.daycare.CareType
import fi.espoo.evaka.invoicing.domain.InvoiceDetailed
import fi.espoo.evaka.invoicing.integration.InvoiceIntegrationClient
import fi.turku.evakaturku.invoice.config.Product
import fi.turku.evakaturku.util.FieldType
import fi.turku.evakaturku.util.FinanceDateProvider
import org.springframework.stereotype.Component
import java.io.FileOutputStream
import java.io.StringWriter
import java.lang.Math.abs
import java.text.SimpleDateFormat
import java.time.LocalDate
import java.time.format.DateTimeFormatter
import java.util.*
import javax.xml.bind.JAXBContext
import javax.xml.bind.JAXBException
import javax.xml.bind.Marshaller
import javax.xml.stream.XMLStreamWriter


@Component
class SapInvoiceGenerator(private val invoiceChecker: InvoiceChecker, val financeDateProvider: FinanceDateProvider) : StringInvoiceGenerator {

    fun generateInvoiceTitle(): String {
        val previousMonth = financeDateProvider.previousMonth()
        return "Varhaiskasvatus " + previousMonth
    }



    override fun generateInvoice(invoices: List<InvoiceDetailed>): StringInvoiceGenerator.InvoiceGeneratorResult {

        var successList = mutableListOf<InvoiceDetailed>()
        var failedList = mutableListOf<InvoiceDetailed>()
        var manuallySentList = mutableListOf<InvoiceDetailed>()

        val (manuallySent, succeeded) = invoices.partition { invoice -> invoiceChecker.shouldSendManually(invoice) }
        manuallySentList.addAll(manuallySent)

        val idocs: MutableList<ORDERS05.IDOC> = mutableListOf()
        succeeded.forEach {
            idocs.add(generateIdoc(it))
            //idocs.add(generateIdoc())
            successList.add(it)
        }

        var invoiceString = ""
        try {
            invoiceString = marshalInvoices(idocs)
            print(invoiceString)
        }
        catch (e: JAXBException) {
            failedList.addAll(successList)
            successList.clear()
        }

        return StringInvoiceGenerator.InvoiceGeneratorResult(
            InvoiceIntegrationClient.SendResult(
                successList,
                failedList,
                manuallySentList
            ), invoiceString
        )
    }

    private fun generateIdoc(invoice: InvoiceDetailed): ORDERS05.IDOC {
    //private fun generateIdoc(): ORDERS05.IDOC {

        val idoc = ORDERS05.IDOC()

        // EDIDC40
        val edidc40 = ORDERS05.IDOC.EDIDC40()
        idoc.edidc40 = edidc40
        edidc40.tabnam = "EDI_DC40"
        edidc40.direct = "2"
        edidc40.idoctyp = "ORDERS05"
        edidc40.mestyp = "ORDERS"
        edidc40.sndpor = ""
        edidc40.sndprt = "LS"
        edidc40.sndprn = "VAK_1002"
        edidc40.rcvpor = ""
        edidc40.rcvprt = ""
        edidc40.rcvprn = ""

        // E1EDK01
        val e1edk01 = ORDERS05.IDOC.E1EDK01()
        idoc.e1EDK01 = e1edk01
        e1edk01.zterm = ""
        e1edk01.augru = ""

        // E1EDK14
        val e1EDK14list : MutableList<ORDERS05.IDOC.E1EDK14> = mutableListOf()
        val e1edk14 = ORDERS05.IDOC.E1EDK14()
        e1edk14.qualf = "006"
        e1edk14.orgid = "2E"
        e1EDK14list.add(e1edk14)

        val e1edk14_2 = ORDERS05.IDOC.E1EDK14()
        e1edk14_2.qualf = "007"
        e1edk14_2.orgid = "22"
        e1EDK14list.add(e1edk14_2)

        val e1edk14_3 = ORDERS05.IDOC.E1EDK14()
        e1edk14_3.qualf = "008"
        e1edk14_3.orgid = "2100"
        e1EDK14list.add(e1edk14_3)

        val e1edk14_4 = ORDERS05.IDOC.E1EDK14()
        e1edk14_4.qualf = "012"
        e1edk14_4.orgid = "ZMT"
        e1EDK14list.add(e1edk14_4)

        val e1edk14_5 = ORDERS05.IDOC.E1EDK14()
        e1edk14_5.qualf = "016"
        e1edk14_5.orgid = "A010"
        e1EDK14list.add(e1edk14_5)

        val e1edk14_6 = ORDERS05.IDOC.E1EDK14()
        e1edk14_6.qualf = "019"
        e1edk14_6.orgid = "VAK"
        e1EDK14list.add(e1edk14_6)

        idoc.e1EDK14 = e1EDK14list

        // E1EDK03
        val e1edk03list : MutableList<ORDERS05.IDOC.E1EDK03> = mutableListOf()
        val e1edk03 = ORDERS05.IDOC.E1EDK03()
        e1edk03.iddat = "016"
        e1edk03.datum = SimpleDateFormat("yyyyMMdd").format(Date()) //Current date now. Should be asked from Turku
        e1edk03list.add(e1edk03)

        val e1edk03_2 = ORDERS05.IDOC.E1EDK03()
        e1edk03_2.iddat = "024"
        e1edk03_2.datum = invoice.invoiceDate.toString() //TO BE CONTINUED
        e1edk03list.add(e1edk03_2)

        idoc.e1EDK03 = e1edk03list

        // E1EDKA1
        val e1edka1list : MutableList<ORDERS05.IDOC.E1EDKA1> = mutableListOf()

        val e1edka1 = ORDERS05.IDOC.E1EDKA1()
        e1edka1.parvw = "AG"
        e1edka1.partn = "45100001"
        e1edka1list.add(e1edka1)

        val e1edka1_2 = ORDERS05.IDOC.E1EDKA1()
        e1edka1_2.parvw = "RE"
        e1edka1_2.partn = "45100001"
        e1edka1list.add(e1edka1_2)

        val e1edka1_3 = ORDERS05.IDOC.E1EDKA1()
        e1edka1_3.parvw = "RG"
        e1edka1_3.partn = "45100001"
        e1edka1list.add(e1edka1_3)

        val e1edka1_4 = ORDERS05.IDOC.E1EDKA1()
        e1edka1_4.parvw = "WE"
        e1edka1_4.partn = "45100001"
        e1edka1list.add(e1edka1_4)

        val e1edka1_5 = ORDERS05.IDOC.E1EDKA1()
        e1edka1_5.parvw = "Y1"
        e1edka1_5.partn = "45100002"
        e1edka1list.add(e1edka1_5)


        idoc.e1EDKA1 = e1edka1list



        return idoc
    }

    fun marshalInvoices(idocs: List<ORDERS05.IDOC>): String {
        val contextObj: JAXBContext = JAXBContext.newInstance(ORDERS05::class.java)

        val marshallerObj: Marshaller = contextObj.createMarshaller()
        marshallerObj.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true)

        val orders05 = ORDERS05()
        orders05.idoc = idocs

        val stringWriter = StringWriter()
        marshallerObj.marshal(orders05, stringWriter)
        return stringWriter.toString()
    }
}