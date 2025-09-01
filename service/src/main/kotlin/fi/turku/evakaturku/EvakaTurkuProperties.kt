// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku

import org.springframework.boot.context.properties.ConfigurationProperties

/**
 * All evakaturku-specific configuration properties.
 */
@ConfigurationProperties(prefix = "evakaturku", ignoreUnknownFields = false)
data class EvakaTurkuProperties(
    val sapInvoicing: SftpProperties,
    val sapPayments: SftpProperties,
    val bucket: BucketProperties,
    val dwExport: DwExportProperties,
)

data class SftpProperties(
    val address: String,
    val path: String,
    val username: String,
    val password: String,
)

data class BucketProperties(
    val export: String,
) {
    fun allBuckets() = listOf(export)
}

data class DwExportProperties(
    val prefix: String,
    val sftp: SftpProperties,
)
