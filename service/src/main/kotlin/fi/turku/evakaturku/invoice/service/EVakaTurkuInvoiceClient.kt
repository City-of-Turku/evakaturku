// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.invoice.service

import com.jcraft.jsch.SftpException
import fi.espoo.evaka.invoicing.domain.InvoiceDetailed
import fi.espoo.evaka.invoicing.integration.InvoiceIntegrationClient
import mu.KotlinLogging
import java.text.SimpleDateFormat
import java.util.*

private val logger = KotlinLogging.logger {}

class EVakaTurkuInvoiceClient(
    private val sftpSender: SftpSender,
    private val invoiceGenerator: SapInvoiceGenerator
) : InvoiceIntegrationClient {
    override fun send(invoices: List<InvoiceDetailed>): InvoiceIntegrationClient.SendResult {
        val failedList = mutableListOf<InvoiceDetailed>()

        val generatorResult = invoiceGenerator.generateInvoice(invoices)
        var invoiceString = generatorResult.invoiceString
        var successList = generatorResult.sendResult.succeeded
        var manuallySentList = generatorResult.sendResult.manuallySent

        if (!successList.isEmpty()) {
            try {
                val filename = SimpleDateFormat("'LAVAK_1002'yyMMdd-hhmmss'.xml'").format(Date())
                sftpSender.send(invoiceString, filename)
                logger.info { "Successfully sent ${successList.size} invoices and created ${manuallySentList.size} manual invoice" }
            } catch (e: SftpException) {
                failedList.addAll(successList)
                failedList.addAll(manuallySentList)
                successList = listOf()
                manuallySentList = listOf()
                logger.error { "Failed to send ${failedList.size} invoices" }
            }
        }

        return InvoiceIntegrationClient.SendResult(successList, failedList, manuallySentList)
    }
}

interface StringInvoiceGenerator {
    data class InvoiceGeneratorResult(
        val sendResult: InvoiceIntegrationClient.SendResult = InvoiceIntegrationClient.SendResult(),
        val invoiceString: String = ""
    )
    fun generateInvoice(invoices: List<InvoiceDetailed>): StringInvoiceGenerator.InvoiceGeneratorResult
}
