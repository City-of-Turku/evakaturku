// SPDX-FileCopyrightText: 2023-2025 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku

import fi.espoo.evaka.BucketEnv
import fi.espoo.evaka.ScheduledJobsEnv
import fi.espoo.evaka.application.ApplicationStatus
import fi.espoo.evaka.espoo.DefaultPasswordSpecification
import fi.espoo.evaka.invoicing.domain.PaymentIntegrationClient
import fi.espoo.evaka.invoicing.service.DefaultInvoiceGenerationLogic
import fi.espoo.evaka.logging.defaultAccessLoggingValve
import fi.espoo.evaka.lookup
import fi.espoo.evaka.mealintegration.DefaultMealTypeMapper
import fi.espoo.evaka.mealintegration.MealTypeMapper
import fi.espoo.evaka.shared.ArchiveProcessConfig
import fi.espoo.evaka.shared.ArchiveProcessType
import fi.espoo.evaka.shared.FeatureConfig
import fi.espoo.evaka.shared.async.AsyncJobRunner
import fi.espoo.evaka.shared.auth.PasswordConstraints
import fi.espoo.evaka.shared.auth.PasswordSpecification
import fi.espoo.evaka.shared.auth.UserRole
import fi.espoo.evaka.shared.security.actionrule.ActionRuleMapping
import fi.espoo.evaka.titania.TitaniaEmployeeIdConverter
import fi.turku.evakaturku.dw.DwExportClient
import fi.turku.evakaturku.dw.DwExportJob
import fi.turku.evakaturku.dw.FileDWExportClient
import fi.turku.evakaturku.invoice.service.SftpConnector
import fi.turku.evakaturku.invoice.service.SftpSender
import fi.turku.evakaturku.payment.service.SapPaymentGenerator
import fi.turku.evakaturku.payment.service.TurkuPaymentIntegrationClient
import fi.turku.evakaturku.security.EvakaTurkuActionRuleMapping
import io.opentelemetry.api.trace.Tracer
import org.jdbi.v3.core.Jdbi
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory
import org.springframework.boot.web.server.WebServerFactoryCustomizer
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.Import
import org.springframework.context.annotation.Profile
import org.springframework.core.env.Environment
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider
import software.amazon.awssdk.regions.Region
import software.amazon.awssdk.services.s3.S3AsyncClient

@Configuration
@Import(EvakaTurkuAsyncJobRegistration::class)
class EVakaTurkuConfig {
    @Bean
    fun featureConfig(env: Environment): FeatureConfig =
        FeatureConfig(
            valueDecisionCapacityFactorEnabled = false,
            // Mon 12:00
            citizenReservationThresholdHours = 6 * 24 + 12,
            dailyFeeDivisorOperationalDaysOverride = null,
            freeSickLeaveOnContractDays = false,
            alwaysUseDaycareFinanceDecisionHandler = true,
            freeAbsenceGivesADailyRefund = true,
            paymentNumberSeriesStart = 1,
            unplannedAbsencesAreContractSurplusDays = false,
            maxContractDaySurplusThreshold = 13,
            useContractDaysAsDailyFeeDivisor = false,
            assistanceDecisionMakerRoles = setOf(UserRole.DIRECTOR, UserRole.SPECIAL_EDUCATION_TEACHER),
            preschoolAssistanceDecisionMakerRoles = setOf(UserRole.DIRECTOR, UserRole.SPECIAL_EDUCATION_TEACHER),
            requestedStartUpperLimit = 14,
            preferredStartRelativeApplicationDueDate = true,
            postOffice = "TURKU",
            municipalMessageAccountName = "Turun kaupunki",
            serviceWorkerMessageAccountName = "Turun kaupunki",
            applyPlacementUnitFromDecision = false,
            skipGuardianPreschoolDecisionApproval = false,
            fiveYearsOldDaycareEnabled = env.lookup("evaka.five_years_old_daycare.enabled") ?: false,
            financeMessageAccountName =
                "Varhaiskasvatuksen asiakasmaksut - Småbarnspedagogikens avgifter - Early childhood education fees",
            archiveMetadataOrganization = "Turun kaupungin varhaiskasvatus",
            archiveMetadataConfigs = { type: ArchiveProcessType, year: Int ->
                when (type) {
                    ArchiveProcessType.APPLICATION_DAYCARE ->
                        ArchiveProcessConfig(
                            processDefinitionNumber = "12.06.01.02",
                            archiveDurationMonths = 12 * 12,
                        )

                    ArchiveProcessType.APPLICATION_PRESCHOOL ->
                        ArchiveProcessConfig(
                            processDefinitionNumber = "12.06.01.02",
                            archiveDurationMonths = 12 * 12,
                        )

                    ArchiveProcessType.APPLICATION_CLUB ->
                        ArchiveProcessConfig(
                            processDefinitionNumber = "12.06.01.02",
                            archiveDurationMonths = 12 * 12,
                        )

                    ArchiveProcessType.ASSISTANCE_NEED_DECISION_DAYCARE ->
                        ArchiveProcessConfig(
                            processDefinitionNumber = "12.06.01.00",
                            archiveDurationMonths = 120 * 12,
                        )

                    ArchiveProcessType.ASSISTANCE_NEED_DECISION_PRESCHOOL ->
                        ArchiveProcessConfig(
                            processDefinitionNumber = "12.06.01.01",
                            archiveDurationMonths = 120 * 12,
                        )

                    ArchiveProcessType.FEE_DECISION ->
                        ArchiveProcessConfig(
                            processDefinitionNumber = "12.06.01.06",
                            archiveDurationMonths = 144,
                        )

                    ArchiveProcessType.VOUCHER_VALUE_DECISION ->
                        ArchiveProcessConfig(
                            processDefinitionNumber = "12.06.01.06",
                            archiveDurationMonths = 144,
                        )
                }
            },
            placementToolApplicationStatus = ApplicationStatus.WAITING_PLACEMENT,
        )

