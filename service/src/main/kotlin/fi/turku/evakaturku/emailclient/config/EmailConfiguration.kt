// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.emailclient.config

import fi.espoo.evaka.EvakaEnv
import fi.espoo.evaka.daycare.domain.Language
import fi.espoo.evaka.emailclient.EmailContent
import fi.espoo.evaka.emailclient.IEmailMessageProvider
import fi.espoo.evaka.messaging.MessageThreadStub
import fi.espoo.evaka.messaging.MessageType
import fi.espoo.evaka.shared.domain.FiniteDateRange
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.Profile
import java.time.format.DateTimeFormatter
import java.time.format.FormatStyle
import java.util.*

@Profile("evakaturku")
@Configuration
class EmailConfiguration {

    @Bean
    fun emailMessageProvider(env: EvakaEnv): IEmailMessageProvider = EmailMessageProvider(env)

}

internal class EmailMessageProvider(private val env: EvakaEnv): IEmailMessageProvider {
    private val subjectForPendingDecisionEmail: String = "Toimenpiteitäsi odotetaan"
    private val subjectForClubApplicationReceivedEmail: String = "Hakemus vastaanotettu"
    private val subjectForDaycareApplicationReceivedEmail: String = "Hakemus vastaanotettu"
    private val subjectForPreschoolApplicationReceivedEmail: String = "Hakemus vastaanotettu"
    private val subjectForDecisionEmail: String = "Päätös eVakassa"


    private fun baseUrl(language: Language) =
        when (language) {
            Language.sv -> env.frontendBaseUrlSv
            else -> env.frontendBaseUrlFi
        }
    override fun messageNotification(language: Language, thread: MessageThreadStub): EmailContent {
        val messageUrl = "${baseUrl(language)}/messages/${thread.id}"
        val (typeFi, typeSv, typeEn) =
            when (thread.type) {
                MessageType.MESSAGE ->
                    if (thread.urgent)
                        Triple(
                            "kiireellinen viesti",
                            "brådskande personligt meddelande",
                            "urgent message"
                        )
                    else Triple("viesti", "personligt meddelande", "message")
                MessageType.BULLETIN ->
                    if (thread.urgent)
                        Triple(
                            "kiireellinen tiedote",
                            "brådskande allmänt meddelande",
                            "urgent bulletin"
                        )
                    else Triple("tiedote", "allmänt meddelande", "bulletin")
            }
        return EmailContent(
            subject = "Uusi $typeFi eVakassa / Nytt $typeSv i eVaka / New $typeEn in eVaka",
            text =
            """
                Sinulle on saapunut uusi $typeFi eVakaan. Lue viesti ${if (thread.urgent) "mahdollisimman pian " else ""}täältä: $messageUrl
                
                Tämä on eVaka-järjestelmän automaattisesti lähettämä ilmoitus. Älä vastaa tähän viestiin.
                
                -----
       
                Du har fått ett nytt $typeSv i eVaka. Läs meddelandet ${if (thread.urgent) "så snart som möjligt " else ""}här: $messageUrl
                
                Detta besked skickas automatiskt av eVaka. Svara inte på detta besked. 
                
                -----
                
                You have received a new $typeEn in eVaka. Read the message ${if (thread.urgent) "as soon as possible " else ""}here: $messageUrl
                
                This is an automatic message from the eVaka system. Do not reply to this message.  
        """
                .trimIndent(),
            html =
            """
                <p>Sinulle on saapunut uusi $typeFi eVakaan. Lue viesti ${if (thread.urgent) "mahdollisimman pian " else ""}täältä: <a href="$messageUrl">$messageUrl</a></p>
                <p>Tämä on eVaka-järjestelmän automaattisesti lähettämä ilmoitus. Älä vastaa tähän viestiin.</p>
            
                <hr>
                
                <p>Du har fått ett nytt $typeSv i eVaka. Läs meddelandet ${if (thread.urgent) "så snart som möjligt " else ""}här: <a href="$messageUrl">$messageUrl</a></p>
                <p>Detta besked skickas automatiskt av eVaka. Svara inte på detta besked.</p>          
                
                <hr>
                
                <p>You have received a new $typeEn in eVaka. Read the message ${if (thread.urgent) "as soon as possible " else ""}here: <a href="$messageUrl">$messageUrl</a></p>
                <p>This is an automatic message from the eVaka system. Do not reply to this message.</p>       
        """
                .trimIndent()
        )
    }


