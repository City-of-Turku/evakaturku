// SPDX-FileCopyrightText: 2021 City of Oulu
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.invoice.service

import fi.turku.evakaturku.SftpProperties
import org.junit.jupiter.api.Test
import org.mockito.kotlin.*

internal class InvoiceSenderTest {

    @Test
    fun `should send invoice`() {
        val path = "/some/path"
        val sftpProperties = SftpProperties("", path, "", "")
        val proEInvoice = "one"
        val sftpConnector = mock<SftpConnector>()
        val sftpSender = SftpSender(
            sftpProperties, sftpConnector
        )

        sftpSender.send(proEInvoice)

        verify(sftpConnector).connect(sftpProperties.address, sftpProperties.username, sftpProperties.password)
        val fileNamePattern = """$path/LAVAK_1002\d{6}-\d{6}.xml"""
        verify(sftpConnector).send(
            argThat { filePath -> filePath.matches(Regex(fileNamePattern)) },
            eq("one")
        )
        verify(sftpConnector).disconnect()
    }
}