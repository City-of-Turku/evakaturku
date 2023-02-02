package fi.turku.evakaturku

import fi.espoo.evaka.invoicing.service.DefaultInvoiceGenerationLogic
import fi.espoo.evaka.shared.FeatureConfig
import fi.espoo.evaka.shared.security.actionrule.ActionRuleMapping
import fi.turku.evakaturku.security.EvakaTurkuActionRuleMapping
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import fi.espoo.evaka.s3.DocumentService
import software.amazon.awssdk.services.s3.S3Client
import software.amazon.awssdk.services.s3.presigner.S3Presigner
import fi.espoo.evaka.BucketEnv
import fi.espoo.evaka.invoicing.domain.PaymentIntegrationClient
import fi.espoo.evaka.shared.auth.UserRole
import fi.turku.evakaturku.invoice.service.SftpConnector
import fi.turku.evakaturku.invoice.service.SftpSender
import fi.turku.evakaturku.payment.service.ProEPaymentGenerator
import fi.turku.evakaturku.payment.service.TurkuPaymentIntegrationClient

@Configuration
class EVakaTurkuConfig {

    @Bean
    fun featureConfig(): FeatureConfig = FeatureConfig(
        valueDecisionCapacityFactorEnabled = false,
        daycareApplicationServiceNeedOptionsEnabled = false,
        citizenReservationThresholdHours = 6 * 24, // Tue 00:00
        dailyFeeDivisorOperationalDaysOverride = null,
        freeSickLeaveOnContractDays = true,
        alwaysUseDaycareFinanceDecisionHandler = true,
        freeAbsenceGivesADailyRefund = true,
        invoiceNumberSeriesStart = 1,
        paymentNumberSeriesStart = 1,
        unplannedAbsencesAreContractSurplusDays = false,
        maxContractDaySurplusThreshold = 13,
        useContractDaysAsDailyFeeDivisor = false,
        enabledChildConsentTypes = setOf(),
        curriculumDocumentPermissionToShareRequired = true,
        assistanceDecisionMakerRoles = setOf(UserRole.DIRECTOR, UserRole.SPECIAL_EDUCATION_TEACHER),
        requestedStartUpperLimit = 7,
        partialAbsenceThresholdsEnabled = false,
        postOffice = "TURKU",
        municipalMessageAccountName = "Turun kaupunki",
        serviceWorkerMessageAccountName = "Turun kaupunki",
        applyPlacementUnitFromDecision = false
    )

    @Bean
    fun actionRuleMapping(): ActionRuleMapping = EvakaTurkuActionRuleMapping()

    @Bean
    fun invoiceGenerationLogicChooser() = DefaultInvoiceGenerationLogic // TODO: implement

    @Bean
    fun documentService(s3Client: S3Client, s3Presigner: S3Presigner, env: BucketEnv): DocumentService =
        DocumentService(s3Client, s3Presigner, env.proxyThroughNginx)

    @Bean
    fun paymentIntegrationClient(evakaProperties: EvakaTurkuProperties, paymentGenerator: ProEPaymentGenerator, sftpConnector: SftpConnector): PaymentIntegrationClient {
        val sftpSender = SftpSender(evakaProperties.sapPayments, sftpConnector)
        return TurkuPaymentIntegrationClient(paymentGenerator, sftpSender)
    }
}
