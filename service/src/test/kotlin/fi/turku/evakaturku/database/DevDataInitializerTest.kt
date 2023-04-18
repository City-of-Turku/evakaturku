// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.database

import fi.turku.evakaturku.AbstractIntegrationTest
import org.jdbi.v3.core.Jdbi
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired

class DevDataInitializerTest : AbstractIntegrationTest() {

    @Autowired
    private lateinit var jdbi: Jdbi

    @Test
    fun init() {
        DevDataInitializer(jdbi)
    }
}