    @Bean
    fun actionRuleMapping(): ActionRuleMapping = EvakaTurkuActionRuleMapping()

    @Bean
    fun invoiceGenerationLogicChooser() = DefaultInvoiceGenerationLogic

    @Bean
    fun paymentIntegrationClient(
        evakaProperties: EvakaTurkuProperties,
        paymentGenerator: SapPaymentGenerator,
        sftpConnector: SftpConnector,
    ): PaymentIntegrationClient {
        val sftpSender = SftpSender(evakaProperties.sapPayments, sftpConnector)
        return TurkuPaymentIntegrationClient(paymentGenerator, sftpSender)
    }

    @Bean
    fun tomcatCustomizer(env: Environment) =
        WebServerFactoryCustomizer<TomcatServletWebServerFactory> {
            it.addContextValves(defaultAccessLoggingValve(env))
        }

    @Bean
    fun titaniaEmployeeIdConverter(): TitaniaEmployeeIdConverter =
        object : TitaniaEmployeeIdConverter {
            override fun fromTitania(employeeId: String): String = employeeId.trimStart('0')
        }

    @Bean
    fun mealTypeMapper(): MealTypeMapper = DefaultMealTypeMapper

    @Bean
    @Profile("production")
    fun productionS3AsyncClient(
        bucketEnv: BucketEnv,
        credentialsProvider: AwsCredentialsProvider,
    ): S3AsyncClient =
        S3AsyncClient
            .crtBuilder()
            .credentialsProvider(credentialsProvider)
            .build()

    @Bean
    @Profile("local")
    fun localS3AsyncClient(
        bucketEnv: BucketEnv,
        credentialsProvider: AwsCredentialsProvider,
    ): S3AsyncClient =
        S3AsyncClient
            .crtBuilder()
            .region(Region.EU_WEST_1)
            .credentialsProvider(credentialsProvider)
            .build()

    @Bean
    fun fileDwExportClient(
        asyncClient: S3AsyncClient,
        sftpConnector: SftpConnector,
        properties: EvakaTurkuProperties,
    ): DwExportClient = FileDWExportClient(asyncClient, SftpSender(properties.dwExport.sftp, sftpConnector), properties)

    @Bean
    fun evakaTurkuAsyncJobRunner(
        jdbi: Jdbi,
        tracer: Tracer,
        env: Environment,
    ): AsyncJobRunner<EvakaTurkuAsyncJob> = AsyncJobRunner(EvakaTurkuAsyncJob::class, listOf(EvakaTurkuAsyncJob.pool), jdbi, tracer)

    @Bean
    fun evakaTurkuDwJob(dwExportClient: DwExportClient) = DwExportJob(dwExportClient)

    @Bean
    fun evakaTurkuScheduledJobEnv(env: Environment): ScheduledJobsEnv<EvakaTurkuScheduledJob> =
        ScheduledJobsEnv.fromEnvironment(
            EvakaTurkuScheduledJob.entries.associateWith { it.defaultSettings },
            "turku.job",
            env,
        )

    @Bean
    fun evakaTurkuScheduledJobs(
        evakaTurkuRunner: AsyncJobRunner<EvakaTurkuAsyncJob>,
        env: ScheduledJobsEnv<EvakaTurkuScheduledJob>,
    ): EvakaTurkuScheduledJobs = EvakaTurkuScheduledJobs(evakaTurkuRunner, env)

    @Bean
    fun passwordSpecification(): PasswordSpecification =
        DefaultPasswordSpecification(
            PasswordConstraints.UNCONSTRAINED.copy(
                minLength = 16,
                minLowers = 1,
                minUppers = 1,
                minDigits = 1,
                minSymbols = 1,
            ),
        )
}
