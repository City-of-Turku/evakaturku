// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.emailclient.config

import fi.espoo.evaka.daycare.domain.Language
import fi.espoo.evaka.emailclient.EmailContent
import fi.espoo.evaka.emailclient.IEmailMessageProvider
import fi.espoo.evaka.shared.AssistanceNeedDecisionId
import fi.espoo.evaka.shared.ChildId
import fi.espoo.evaka.shared.domain.FiniteDateRange
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.Profile

@Profile("evakaturku")
@Configuration
class EmailConfiguration {

    @Bean
    fun emailMessageProvider(): IEmailMessageProvider = EmailMessageProvider()
}

internal class EmailMessageProvider(): IEmailMessageProvider {
    override val subjectForPendingDecisionEmail: String = "Toimenpiteitäsi odotetaan"
    override val subjectForClubApplicationReceivedEmail: String = "Hakemus vastaanotettu"
    override val subjectForDaycareApplicationReceivedEmail: String = "Hakemus vastaanotettu"
    override val subjectForPreschoolApplicationReceivedEmail: String = "Hakemus vastaanotettu"
    override val subjectForDecisionEmail: String = "Päätös eVakassa"

    override fun getPendingDecisionEmailHtml(): String {
        return """
            <p>Sinulla on vastaamaton päätös Turun varhaiskasvatukselta. Päätös tulee hyväksyä tai hylätä kahden viikon sisällä sen saapumisesta osoitteessa <a href="https://evaka.turku.fi">evaka.turku.fi</a></p>
            
            <p>Tähän viestiin ei voi vastata. Tarvittaessa ole yhteydessä varhaiskasvatuksen palveluohjaukseen p. 02 262 5610, puhelinpäivystys arkisin klo 9.00–15.00 (keskiviikkoisin 9–12).</p>
            
            <p>
            Ystävällisesti,<br/>
            Varhaiskasvatuksen palveluohjaus<br/>
            varhaiskasvatus@turku.fi<br/>
            p. 02 262 5610<br/>
            </p>
        """.trimIndent()
    }

    override fun getPendingDecisionEmailText(): String {
        return """
            Sinulla on vastaamaton päätös Turun varhaiskasvatukselta. Päätös tulee hyväksyä tai hylätä kahden viikon sisällä sen saapumisesta osoitteessa evaka.turku.fi
            
            Tähän viestiin ei voi vastata. Tarvittaessa ole yhteydessä varhaiskasvatuksen palveluohjaukseen p. 02 262 5610, puhelinpäivystys arkisin klo 9.00–15.00 (keskiviikkoisin 9–12).
            
            Ystävällisesti,
            Varhaiskasvatuksen palveluohjaus
            varhaiskasvatus@turku.fi
            p. 02 262 5610
        """.trimIndent()
    }

    override fun getClubApplicationReceivedEmailHtml(): String {
        return """
            <p>Hei!</p>
           
            <p>Olemme vastaanottaneet lapsenne hakemuksen avoimeen varhaiskasvatukseen. Pyydämme teitä olemaan yhteydessä suoraan avoimen yksikön lähijohtajaan ja tiedustelemaan vapaata avoimen varhaiskasvatuksen paikkaa.</p>
           
            <p>Hakemuksia käsitellään pääsääntöisesti vastaanottopäivämäärän mukaan.</p>
           
            <p>Tähän viestiin ei voi vastata.</p>
           
            <p>Päätös on nähtävissä ja hyväksyttävissä/hylättävissä <a href="https://evaka.turku.fi">evaka.turku.fi</a>.</p>
           
            <p>
            Ystävällisesti, <br/>
            Varhaiskasvatuksen palveluohjaus<br/> 
            </p>
        """.trimIndent()
    }

    override fun getClubApplicationReceivedEmailText(): String {
        return """
           Hei! 
           
           Olemme vastaanottaneet lapsenne hakemuksen avoimeen varhaiskasvatukseen. Pyydämme teitä olemaan yhteydessä suoraan avoimen yksikön lähijohtajaan ja tiedustelemaan vapaata avoimen varhaiskasvatuksen paikkaa. 
           
           Hakemuksia käsitellään pääsääntöisesti vastaanottopäivämäärän mukaan.

           Tähän viestiin ei voi vastata.
            
           Päätös on nähtävissä ja hyväksyttävissä/hylättävissä evaka.turku.fi.
           
           Ystävällisesti, 
           Varhaiskasvatuksen palveluohjaus 

        """.trimIndent()
    }

