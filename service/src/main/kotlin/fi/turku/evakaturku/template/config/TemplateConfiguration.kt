// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.template.config

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
    override fun getPreparatoryDecisionPath(): String = "turku/preschool/decision"
}
