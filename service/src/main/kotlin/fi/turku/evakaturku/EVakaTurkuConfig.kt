package fi.turku.evakaturku

import fi.espoo.evaka.invoicing.domain.PaymentIntegrationClient
import fi.espoo.evaka.invoicing.service.DefaultInvoiceGenerationLogic
import fi.espoo.evaka.logging.defaultAccessLoggingValve
import fi.espoo.evaka.lookup
import fi.espoo.evaka.mealintegration.DefaultMealTypeMapper
import fi.espoo.evaka.mealintegration.MealTypeMapper
import fi.espoo.evaka.shared.FeatureConfig
import fi.espoo.evaka.shared.auth.UserRole
import fi.espoo.evaka.shared.security.actionrule.ActionRuleMapping
import fi.espoo.evaka.titania.TitaniaEmployeeIdConverter
import fi.turku.evakaturku.invoice.service.SftpConnector
import fi.turku.evakaturku.invoice.service.SftpSender
import fi.turku.evakaturku.payment.service.SapPaymentGenerator
import fi.turku.evakaturku.payment.service.TurkuPaymentIntegrationClient
import fi.turku.evakaturku.security.EvakaTurkuActionRuleMapping
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory
import org.springframework.boot.web.server.WebServerFactoryCustomizer
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.core.env.Environment

@Configuration
class EVakaTurkuConfig {
    @Bean
    fun featureConfig(env: Environment): FeatureConfig =
        FeatureConfig(
            valueDecisionCapacityFactorEnabled = false,
            // Mon 12:00
            citizenReservationThresholdHours = 6 * 24 + 12,
            dailyFeeDivisorOperationalDaysOverride = null,
            freeSickLeaveOnContractDays = true,
            alwaysUseDaycareFinanceDecisionHandler = true,
            freeAbsenceGivesADailyRefund = true,
            invoiceNumberSeriesStart = 1,
            paymentNumberSeriesStart = 1,
            unplannedAbsencesAreContractSurplusDays = false,
            maxContractDaySurplusThreshold = 13,
            useContractDaysAsDailyFeeDivisor = false,
            curriculumDocumentPermissionToShareRequired = true,
            assistanceDecisionMakerRoles = setOf(UserRole.DIRECTOR, UserRole.SPECIAL_EDUCATION_TEACHER),
            preschoolAssistanceDecisionMakerRoles = setOf(UserRole.DIRECTOR, UserRole.SPECIAL_EDUCATION_TEACHER),
            requestedStartUpperLimit = 14,
            preferredStartRelativeApplicationDueDate = true,
            postOffice = "TURKU",
            municipalMessageAccountName = "Turun kaupunki",
            serviceWorkerMessageAccountName = "Turun kaupunki",
            applyPlacementUnitFromDecision = false,
            fiveYearsOldDaycareEnabled = env.lookup("evaka.five_years_old_daycare.enabled") ?: false,
            archiveMetadataOrganization = "Turun kaupungin varhaiskasvatus",
            archiveMetadataConfigs = emptyMap(),
        )

    @Bean
    fun actionRuleMapping(): ActionRuleMapping = EvakaTurkuActionRuleMapping()

    @Bean
    fun invoiceGenerationLogicChooser() = DefaultInvoiceGenerationLogic // TODO: implement

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
}