    override fun getDaycareApplicationReceivedEmailHtml(): String {
        return """
            <p>Hei!</p>
            
            <p>Lapsenne varhaiskasvatushakemus on vastaanotettu. Hakemuksen tehnyt huoltaja voi muokata hakemusta osoitteessa <a href="https://evaka.turku.fi">evaka.turku.fi</a> siihen saakka, kunnes varhaiskasvatuksen palveluohjaus ottaa sen käsittelyyn. Varhaiskasvatuspaikan hakuaika on neljä kuukautta. Mikäli kyseessä on vanhemman äkillinen työllistyminen tai opintojen alkaminen, järjestelyaika on kaksi viikkoa. Toimittakaa tällöin työ- tai opiskelutodistus hakemuksen liitteeksi. Kahden viikon järjestelyaika alkaa todistuksen saapumispäivämäärästä. Vuorohoidon palveluita järjestetään vanhempien vuorotyön perusteella, jolloin pyydämme työvuoroista todistuksen.</p>
            
            <p><b>Mikäli lapsellenne järjestyy varhaiskasvatuspaikka jostakin hakemuksessa toivomastanne kunnallisesta varhaiskasvatuspaikasta</b>, ilmoitamme teille paikan noin kuukautta ennen varhaiskasvatuksen toivottua aloitusajankohtaa. Huomioittehan, että paikka voi järjestyä muualta kuin ensisijaisista hakutoiveista.</p>
            
            <p><b>Mikäli valitsitte ensimmäiseksi hakutoiveeksi yksityisen päiväkodin tai yksityisen perhepäivähoitajan</b>, olkaa suoraan yhteydessä kyseiseen palveluntuottajaan varmistaaksenne varhaiskasvatuspaikan saamisen. Mikäli toivomanne palveluntuottaja ei pysty tarjoamaan hoitopaikkaa, pyydämme teitä olemaan yhteydessä varhaiskasvatuksen palveluohjaukseen.</p> 
            
            <p><b>Siirtohakemukset</b> (lapsella on jo varhaiskasvatuspaikka Turun kaupungin varhaiskasvatusyksikössä) käsitellään pääsääntöisesti hakemuksen saapumispäivämäärän mukaan.</p>
            
            <p><b>Mikäli ilmoititte hakemuksessa lapsenne tuen tarpeesta</b>, varhaiskasvatuksen erityisopettaja on teihin yhteydessä, jotta lapsen tuen tarpeet voidaan ottaa huomioon paikkaa osoitettaessa.</p>
            
            <p>Päätös on nähtävissä ja hyväksyttävissä/hylättävissä <a href="https://evaka.turku.fi">evaka.turku.fi</a></p>
            
            <p>Hakemuksen liitteet voi lisätä suoraan sähköiselle hakemukselle tai toimittaa postitse osoitteeseen Varhaiskasvatuksen palveluohjaus, PL 355, 20101 Turku tai toimittamalla Kauppatorin Monitoriin, Varhaiskasvatuksen palveluohjaus, Aurakatu 8.</p> 

            <p>
            Ystävällisesti, <br/>
            Varhaiskasvatuksen palveluohjaus<br/> 
            </p>
            
            <p>Tämä on automaattinen viesti, joka kertoo lomakkeen tallennuksesta. Viestiin ei voi vastata reply-/ vastaa-toiminnolla.</p>
        """.trimIndent()
    }