    override fun pendingDecisionNotification(language: Language): EmailContent {
        return EmailContent(subjectForPendingDecisionEmail,getPendingDecisionEmailText(),getPendingDecisionEmailHtml())
    }
    fun getPendingDecisionEmailHtml(): String {
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

    fun getPendingDecisionEmailText(): String {
        return """
            Sinulla on vastaamaton päätös Turun varhaiskasvatukselta. Päätös tulee hyväksyä tai hylätä kahden viikon sisällä sen saapumisesta osoitteessa evaka.turku.fi
            
            Tähän viestiin ei voi vastata. Tarvittaessa ole yhteydessä varhaiskasvatuksen palveluohjaukseen p. 02 262 5610, puhelinpäivystys arkisin klo 9.00–15.00 (keskiviikkoisin 9–12).
            
            Ystävällisesti,
            Varhaiskasvatuksen palveluohjaus
            varhaiskasvatus@turku.fi
            p. 02 262 5610
        """.trimIndent()
    }

    override fun clubApplicationReceived(language: Language): EmailContent {
        return EmailContent(subjectForClubApplicationReceivedEmail, getClubApplicationReceivedEmailText(), getClubApplicationReceivedEmailHtml())
    }

    fun getClubApplicationReceivedEmailHtml(): String {
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

    fun getClubApplicationReceivedEmailText(): String {
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

    override fun daycareApplicationReceived(language: Language): EmailContent {
        return EmailContent(subjectForDaycareApplicationReceivedEmail, getDaycareApplicationReceivedEmailText(), getDaycareApplicationReceivedEmailHtml())
    }

    fun getDaycareApplicationReceivedEmailHtml(): String {
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

    fun getDaycareApplicationReceivedEmailText(): String {
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

    override fun assistanceNeedDecisionNotification(language: Language): EmailContent {
        return EmailContent(subjectForDecisionEmail, getDecisionEmailText() ,getDecisionEmailHtml())
    }

    fun getDecisionEmailHtml(): String {
        return """
        <p>Hei!</p>
       
        <p>Lapsellenne on tehty päätös.</p>
       
        <p>Päätös on nähtävissä eVakassa osoitteessa <a href="https://evaka.turku.fi">evaka.turku.fi</a>.</p>
        
        <p>Tähän viestiin ei voi vastata.</p>
       
    """.trimIndent()
    }

    fun getDecisionEmailText(): String {
        return """
        Hei!
        
        Lapsellenne on tehty päätös.
        
        Päätös on nähtävissä eVakassa osoitteessa https://evaka.turku.fi/.
        
        Tähän viestiin ei voi vastata.
        
    """.trimIndent()
    }

    override fun missingReservationsNotification(
        language: Language,
        checkedRange: FiniteDateRange
    ): EmailContent {
        val start =
            checkedRange.start.format(
                DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT).withLocale(Locale("fi", "FI"))
            )
        return EmailContent(
            subject =
            "Läsnäolovarauksia puuttuu / Det finns några närvarobokningar som saknas / There are missing attendance reservations",
            text =
            """
                Läsnäolovarauksia puuttuu $start alkavalta viikolta. Käythän merkitsemässä ne mahdollisimman pian.
                
                -----
                
                Det finns några närvarobokningar som saknas för veckan som börjar $start. Vänligen markera dem så snart som möjligt.
                
                ----
                
                There are missing attendance reservations for the week starting $start. Please mark them as soon as possible.
                """
                .trimIndent(),
            html =
            """
                <p>Läsnäolovarauksia puuttuu $start alkavalta viikolta. Käythän merkitsemässä ne mahdollisimman pian.</p>
                <hr>
                <p>Det finns några närvarobokningar som saknas för veckan som börjar $start. Vänligen markera dem så snart som möjligt.</p>
                <hr>
                <p>There are missing attendance reservations for week starting $start. Please mark them as soon as possible.</p>
            """
                .trimIndent()
        )
    }

    override fun preschoolApplicationReceived(language: Language, withinApplicationPeriod: Boolean): EmailContent {
        return EmailContent(subjectForPreschoolApplicationReceivedEmail, getPreschoolApplicationReceivedEmailText(), getPreschoolApplicationReceivedEmailHtml())
    }

    fun getPreschoolApplicationReceivedEmailHtml(): String {
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

    fun getPreschoolApplicationReceivedEmailText(): String {
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