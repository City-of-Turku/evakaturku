{
  /*
SPDX-FileCopyrightText: 2021 City of Turku

SPDX-License-Identifier: LGPL-2.1-or-later
*/
}

import React from 'react'

import {
  daycareAssistanceLevels,
  preschoolAssistanceLevels
} from 'lib-common/generated/api-types/assistance'
import { H3, P } from 'lib-components/typography'
import { EmployeeCustomizations } from 'lib-customizations/types'

import TurkuLogo from './city-logo-citizen.png'
import featureFlags from './featureFlags'

const customizations: EmployeeCustomizations = {
  appConfig: {},
  translations: {
    fi: {
      // override translations here
      incomeStatement: {
        incomesRegister:
          'Toimintan tulotietoni liitteenä ja tarvittaessa tuloni saa tarkistaa myös tulorekisteristä'
      },
      personProfile: {
        income: {
          details: {
            incomeCoefficients: {
              MONTHLY_WITH_HOLIDAY_BONUS: 'kuukausi + lomaraha',
              MONTHLY_NO_HOLIDAY_BONUS: 'kuukausi ilman lomarahaa',
              BI_WEEKLY_WITH_HOLIDAY_BONUS: '2 viikkoa + lomaraha',
              BI_WEEKLY_NO_HOLIDAY_BONUS: '2 viikkoa ilman lomarahaa',
              DAILY_ALLOWANCE_21_5: 'Päiväraha x 21,5',
              DAILY_ALLOWANCE_25: 'Päiväraha x 25',
              YEARLY: 'Vuosi'
            }
          }
        }
      },
      invoices: {
        buttons: {
          individualSendAlertText: ''
        }
      },
      preferredFirstName: {
        popupLink: 'Kutsumanimi',
        title: 'Kutsumanimi',
        description:
          'Voit määritellä eVakassa käytössä olevan kutsumanimesi. Kutsumanimen tulee olla jokin etunimistäsi.',
        select: 'Valitse kutsumanimi',
        confirm: 'Vahvista'
      },
      absences: {
        title: 'Poissaolot',
        absenceTypes: {
          OTHER_ABSENCE: 'Poissaolo',
          SICKLEAVE: 'Sairaus',
          UNKNOWN_ABSENCE: 'Ilmoittamaton poissaolo',
          PLANNED_ABSENCE: 'Sopimuspoissaolo',
          TEMPORARY_RELOCATION: 'Lapsi varasijoitettuna muualla',
          PARENTLEAVE: 'Vanhempainvapaa',
          FORCE_MAJEURE: 'Päiväkohtainen alennus',
          FREE_ABSENCE: 'Maksuton kesäpoissaolo',
          UNAUTHORIZED_ABSENCE: 'Ilmoittamaton päivystyksen poissaolo',
          NO_ABSENCE: 'Ei poissaoloa'
        },
        absenceTypesShort: {
          OTHER_ABSENCE: 'Poissaolo',
          SICKLEAVE: 'Sairaus',
          UNKNOWN_ABSENCE: 'Ilmoittamaton',
          PLANNED_ABSENCE: 'Sopimus',
          TEMPORARY_RELOCATION: 'Varasijoitus',
          PARENTLEAVE: 'Vanhempainvapaa',
          FORCE_MAJEURE: 'Päiväkohtainen alennus',
          FREE_ABSENCE: 'Maksuton kesäpoissaolo',
          UNAUTHORIZED_ABSENCE: 'Sakko',
          NO_ABSENCE: 'Ei poissa'
        },
        absenceTypeInfo: {
          OTHER_ABSENCE:
            'Käytetään aina, kun huoltaja on ilmoittanut poissaolosta mukaan lukien säännölliset vapaat ja loma-aika. Käytetään myös vuoroyksiköissä lasten lomamerkinnöissä tai muissa poissaoloissa, jotka ovat suunniteltujen läsnäolovarausten ulkopuolella.',
          SICKLEAVE: 'Merkitään kun lapsi on sairaana.',
          UNKNOWN_ABSENCE:
            'Käytetään silloin, kun huoltaja ei ole ilmoittanut poissaolosta, vaikuttaa heinäkuussa myös laskutukseen. Koodi muutetaan vain, jos kyseessä on sairauspoissaolo, jonka jatkumisesta huoltaja ilmoittaa seuraavana päivänä.',
          PLANNED_ABSENCE:
            'Palveluntarvesopimuksen (enintään 147h/kk, enintään 116h/kk, tai enintään 84h/kk mukaiset etukäteen ilmoitetut poissaolot',
          TEMPORARY_RELOCATION:
            'Lapselle on tehty varasijoitus toiseen yksikköön. Poissa omasta, läsnä muualla.',
          PARENTLEAVE:
            'Poissaolo merkitään sille lapselle, josta maksetaan Kelan vanhenpainrahaa.',
          FORCE_MAJEURE:
            'Käytetään vain erikoistilanteissa hallinnon ohjeiden mukaan. Yksittäisiä päiviä, joista on luvattu maksuhyvitys',
          FREE_ABSENCE: 'Kesäajan maksuton poissaolo',
          UNAUTHORIZED_ABSENCE: 'Ilmoittamaton päivystyksen poissaolo',
          NO_ABSENCE: 'Jos lapsi on paikalla, älä merkitse mitään.'
        },
        modal: {
          absenceSectionLabel: 'Poissaolon syy',
          placementSectionLabel: 'Toimintamuoto, jota poissaolo koskee',
          saveButton: 'Tallenna',
          cancelButton: 'Peruuta',
          absenceTypes: {
            OTHER_ABSENCE: 'Poissaolo',
            SICKLEAVE: 'Sairaus',
            UNKNOWN_ABSENCE: 'Ilmoittamaton poissaolo',
            PLANNED_ABSENCE: 'Sopimuspoissaolo',
            TEMPORARY_RELOCATION: 'Lapsi varasijoitettuna muualla',
            PARENTLEAVE: 'Vanhempainvapaa',
            FORCE_MAJEURE: 'Päiväkohtainen alennus',
            FREE_ABSENCE: 'Maksuton kesäpoissaolo',
            UNAUTHORIZED_ABSENCE: 'Ilmoittamaton päivystyksen poissaolo',
            NO_ABSENCE: 'Ei poissaoloa'
          },
          free: 'Maksuton',
          paid: 'Maksullinen',
          absenceSummaryTitle: 'Lapsen poissaolokooste'
        }
      },
      common: {
        careTypeLabels: {
          preschool: 'Esiopetusta täydentävä toiminta'
        }
      },
      footer: {
        cityLabel: 'Turun kaupunki',
        linkLabel: 'Turun varhaiskasvatus',
        linkHref: 'https://www.turku.fi/paivahoito-ja-koulutus/varhaiskasvatus'
      },
      childInformation: {
        assistance: {
          types: {
            preschoolAssistanceLevel: {
              SPECIAL_SUPPORT_WITH_DECISION_LEVEL_1:
                'Erityinen tuki ja pidennetty oppivelvollisuus - muu kuin vaikeimmin kehitysvammainen (Koskeen)',
              SPECIAL_SUPPORT_WITH_DECISION_LEVEL_2:
                'Erityinen tuki ja pidennetty oppivelvollisuus - vaikeimmin kehitysvammainen (Koskeen)'
            },
            otherAssistanceMeasureType: {
              TRANSPORT_BENEFIT: 'Esiopetuksen kuljetusetu',
              ACCULTURATION_SUPPORT: 'Lapsen kotoutumisen tuki (ELY)'
            }
          }
        },
        assistanceNeed: {
          fields: {
            capacityFactor: 'Lapsen paikkatarve',
            capacityFactorInfo:
              'Rakenteellinen tuki määräytyy yleensä lapsen iän ja palvelun tarpeen mukaan. Mikäli lapsella on sellainen tuen tarve, joka lisää rakenteellisen tuen tarvetta, lisätään tuen tarpeen kerroin tähän. Tuen tarpeen ja kertoimen lisää varhaiskasvatuksen erityisopettaja. Päiväkodinjohtaja lisää kertoimen integroidun ryhmän tai erityisryhmän osalta',
            bases: 'Perusteet'
          }
        },
        assistanceNeedDecision: {
          pedagogicalMotivationInfo:
            'Kirjataan ”Pedagogisten tuen muotojen perustelut käyvät ilmi lapsen varhaiskasvatussuunnitelmasta”.',
          structuralMotivationInfo:
            'Kirjataan: ”Rakenteelliset tuen muotojen perustelut käyvät ilmi lapsen varhaiskasvatussuunnitelmasta”. Pienryhmä voi tarkoittaa sekä alueellista integroitua ryhmää että pienennettyä ryhmää. Kirjoita tarkennus avoimeen kenttään koskien myös henkilöresurssin lisäystä (esim. tuen hoitaja ryhmässä).',
          careMotivationInfo:
            'Hoidollisen tuen muotojen perustelut käyvät ilmi lapsen varhaiskasvatussuunnitelmasta.',
          servicesInfo:
            'Valitse lapselle esitettävät tukipalvelut. Lisää mahdollinen perustelu.',
          guardiansHeardInfo:
            'Kirjaa tähän millä keinoin huoltajaa on kuultu (esim. palaveri, etäyhteys, huoltajan kirjallinen vastine). Jos huoltajaa ei ole kuultu, kirjaa tähän selvitys siitä, miten ja milloin hänet on kutsuttu kuultavaksi, ja miten ja milloin lapsen varhaiskasvatussuunnitelma on annettu huoltajalle tiedoksi. Kaikilla lapsen huoltajilla tulee olla mahdollisuus tulla kuulluksi.',
          viewOfTheGuardiansInfo:
            'Kirjaa tähän huoltajien näkemys lapselle esitetystä tuesta.',
          jurisdiction: '',
          jurisdictionText: '',
          unitMayChange: 'Loma-aikoina tuen järjestämispaikka saattaa muuttua.',
          appealInstructionsTitle: 'Oikaisuvaatimusohjeet',
          appealInstructions: (
            <>
              <H3>Oikaisuvaatimusohjeet</H3>
              <P>
                Edellä mainittuun päätökseen saa hakea oikaisua Lounais-Suomen
                aluehallintovirastolta 30 päivän kuluessa päätöksen
                tiedoksisaannista. Päätökseen ei saa hakea muutosta valittamalla
                tuomioistuimeen.
              </P>
              <P>Oikaisuvaatimuksen saa tehdä</P>
              <ul>
                <li>se, johon päätös on kohdistettu </li>
                <li>
                  {' '}
                  tai jonka oikeuteen, velvollisuuteen tai etuun päätös
                  välittömästi vaikuttaa.
                </li>
              </ul>
              <h3>Tiedoksisaanti</h3>
              <P>
                Mikäli päätös annetaan tiedoksi kirjeellä, asianosaisen (lapsen
                huoltajan) katsotaan saaneen päätöksestä tiedon, jollei muuta
                näytetä, 7 päivän kuluttua kirjeen lähettämisestä.
              </P>
              <P>
                Käytettäessä tavallista sähköistä tiedoksiantoa katsotaan
                asianosaisen saaneen tiedon päätöksestä kolmantena päivänä
                viestin lähettämisestä.
              </P>
              <P>
                Mikäli päätös annetaan tiedoksi henkilökohtaisesti, asianosaisen
                (lapsen huoltajan) katsotaan saaneen päätöksestä tiedon sinä
                päivänä, jona päätös on luovutettu asianosaiselle tai hänen
                lailliselle edustajalleen.
              </P>
              <P>
                Postitse saantitodistusta vastaan lähetetystä asiakirjasta
                katsotaan asianosaisen saaneen tiedonsaantitodistuksen
                osoittamana aikana.
              </P>
              <P>
                Tiedoksisaantipäivää ei lueta oikaisuvaatimusaikaan. Jos
                oikaisuvaatimusajan viimeinen päivä on pyhäpäivä,
                itsenäisyyspäivä, vapunpäivä, joulu- tai juhannusaatto tai
                arkilauantai, saa oikaisuvaatimuksen tehdä ensimmäisenä
                arkipäivänä sen jälkeen.
              </P>
              <H3>Oikaisuvaatimuksen sisältö</H3>
              <P>
                Oikaisuvaatimus on tehtävä kirjallisesti. Myös sähköinen
                asiakirja täyttää vaatimuksen kirjallisesta muodosta.
              </P>
              <P>Oikaisuvaatimuksessa on ilmoitettava</P>
              <ul>
                <li>päätös, johon haetaan oikaisua</li>
                <li>
                  miltä kohdin päätökseen haetaan oikaisua ja millaista oikaisua
                  siihen vaaditaan tehtäväksi
                </li>
                <li>perusteet, joilla oikaisua vaaditaan</li>
              </ul>
              <P>
                Oikaisuvaatimuksessa on ilmoitettava tekijän nimi ja kotikunta.
                Jos oikaisuvaatimuksen tekijän puhevaltaa käyttää hänen
                laillinen edustajansa tai asiamiehensä tai jos
                oikaisuvaatimuksen laatijana on joku muu henkilö,
                oikaisuvaatimuksessa on ilmoitettava myös tämän nimi ja
                kotikunta.
              </P>
              <P>
                Oikaisuvaatimuksessa on lisäksi ilmoitettava postiosoite,
                puhelinnumero ja muut tarvittavat yhteystiedot. Jos
                oikaisuvaatimusviranomaisen päätös voidaan antaa tiedoksi
                sähköisenä viestinä, yhteystietona pyydetään ilmoittamaan myös
                sähköpostiosoite.
              </P>
              <P>
                Oikaisuvaatimuksen tekijän, laillisen edustajan tai asiamiehen
                on allekirjoitettava oikaisuvaatimus. Sähköistä asiakirjaa ei
                kuitenkaan tarvitse täydentää allekirjoituksella, jos
                asiakirjassa on tiedot lähettäjästä eikä asiakirjan
                alkuperäisyyttä tai eheyttä ole syytä epäillä.
              </P>
              <P>Oikaisuvaatimuksessa on liitettävä</P>
              <ul>
                <li>
                  päätös, johon haetaan oikaisua, alkuperäisenä tai
                  jäljennöksenä
                </li>
                <li>
                  todistus siitä, minä päivänä päätös on annettu tiedoksi, tai
                  muu selvitys oikaisuvaatimusajan alkamisesta
                </li>
                <li>
                  asiakirjat, joihin oikaisuvaatimuksen tekijä vetoaa, jollei
                  niitä ole aikaisemmin toimitettu viranomaiselle.
                </li>
              </ul>
              <H3>Oikaisuvaatimuksen toimittaminen</H3>
              <P>
                Oikaisuvaatimus on toimitettava oikaisuvaatimusajan kuluessa
                Lounais-Suomen aluehallintovirastolle osoitteella:
              </P>
              <P>
                Lounais-Suomen aluehallintovirasto
                <br />
                PL 4, 13035 AVI
                <br />
                Itsenäisyydenaukio 2, 20800 Turku
                <br />
                Sähköposti: kirjaamo.lounais@avi.fi
                <br />
                Puh: 0295 018 000
                <br />
                Kirjaamon aukioloaika: 8.00–16.15
                <br />
                Fax (02) 2511 820
              </P>
              <P>
                Omalla vastuulla oikaisuvaatimuksen voi lähettää postitse tai
                lähetin välityksellä. Postiin oikaisuvaatimusasiakirjat on
                jätettävä niin ajoissa, että ne ehtivät perille viimeistään
                oikaisuvaatimusajan viimeisenä päivänä ennen viraston
                aukioloajan päättymistä.
              </P>
              <P>
                Omalla vastuulla oikaisuvaatimuksen voi toimittaa ennen
                oikaisuvaatimusajan päättymistä myös telekopiona/faxina tai
                sähköpostilla. Määräajassa toimitettava asiakirja on lähetettävä
                ennen määräajan päättymistä siten, että asiakirja on
                viranomaisen käytettävissä vastaanottolaitteessa tai
                tietojärjestelmässä.
              </P>
            </>
          )
        },
        assistanceNeedPreschoolDecision: {
          validFromInfo: (): React.ReactNode => (
            <ul>
              <li>
                Erityinen tuki alkaa merkitään huoltajien kuulemispäivämäärästä
                tai esiopetuksen alkamispäivästä (jos päätös tehdään ennen
                esiopetuksen alkua)
              </li>
              <li>
                Erityinen tuki jatkuu merkitään, kun lapsi vaihtaa
                esiopetusyksikköä/tukimuotoihin (esim. lapsi siirtyy
                erityisryhmään) tulee muutoksia/saa päätöksen koululykkäyksestä
              </li>
              <li>
                Erityinen tuki päättyy merkitään, kun erityinen tuki
                esiopetuksessa puretaan
              </li>
            </ul>
          ),
          grantedAssistanceSectionInfo: (): React.ReactNode =>
            'Merkitään jos lapselle myönnetään avustamis-/tulkitsemispalveluita tai apuvälineitä. Kirjataan perusteluihin ”Lapselle myönnetään perusopetuslain 31§ mukaisena tukipalveluna avustamispalvelua/tarvittavat erityiset apuvälineet/tulkitsemispalvelua/opetuksen poikkeava järjestäminen”. ',
          primaryGroupInfo: (): React.ReactNode =>
            'Kirjaa tähän ryhmän muoto erityisryhmä, alueellinen integroitu ryhmä/esiopetusryhmä/muu mikä? ',
          decisionBasisInfo: (): React.ReactNode =>
            'Kirjaa mihin selvityksiin päätös perustuu (pedagoginen selvitys ja/tai psykologinen tai lääketieteellinen lausunto sekä päivämäärät). Kirjaa tähän mikä pidennetyn oppivelvollisuuden vaihtoehto lapselle on valittu.',
          documentBasisInfo: (): React.ReactNode =>
            'Merkitse mihin asiakirjoihin päätös perustuu.',
          heardGuardiansInfo: (): React.ReactNode =>
            'Kirjaa tähän millä keinoin huoltajaa on kuultu (esim. palaveri, etäyhteys, huoltajan kirjallinen vastine). Jos huoltajaa ei ole kuultu, kirjaa tähän selvitys siitä, miten ja milloin hänet on kutsuttu kuultavaksi, ja miten ja milloin lapsen esiopetuksen oppimissuunnitelma on annettu huoltajalle tiedoksi. Kaikilla lapsen huoltajilla tulee olla mahdollisuus tulla kuulluksi.',
          viewOfGuardiansInfo: (): React.ReactNode => (
            <div>
              <p>Kirjaa tähän huoltajien näkemys lapselle esitetystä tuesta.</p>
              <p>
                Kirjaa tähän myös lapsen mielipide asiaan tai kirjaa ”lapsi ei
                ikänsä ja/tai kehitystasonsa puolesta pysty ilmaisemaan
                mielipidettään”.
              </p>
            </div>
          ),
          jurisdiction: '',
          jurisdictionText: '',
          appealInstructions: (
            <>
              <H3>Oikaisuvaatimusohjeet</H3>
              <P>
                Edellä mainittuun päätökseen saa hakea oikaisua Lounais-Suomen
                aluehallintovirastolta 14 päivän kuluessa päätöksen
                tiedoksisaannista. Päätökseen ei saa hakea muutosta valittamalla
                tuomioistuimeen.
              </P>
              <P>Oikaisuvaatimuksen saa tehdä</P>
              <ul>
                <li>se, johon päätös on kohdistettu </li>
                <li>
                  {' '}
                  tai jonka oikeuteen, velvollisuuteen tai etuun päätös
                  välittömästi vaikuttaa.
                </li>
              </ul>
              <h3>Tiedoksisaanti</h3>
              <P>
                Mikäli päätös annetaan tiedoksi kirjeellä, asianosaisen (lapsen
                huoltajan) katsotaan saaneen päätöksestä tiedon, jollei muuta
                näytetä, 7 päivän kuluttua kirjeen lähettämisestä.
              </P>
              <P>
                Käytettäessä tavallista sähköistä tiedoksiantoa katsotaan
                asianosaisen saaneen tiedon päätöksestä kolmantena päivänä
                viestin lähettämisestä.
              </P>
              <P>
                Mikäli päätös annetaan tiedoksi henkilökohtaisesti, asianosaisen
                (lapsen huoltajan) katsotaan saaneen päätöksestä tiedon sinä
                päivänä, jona päätös on luovutettu asianosaiselle tai hänen
                lailliselle edustajalleen.
              </P>
              <P>
                Postitse saantitodistusta vastaan lähetetystä asiakirjasta
                katsotaan asianosaisen saaneen tiedonsaantitodistuksen
                osoittamana aikana.
              </P>
              <P>
                Tiedoksisaantipäivää ei lueta oikaisuvaatimusaikaan. Jos
                oikaisuvaatimusajan viimeinen päivä on pyhäpäivä,
                itsenäisyyspäivä, vapunpäivä, joulu- tai juhannusaatto tai
                arkilauantai, saa oikaisuvaatimuksen tehdä ensimmäisenä
                arkipäivänä sen jälkeen.
              </P>
              <H3>Oikaisuvaatimuksen sisältö</H3>
              <P>
                Oikaisuvaatimus on tehtävä kirjallisesti. Myös sähköinen
                asiakirja täyttää vaatimuksen kirjallisesta muodosta.
              </P>
              <P>Oikaisuvaatimuksessa on ilmoitettava</P>
              <ul>
                <li>päätös, johon haetaan oikaisua</li>
                <li>
                  miltä kohdin päätökseen haetaan oikaisua ja millaista oikaisua
                  siihen vaaditaan tehtäväksi
                </li>
                <li>perusteet, joilla oikaisua vaaditaan</li>
              </ul>
              <P>
                Oikaisuvaatimuksessa on ilmoitettava tekijän nimi ja kotikunta.
                Jos oikaisuvaatimuksen tekijän puhevaltaa käyttää hänen
                laillinen edustajansa tai asiamiehensä tai jos
                oikaisuvaatimuksen laatijana on joku muu henkilö,
                oikaisuvaatimuksessa on ilmoitettava myös tämän nimi ja
                kotikunta.
              </P>
              <P>
                Oikaisuvaatimuksessa on lisäksi ilmoitettava postiosoite,
                puhelinnumero ja muut tarvittavat yhteystiedot. Jos
                oikaisuvaatimusviranomaisen päätös voidaan antaa tiedoksi
                sähköisenä viestinä, yhteystietona pyydetään ilmoittamaan myös
                sähköpostiosoite.
              </P>
              <P>
                Oikaisuvaatimuksen tekijän, laillisen edustajan tai asiamiehen
                on allekirjoitettava oikaisuvaatimus. Sähköistä asiakirjaa ei
                kuitenkaan tarvitse täydentää allekirjoituksella, jos
                asiakirjassa on tiedot lähettäjästä eikä asiakirjan
                alkuperäisyyttä tai eheyttä ole syytä epäillä.
              </P>
              <P>Oikaisuvaatimuksessa on liitettävä</P>
              <ul>
                <li>
                  päätös, johon haetaan oikaisua, alkuperäisenä tai
                  jäljennöksenä
                </li>
                <li>
                  todistus siitä, minä päivänä päätös on annettu tiedoksi, tai
                  muu selvitys oikaisuvaatimusajan alkamisesta
                </li>
                <li>
                  asiakirjat, joihin oikaisuvaatimuksen tekijä vetoaa, jollei
                  niitä ole aikaisemmin toimitettu viranomaiselle.
                </li>
              </ul>
              <H3>Oikaisuvaatimuksen toimittaminen</H3>
              <P>
                Oikaisuvaatimus on toimitettava oikaisuvaatimusajan kuluessa
                Lounais-Suomen aluehallintovirastolle osoitteella:
              </P>
              <P>
                Lounais-Suomen aluehallintovirasto
                <br />
                PL 4, 13035 AVI
                <br />
                Itsenäisyydenaukio 2, 20800 Turku
                <br />
                Sähköposti: kirjaamo.lounais@avi.fi
                <br />
                Puh: 0295 018 000
                <br />
                Kirjaamon aukioloaika: 8.00–16.15
                <br />
                Fax (02) 2511 820
              </P>
              <P>
                Omalla vastuulla oikaisuvaatimuksen voi lähettää postitse tai
                lähetin välityksellä. Postiin oikaisuvaatimusasiakirjat on
                jätettävä niin ajoissa, että ne ehtivät perille viimeistään
                oikaisuvaatimusajan viimeisenä päivänä ennen viraston
                aukioloajan päättymistä.
              </P>
              <P>
                Omalla vastuulla oikaisuvaatimuksen voi toimittaa ennen
                oikaisuvaatimusajan päättymistä myös telekopiona/faxina tai
                sähköpostilla. Määräajassa toimitettava asiakirja on lähetettävä
                ennen määräajan päättymistä siten, että asiakirja on
                viranomaisen käytettävissä vastaanottolaitteessa tai
                tietojärjestelmässä.
              </P>
            </>
          )
        },
        assistanceAction: {
          title: 'Tukitoimet ja tukipalvelut',
          fields: {
            actions: 'Rakenteelliset tukitoimet'
          }
        },
        dailyServiceTimes: {
          info: 'Tallenna tähän varhaiskasvatussopimuksella sovittu päivittäinen läsnäoloaika.',
          info2: ''
        }
      },
      unit: {
        placementProposals: {
          rejectReasons: {
            REASON_1: 'Vapaat paikat vain esiopetuksen ryhmässä',
            REASON_2: 'Palvelusetelituottajan paikat täynnä',
            OTHER: 'Muu syy - perustelut'
          },
          infoTitle: '',
          infoText: ''
        }
      },
      login: {
        loginAD: 'Kirjaudu edu.turku.fi-tunnuksella'
      },
      placement: {
        type: {
          DAYCARE: 'Varhaiskasvatus',
          DAYCARE_PART_TIME: 'Osapäiväinen varhaiskasvatus',
          PRESCHOOL: 'Esiopetus',
          PRESCHOOL_DAYCARE: 'Esiopetus ja täydentävä varhaiskasvatus',
          PREPARATORY: 'Valmistava opetus',
          PREPARATORY_DAYCARE: 'Valmistava ja täydentävä varhaiskasvatus',
          DAYCARE_FIVE_YEAR_OLDS: '5-vuotiaiden maksuton varhaiskasvatus',
          DAYCARE_PART_TIME_FIVE_YEAR_OLDS:
            '5-vuotiaiden maksuton ja täydentävä varhaiskasvatus',
          CLUB: 'Kerho ja puisto',
          TEMPORARY_DAYCARE: 'Tilapäinen varhaiskasvatus',
          SCHOOL_SHIFT_CARE: 'Koululaisten vuorohoito'
        }
      },
      unitEditor: {
        placeholder: {
          phone: 'esim. +358 40 555 5555',
          email: 'etunimi.sukunimi@turku.fi',
          url: 'esim. https://www.turku.fi/toimipaikat/peppiina-paaskyvuori-kaenkuja-3',
          streetAddress: 'Kadun nimi esim. Käenkuja 3',
          decisionCustomization: {
            name: 'esim. Ankkalammen Peppiina'
          }
        },
        field: {
          decisionCustomization: {
            handler: ['Palveluohjaus', 'Varhaiskasvatusyksikön johtaja']
          }
        }
      },
      welcomePage: {
        text: 'Olet kirjautunut sisään eVaka-Turku palveluun. Käyttäjätunnuksellesi ei ole vielä annettu oikeuksia, jotka mahdollistavat palvelun käytön. Tarvittavat käyttöoikeudet saat eVakan pääkäyttäjältä ilmoittamalla kirjautumisestasi varkas.tietojarjestelmat@turku.fi'
      }
    },
    sv: {
      childInformation: {
        assistanceNeedDecision: {
          pageTitle: 'Beslut om behov av stöd inom småbarnspedagogik',
          pedagogicalMotivationInfo:
            'Beskriv "Motiveringen för formerna av pedagogiskt stöd anges i barnets plan för småbarnspedagogik".',
          structuralMotivationInfo:
            'Beskriv: "Den strukturella motiveringen för stödformerna anges i barnets plan för småbarnspedagogik". Små grupp kan betyda både en regional integrerad grupp och en reducerad grupp. Ange ett förtydligande i det öppna fältet om även en ökning av personalresurserna (t.ex. en stödsköterska i gruppen).',
          careMotivationInfo:
            'Motiveringen för formerna av vårdrinktande stöd anges i barnets plan för smäbarnspedagogik.',
          servicesInfo:
            'Välj de stödtjänster som ska presenteras för barnet. Lägg till en motivering, om tillämpligt.',
          guardiansHeardInfo:
            'Ange här på vilket sätt vårdnadshavaren rådfrågades (t.ex. möte, distanskontakt, skriftligt svar från vårdnadshavaren). Om vårdnadshavaren inte rådfrågades, ange här en förklaring av hur och när han eller hon bjöds in till utfrågningen och hur och när planen för småbarnspedagogik meddelades vårdnadshavaren. Alla vårdnadshavare måste få möjlighet att höras.',
          viewOfTheGuardiansInfo:
            'Anteckna här vårdnadshavarnas syn på det stöd som ges till barnet.',
          jurisdiction: '',
          jurisdictionText: '',
          unitMayChange: 'Enheten kan ändras under semestertider',
          appealInstructions: (
            <>
              <H3>Anvisning om hur man begär omprövning</H3>
              <P>
                Du kan begära om omprövning av ovanstående beslut hos
                Regionförvaltningsverket i Sydvästra Finland inom 14 dagar från
                dagen för delfående av beslutet. Beslutet kan inte överklagas
                genom besvär hos förvaltningsdomstolen.
              </P>
              <P>En begäran om omprövning</P>
              <ul>
                <li>får göras av den person som beslutet gäller </li>
                <li>
                  {' '}
                  eller den person vars rätt, skyldighet eller fördel direkt
                  påverkas av beslutet.
                </li>
              </ul>
              <h3>Delfående</h3>
              <P>
                Om beslutet delgivits per brev, anses den berörda parten
                (barnets vårdnadshavare) ha tagit del av beslutet, om inte annat
                bevisas, 7 dagar efter det att brevet skickades.
              </P>
              <P>
                Om beslutet skickas elektroniskt anses den berörda parten ha
                tagit del av beslutet tre dagar efter att meddelandet skickades.
              </P>
              <P>
                Om beslutet delges personligen, anses den berörda parten
                (barnets vårdnadshavare) ha tagit del av beslutet den dag då
                beslutet delgivits till den berörda parten eller deras lagliga
                företrädare.
              </P>
              <P>
                Om dokumentet skickas med post mot ett mottagningsbevis , anses
                den berörda parten ha tagit del av beslutet vid den tidpunkt som
                anges i mottagningsbeviset.
              </P>
              <P>
                Själva delfåendedagen räknas inte med i besvärstiden. Om
                besvärstidens sista dag infaller på en helgdag,
                självständighetsdagen, första maj, jul- eller midsommarafton
                eller en helgfri lördag är den första dagen då man får göra en
                begäran om omprövning den följande vardagen.
              </P>
              <H3>Innehållet i begäran om omprövning</H3>
              <P>
                Begäran ska vara skriftlig. Ett elektroniskt dokument fyller
                också kravet på en skriftlig begäran.
              </P>
              <P>I begäran om omprövning ska det framgå</P>
              <ul>
                <li>vilket beslut begäran handlar om</li>
                <li>
                  vilka punkter i beslutet begäran berör och hurdan omprövning
                  som begärs
                </li>
                <li>på vilka grunder omprövning begärs</li>
              </ul>
              <P>
                Begäran om omprövning måste innehålla namnet och hemorten till
                den som begär omprövning. Om begäran bereds av en laglig
                företrädare till den som begär omprövning eller hens
                representant, eller om begäran bereds av en annan person, ska
                också dennes namn och hemort anges i begäran.
              </P>
              <P>
                En begäran om omprövning ska även innehålla dennes postadress,
                telefonnummer och andra relevanta kontaktuppgifter. Om beslutet
                kan meddelas elektroniskt, bör även e-postadress anges.
              </P>
              <P>
                Den som framställt begäran eller dennes lagliga företrädare
                eller ombud ska underteckna begäran. Ett elektroniskt dokument
                behöver inte undertecknas om dokumentet innehåller avsändarens
                uppgifter och det finns ingen anledning att tvivla på dess
                äkthet eller integritet.
              </P>
              <P>Till begäran om omprövning bifogas</P>
              <ul>
                <li>beslutet som begäran gäller (originalet eller en kopia)</li>
                <li>
                  ett intyg från vilket det framgår när beslutet delgavs eller
                  en annan utredning där det framgår när besvärstiden började.
                </li>
                <li>
                  dokumenten som den som skickat in begäran åberopar i fall
                  dessa inte tidigare skickats till myndigheten.
                </li>
              </ul>
              <H3>Inlämnande av en begäran om omprövning</H3>
              <P>
                Begäran om omprövning skickas in inom besvärstiden till
                Regionförvaltiningsverket i Västra och Inre Finland på adressen:
              </P>
              <P>
                Regionförvaltiningsverket i Västra och Inre Finland
                <br />
                PB 5, 13035 AVI
                <br />
                Wolffskavägen 35
                <br />
                E-post: registratur.vastra@rfv.fi
                <br />
                Tfn: 0295 018 450
                <br />
                Öppettider för registratorskontoret: 8.00–16.15
              </P>
              <P>
                Om begäran om omprövning skickas via post eller med bud sker
                detta på avsändarens eget ansvar. Dokumenten i begäran om
                omprövning ska skickas per post i så god tid att de hinner fram
                senast under besvärstidens sista dag innan registratorskontoret
                stänger.
              </P>
              <P>
                Begäran om omprövning kan också skickas in via fax eller e-post
                innan besvärstiden upphör, men detta sker på avsändarens eget
                ansvar. Avsändaren ska se till att dokumentet levereras så att
                det befinner sig i myndighetens mottagningsenhet eller
                informationssystem innan tidsfristen.
              </P>
            </>
          )
        },
        assistanceNeedPreschoolDecision: {
          validFromInfo: (): React.ReactNode => (
            <ul>
              <li>
                Starten för särskilt stöd markeras från datumet för samrådet med
                föräldrarna eller starten av förskoleundervisningen (om beslutet
                fattas före starten av förskoleundervisningen).
              </li>
              <li>
                Särskilt stöd fortsätter att registreras när barnet byter
                förskoleenhet/stödform (t.ex. barnet flyttas till en särskild
                grupp) byter/tar emot ett beslut om avstängning från skolan.
              </li>
              <li>
                Upphörande av särskilt stöd registreras när särskilt stöd i
                förskoleverksamhet upphör
              </li>
            </ul>
          ),
          grantedAssistanceSectionInfo: (): React.ReactNode =>
            'Anges om barnet har tillgång till assistans/tolkningstjänster eller hjälpmedel. Anges i motiveringen "Barnet har tillgång till assistanstjänster/särskilda hjälpmedel/tolktjänster/exceptionell organisation av undervisningen som en stödtjänst i enlighet med § 31 i lagen om grundläggande utbildning".',
          primaryGroupInfo: (): React.ReactNode =>
            'Ange här typ av grupp specialgrupp, regional integrerad grupp/förskolegrupp/annat vad?',
          decisionBasisInfo: (): React.ReactNode =>
            'Ange vilka rapporter som ligger till grund för beslutet (pedagogisk utredning och/eller psykologisk eller medicinsk utredning samt datum). Ange här vilket alternativ av förlängd läroplikt som har valts för barnet.',
          documentBasisInfo: (): React.ReactNode =>
            'Ange vilka dokument som beslutet baseras på',
          heardGuardiansInfo: (): React.ReactNode =>
            'Ange här på vilket sätt vårdnadshavaren hördes (t.ex. möte, distanskontakt, skriftligt svar från vårdnadshavaren). Om vårdnadshavaren inte hördes, ange här en förklaring till hur och när han eller hon bjöds in till hörandet och hur och när barnets plan för lärande i förskolan meddelades vårdnadshavaren. Alla vårdnadshavare måste få möjlighet att höras.',
          viewOfGuardiansInfo: (): React.ReactNode => (
            <div>
              <p>
                Anteckna här vårdnadshavarnas åsikter om det stöd som ges till
                barnet.
              </p>
              <p>
                Skriv också barnets åsikt i frågan eller skriv &quot;barnet kan
                inte uttrycka sin åsikt på grund av sin ålder och/eller
                utvecklingsnivå&quot;.
              </p>
            </div>
          ),
          jurisdiction: '',
          jurisdictionText: '',
          appealInstructions: (
            <>
              <H3>Anvisning om hur man begär omprövning</H3>
              <P>
                Du kan begära om omprövning av ovanstående beslut hos
                Regionförvaltningsverket i Sydvästra Finland inom 14 dagar från
                dagen för delfående av beslutet. Beslutet kan inte överklagas
                genom besvär hos förvaltningsdomstolen.
              </P>
              <P>En begäran om omprövning</P>
              <ul>
                <li>får göras av den person som beslutet gäller </li>
                <li>
                  {' '}
                  eller den person vars rätt, skyldighet eller fördel direkt
                  påverkas av beslutet.
                </li>
              </ul>
              <h3>Delfående</h3>
              <P>
                Om beslutet delgivits per brev, anses den berörda parten
                (barnets vårdnadshavare) ha tagit del av beslutet, om inte annat
                bevisas, 7 dagar efter det att brevet skickades.
              </P>
              <P>
                Om beslutet skickas elektroniskt anses den berörda parten ha
                tagit del av beslutet tre dagar efter att meddelandet skickades.
              </P>
              <P>
                Om beslutet delges personligen, anses den berörda parten
                (barnets vårdnadshavare) ha tagit del av beslutet den dag då
                beslutet delgivits till den berörda parten eller deras lagliga
                företrädare.
              </P>
              <P>
                Om dokumentet skickas med post mot ett mottagningsbevis , anses
                den berörda parten ha tagit del av beslutet vid den tidpunkt som
                anges i mottagningsbeviset.
              </P>
              <P>
                Själva delfåendedagen räknas inte med i besvärstiden. Om
                besvärstidens sista dag infaller på en helgdag,
                självständighetsdagen, första maj, jul- eller midsommarafton
                eller en helgfri lördag är den första dagen då man får göra en
                begäran om omprövning den följande vardagen.
              </P>
              <H3>Innehållet i begäran om omprövning</H3>
              <P>
                Begäran ska vara skriftlig. Ett elektroniskt dokument fyller
                också kravet på en skriftlig begäran.
              </P>
              <P>I begäran om omprövning ska det framgå</P>
              <ul>
                <li>vilket beslut begäran handlar om</li>
                <li>
                  vilka punkter i beslutet begäran berör och hurdan omprövning
                  som begärs
                </li>
                <li>på vilka grunder omprövning begärs</li>
              </ul>
              <P>
                Begäran om omprövning måste innehålla namnet och hemorten till
                den som begär omprövning. Om begäran bereds av en laglig
                företrädare till den som begär omprövning eller hens
                representant, eller om begäran bereds av en annan person, ska
                också dennes namn och hemort anges i begäran.
              </P>
              <P>
                En begäran om omprövning ska även innehålla dennes postadress,
                telefonnummer och andra relevanta kontaktuppgifter. Om beslutet
                kan meddelas elektroniskt, bör även e-postadress anges.
              </P>
              <P>
                Den som framställt begäran eller dennes lagliga företrädare
                eller ombud ska underteckna begäran. Ett elektroniskt dokument
                behöver inte undertecknas om dokumentet innehåller avsändarens
                uppgifter och det finns ingen anledning att tvivla på dess
                äkthet eller integritet.
              </P>
              <P>Till begäran om omprövning bifogas</P>
              <ul>
                <li>beslutet som begäran gäller (originalet eller en kopia)</li>
                <li>
                  ett intyg från vilket det framgår när beslutet delgavs eller
                  en annan utredning där det framgår när besvärstiden började.
                </li>
                <li>
                  dokumenten som den som skickat in begäran åberopar i fall
                  dessa inte tidigare skickats till myndigheten.
                </li>
              </ul>
              <H3>Inlämnande av en begäran om omprövning</H3>
              <P>
                Begäran om omprövning skickas in inom besvärstiden till
                Regionförvaltiningsverket i Västra och Inre Finland på adressen:
              </P>
              <P>
                Regionförvaltiningsverket i Västra och Inre Finland
                <br />
                PB 5, 13035 AVI
                <br />
                Wolffskavägen 35
                <br />
                E-post: registratur.vastra@rfv.fi
                <br />
                Tfn: 0295 018 450
                <br />
                Öppettider för registratorskontoret: 8.00–16.15
              </P>
              <P>
                Om begäran om omprövning skickas via post eller med bud sker
                detta på avsändarens eget ansvar. Dokumenten i begäran om
                omprövning ska skickas per post i så god tid att de hinner fram
                senast under besvärstidens sista dag innan registratorskontoret
                stänger.
              </P>
              <P>
                Begäran om omprövning kan också skickas in via fax eller e-post
                innan besvärstiden upphör, men detta sker på avsändarens eget
                ansvar. Avsändaren ska se till att dokumentet levereras så att
                det befinner sig i myndighetens mottagningsenhet eller
                informationssystem innan tidsfristen.
              </P>
            </>
          )
        }
      }
    }
  },
  vasuTranslations: {
    FI: {},
    SV: {}
  },
  cityLogo: {
    src: TurkuLogo,
    alt: 'Turku logo'
  },
  featureFlags,
  placementTypes: [
    'DAYCARE',
    'DAYCARE_PART_TIME',
    'PRESCHOOL',
    'PRESCHOOL_DAYCARE',
    'PREPARATORY',
    'PREPARATORY_DAYCARE',
    'DAYCARE_FIVE_YEAR_OLDS',
    'DAYCARE_PART_TIME_FIVE_YEAR_OLDS',
    'CLUB',
    'TEMPORARY_DAYCARE'
  ],
  absenceTypes: [
    'OTHER_ABSENCE',
    'UNKNOWN_ABSENCE',
    'PLANNED_ABSENCE',
    'SICKLEAVE',
    'FORCE_MAJEURE',
    'PARENTLEAVE'
  ],
  voucherValueDecisionTypes: [
    'NORMAL',
    'RELIEF_ACCEPTED',
    'RELIEF_PARTLY_ACCEPTED',
    'RELIEF_REJECTED'
  ],
  daycareAssistanceLevels: daycareAssistanceLevels.filter(
    (level) => level !== 'GENERAL_SUPPORT'
  ),
  otherAssistanceMeasureTypes: [
    'TRANSPORT_BENEFIT',
    'ACCULTURATION_SUPPORT',
    'ANOMALOUS_EDUCATION_START'
  ],
  placementPlanRejectReasons: ['REASON_1', 'REASON_2', 'OTHER'],
  preschoolAssistanceLevels: [...preschoolAssistanceLevels],
  unitProviderTypes: [
    'MUNICIPAL',
    'PURCHASED',
    'PRIVATE',
    'PRIVATE_SERVICE_VOUCHER'
  ]
}

export default customizations