    override fun getDaycareApplicationReceivedEmailText(): String {
        return """
            Hei! 
            
            Lapsenne varhaiskasvatushakemus on vastaanotettu. Hakemuksen tehnyt huoltaja voi muokata hakemusta osoitteessa evaka.turku.fi siihen saakka, kunnes varhaiskasvatuksen palveluohjaus ottaa sen käsittelyyn. Varhaiskasvatuspaikan hakuaika on neljä kuukautta. Mikäli kyseessä on vanhemman äkillinen työllistyminen tai opintojen alkaminen, järjestelyaika on kaksi viikkoa. Toimittakaa tällöin työ- tai opiskelutodistus hakemuksen liitteeksi. Kahden viikon järjestelyaika alkaa todistuksen saapumispäivämäärästä. Vuorohoidon palveluita järjestetään vanhempien vuorotyön perusteella, jolloin pyydämme työvuoroista todistuksen. 
            
            Mikäli lapsellenne järjestyy varhaiskasvatuspaikka jostakin hakemuksessa toivomastanne kunnallisesta varhaiskasvatuspaikasta, ilmoitamme teille paikan noin kuukautta ennen varhaiskasvatuksen toivottua aloitusajankohtaa. Huomioittehan, että paikka voi järjestyä muualta kuin ensisijaisista hakutoiveista.  
            
            Mikäli valitsitte ensimmäiseksi hakutoiveeksi yksityisen päiväkodin tai yksityisen perhepäivähoitajan, olkaa suoraan yhteydessä kyseiseen palveluntuottajaan varmistaaksenne varhaiskasvatuspaikan saamisen. Mikäli toivomanne palveluntuottaja ei pysty tarjoamaan hoitopaikkaa, pyydämme teitä olemaan yhteydessä varhaiskasvatuksen palveluohjaukseen. 
            
            Siirtohakemukset (lapsella on jo varhaiskasvatuspaikka Turun kaupungin varhaiskasvatusyksikössä) käsitellään pääsääntöisesti hakemuksen saapumispäivämäärän mukaan.
            
            Mikäli ilmoititte hakemuksessa lapsenne tuen tarpeesta, varhaiskasvatuksen erityisopettaja on teihin yhteydessä, jotta lapsen tuen tarpeet voidaan ottaa huomioon paikkaa osoitettaessa. 
            
            Päätös on nähtävissä ja hyväksyttävissä/hylättävissä evaka.turku.fi
            
            Hakemuksen liitteet voi lisätä suoraan sähköiselle hakemukselle tai toimittaa postitse osoitteeseen Varhaiskasvatuksen palveluohjaus, PL 355, 20101 Turku tai toimittamalla Kauppatorin Monitoriin, Varhaiskasvatuksen palveluohjaus, Aurakatu 8.
            
            Ystävällisesti, 
            Varhaiskasvatuksen palveluohjaus 

            Tämä on automaattinen viesti, joka kertoo lomakkeen tallennuksesta. Viestiin ei voi vastata reply-/ vastaa-toiminnolla.
        """.trimIndent()
    }

    override fun getDecisionEmailHtml(childId: ChildId, decisionId: AssistanceNeedDecisionId): String {
        return """
        <p>Hei!</p>
       
        <p>Lapsellenne on tehty päätös.</p>
       
        <p>Päätös on nähtävissä eVakassa osoitteessa <a href="https://evaka.turku.fi">evaka.turku.fi</a>.</p>
        
        <p>Tähän viestiin ei voi vastata.</p>
       
    """.trimIndent()
    }

    override fun getDecisionEmailText(childId: ChildId, decisionId: AssistanceNeedDecisionId): String {
        return """
        Hei!
        
        Lapsellenne on tehty päätös.
        
        Päätös on nähtävissä eVakassa osoitteessa https://evaka.turku.fi/.
        
        Tähän viestiin ei voi vastata.
        
    """.trimIndent()
    }

    override fun missingReservationsNotification(language: Language, checkedRange: FiniteDateRange): EmailContent {
        return EmailContent("", "", "")
    }

