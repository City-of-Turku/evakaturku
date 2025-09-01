package fi.turku.evakaturku.dw

enum class DwQuery(
    val queryName: String,
    val query: DwQueries.CsvQuery,
) {
    Absence("absences", DwQueries.getAbsences),
    AssistanceNeedDecision("assistanceNeedDecisions", DwQueries.getAssistanceNeedDecisions),
    ChildAggregate("childAggregate", DwQueries.getChildAggregate),
    DailyInfo("dailyInfos", DwQueries.getDailyInfos),
    DailyUnitAndGroupAttendance("dailyUnitAndGroupAtendance", DwQueries.getDailyUnitsAndGroupsAttendances),
    DailyUnitOccupancyConfirmed("dailyUnitsOccupanciesConfirmed", DwQueries.getDailyUnitsOccupanciesConfirmed),
    DailyUnitOccupancyRealized("dailyUnitsOccupanciesRealized", DwQueries.getDailyUnitsOccupanciesRealized),
    FeeDecision("feeDecisions", DwQueries.getFeeDecisions),
    UnitAndGroup("unitsAndGroups", DwQueries.getUnitsAndGroups),
    VoucherValueDecision("voucherValueDecisions", DwQueries.getVoucherValueDecisions),
}
