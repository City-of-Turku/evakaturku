package fi.turku.evakaturku.payment.service

import fi.espoo.evaka.invoicing.domain.Payment
import fi.espoo.evaka.shared.DaycareId
import fi.espoo.evaka.shared.db.Database
import fi.espoo.evaka.shared.domain.DateRange

class PreschoolValuesFetcher(val tx: Database.Transaction) {

    fun fetchPreschoolers(payments: List<Payment>): Map<DaycareId, Int> {
        return tx.fetchPreschoolers(payments)
    }

    fun Database.Read.fetchPreschoolers(payments: List<Payment>): Map<DaycareId, Int> {
        return createQuery(
            """
            SELECT placement_unit_id as unitId,count(placement_type) as preSchoolers
            FROM voucher_value_report_decision
            JOIN voucher_value_decision ON voucher_value_report_decision.decision_id = voucher_value_decision.id
            WHERE voucher_value_report_decision.realized_period && :period
            AND voucher_value_decision.placement_unit_id = ANY(:ids)
            AND voucher_value_decision.placement_type in ('PRESCHOOL','PRESCHOOL_DAYCARE')
            AND voucher_value_report_decision.type='ORIGINAL'
            GROUP BY voucher_value_decision.placement_unit_id;
        """
        )
            .bind("ids", payments.map { it.unit.id })
            .bind("period", payments[0].period)
            .mapTo<Pair<DaycareId, Int>>()
            .toMap()
    }

    fun fetchUnitLanguages(payments: List<Payment>): Map<DaycareId, String> {
        return tx.fetchUnitLanguages(payments)
    }

    fun Database.Read.fetchUnitLanguages(payments: List<Payment>): Map<DaycareId, String> {
        return createQuery(
            """
            SELECT id as unitId,language
            FROM daycare
            WHERE daycare.id = ANY(:ids)
        """
        )
            .bind("ids", payments.map { it.unit.id })
            .mapTo<Pair<DaycareId, String>>()
            .toMap()
    }

    fun fetchPreschoolAccountingAmount(period: DateRange): Int {
        return tx.fetchPreschoolAccountingAmount(period)
    }

    fun Database.Read.fetchPreschoolAccountingAmount(period: DateRange): Int {
        return createQuery(
            """
            SELECT base_value
            FROM service_need_option_voucher_value
            WHERE service_need_option_id=(
                SELECT id
                FROM service_need_option
                WHERE default_option=true
                AND valid_placement_type='PRESCHOOL')
            AND validity @> :date;
        """
        )
            .bind("date", period.start)
            .mapTo<Int>()
            // this should only ever return one row with one value
            .first()
    }
}
