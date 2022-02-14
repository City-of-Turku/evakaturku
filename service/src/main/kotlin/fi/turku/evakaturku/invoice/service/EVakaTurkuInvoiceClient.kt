// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.invoice.service

import fi.espoo.evaka.invoicing.domain.InvoiceDetailed
import fi.espoo.evaka.invoicing.integration.InvoiceIntegrationClient
import fi.espoo.evaka.invoicing.integration.InvoiceIntegrationClient.SendResult
import fi.turku.evakaturku.InvoiceProperties
import org.springframework.ws.client.core.WebServiceTemplate


class EVakaTurkuInvoiceClient(
    private val webServiceTemplate: WebServiceTemplate, private val properties: InvoiceProperties
) : InvoiceIntegrationClient {
    override fun send(invoices: List<InvoiceDetailed>): SendResult {
        TODO("Not yet implemented")
    }
}