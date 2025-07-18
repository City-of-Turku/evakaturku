package fi.turku.evakaturku.dw

enum class DWQuery(val queryName: String, val query: DWQueries.CsvQuery) {
    Absence("absences", DWQueries.getAbsences),
}
