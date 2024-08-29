// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.database

import fi.espoo.evaka.shared.db.Database
import fi.espoo.evaka.shared.dev.runDevScript
import fi.espoo.evaka.shared.noopTracer
import fi.espoo.evaka.vtjclient.service.persondetails.MockPersonDetailsService
import fi.espoo.evaka.vtjclient.service.persondetails.legacyMockVtjDataset
import org.jdbi.v3.core.Jdbi
import org.springframework.context.annotation.Profile
import org.springframework.stereotype.Component

@Component
@Profile("local")
class DevDataInitializer(jdbi: Jdbi) {
    init {
        Database(jdbi, noopTracer()).connect { db ->
            db.transaction { tx ->
                tx.runDevScript("reset-turku-database-for-e2e-tests.sql")
                tx.ensureTurkuDevData()
            }
        }
        MockPersonDetailsService.add(legacyMockVtjDataset())
    }
}
