// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.emailclient.config

import fi.espoo.evaka.EvakaEnv
import fi.espoo.evaka.daycare.domain.Language
import fi.espoo.evaka.emailclient.EmailContent
import fi.espoo.evaka.emailclient.IEmailMessageProvider
import fi.espoo.evaka.invoicing.service.IncomeNotificationType
import fi.espoo.evaka.messaging.MessageThreadStub
import fi.espoo.evaka.messaging.MessageType
import fi.espoo.evaka.shared.ChildId
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

    override fun vasuNotification(language: Language, childId: ChildId): EmailContent {
        val documentsUrl = "${baseUrl(language)}/children/$childId"
        return EmailContent(
            subject = "Uusi dokumentti eVakassa / Nytt dokument i eVaka / New document in eVaka",
            text =
            """
                Sinulle on saapunut uusi dokumentti eVakaan. Lue dokumentti täältä: $documentsUrl
                
                Tämä on eVaka-järjestelmän automaattisesti lähettämä ilmoitus. Älä vastaa tähän viestiin.
                
                -----
       
                Du har fått ett nytt dokument i eVaka. Läs dokumentet här: $documentsUrl
                
                Detta besked skickas automatiskt av eVaka. Svara inte på detta besked. 
                
                -----
                
                You have received a new eVaka document. Read the document here: $documentsUrl
                
                This is an automatic message from the eVaka system. Do not reply to this message.  
        """
                .trimIndent(),
            html =
            """
                <p>Sinulle on saapunut uusi dokumentti eVakaan. Lue dokumentti täältä: <a href="$documentsUrl">$documentsUrl</a></p>
                <p>Tämä on eVaka-järjestelmän automaattisesti lähettämä ilmoitus. Älä vastaa tähän viestiin.</p>
            
                <hr>
                
                <p>Du har fått ett nytt dokument i eVaka. Läs dokumentet här: <a href="$documentsUrl">$documentsUrl</a></p>
                <p>Detta besked skickas automatiskt av eVaka. Svara inte på detta besked.</p>          
                
                <hr>
                
                <p>You have received a new eVaka document. Read the document here: <a href="$documentsUrl">$documentsUrl</a></p>
                <p>This is an automatic message from the eVaka system. Do not reply to this message.</p>       
        """
                .trimIndent()
        )
    }

    override fun pedagogicalDocumentNotification(language: Language): EmailContent {
        val documentsUrl = "${baseUrl(language)}/pedagogical-documents"
        return EmailContent(
            subject =
            "Uusi pedagoginen dokumentti eVakassa / Nytt pedagogiskt dokument i eVaka / New pedagogical document in eVaka",
            text =
            """
                Sinulle on saapunut uusi pedagoginen dokumentti eVakaan. Lue dokumentti täältä: $documentsUrl
                
                Tämä on eVaka-järjestelmän automaattisesti lähettämä ilmoitus. Älä vastaa tähän viestiin.
                
                -----
       
                Du har fått ett nytt pedagogiskt dokument i eVaka. Läs dokumentet här: $documentsUrl
                
                Detta besked skickas automatiskt av eVaka. Svara inte på detta besked. 
                
                -----
                
                You have received a new eVaka pedagogical document. Read the document here: $documentsUrl
                
                This is an automatic message from the eVaka system. Do not reply to this message.  
        """
                .trimIndent(),
            html =
            """
                <p>Sinulle on saapunut uusi pedagoginen dokumentti eVakaan. Lue dokumentti täältä: <a href="$documentsUrl">$documentsUrl</a></p>
                <p>Tämä on eVaka-järjestelmän automaattisesti lähettämä ilmoitus. Älä vastaa tähän viestiin.</p>
            
                <hr>
                
                <p>Du har fått ett nytt pedagogiskt dokument i eVaka. Läs dokumentet här: <a href="$documentsUrl">$documentsUrl</a></p>
                <p>Detta besked skickas automatiskt av eVaka. Svara inte på detta besked.</p>          
                
                <hr>
                
                <p>You have received a new eVaka pedagogical document. Read the document here: <a href="$documentsUrl">$documentsUrl</a></p>
                <p>This is an automatic message from the eVaka system. Do not reply to this message.</p>       
        """
                .trimIndent()
        )
    }

    override fun outdatedIncomeNotification(
            notificationType: IncomeNotificationType,
            language: Language
    ): EmailContent {
        return when (notificationType) {
            IncomeNotificationType.INITIAL_EMAIL -> outdatedIncomeNotificationInitial(language)
            IncomeNotificationType.REMINDER_EMAIL -> outdatedIncomeNotificationReminder(language)
            IncomeNotificationType.EXPIRED_EMAIL -> outdatedIncomeNotificationExpired()
        }
    }

    fun outdatedIncomeNotificationInitial(language: Language): EmailContent {
        val documentsUrl = "${baseUrl(language)}/income"
        return EmailContent(
                subject =
                "Tulotietojen tarkastus- kehotus / Uppmaning att göra en inkomstutredning / Request to review income information",
                text =
                """
                Hyvä asiakkaamme
                
                Varhaiskasvatuksen asiakasmaksun tai palvelusetelin omavastuuosuuden perusteena olevat tulotiedot tarkistetaan vuosittain.
                
                Pyydämme toimittamaan tuloselvityksen eVakassa 14 päivän kuluessa tästä ilmoituksesta.eVakassa voitte myös antaa suostumuksen korkeimpaan maksuluokkaan tai tulorekisterin käyttöön.
                
                Mikäli ette toimita uusia tulotietoja, asiakasmaksu määräytyy korkeimman maksuluokan mukaan. Puuttuvilla tulotiedoilla määrättyä maksua ei korjata takautuvasti.
                
                Voitte tarvittaessa toimittaa tulotiedot myös postitse osoitteeseen: Turun kaupunki / Kasvatuksen ja opetuksen palveluokokonaisuus, varhaiskasvatuksen asiakasmaksut/ PL 355 20101 Turun kaupunki
                
                Lisätietoja saatte tarvittaessa: paivahoitomaksut@turku.fi
                
                Tulotiedot: $documentsUrl
                
                Tämä on eVaka-järjestelmän automaattisesti lähettämä ilmoitus. Älä vastaa tähän viestiin.
                
                -----
                
                Bästa klient
                
                Inkomstuppgifterna som ligger till grund för klientavgiften för småbarnspedagogik eller servicesedelns egenandel granskas årligen.
                
                Vi ber att du skickar en inkomstutredning via eVaka inom 14 dagar från den här anmälan. I eVaka kan du också ge ditt samtycke till den högsta avgiften eller till användning av inkomstregistret.
                
                Om du inte lämnar in en ny inkomstutredning bestäms din klientavgift enligt den högsta avgiften. En avgift som fastställts på grund av bristfälliga inkomstuppgifter korrigeras inte retroaktivt.
                
                Du kan vid behov också skicka inkomstutredningen per post till adressen: Åbo stad / Servicehelheten för fostran och undervisning, klientavgifter för småbarnspedagogik / PB 355 20101 Åbo stad
                
                Mer information: paivahoitomaksut@turku.fi
                
                Inkomstuppgifterna: $documentsUrl
                
                Detta besked skickas automatiskt av eVaka. Svara inte på detta besked. 
                
                -----

                Dear client
                
                The income information used for determining the early childhood education fee or the out-of-pocket cost of a service voucher is reviewed every year.
                
                We ask you to submit your income statement through eVaka within 14 days of this notification. Through eVaka, you can also give your consent to the highest fee or the use of the Incomes Register.
                
                If you do not provide your latest income information, your client fee will be determined based on the highest fee category. We will not retroactively reimburse you for fees charged in a situation where you have not provided your income information.
                
                If necessary, you can also send your income information by post to the following address: City of Turku / Education Services, Early childhood education client fees / P.O. Box 355, 20101 City of Turku
                
                Inquiries: paivahoitomaksut@turku.fi.

                Income information: $documentsUrl    

                This is an automatic message from the eVaka system. Do not reply to this message.  
        """
                        .trimIndent(),
                html =
                """
                <p>Hyvä asiakkaamme</p>
                
                <p>Varhaiskasvatuksen asiakasmaksun tai palvelusetelin omavastuuosuuden perusteena olevat tulotiedot tarkistetaan vuosittain.</p>
                
                <p>Pyydämme toimittamaan tuloselvityksen eVakassa 14 päivän kuluessa tästä ilmoituksesta. eVakassa voitte myös antaa suostumuksen korkeimpaan maksuluokkaan tai tulorekisterin käyttöön. </p>
                
                <p>Mikäli ette toimita uusia tulotietoja, asiakasmaksu määräytyy korkeimman maksuluokan mukaan. Puuttuvilla tulotiedoilla määrättyä maksua ei korjata takautuvasti.</p>
                
                <p>Voitte tarvittaessa toimittaa tulotiedot myös postitse osoitteeseen: Turun kaupunki / Kasvatuksen ja opetuksen palveluokokonaisuus, varhaiskasvatuksen asiakasmaksut/ PL 355 20101 Turun kaupunki</p>
                
                <p>Lisätietoja saatte tarvittaessa: paivahoitomaksut@turku.fi</p>
                
                <p>Tulotiedot: <a href="$documentsUrl">$documentsUrl</a></p>
                
                <p>Tämä on eVaka-järjestelmän automaattisesti lähettämä ilmoitus. Älä vastaa tähän viestiin.</p>
            
                <hr>
                
                <p>Bästa klient</p>
                                
                <p>Inkomstuppgifterna som ligger till grund för klientavgiften för småbarnspedagogik eller servicesedelns egenandel granskas årligen.</p>
                                
                <p>Vi ber att du skickar en inkomstutredning via eVaka inom 14 dagar från den här anmälan. I eVaka kan du också ge ditt samtycke till den högsta avgiften eller till användning av inkomstregistret.</p>
                                
                <p>Om du inte lämnar in en ny inkomstutredning bestäms din klientavgift enligt den högsta avgiften. En avgift som fastställts på grund av bristfälliga inkomstuppgifter korrigeras inte retroaktivt.</p>
                                
                <p>Du kan vid behov också skicka inkomstutredningen per post till adressen: Åbo stad / Servicehelheten för fostran och undervisning, klientavgifter för småbarnspedagogik / PB 355 20101 Åbo stad</p>
                                
                <p>Mer information: paivahoitomaksut@turku.fi</p>
                                
                <p>Inkomstuppgifterna: <a href="$documentsUrl">$documentsUrl</a></p>
                                                
                <p>Detta besked skickas automatiskt av eVaka. Svara inte på detta besked.</p>          
                
                <hr>
                
                <p>Dear client</p>
                
                <p>The income information used for determining the early childhood education fee or the out-of-pocket cost of a service voucher is reviewed every year.</p>
                
                <p>We ask you to submit your income statement through eVaka within 14 days of this notification. Through eVaka, you can also give your consent to the highest fee or the use of the Incomes Register.</p>
                
                <p>If you do not provide your latest income information, your client fee will be determined based on the highest fee category. We will not retroactively reimburse you for fees charged in a situation where you have not provided your income information.</p>
                
                <p>If necessary, you can also send your income information by post to the following address: City of Turku / Education Services, Early childhood education client fees / P.O. Box 355, 20101 City of Turku</p>
                
                <p>Inquiries: paivahoitomaksut@turku.fi</p>
                
                <p>Income information: <a href="$documentsUrl">$documentsUrl</a></p>

                <p>This is an automatic message from the eVaka system. Do not reply to this message.</p>       
        """
                        .trimIndent()
        )
    }

    fun outdatedIncomeNotificationReminder(language: Language): EmailContent {
        val documentsUrl = "${baseUrl(language)}/income"
        return EmailContent(
                subject =
                "Tulotietojen tarkastus- kehotus / Uppmaning att göra en inkomstutredning / Request to review income information",
                text =
                """
                Hyvä asiakkaamme
                
                Ette ole vielä toimittaneet uusia tulotietoja. Varhaiskasvatuksen asiakasmaksun tai palvelusetelin omavastuuosuuden perusteena olevat tulotiedot tarkistetaan vuosittain.
                
                Pyydämme toimittamaan tuloselvityksen eVakassa 7 päivän kuluessa tästä ilmoituksesta. eVakassa voitte myös antaa suostumuksen korkeimpaan maksuluokkaan tai tulorekisterin käyttöön.
                
                Mikäli ette toimita uusia tulotietoja, asiakasmaksu määräytyy korkeimman maksuluokan mukaan. Puuttuvilla tulotiedoilla määrättyä maksua ei korjata takautuvasti.
                
                Voitte tarvittaessa toimittaa tulotiedot myös postitse osoitteeseen: Turun kaupunki / Kasvatuksen ja opetuksen palveluokokonaisuus, varhaiskasvatuksen asiakasmaksut/ PL 355 20101 Turun kaupunki    
                
                Lisätietoja saatte tarvittaessa: paivahoitomaksut@turku.fi
                
                Tulotiedot: $documentsUrl
                
                Tämä on eVaka-järjestelmän automaattisesti lähettämä ilmoitus. Älä vastaa tähän viestiin.
                
                -----
                
                Bästa klient
                
                Du har ännu inte lämnat in en ny inkomstutredning. Inkomstuppgifterna som ligger till grund för klientavgiften för småbarnspedagogik eller servicesedelns egenandel granskas årligen.
                
                Vi ber att du skickar en inkomstutredning via eVaka inom sju dagar från denna anmälan. I eVaka kan du också ge ditt samtycke till den högsta avgiften eller till användning av inkomstregistret.
                
                Om du inte lämnar in en ny inkomstutredning bestäms din klientavgift enligt den högsta avgiften. En avgift som fastställts på grund av bristfälliga inkomstuppgifter korrigeras inte retroaktivt.
                
                Du kan vid behov också skicka inkomstutredningen per post till adressen: Åbo stad / Servicehelheten för fostran och undervisning, klientavgifter för småbarnspedagogik / PB 355 20101 Åbo stad
                
                Mer information: paivahoitomaksut@turku.fi
                
                Inkomstuppgifterna: $documentsUrl
                
                Detta besked skickas automatiskt av eVaka. Svara inte på detta besked. 
                
                -----

                Dear client
                
                You have not yet submitted your latest income information. The income information used for determining the early childhood education fee or the out-of-pocket cost of a service voucher is reviewed every year.
                
                We ask you to submit your income statement through eVaka within 7 days of this notification. Through eVaka, you can also give your consent to the highest fee or the use of the Incomes Register.
                
                If you do not provide your latest income information, your client fee will be determined based on the highest fee category. We will not retroactively reimburse you for fees charged in a situation where you have not provided your income information. 
                
                If necessary, you can also send your income information by post to the following address: City of Turku / Education Services, Early childhood education client fees / P.O. Box 355, 20101 City of Turku
                
                Inquiries: paivahoitomaksut@turku.fi
                
                Income information: $documentsUrl
                
                This is an automatic message from the eVaka system. Do not reply to this message.  
        """
                        .trimIndent(),
                html =
                """
                <p>Hyvä asiakkaamme</p>
                
                <p>Ette ole vielä toimittaneet uusia tulotietoja. Varhaiskasvatuksen asiakasmaksun tai palvelusetelin omavastuuosuuden perusteena olevat tulotiedot tarkistetaan vuosittain.</p>
                
                <p>Pyydämme toimittamaan tuloselvityksen eVakassa 7 päivän kuluessa tästä ilmoituksesta. eVakassa voitte myös antaa suostumuksen korkeimpaan maksuluokkaan tai tulorekisterin käyttöön.</p>
                
                <p>Mikäli ette toimita uusia tulotietoja, asiakasmaksu määräytyy korkeimman maksuluokan mukaan. Puuttuvilla tulotiedoilla määrättyä maksua ei korjata takautuvasti.</p>
                
                <p>Voitte tarvittaessa toimittaa tulotiedot myös postitse osoitteeseen: Turun kaupunki / Kasvatuksen ja opetuksen palveluokokonaisuus, varhaiskasvatuksen asiakasmaksut/ PL 355 20101 Turun kaupunki</p>
                
                <p>Lisätietoja saatte tarvittaessa: paivahoitomaksut@turku.fi</p>
                
                <p>Tulotiedot: <a href="$documentsUrl">$documentsUrl</a></p>
                
                <p>Tämä on eVaka-järjestelmän automaattisesti lähettämä ilmoitus. Älä vastaa tähän viestiin.</p>
            
                <hr>
                
                <p>Bästa klient</p>
                                
                <p>Du har ännu inte lämnat in en ny inkomstutredning. Inkomstuppgifterna som ligger till grund för klientavgiften för småbarnspedagogik eller servicesedelns egenandel granskas årligen.</p>
                                
                <p>Vi ber att du skickar en inkomstutredning via eVaka inom sju dagar från denna anmälan. I eVaka kan du också ge ditt samtycke till den högsta avgiften eller till användning av inkomstregistret.</p>
                                
                <p>Om du inte lämnar in en ny inkomstutredning bestäms din klientavgift enligt den högsta avgiften. En avgift som fastställts på grund av bristfälliga inkomstuppgifter korrigeras inte retroaktivt.</p>
                                
                <p>Du kan vid behov också skicka inkomstutredningen per post till adressen: Åbo stad / Servicehelheten för fostran och undervisning, klientavgifter för småbarnspedagogik / PB 355 20101 Åbo stad</p>
                                
                <p>Mer information: paivahoitomaksut@turku.fi</p>
                                
                <p>Inkomstuppgifterna: <a href="$documentsUrl">$documentsUrl</a></p>
                                
                <p>Detta besked skickas automatiskt av eVaka. Svara inte på detta besked.</p>
                                
                <hr>
                
                <p>Dear client</p>
                                
                <p>You have not yet submitted your latest income information. The income information used for determining the early childhood education fee or the out-of-pocket cost of a service voucher is reviewed every year.</p>
                
                <p>We ask you to submit your income statement through eVaka within 7 days of this notification. Through eVaka, you can also give your consent to the highest fee or the use of the Incomes Register.</p>
                
                <p>If you do not provide your latest income information, your client fee will be determined based on the highest fee category. We will not retroactively reimburse you for fees charged in a situation where you have not provided your income information.</p> 
                
                <p>If necessary, you can also send your income information by post to the following address: City of Turku / Education Services, Early childhood education client fees / P.O. Box 355, 20101 City of Turku</p>
                               
                <p>Inquiries: paivahoitomaksut@turku.fi</p>
                                
                <p>Income information: <a href="$documentsUrl">$documentsUrl</a></p>
                                                
                <p>This is an automatic message from the eVaka system. Do not reply to this message.</p>       
        """
                        .trimIndent()
        )
    }

    fun outdatedIncomeNotificationExpired(): EmailContent {
        return EmailContent(
                subject =
                "Tulotietojen tarkastus- kehotus / Uppmaning att göra en inkomstutredning / Request to review income information",
                text =
                """
                Hyvä asiakkaamme
                
                Seuraava asiakasmaksunne määräytyy korkeimman maksuluokan mukaan, sillä ette ole toimittaneet uusia tulotietoja määräaikaan mennessä.
                
                Lisätietoja saatte tarvittaessa: paivahoitomaksut@turku.fi
                
                Tämä on eVaka-järjestelmän automaattisesti lähettämä ilmoitus. Älä vastaa tähän viestiin.
                
                -----
                
                Bästä klient
                
                Din följande klientavgift bestäms enligt den högsta avgiften, eftersom du inte har lämnat in en inkomstutredning inom utsatt tid.
                
                Mer information: paivahoitomaksut@turku.fi
                
                Detta besked skickas automatiskt av eVaka. Svara inte på detta besked. 
                
                -----
                
                Dear client
                
                Your next client fee will be determined based on the highest fee category as you did not provide your latest income information by the deadline.
                
                Inquiries: paivahoitomaksut@turku.fi

                This is an automatic message from the eVaka system. Do not reply to this message.  
        """
                        .trimIndent(),
                html =
                """
                <p>Hyvä asiakkaamme</p>
                
                <p>Seuraava asiakasmaksunne määräytyy korkeimman maksuluokan mukaan, sillä ette ole toimittaneet uusia tulotietoja määräaikaan mennessä.</p>
                
                <p>Lisätietoja saatte tarvittaessa: paivahoitomaksut@turku.fi</p>
                
                <p>Tämä on eVaka-järjestelmän automaattisesti lähettämä ilmoitus. Älä vastaa tähän viestiin.</p>
            
                <hr>
                
                <p>Bästä klient</p>
                
                <p>Din följande klientavgift bestäms enligt den högsta avgiften, eftersom du inte har lämnat in en inkomstutredning inom utsatt tid.</p>
                
                <p>Mer information: paivahoitomaksut@turku.fi</p>
                
                <p>Detta besked skickas automatiskt av eVaka. Svara inte på detta besked.</p>  
                
                <hr>
                
                <p>Dear client</p>
                
                <p>Your next client fee will be determined based on the highest fee category as you did not provide your latest income information by the deadline.</p>
                
                <p>Inquiries: paivahoitomaksut@turku.fi</p>

                <p>This is an automatic message from the eVaka system. Do not reply to this message.</p>
               """
                        .trimIndent()
        )
    }


}