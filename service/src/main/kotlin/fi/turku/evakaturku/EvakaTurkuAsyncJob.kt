package fi.turku.evakaturku

import fi.espoo.evaka.shared.async.AsyncJobPayload
import fi.espoo.evaka.shared.async.AsyncJobPool
import fi.espoo.evaka.shared.async.AsyncJobRunner
import fi.espoo.evaka.shared.auth.AuthenticatedUser
import fi.turku.evakaturku.dw.DWExportJob
import fi.turku.evakaturku.dw.DWQuery

sealed interface EvakaTurkuAsyncJob : AsyncJobPayload {
    data class SendDWQuery(val query: DWQuery) : EvakaTurkuAsyncJob {
        override val user: AuthenticatedUser? = null
    }

    companion object {
        val pool =
            AsyncJobRunner.Pool(
                AsyncJobPool.Id(EvakaTurkuAsyncJob::class, "turku"),
                AsyncJobPool.Config(concurrency = 1),
                setOf(SendDWQuery::class),
            )
    }
}

class EvakaTurkuAsyncJobRegistration(
    runner: AsyncJobRunner<EvakaTurkuAsyncJob>,
    dwExportJob: DWExportJob,
) {
    init {
        dwExportJob.let { runner.registerHandler(it::sendDWQuery) }
    }
}
