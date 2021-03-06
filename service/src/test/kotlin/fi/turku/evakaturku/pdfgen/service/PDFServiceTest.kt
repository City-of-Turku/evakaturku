// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.pdfgen.service

import fi.espoo.voltti.pdfgen.PDFService
import fi.espoo.voltti.pdfgen.Page
import fi.espoo.voltti.pdfgen.Template
import fi.turku.evakaturku.AbstractIntegrationTest
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.thymeleaf.context.Context

internal class PDFServiceTest : AbstractIntegrationTest() {

    @Autowired
    private lateinit var pdfService: PDFService

    @Test
    fun render() {
        pdfService.render(Page(Template("test"), Context()))
    }

}
