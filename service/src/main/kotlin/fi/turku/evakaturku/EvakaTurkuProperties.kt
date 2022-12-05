// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.boot.context.properties.ConstructorBinding

/**
 * All evakaturku-specific configuration properties.
 */
@ConstructorBinding
@ConfigurationProperties(prefix = "evakaturku", ignoreUnknownFields = false)
data class EvakaTurkuProperties(
    val sapInvoicing: SftpProperties,
    val sapPayments: SftpProperties,
)

data class SftpProperties(
    val address: String,
    val path: String,
    val username: String,
    val password: String
)
