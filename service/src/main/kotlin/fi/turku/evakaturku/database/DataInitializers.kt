// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.database

import fi.espoo.evaka.shared.db.Database
import fi.espoo.evaka.shared.dev.runDevScript

fun Database.Transaction.ensureTurkuDevData() {
    if (createQuery("SELECT count(*) FROM daycare").mapTo<Int>().first() == 0) {
        listOf("turku-dev-data.sql").forEach { runDevScript(it) }
    }
}

fun Database.Transaction.resetTurkuDatabaseForE2ETests() {
    execute("SELECT reset_turku_database_for_e2e_tests()")
}
