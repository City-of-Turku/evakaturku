package fi.turku.evakaturku.dw

enum class DWQuery(
    val queryName: String,
    val query: DWQueries.CsvQuery,
) {
    Absence("absences", DWQueries.getAbsences),
    AssistanceNeedDecision("assistanceNeedDecisions", DWQueries.getAssistanceNeedDecisions),
    ChildAggregate("childAggregate", DWQueries.getChildAggregate),
    DailyInfo("dailyInfos", DWQueries.getDailyInfos),
    DailyUnitAndGroupAttendance("dailyUnitAndGroupAtendance", DWQueries.getDailyUnitsAndGroupsAttendances),
    DailyUnitOccupancyConfirmed("dailyUnitsOccupanciesConfirmed", DWQueries.getDailyUnitsOccupanciesConfirmed),
    DailyUnitOccupancyRealized("dailyUnitsOccupanciesRealized", DWQueries.getDailyUnitsOccupanciesRealized),
    FeeDecision("feeDecisions", DWQueries.getFeeDecisions),
    UnitAndGroup("unitsAndGroups", DWQueries.getUnitsAndGroups),
    VoucherValueDecision("voucherValueDecisions", DWQueries.getVoucherValueDecisions),
}
