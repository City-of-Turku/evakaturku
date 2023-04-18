// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.invoice.service

import com.jcraft.jsch.SftpException
import fi.turku.evakaturku.SftpProperties
import java.util.*

class SftpSender(val sftpProperties: SftpProperties, val sftpConnector: SftpConnector) {
    @Throws(SftpException::class)
    fun send(content: String, fileName: String) {
        val path = sftpProperties.path

        val filepath = "$path/$fileName"

        sftpConnector.connect(sftpProperties.address, sftpProperties.username, sftpProperties.password)

        sftpConnector.send(filepath, content)

        sftpConnector.disconnect()
    }
}
