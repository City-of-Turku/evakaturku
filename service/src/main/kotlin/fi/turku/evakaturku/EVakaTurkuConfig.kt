package fi.turku.evakaturku

import fi.espoo.evaka.shared.FeatureConfig
import fi.espoo.evaka.shared.security.PermittedRoleActions
import fi.espoo.evaka.shared.security.StaticPermittedRoleActions
import fi.turku.evakaturku.security.EvakaTurkuPermittedRoleActions
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
class EVakaTurkuConfig {

    @Bean
    fun featureConfig(): FeatureConfig = FeatureConfig(
        valueDecisionCapacityFactorEnabled = true,
        daycareApplicationServiceNeedOptionsEnabled = true,
        citizenReservationThresholdHours = 6 * 24, // Tue 00:00
        dailyFeeDivisorOperationalDaysOverride = null,
        freeSickLeaveOnContractDays = true
    )

    @Bean
    fun permittedRoleActions(): PermittedRoleActions = EvakaTurkuPermittedRoleActions(StaticPermittedRoleActions())
}
