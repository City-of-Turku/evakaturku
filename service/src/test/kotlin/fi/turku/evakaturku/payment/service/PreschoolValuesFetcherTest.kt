package fi.turku.evakaturku.payment.service

import fi.espoo.evaka.daycare.domain.Language
import fi.espoo.evaka.invoicing.domain.VoucherValueDecisionStatus
import fi.espoo.evaka.placement.PlacementType
import fi.espoo.evaka.shared.AreaId
import fi.espoo.evaka.shared.ChildId
import fi.espoo.evaka.shared.VoucherValueDecisionId
import fi.espoo.evaka.shared.db.Database
import fi.espoo.evaka.shared.dev.DevCareArea
import fi.espoo.evaka.shared.dev.DevChild
import fi.espoo.evaka.shared.dev.DevDaycare
import fi.espoo.evaka.shared.dev.DevPerson
import fi.espoo.evaka.shared.dev.DevPersonType
import fi.espoo.evaka.shared.dev.DevVoucherValueDecision
import fi.espoo.evaka.shared.dev.insert
import fi.espoo.evaka.shared.domain.DateRange
import fi.turku.evakaturku.AbstractIntegrationTest
import org.junit.jupiter.api.Test
import java.time.LocalDate
import java.time.Month
import java.util.UUID

class PreschoolValuesFetcherTest: AbstractIntegrationTest(resetDbBeforeEach = true) {

    @Test
    fun `should return correct accounting amount`() {
        db.transaction { tx ->
            tx.insertServiceNeedOptionVoucherValues()
            val fetcher = PreschoolValuesFetcher(tx)
            assert(fetcher.fetchPreschoolAccountingAmount(DateRange.Companion.ofMonth(2022, Month.SEPTEMBER)) == 451)
        }
    }

    @Test
    fun `should return unit languages`() {

        val daycare1 = DevDaycare(areaId = AreaId(UUID.fromString("79694e7e-544e-11ed-9f76-ab4476885861")), language = Language.fi)
        val daycare2 = DevDaycare(areaId = AreaId(UUID.fromString("79694e7e-544e-11ed-9f76-ab4476885861")), language = Language.sv)
        val daycare3 = DevDaycare(areaId = AreaId(UUID.fromString("79694e7e-544e-11ed-9f76-ab4476885861")), language = Language.fi)

        db.transaction { tx ->
            tx.insert(daycare1)
            tx.insert(daycare2)
            tx.insert(daycare3)

            val fetcher = PreschoolValuesFetcher(tx)

            val payments = listOf(
                validPayment().copy(unit = validPaymentUnit().copy(id = daycare1.id)),
                validPayment().copy(unit = validPaymentUnit().copy(id = daycare2.id))
            )

            val result = fetcher.fetchUnitLanguages(payments)
            assert(result == mapOf(daycare1.id to "fi", daycare2.id to "sv"))
        }
    }