    override fun getPreschoolApplicationReceivedEmailHtml(withinApplicationPeriod: Boolean): String {
        return """
            <p>Hei!</p>
            
            <p>Olemme vastaanottaneet lapsenne hakemuksen esiopetukseen. Hakemuksen tehnyt huoltaja voi muokata hakemusta osoitteessa <a href="https://evaka.turku.fi">evaka.turku.fi</a> siihen saakka, kunnes varhaiskasvatuksen palveluohjaus ottaa sen käsittelyyn. Päätös on nähtävissä ja hyväksyttävissä/hylättävissä <a href="https://evaka.turku.fi">evaka.turku.fi</a>.</p>
            
            <p>Mikäli ilmoititte hakemuksessa lapsenne tuen tarpeesta, varhaiskasvatuksen erityisopettaja on teihin yhteydessä, jotta lapsen tuen tarpeet voidaan ottaa huomioon paikkaa osoitettaessa.</p>
            
            <p>ESIOPETUKSEN TÄYDENTÄVÄ VARHAISKASVATUS</p>
            
            <p>Mikäli hait esiopetukseen täydentävää varhaiskasvatusta, otathan huomioon:</p>
            
            <p><ul>
            <li>Vuorohoidon palveluita järjestetään vanhempien vuorotyön tai iltaisin ja/tai viikonloppuisin tapahtuvan opiskelun perusteella.</li>
            <li>Mikäli lapsellenne järjestyy varhaiskasvatuspaikka jostakin hakemuksessa toivomastanne kunnallisesta varhaiskasvatuspaikasta, ilmoitamme teille paikan viimeistään kaksi viikkoa ennen varhaiskasvatuksen toivottua aloitusajankohtaa.</li>
            <li>Mikäli valitsitte ensimmäiseksi hakutoiveeksi yksityisen päiväkodin, olkaa suoraan yhteydessä kyseiseen yksikköön varmistaaksenne varhaiskasvatuspaikan saamisen. Mikäli toivomanne palveluntuottaja ei pysty tarjoamaan hoitopaikkaa, pyydämme teitä olemaan yhteydessä varhaiskasvatuksen palveluohjaukseen.</li>
            <li>Siirtohakemukset (lapsella on jo varhaiskasvatuspaikka Turun kaupungin varhaiskasvatusyksikössä) käsitellään pääsääntöisesti hakemuksen saapumispäivämäärän mukaan.</li>
            </ul></p>
            
            <p>Päätös on nähtävissä ja hyväksyttävissä/hylättävissä evaka.turku.fi</p>
            
            <p>Hakemuksen liitteet voi lisätä suoraan sähköiselle hakemukselle tai toimittaa postitse osoitteeseen Varhaiskasvatuksen palveluohjaus, PL 355, 20101 Turku tai toimittamalla Kauppatorin Monitoriin, Varhaiskasvatuksen palveluohjaus, Aurakatu 8.</p>
            
            <p>
            Ystävällisesti,<br/>
            Varhaiskasvatuksen palveluohjaus<br/>
            </p>
        """.trimIndent()
    }

    override fun getPreschoolApplicationReceivedEmailText(withinApplicationPeriod: Boolean): String {
        return """
            Hei! 
            
            Olemme vastaanottaneet lapsenne hakemuksen esiopetukseen. Hakemuksen tehnyt huoltaja voi muokata hakemusta osoitteessa evaka.turku.fi siihen saakka, kunnes varhaiskasvatuksen palveluohjaus ottaa sen käsittelyyn. Päätös on nähtävissä ja hyväksyttävissä/hylättävissä evaka.turku.fi.
            
            Mikäli ilmoititte hakemuksessa lapsenne tuen tarpeesta, varhaiskasvatuksen erityisopettaja on teihin yhteydessä, jotta lapsen tuen tarpeet voidaan ottaa huomioon paikkaa osoitettaessa.

            ESIOPETUKSEN TÄYDENTÄVÄ VARHAISKASVATUS 

            Mikäli hait esiopetukseen täydentävää varhaiskasvatusta, otathan huomioon: 
            •	Vuorohoidon palveluita järjestetään vanhempien vuorotyön tai iltaisin ja/tai viikonloppuisin tapahtuvan opiskelun perusteella. 
            •	Mikäli lapsellenne järjestyy varhaiskasvatuspaikka jostakin hakemuksessa toivomastanne kunnallisesta varhaiskasvatuspaikasta, ilmoitamme teille paikan viimeistään kaksi viikkoa ennen varhaiskasvatuksen toivottua aloitusajankohtaa.
            •	Mikäli valitsitte ensimmäiseksi hakutoiveeksi yksityisen päiväkodin, olkaa suoraan yhteydessä kyseiseen yksikköön varmistaaksenne varhaiskasvatuspaikan saamisen. Mikäli toivomanne palveluntuottaja ei pysty tarjoamaan hoitopaikkaa, pyydämme teitä olemaan yhteydessä varhaiskasvatuksen palveluohjaukseen. 
            •	Siirtohakemukset (lapsella on jo varhaiskasvatuspaikka Turun kaupungin varhaiskasvatusyksikössä) käsitellään pääsääntöisesti hakemuksen saapumispäivämäärän mukaan.
             
            Päätös on nähtävissä ja hyväksyttävissä/hylättävissä evaka.turku.fi
             
            Hakemuksen liitteet voi lisätä suoraan sähköiselle hakemukselle tai toimittaa postitse osoitteeseen Varhaiskasvatuksen palveluohjaus, PL 355, 20101 Turku tai toimittamalla Kauppatorin Monitoriin, Varhaiskasvatuksen palveluohjaus, Aurakatu 8.

            Ystävällisesti, 
            Varhaiskasvatuksen palveluohjaus 
        """.trimIndent()
    }

}