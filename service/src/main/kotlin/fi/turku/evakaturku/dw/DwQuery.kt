package fi.turku.evakaturku.dw

enum class DwQuery(
    val queryName: String,
    val query: DwQueries.CsvQuery,
) {
    Absence("absences", DwQueries.getAbsences),
    AssistanceNeedDecision("assistance_need_decisions_3v_", DwQueries.getAssistanceNeedDecisions),
    ChildAggregate("child_aggregate_3v_", DwQueries.getChildAggregate),
    DailyInfo("daily_info_3v_", DwQueries.getDailyInfos),
    DailyUnitAndGroupAttendance("daily_unit_and_group_attendance_3v_", DwQueries.getDailyUnitsAndGroupsAttendances),
    DailyUnitOccupancyConfirmed("daily_units_occupancies_confirmed_", DwQueries.getDailyUnitsOccupanciesConfirmed),
    DailyUnitOccupancyRealized("daily_units_occupancies_realized_", DwQueries.getDailyUnitsOccupanciesRealized),
    FeeDecision("fee_decisions_3v_", DwQueries.getFeeDecisions),
    UnitAndGroup("units_and_groups_3v_", DwQueries.getUnitsAndGroups),
    VoucherValueDecision("voucher_value_decisions_3v_", DwQueries.getVoucherValueDecisions),
}
