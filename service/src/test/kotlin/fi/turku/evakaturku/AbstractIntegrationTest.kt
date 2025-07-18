// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku

import fi.espoo.evaka.shared.db.Database
import fi.espoo.evaka.shared.dev.runDevScript
import fi.espoo.evaka.shared.noopTracer
import fi.turku.evakaturku.database.resetTurkuDatabaseForE2ETests
import org.jdbi.v3.core.Jdbi
import org.junit.jupiter.api.AfterAll
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.TestInstance
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.cloud.contract.wiremock.AutoConfigureWireMock
import software.amazon.awssdk.services.s3.S3Client

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@SpringBootTest(
    classes = [IntegrationTestConfiguration::class],
)
@AutoConfigureWireMock(port = 0)
abstract class AbstractIntegrationTest(private val resetDbBeforeEach: Boolean = true) {
    @Autowired
    private lateinit var jdbi: Jdbi

    protected lateinit var db: Database.Connection

    @Autowired protected lateinit var s3Client: S3Client

    @Autowired protected lateinit var properties: EvakaTurkuProperties

    @BeforeAll
    protected fun initializeJdbi() {
        db = Database(jdbi, noopTracer()).connectWithManualLifecycle()
        db.transaction {
            it.runDevScript("reset-turku-database-for-e2e-tests.sql")
            if (!resetDbBeforeEach) {
                it.resetTurkuDatabaseForE2ETests()
            }
        }
    }

    @BeforeEach
    fun setup() {
        if (resetDbBeforeEach) {
            db.transaction {
                it.resetTurkuDatabaseForE2ETests()
            }
        }
    }

    @AfterAll
    protected fun afterAll() {
        db.close()
    }
}
