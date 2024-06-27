// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.template.config

import fi.espoo.evaka.decision.DecisionType
import fi.espoo.evaka.shared.domain.OfficialLanguage
import fi.espoo.evaka.shared.template.ITemplateProvider
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
class TemplateConfiguration {
    @Bean
    fun templateProvider(): ITemplateProvider = EVakaTurkuTemplateProvider()
}

internal class EVakaTurkuTemplateProvider : ITemplateProvider {
    override fun getFeeDecisionPath(): String = "turku/fee-decision/decision"

    override fun getVoucherValueDecisionPath(): String = "turku/fee-decision/voucher-value-decision"

    override fun getClubDecisionPath(): String = "turku/club/decision"

    override fun getDaycareVoucherDecisionPath(): String = "turku/daycare/voucher/decision"

    override fun getDaycareTransferDecisionPath(): String = "turku/daycare/decision"

    override fun getDaycareDecisionPath(): String = "turku/daycare/decision"

    override fun getPreschoolDecisionPath(): String = "turku/preschool/decision"

    override fun getPreparatoryDecisionPath(): String = "turku/preparatory/decision"

    override fun getAssistanceNeedDecisionPath(): String = "turku/assistance-need/decision"

    override fun getAssistanceNeedPreschoolDecisionPath(): String = "turku/assistance-need-preschool/decision"

    override fun getLocalizedFilename(
        type: DecisionType,
        lang: OfficialLanguage,
    ): String =
        when (type) {
            DecisionType.CLUB -> "Kerhopäätös"
            DecisionType.DAYCARE,
            DecisionType.DAYCARE_PART_TIME,
            -> "Varhaiskasvatuspäätös"
            DecisionType.PRESCHOOL -> "Esiopetuspäätös"
            DecisionType.PRESCHOOL_DAYCARE,
            DecisionType.PRESCHOOL_CLUB,
            -> "Esiopetukseen liittyvän toiminnan päätös"
            DecisionType.PREPARATORY_EDUCATION -> "Valmistavan opetuksen päätös"
        }
}
