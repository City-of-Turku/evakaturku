// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later
package fi.turku.evakaturku.database

import fi.espoo.evaka.shared.db.Database
import fi.turku.evakaturku.AbstractIntegrationTest
import org.jdbi.v3.core.Jdbi
import org.junit.jupiter.api.AfterEach
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired

class DevDataInitializerTest : AbstractIntegrationTest() {

    @Autowired
    private lateinit var jdbi: Jdbi

    @AfterEach
    fun cleanup() {
        Database(jdbi).connect { db -> db.transaction { tx -> tx.resetTurkuDatabaseForE2ETests() } }
    }

    @Test
    fun init() {
        DevDataInitializer(jdbi)
    }

}
