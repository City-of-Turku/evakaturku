package fi.turku.evakaturku.reports

import fi.espoo.evaka.reports.freezeVoucherValueReportRows
import fi.espoo.evaka.shared.auth.AuthenticatedUser
import fi.espoo.evaka.shared.db.Database
import fi.espoo.evaka.shared.domain.Forbidden
import fi.espoo.evaka.shared.domain.HelsinkiDateTime
import mu.KotlinLogging
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import java.time.YearMonth

private val logger = KotlinLogging.logger { }

@RestController
@RequestMapping("/reports")
class ReportsController() {

    @GetMapping("/freeze-voucher-value-report-rows/{year}/{month}")
    fun freezeVoucherValueReportRows(
        db: Database,
        user: AuthenticatedUser,
        @PathVariable year: Int,
        @PathVariable month: Int
    ) {
        logger.info { "Freeze voucher value report rows ${YearMonth.of(year, month)}" }
        if (!user.isAdmin) throw Forbidden()
        db.connect { dbc ->
            dbc.transaction { tx ->
                freezeVoucherValueReportRows(
                    tx,
                    year,
                    month,
                    HelsinkiDateTime.now()
                )
            }
        }
    }

}
