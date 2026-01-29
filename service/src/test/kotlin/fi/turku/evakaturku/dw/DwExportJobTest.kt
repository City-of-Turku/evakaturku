package fi.turku.evakaturku.dw

import fi.espoo.evaka.absence.AbsenceCategory
import fi.espoo.evaka.shared.AreaId
import fi.espoo.evaka.shared.EvakaUserId
import fi.espoo.evaka.shared.ServiceNeedOptionId
import fi.espoo.evaka.shared.auth.AuthenticatedUser
import fi.espoo.evaka.shared.db.QuerySql
import fi.espoo.evaka.shared.dev.DevAbsence
import fi.espoo.evaka.shared.dev.DevAssistanceAction
import fi.espoo.evaka.shared.dev.DevChildAttendance
import fi.espoo.evaka.shared.dev.DevDaycare
import fi.espoo.evaka.shared.dev.DevDaycareGroup
import fi.espoo.evaka.shared.dev.DevDaycareGroupPlacement
import fi.espoo.evaka.shared.dev.DevEmployee
import fi.espoo.evaka.shared.dev.DevFeeDecision
import fi.espoo.evaka.shared.dev.DevPerson
import fi.espoo.evaka.shared.dev.DevPersonType
import fi.espoo.evaka.shared.dev.DevPlacement
import fi.espoo.evaka.shared.dev.DevReservation
import fi.espoo.evaka.shared.dev.DevVoucherValueDecision
import fi.espoo.evaka.shared.dev.insert
import fi.espoo.evaka.shared.domain.FiniteDateRange
import fi.espoo.evaka.shared.domain.HelsinkiDateTime
import fi.espoo.evaka.shared.domain.MockEvakaClock
import fi.turku.evakaturku.AbstractIntegrationTest
import fi.turku.evakaturku.invoice.service.SftpSender
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DynamicTest
import org.junit.jupiter.api.TestFactory
import org.springframework.beans.factory.annotation.Autowired
import software.amazon.awssdk.services.s3.S3AsyncClient
import java.time.LocalDate
import java.time.LocalTime

class DwExportJobTest : AbstractIntegrationTest() {
    private val clock = MockEvakaClock(HelsinkiDateTime.of(LocalDate.of(2019, 7, 15), LocalTime.of(23, 0)))

    @Autowired
    private lateinit var s3AsyncClient: S3AsyncClient

    @Autowired
    private lateinit var sftpSender: SftpSender

    private lateinit var job: DwExportJob

    @BeforeAll
    fun beforeAll() {
        val exportClient = FileDWExportClient(s3AsyncClient, sftpSender, properties)
        job = DwExportJob(exportClient)
    }

    @BeforeEach
    fun beforeEach() {
        insertCriticalTestData()
    }

    @TestFactory
    fun testDwExports() =
        DwQuery.entries.map {
            DynamicTest.dynamicTest("Test '${it.queryName}' export") { sendAndAssertDwQueryCsv(it) }
        }

    private fun sendAndAssertDwQueryCsv(query: DwQuery) {
        job.sendDwQuery(db, clock, query.queryName, query.query)
    }

    private fun insertCriticalTestData() {
        db.transaction { tx ->
            val employee = DevEmployee()
            tx.insert(employee)
            val areaId =
                tx
                    .createQuery(
                        QuerySql { sql("select id from care_area order by short_name limit 1") },
                    ).exactlyOne<AreaId>()
            val snoId =
                tx
                    .createQuery(
                        QuerySql { sql("select id from service_need_option order by name_fi limit 1") },
                    ).exactlyOne<ServiceNeedOptionId>()
            val daycareId = tx.insert(DevDaycare(areaId = areaId))
            val groupId = tx.insert(DevDaycareGroup(daycareId = daycareId))
            val childId = tx.insert(DevPerson(), DevPersonType.CHILD)
            val guardianId = tx.insert(DevPerson(), DevPersonType.RAW_ROW)
            val placementId =
                tx.insert(
                    DevPlacement(
                        childId = childId,
                        unitId = daycareId,
                        createdBy = employee.evakaUserId,
                        modifiedBy = employee.evakaUserId,
                    ),
                )
            tx.insert(
                DevDaycareGroupPlacement(
                    daycarePlacementId = placementId,
                    daycareGroupId = groupId,
                ),
            )

            tx.insert(
                DevAbsence(
                    childId = childId,
                    date = LocalDate.of(2019, 7, 15),
                    modifiedBy = employee.evakaUserId,
                    absenceCategory = AbsenceCategory.BILLABLE,
                ),
            )
            tx.insert(
                DevVoucherValueDecision(
                    childId = childId,
                    headOfFamilyId = guardianId,
                    placementUnitId = daycareId,
                    validFrom = LocalDate.of(2019, 1, 1),
                    validTo = LocalDate.of(2019, 12, 31),
                ),
            )
            tx.insert(
                DevFeeDecision(
                    validDuring = FiniteDateRange(LocalDate.of(2019, 1, 1), LocalDate.of(2019, 12, 31)),
                    headOfFamilyId = guardianId,
                ),
            )
            tx.insert(
                DevAssistanceAction(
                    childId = childId,
                    modifiedBy = employee.evakaUserId,
                ),
            )
            tx.insert(
                DevReservation(
                    childId = childId,
                    date = LocalDate.of(2019, 7, 15),
                    startTime = LocalTime.of(8, 0),
                    endTime = LocalTime.of(16, 0),
                    createdBy = employee.evakaUserId,
                ),
            )
            tx.insert(
                DevChildAttendance(
                    childId = childId,
                    unitId = daycareId,
                    date = LocalDate.of(2019, 7, 15),
                    arrived = LocalTime.of(8, 15),
                    departed = LocalTime.of(15, 45),
                    modifiedBy = employee.evakaUserId,
                ),
            )
        }
    }
}