    @Test
    fun `should return correct numbers of preschoolers`() {
        val daycare1 = DevDaycare(areaId = AreaId(UUID.fromString("79694e7e-544e-11ed-9f76-ab4476885861")))
        val daycare2 = DevDaycare(areaId = AreaId(UUID.fromString("79694e7e-544e-11ed-9f76-ab4476885861")))
        val daycare3 = DevDaycare(areaId = AreaId(UUID.fromString("79694e7e-544e-11ed-9f76-ab4476885861")))

        val headOfFamily = DevPerson()
        val daycare1preschooler1 = DevPerson(ChildId(UUID.randomUUID()))
        val daycare1preschooler2 = DevPerson(ChildId(UUID.randomUUID()))
        val daycare1daycarer = DevPerson(ChildId(UUID.randomUUID()))
        val daycare2preschooler = DevPerson(ChildId(UUID.randomUUID()))
        val daycare2daycarer = DevPerson(ChildId(UUID.randomUUID()))
        val daycare3preschooler = DevPerson(ChildId(UUID.randomUUID()))

        val d1p1decision = DevVoucherValueDecision(
            status = VoucherValueDecisionStatus.SENT,
            validFrom = LocalDate.of(2022, Month.JANUARY, 1),
            validTo = LocalDate.of(2022, Month.DECEMBER, 31),
            childId = daycare1preschooler1.id,
            headOfFamilyId = headOfFamily.id,
            placementUnitId = daycare1.id,
            placementType = PlacementType.PRESCHOOL
        )
        val d1p2decision = DevVoucherValueDecision(
            status = VoucherValueDecisionStatus.SENT,
            validFrom = LocalDate.of(2022, Month.JANUARY, 1),
            validTo = LocalDate.of(2022, Month.DECEMBER, 31),
            childId = daycare1preschooler2.id,
            headOfFamilyId = headOfFamily.id,
            placementUnitId = daycare1.id,
            placementType = PlacementType.PRESCHOOL_DAYCARE
        )
        val d1p3decision = DevVoucherValueDecision(
            status = VoucherValueDecisionStatus.SENT,
            validFrom = LocalDate.of(2022, Month.JANUARY, 1),
            validTo = LocalDate.of(2022, Month.DECEMBER, 31),
            childId = daycare1daycarer.id,
            headOfFamilyId = headOfFamily.id,
            placementUnitId = daycare1.id,
            placementType = PlacementType.DAYCARE
        )
        val d2p1decision = DevVoucherValueDecision(
            status = VoucherValueDecisionStatus.SENT,
            validFrom = LocalDate.of(2022, Month.JANUARY, 1),
            validTo = LocalDate.of(2022, Month.DECEMBER, 31),
            childId = daycare2preschooler.id,
            headOfFamilyId = headOfFamily.id,
            placementUnitId = daycare2.id,
            placementType = PlacementType.PRESCHOOL
        )
        val d2p2decision = DevVoucherValueDecision(
            status = VoucherValueDecisionStatus.SENT,
            validFrom = LocalDate.of(2022, Month.JANUARY, 1),
            validTo = LocalDate.of(2022, Month.DECEMBER, 31),
            childId = daycare2daycarer.id,
            headOfFamilyId = headOfFamily.id,
            placementUnitId = daycare2.id,
            placementType = PlacementType.DAYCARE
        )
        val d3p1decision = DevVoucherValueDecision(
            status = VoucherValueDecisionStatus.SENT,
            validFrom = LocalDate.of(2022, Month.JANUARY, 1),
            validTo = LocalDate.of(2022, Month.DECEMBER, 31),
            childId = daycare3preschooler.id,
            headOfFamilyId = headOfFamily.id,
            placementUnitId = daycare3.id,
            placementType = PlacementType.PRESCHOOL
        )

        db.transaction { tx ->
            tx.insert(headOfFamily, DevPersonType.ADULT)

            tx.insert(daycare1preschooler1, DevPersonType.CHILD)
            tx.insert(daycare1preschooler2, DevPersonType.CHILD)
            tx.insert(daycare1daycarer, DevPersonType.CHILD)
            tx.insert(daycare2preschooler, DevPersonType.CHILD)
            tx.insert(daycare2daycarer, DevPersonType.CHILD)
            tx.insert(daycare3preschooler, DevPersonType.CHILD)

            tx.insert(daycare1)
            tx.insert(daycare2)
            tx.insert(daycare3)

            tx.insert(d1p1decision)
            tx.insert(d1p2decision)
            tx.insert(d1p3decision)
            tx.insert(d2p1decision)
            tx.insert(d2p2decision)
            tx.insert(d3p1decision)

            val snapshotId = tx.insertVoucherValueReportSnapshot()
            tx.insertVoucherValueReportDecision(snapshotId, d1p1decision.id)
            tx.insertVoucherValueReportDecision(snapshotId, d1p2decision.id)
            tx.insertVoucherValueReportDecision(snapshotId, d1p3decision.id)
            tx.insertVoucherValueReportDecision(snapshotId, d2p1decision.id)
            tx.insertVoucherValueReportDecision(snapshotId, d2p2decision.id)
            tx.insertVoucherValueReportDecision(snapshotId, d3p1decision.id)

            val fetcher = PreschoolValuesFetcher(tx)

            val payments = listOf(
                validPayment().copy(
                    period = DateRange(
                        LocalDate.of(2022, 4, 1),
                        LocalDate.of(2022, 4, 30)),
                    unit = validPaymentUnit().copy(id = daycare1.id)
                ),
                validPayment().copy(
                    period = DateRange(
                        LocalDate.of(2022, 4, 1),
                        LocalDate.of(2022, 4, 30)),
                    unit = validPaymentUnit().copy(id = daycare2.id))
            )
            val result = fetcher.fetchPreschoolers(payments)
        }
    }

