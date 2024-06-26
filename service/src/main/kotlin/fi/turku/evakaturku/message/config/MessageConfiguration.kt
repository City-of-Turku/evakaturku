// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.message.config

import fi.espoo.evaka.decision.DecisionSendAddress
import fi.espoo.evaka.shared.domain.OfficialLanguage
import fi.espoo.evaka.shared.message.IMessageProvider
import org.springframework.beans.factory.config.YamlPropertiesFactoryBean
import org.springframework.context.MessageSource
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.support.AbstractMessageSource
import org.springframework.core.io.ClassPathResource
import org.springframework.core.io.Resource
import java.text.MessageFormat
import java.util.Locale
import java.util.Properties

internal const val PREFIX: String = "fi.turku.evakaturku.MessageProvider"

@Configuration
class MessageConfiguration {
    @Bean
    fun messageProvider(): IMessageProvider {
        val messageSource = YamlMessageSource(ClassPathResource("messages.yaml"))
        return EVakaTurkuMessageProvider(messageSource)
    }
}

internal class EVakaTurkuMessageProvider(val messageSource: MessageSource) : IMessageProvider {
    override fun getDecisionHeader(lang: OfficialLanguage): String =
        messageSource.getMessage("$PREFIX.DECISION_HEADER", null, resolveLocale(lang))

    override fun getDecisionContent(lang: OfficialLanguage): String =
        messageSource.getMessage("$PREFIX.DECISION_CONTENT", null, resolveLocale(lang))

    override fun getFeeDecisionHeader(lang: OfficialLanguage): String =
        messageSource.getMessage("$PREFIX.FEE_DECISION_HEADER", null, resolveLocale(lang))

    override fun getFeeDecisionContent(lang: OfficialLanguage): String =
        messageSource.getMessage("$PREFIX.FEE_DECISION_CONTENT", null, resolveLocale(lang))

    override fun getVoucherValueDecisionHeader(lang: OfficialLanguage): String =
        messageSource.getMessage("$PREFIX.VOUCHER_VALUE_DECISION_HEADER", null, resolveLocale(lang))

    override fun getVoucherValueDecisionContent(lang: OfficialLanguage): String =
        messageSource.getMessage("$PREFIX.VOUCHER_VALUE_DECISION_CONTENT", null, resolveLocale(lang))

    override fun getAssistanceNeedDecisionHeader(lang: OfficialLanguage): String =
        messageSource.getMessage("$PREFIX.ASSISTANCE_NEED_DECISION_HEADER", null, resolveLocale(lang))

    override fun getAssistanceNeedDecisionContent(lang: OfficialLanguage): String =
        messageSource.getMessage("$PREFIX.ASSISTANCE_NEED_DECISION_CONTENT", null, resolveLocale(lang))

    override fun getAssistanceNeedPreschoolDecisionHeader(lang: OfficialLanguage): String = getAssistanceNeedDecisionHeader(lang)

    override fun getAssistanceNeedPreschoolDecisionContent(lang: OfficialLanguage): String = getAssistanceNeedDecisionContent(lang)

    override fun getDefaultDecisionAddress(lang: OfficialLanguage): DecisionSendAddress =
        when (lang) {
            OfficialLanguage.FI ->
                DecisionSendAddress(
                    street = "PL 355",
                    postalCode = "20101",
                    postOffice = "Turku",
                    row1 = "Kasvatuksen ja opetuksen palvelukokonaisuus",
                    row2 = "Varhaiskasvatuksen ja esiopetuksen asiakaspalvelu",
                    row3 = "PL 355, 20101 Turku",
                )
            OfficialLanguage.SV ->
                DecisionSendAddress(
                    street = "PB 355",
                    postalCode = "20101",
                    postOffice = "Åbo stad",
                    row1 = "Servicehelheten för fostran och undervisning",
                    row2 = "Klientavgifter för småbarnspedagogik",
                    row3 = "PB 355, 20101 Åbo stad",
                )
        }

    override fun getDefaultFinancialDecisionAddress(lang: OfficialLanguage): DecisionSendAddress =
        when (lang) {
            OfficialLanguage.FI ->
                DecisionSendAddress(
                    street = "PL 355",
                    postalCode = "20101",
                    postOffice = "Turku",
                    row1 = "Kasvatuksen ja opetuksen palvelukokonaisuus",
                    row2 = "Varhaiskasvatuksen ja esiopetuksen asiakaspalvelu",
                    row3 = "PL 355, 20101 Turku",
                )
            OfficialLanguage.SV ->
                DecisionSendAddress(
                    street = "PB 355",
                    postalCode = "20101",
                    postOffice = "Åbo stad",
                    row1 = "Servicehelheten för fostran och undervisning",
                    row2 = "Klientavgifter för småbarnspedagogik",
                    row3 = "PB 355, 20101 Åbo stad",
                )
        }

    private fun resolveLocale(lang: OfficialLanguage): Locale {
        return Locale.of(lang.name.lowercase())
    }
}

internal class YamlMessageSource(resource: Resource) : AbstractMessageSource() {
    private val properties: Properties =
        YamlPropertiesFactoryBean().apply {
            setResources(resource)
            afterPropertiesSet()
        }.`object`!!

    override fun resolveCode(
        code: String,
        locale: Locale,
    ): MessageFormat? = properties.getProperty("$code.${locale.language.lowercase()}")?.let { MessageFormat(it, locale) }
}
