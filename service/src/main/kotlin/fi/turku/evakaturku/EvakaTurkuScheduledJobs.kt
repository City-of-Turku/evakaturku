package fi.turku.evakaturku

import fi.espoo.evaka.ScheduledJobsEnv
import fi.espoo.evaka.shared.async.AsyncJobRunner
import fi.espoo.evaka.shared.async.AsyncJobType
import fi.espoo.evaka.shared.async.removeUnclaimedJobs
import fi.espoo.evaka.shared.db.Database
import fi.espoo.evaka.shared.domain.EvakaClock
import fi.espoo.evaka.shared.job.JobSchedule
import fi.espoo.evaka.shared.job.ScheduledJobDefinition
import fi.espoo.evaka.shared.job.ScheduledJobSettings
import fi.turku.evakaturku.dw.DwQuery
import io.github.oshai.kotlinlogging.KotlinLogging
import java.time.LocalTime

enum class EvakaTurkuScheduledJob(
    val fn: (EvakaTurkuScheduledJobs, Database.Connection, EvakaClock) -> Unit,
    val defaultSettings: ScheduledJobSettings,
) {
    PlanDwExportJobs(
        { jobs, db, clock -> jobs.planDwExportJobs(db, clock, DwQuery.entries) },
        ScheduledJobSettings(enabled = false, schedule = JobSchedule.daily(LocalTime.of(20, 0))),
    ),
}

class EvakaTurkuScheduledJobs(
    private val asyncJobRunner: AsyncJobRunner<EvakaTurkuAsyncJob>,
    env: ScheduledJobsEnv<EvakaTurkuScheduledJob>,
) : JobSchedule {
    private val logger = KotlinLogging.logger {}

    override val jobs: List<ScheduledJobDefinition> =
        env.jobs.map {
            ScheduledJobDefinition(it.key, it.value) { db, clock -> it.key.fn(this, db, clock) }
        }

    fun planDwExportJobs(
        db: Database.Connection,
        clock: EvakaClock,
        selectedQueries: List<DwQuery>?,
    ) {
        val queries = selectedQueries ?: DwQuery.entries
        logger.info { "Planning DW jobs for ${queries.size} queries" }
        db.transaction { tx ->
            tx.removeUnclaimedJobs(setOf(AsyncJobType(EvakaTurkuAsyncJob.SendDWQuery::class)))
            asyncJobRunner.plan(
                tx,
                queries.asSequence().map(EvakaTurkuAsyncJob::SendDWQuery),
                runAt = clock.now(),
                retryCount = 1,
            )
        }
    }
}