    fun Database.Transaction.insertServiceNeedOptionVoucherValues() {
        insertServiceNeedOptionVoucherValue(
            UUID.fromString("bc6a4550-fa74-11eb-9a2d-035acd5db9aa"),
            DateRange(
                LocalDate.of(2021, Month.JANUARY, 1),
                LocalDate.of(2021, Month.DECEMBER, 31)),
            420)

        insertServiceNeedOptionVoucherValue(
            UUID.fromString("bc6a4550-fa74-11eb-9a2d-035acd5db9aa"),
            DateRange(
                LocalDate.of(2022, Month.JANUARY, 1),
                LocalDate.of(2022, Month.DECEMBER, 31)),
            451)

        insertServiceNeedOptionVoucherValue(
            UUID.fromString("bc6a4550-fa74-11eb-9a2d-035acd5db9aa"),
            DateRange(
                LocalDate.of(2023, Month.JANUARY, 1),
                LocalDate.of(2023, Month.DECEMBER, 31)),
            492)

        insertServiceNeedOptionVoucherValue(
            UUID.fromString("5c21d452-4f90-11ed-8be7-bf748cc343bf"),
            DateRange(
                LocalDate.of(2022, Month.JANUARY, 1),
                LocalDate.of(2022, Month.DECEMBER, 31)),
            440)

        insertServiceNeedOptionVoucherValue(
            UUID.fromString("50358394-b961-11eb-b51f-67ac436e5636"),
            DateRange(
                LocalDate.of(2022, Month.JANUARY, 1),
                LocalDate.of(2022, Month.DECEMBER, 31)),
            450)
    }

    fun Database.Transaction.insertServiceNeedOptionVoucherValue(serviceNeedOptionId: UUID, validity: DateRange, baseValue: Int): UUID {
        val uuid = UUID.randomUUID()
        createUpdate {
            sql("""
                insert into service_need_option_voucher_value (
                    id,
                    service_need_option_id,
                    validity,
                    base_value,
                    coefficient,
                    "value",
                    base_value_under_3y,
                    coefficient_under_3y,
                    value_under_3y)
                values (
                    :id,
                    :serviceNeedOptionId,
                    :validity,
                    :baseValue,
                    1,
                    0,
                    0,
                    0,
                    0
                );
            """.trimIndent())
        }
            .bind("id", uuid)
            .bind("serviceNeedOptionId", serviceNeedOptionId)
            .bind("validity", validity)
            .bind("baseValue", baseValue)
            .execute()
        return uuid
    }

    fun Database.Transaction.insertVoucherValueReportSnapshot(): UUID {
        val id = UUID.randomUUID()
        createUpdate {
            sql("""
                insert into voucher_value_report_snapshot (
                    id,
                    "month",
                    "year",
                    taken_at)
                values (
                    :id,
                    4,
                    2022,
                    '2022-04-30 23:30:00'
                );
            """.trimIndent())
        }
            .bind("id", id)
            .execute()
        return id
    }

    fun Database.Transaction.insertVoucherValueReportDecision(snapshotId: UUID, decisionId: VoucherValueDecisionId) {
        createUpdate {
            sql("""
                insert into voucher_value_report_decision (
                    voucher_value_report_snapshot_id,
                    realized_amount,
                    realized_period,
                    type,
                    decision_id)
                values (
                    :snapshotId,
                    451,
                    daterange('2022-04-01', '2022-04-30', '[]'),
                    'ORIGINAL',
                    :decisionId
                );
            """.trimIndent())
        }
            .bind("snapshotId", snapshotId)
            .bind("decisionId", decisionId)
            .execute()
    }
}