// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.invoice.service

import fi.espoo.evaka.invoicing.domain.InvoiceDetailed
import fi.espoo.evaka.invoicing.integration.InvoiceIntegrationClient
import fi.turku.evakaturku.invoice.config.Product
import fi.turku.evakaturku.util.FinanceDateProvider
import jakarta.xml.bind.JAXBContext
import jakarta.xml.bind.JAXBException
import jakarta.xml.bind.Marshaller
import org.springframework.stereotype.Component
import java.io.StringWriter
import java.text.SimpleDateFormat
import java.time.format.DateTimeFormatter
import java.util.*


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
        e1edk03_2.datum = SimpleDateFormat("yyyyMMdd").format(Date()) //Current date now. Should be asked from Turku
        // invoice.invoiceDate.toString() //TO BE CONTINUED
        e1edk03list.add(e1edk03_2)

        idoc.e1EDK03 = e1edk03list

        // E1EDKA1
        val e1edka1list : MutableList<ORDERS05.IDOC.E1EDKA1> = mutableListOf()

        val e1edka1 = ORDERS05.IDOC.E1EDKA1()
        e1edka1.parvw = "AG"
        e1edka1.partn = invoice.headOfFamily.ssn.toString()

        val nameInInvoiceAG = invoice.headOfFamily.lastName + " " + invoice.headOfFamily.firstName
        if (nameInInvoiceAG.count() > 35)
        {
            e1edka1.name1 = nameInInvoiceAG.substring(0, 35)
            if (nameInInvoiceAG.length > 70) {
                e1edka1.name2 = nameInInvoiceAG.substring(35, 70)
                if (nameInInvoiceAG.length > 105)
                {
                    e1edka1.name3 = nameInInvoiceAG.substring(70, 105)
                    if (nameInInvoiceAG.length > 140)
                    {
                        e1edka1.name4 = nameInInvoiceAG.substring(105, 140)
                    }
                    else
                    {
                        e1edka1.name4 = nameInInvoiceAG.substring(105, nameInInvoiceAG.length)
                    }
                }
                else
                {
                    e1edka1.name3 = nameInInvoiceAG.substring(70, nameInInvoiceAG.length)
                }
            }
            else
            {
                e1edka1.name2 = nameInInvoiceAG.substring(35, nameInInvoiceAG.length)
            }
        }
        else
        {
            e1edka1.name1 = invoice.headOfFamily.lastName + " " + invoice.headOfFamily.firstName
        }

        val streetAddressAG = invoice.headOfFamily.streetAddress
        if (streetAddressAG.count() > 35)
        {
            e1edka1.stras = streetAddressAG.substring(0, 35)
            if (streetAddressAG.length > 70) {
                e1edka1.strs2 = streetAddressAG.substring(35, 70)
            }
            else
            {
                e1edka1.strs2 = streetAddressAG.substring(35, streetAddressAG.length)
            }
        }

        e1edka1.pstlz = invoice.headOfFamily.postalCode
        e1edka1.orT01 = invoice.headOfFamily.postOffice
        e1edka1.land1 = "FI"


        e1edka1list.add(e1edka1)

        val e1edka1_2 = ORDERS05.IDOC.E1EDKA1()
        e1edka1_2.parvw = "RE"
        e1edka1_2.partn = invoice.headOfFamily.ssn.toString()
        val nameInInvoiceRE = invoice.headOfFamily.lastName + " " + invoice.headOfFamily.firstName

        if (nameInInvoiceRE.count() > 35)
        {
            e1edka1_2.name1 = nameInInvoiceRE.substring(0, 35)
            if (nameInInvoiceRE.length > 70) {
                e1edka1_2.name2 = nameInInvoiceRE.substring(35, 70)
                if (nameInInvoiceRE.length > 105)
                {
                    e1edka1_2.name3 = nameInInvoiceRE.substring(70, 105)
                    if (nameInInvoiceRE.length > 140)
                    {
                        e1edka1_2.name4 = nameInInvoiceRE.substring(105, 140)
                    }
                    else
                    {
                        e1edka1_2.name4 = nameInInvoiceRE.substring(105, nameInInvoiceRE.length)
                    }
                }
                else
                {
                    e1edka1_2.name3 = nameInInvoiceRE.substring(70, nameInInvoiceRE.length)
                }
            }
            else
            {
                e1edka1_2.name2 = nameInInvoiceRE.substring(35, nameInInvoiceRE.length)
            }
        }
        else
        {
            e1edka1_2.name1 = invoice.headOfFamily.lastName + " " + invoice.headOfFamily.firstName
        }

        val streetAddressRE = invoice.headOfFamily.streetAddress
        if (streetAddressRE.count() > 35)
        {
            e1edka1_2.stras = streetAddressRE.substring(0, 35)
            if (streetAddressRE.length > 70) {
                e1edka1_2.strs2 = streetAddressRE.substring(35, 70)
            }
            else
            {
                e1edka1_2.strs2 = streetAddressRE.substring(35, streetAddressRE.length)
            }
        }

        e1edka1_2.pstlz = invoice.headOfFamily.postalCode
        e1edka1_2.orT01 = invoice.headOfFamily.postOffice
        e1edka1list.add(e1edka1_2)

        val e1edka1_3 = ORDERS05.IDOC.E1EDKA1()
        e1edka1_3.parvw = "RG"
        e1edka1_3.partn = invoice.headOfFamily.ssn.toString()

        val nameInInvoiceRG = invoice.headOfFamily.lastName + " " + invoice.headOfFamily.firstName
        if (nameInInvoiceRG.count() > 35)
        {
            e1edka1_3.name1 = nameInInvoiceRG.substring(0, 35)
            if (nameInInvoiceRG.length > 70) {
                e1edka1_3.name2 = nameInInvoiceRG.substring(35, 70)
                if (nameInInvoiceRG.length > 105)
                {
                    e1edka1_3.name3 = nameInInvoiceRG.substring(70, 105)
                    if (nameInInvoiceRG.length > 140)
                    {
                        e1edka1_3.name4 = nameInInvoiceRG.substring(105, 140)
                    }
                    else
                    {
                        e1edka1_3.name4 = nameInInvoiceRG.substring(105, nameInInvoiceRG.length)
                    }
                }
                else
                {
                    e1edka1_3.name3 = nameInInvoiceRG.substring(70, nameInInvoiceRG.length)
                }
            }
            else
            {
                e1edka1_3.name2 = nameInInvoiceRG.substring(35, nameInInvoiceRG.length)
            }
        }
        else
        {
            e1edka1_3.name1 = invoice.headOfFamily.lastName + " " + invoice.headOfFamily.firstName
        }

        val streetAddressRG = invoice.headOfFamily.streetAddress
        if (streetAddressRG.count() > 35)
        {
            e1edka1_3.stras = streetAddressRG.substring(0, 35)
            if (streetAddressRG.length > 70) {
                e1edka1_3.strs2 = streetAddressRG.substring(35, 70)
            }
            else
            {
                e1edka1_3.strs2 = streetAddressRG.substring(35, streetAddressRG.length)
            }
        }

        e1edka1_3.pstlz = invoice.headOfFamily.postalCode
        e1edka1_3.orT01 = invoice.headOfFamily.postOffice
        e1edka1list.add(e1edka1_3)

        val e1edka1_4 = ORDERS05.IDOC.E1EDKA1()
        e1edka1_4.parvw = "WE"
        e1edka1_4.partn = invoice.headOfFamily.ssn.toString()

        val nameInInvoiceWE = invoice.headOfFamily.lastName + " " + invoice.headOfFamily.firstName
        if (nameInInvoiceWE.count() > 35)
        {
            e1edka1_4.name1 = nameInInvoiceWE.substring(0, 35)
            if (nameInInvoiceWE.length > 70) {
                e1edka1_4.name2 = nameInInvoiceWE.substring(35, 70)
                if (nameInInvoiceWE.length > 105)
                {
                    e1edka1_4.name3 = nameInInvoiceWE.substring(70, 105)
                    if (nameInInvoiceWE.length > 140)
                    {
                        e1edka1_4.name4 = nameInInvoiceWE.substring(105, 140)
                    }
                    else
                    {
                        e1edka1_4.name4 = nameInInvoiceWE.substring(105, nameInInvoiceWE.length)
                    }
                }
                else
                {
                    e1edka1_4.name3 = nameInInvoiceWE.substring(70, nameInInvoiceWE.length)
                }
            }
            else
            {
                e1edka1_4.name2 = nameInInvoiceWE.substring(35, nameInInvoiceWE.length)
            }
        }
        else
        {
            e1edka1_4.name1 = invoice.headOfFamily.lastName + " " + invoice.headOfFamily.firstName
        }

        val streetAddressWE = invoice.headOfFamily.streetAddress
        if (streetAddressWE.count() > 35)
        {
            e1edka1_4.stras = streetAddressWE.substring(0, 35)
            if (streetAddressWE.length > 70) {
                e1edka1_4.strs2 = streetAddressWE.substring(35, 70)
            }
            else
            {
                e1edka1_4.strs2 = streetAddressWE.substring(35, streetAddressWE.length)
            }
        }

        e1edka1_4.pstlz = invoice.headOfFamily.postalCode
        e1edka1_4.orT01 = invoice.headOfFamily.postOffice
        e1edka1list.add(e1edka1_4)


        if (invoice.codebtor != null)//
        {
            val e1edka1_5 = ORDERS05.IDOC.E1EDKA1()
            e1edka1_5.parvw = "Y1"
            e1edka1_5.partn = invoice.codebtor?.ssn.toString()
            //e1edka1_4.name1 = invoice.codebtor?.lastName + " " + invoice.codebtor?.firstName

            val nameOfCodebtorY1 = invoice.codebtor?.lastName + " " + invoice.codebtor?.firstName
            if (nameOfCodebtorY1.count() > 35)
            {
                e1edka1_3.name1 = nameOfCodebtorY1.substring(0, 35)
                if (nameOfCodebtorY1.length > 70) {
                    e1edka1_3.name2 = nameOfCodebtorY1.substring(35, 70)
                    if (nameOfCodebtorY1.length > 105)
                    {
                        e1edka1_3.name3 = nameOfCodebtorY1.substring(70, 105)
                        if (nameOfCodebtorY1.length > 140)
                        {
                            e1edka1_3.name4 = nameOfCodebtorY1.substring(105, 140)
                        }
                        else
                        {
                            e1edka1_3.name4 = nameOfCodebtorY1.substring(105, nameOfCodebtorY1.length)
                        }
                    }
                    else
                    {
                        e1edka1_3.name3 = nameOfCodebtorY1.substring(70, nameOfCodebtorY1.length)
                    }
                }
                else
                {
                    e1edka1_3.name2 = nameOfCodebtorY1.substring(35, nameOfCodebtorY1.length)
                }
            }
            else
            {
                e1edka1_3.name1 = invoice.headOfFamily.lastName + " " + invoice.headOfFamily.firstName
            }

            val streetAddressCodebtorY1 = invoice.codebtor?.streetAddress

            if(streetAddressCodebtorY1 != null)
            {
                if (streetAddressCodebtorY1.count() > 35)
                {
                    e1edka1_3.stras = streetAddressCodebtorY1.substring(0, 35)
                    if (streetAddressCodebtorY1.length > 70) {
                        e1edka1_3.strs2 = streetAddressCodebtorY1.substring(35, 70)
                    }
                    else
                    {
                        e1edka1_3.strs2 = streetAddressCodebtorY1.substring(35, streetAddressCodebtorY1.length)
                    }
                }
            }

            e1edka1_4.pstlz = invoice.codebtor?.postalCode
            e1edka1_4.orT01 = invoice.codebtor?.postOffice
            e1edka1list.add(e1edka1_5)

            idoc.e1EDKA1 = e1edka1list
        }

        // E1EDK02
        val e1edk02list : MutableList<ORDERS05.IDOC.E1EDK02> = mutableListOf()
        val e1edk02 = ORDERS05.IDOC.E1EDK02()
        e1edk02.qualf = "001"
        val invoiceYearFormatter = DateTimeFormatter.ofPattern("yyyy")
        e1edk02.belnr = invoice.invoiceDate.format(invoiceYearFormatter) + "A010" + invoice.number
        e1edk02list.add(e1edk02)
        idoc.e1EDK02 = e1edk02list

        // E1EDKT1
        val e1edkt1list : MutableList<ORDERS05.IDOC.E1EDKT1> = mutableListOf()
        val e1edkt1 = ORDERS05.IDOC.E1EDKT1()
        e1edkt1.tdid = "Z002"
        idoc.e1EDKT1 = e1edkt1list

        // E1EDKT2
        val e1edkt2list : MutableList<ORDERS05.IDOC.E1EDKT1.E1EDKT2> = mutableListOf()
        val e1edkt2 = ORDERS05.IDOC.E1EDKT1.E1EDKT2()
        e1edkt2.tdline = "Lisätietoja laskun sisällöstä puh 358 22625609"
        e1edkt2.tdformat = "*"
        e1edkt2list.add(e1edkt2)
        e1edkt1.e1EDKT2 = e1edkt2list
        e1edkt1list.add(e1edkt1)

        // ROWS segment - TODO: loop invoice-row-values here
        //generateInvoiceRow(InvoiceRowDetailed)

        // E1EDP01 ROWS - segment
        val e1edp01list : MutableList<ORDERS05.IDOC.E1EDP01> = mutableListOf()
        val e1edp01 = ORDERS05.IDOC.E1EDP01()
        e1edp01.posex = "000010" // TODO: invoicerow number
        val formattedUnitAmount = invoice.rows[0].amount.toDouble()
        e1edp01.menge = String.format(Locale.ENGLISH,"%.3f", formattedUnitAmount)
        e1edp01.werks = "102S"
        e1edp01list.add(e1edp01)
        idoc.e1EDP01 = e1edp01list

        // E1EDP02 ROWS - segment
        val e1edp02list : MutableList<ORDERS05.IDOC.E1EDP01.E1EDP02> = mutableListOf()
        val e1edp02 = ORDERS05.IDOC.E1EDP01.E1EDP02()
        e1edp02.qualf = "048"
        e1edp02.zeile = "000010" //TODO: same as invoice row number POSEX
        e1edp02.bsark = "0000003108"
        e1edp02list.add(e1edp02)
        e1edp01.e1EDP02 = e1edp02list

        // E1EDP03 ROWS - segment
        val e1edp03list : MutableList<ORDERS05.IDOC.E1EDP01.E1EDP03> = mutableListOf()
        val e1edp03 = ORDERS05.IDOC.E1EDP01.E1EDP03()
        e1edp03.iddat = "002"
        val dateFormatterE1EDP03 = DateTimeFormatter.ofPattern("yyyyMMdd")
        e1edp03.datum = invoice.invoiceDate.format(dateFormatterE1EDP03)
        e1edp03list.add(e1edp03)
        e1edp01.e1EDP03 = e1edp03list

        // E1EDP05 ROWS - segment
        val e1edp05list : MutableList<ORDERS05.IDOC.E1EDP01.E1EDP05> = mutableListOf()
        val e1edp05 = ORDERS05.IDOC.E1EDP01.E1EDP05()
        e1edp05.alckz = "+"
        e1edp05.kschl = "ZPR0"
        //TODO: if unit price is negative remove mark and add it after the unit price
        val formattedUnitPrice = invoice.rows[0].unitPrice.toDouble() / 100
        e1edp05.krate = String.format(Locale.ENGLISH,"%.2f", formattedUnitPrice)
        e1edp05list.add(e1edp05)
        e1edp01.e1EDP05 = e1edp05list

        // E1EDP19 ROWS - segment
        val e1edp19list : MutableList<ORDERS05.IDOC.E1EDP01.E1EDP19> = mutableListOf()
        val e1edp19 = ORDERS05.IDOC.E1EDP01.E1EDP19()
        e1edp19.qualf = "002"
        if(invoice.rows[0].product.value == Product.DAYCARE.toString())
        {
            e1edp19.idtnr = "000000000000007246"
        }
        else if (invoice.rows[0].product.value == Product.PRESCHOOL_WITH_DAYCARE.toString())
        {
            e1edp19.idtnr = "000000000000007251"
        }
        e1edp19list.add(e1edp19)
        e1edp01.e1EDP19= e1edp19list

        // E1EDPT1 ROWS - segment
        val e1edpt1list : MutableList<ORDERS05.IDOC.E1EDP01.E1EDPT1> = mutableListOf()
        val e1edpt1 = ORDERS05.IDOC.E1EDP01.E1EDPT1()
        //Daycare name
        e1edpt1.tdid = "ZZ01"
        e1edpt1list.add(e1edpt1)

        e1edp01.e1EDPT1= e1edpt1list

        val e1edpt2list : MutableList<ORDERS05.IDOC.E1EDP01.E1EDPT1.E1EDPT2> = mutableListOf()
        val e1edpt2 = ORDERS05.IDOC.E1EDP01.E1EDPT1.E1EDPT2()
        e1edpt2.tdline = invoice.rows[0].unitName
        e1edpt2.tdformat = "*"
        e1edpt2list.add(e1edpt2)

        e1edpt1.e1EDPT2 = e1edpt2list

        //Child name
        val e1edpt1_2 = ORDERS05.IDOC.E1EDP01.E1EDPT1()
        e1edpt1_2.tdid = "ZZ02"
        e1edpt1list.add(e1edpt1_2)

        val e1edpt2_2list : MutableList<ORDERS05.IDOC.E1EDP01.E1EDPT1.E1EDPT2> = mutableListOf()
        val e1edpt2_2 = ORDERS05.IDOC.E1EDP01.E1EDPT1.E1EDPT2()
        e1edpt2_2.tdline = invoice.rows[0].child.firstName + " " +invoice.rows[0].child.lastName
        e1edpt2_2.tdformat = "*"
        e1edpt2_2list.add(e1edpt2_2)

        e1edpt1_2.e1EDPT2 = e1edpt2_2list

        //DateTime range

        val e1edpt1_3 = ORDERS05.IDOC.E1EDP01.E1EDPT1()
        e1edpt1_3.tdid = "ZZ03"
        e1edpt1list.add(e1edpt1_3)

        val e1edpt2_3list : MutableList<ORDERS05.IDOC.E1EDP01.E1EDPT1.E1EDPT2> = mutableListOf()
        val e1edpt2_3 = ORDERS05.IDOC.E1EDP01.E1EDPT1.E1EDPT2()

        val pattern = "dd.MM.yyyy"
        val formatter = DateTimeFormatter.ofPattern(pattern)

        e1edpt2_3.tdline =  invoice.rows[0].periodStart.format(formatter) + " - " + invoice.rows[0].periodEnd.format(formatter)
        e1edpt2_3.tdformat = "*"
        e1edpt2_3list.add(e1edpt2_3)

        e1edpt1_3.e1EDPT2 = e1edpt2_3list


        return idoc
    }

//    private fun generateInvoiceRow(invoiceRowDetailed: Any) {
//
//    }


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