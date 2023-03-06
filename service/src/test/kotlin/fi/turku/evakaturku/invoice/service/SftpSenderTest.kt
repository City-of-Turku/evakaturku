// SPDX-FileCopyrightText: 2021 City of Oulu
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.invoice.service

import fi.turku.evakaturku.SftpProperties
import org.junit.jupiter.api.Test
import org.mockito.kotlin.*
import java.text.SimpleDateFormat
import java.util.*

internal class SftpSenderTest {

    @Test
    fun `should send SAP material with same name`() {
        val path = "/some/path"
        val sftpProperties = SftpProperties("", path, "", "")
        val sapMaterial = "one"
        val sftpConnector = mock<SftpConnector>()
        val filename = SimpleDateFormat("'LAVAK_1002'yyMMdd-hhmmss'.xml'").format(Date())
        val sftpSender = SftpSender(
            sftpProperties, sftpConnector
        )

        sftpSender.send(sapMaterial, filename)

        verify(sftpConnector).connect(sftpProperties.address, sftpProperties.username, sftpProperties.password)
        val fileNamePattern = """$path/LAVAK_1002\d{6}-\d{6}.xml"""
        verify(sftpConnector).send(
            argThat { filePath -> filePath.matches(Regex(fileNamePattern)) },
            eq("one")
        )
        verify(sftpConnector).disconnect()
    }

}