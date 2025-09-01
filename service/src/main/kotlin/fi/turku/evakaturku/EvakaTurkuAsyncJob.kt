package fi.turku.evakaturku

import fi.espoo.evaka.shared.async.AsyncJobPayload
import fi.espoo.evaka.shared.async.AsyncJobPool
import fi.espoo.evaka.shared.async.AsyncJobRunner
import fi.espoo.evaka.shared.auth.AuthenticatedUser
import fi.turku.evakaturku.dw.DwExportJob
import fi.turku.evakaturku.dw.DwQuery

sealed interface EvakaTurkuAsyncJob : AsyncJobPayload {
    data class SendDWQuery(
        val query: DwQuery,
    ) : EvakaTurkuAsyncJob {
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
    dwExportJob: DwExportJob,
) {
    init {
        dwExportJob.let { runner.registerHandler(it::sendDwQuery) }
    }
}
