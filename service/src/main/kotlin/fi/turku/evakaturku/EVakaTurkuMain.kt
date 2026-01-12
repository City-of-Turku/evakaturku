// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku

import io.github.oshai.kotlinlogging.KotlinLogging
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.builder.SpringApplicationBuilder
import org.springframework.boot.context.properties.ConfigurationPropertiesScan
import org.springframework.boot.jdbc.autoconfigure.DataSourceAutoConfiguration
import org.springframework.boot.transaction.autoconfigure.TransactionAutoConfiguration

@SpringBootApplication(
    scanBasePackages = ["fi.turku.evakaturku", "fi.espoo.evaka"],
    exclude = [
        DataSourceAutoConfiguration::class,
        TransactionAutoConfiguration::class,
    ],
)
@ConfigurationPropertiesScan(basePackages = ["fi.turku.evakaturku"])
class EvakaTurkuMain

private val logger = KotlinLogging.logger {}

fun main(args: Array<String>) {
    SpringApplicationBuilder()
        .sources(EvakaTurkuMain::class.java)
        .profiles("evakaturku")
        .run(*args)
}
