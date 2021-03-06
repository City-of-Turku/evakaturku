// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.scheduler.config

import fi.espoo.evaka.ScheduledJobsEnv
import fi.espoo.evaka.shared.job.DefaultJobSchedule
import fi.espoo.evaka.shared.job.JobSchedule
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
class SchedulerConfiguration {

    @Bean
    fun jobSchedule(env: ScheduledJobsEnv): JobSchedule = DefaultJobSchedule(env)

}
