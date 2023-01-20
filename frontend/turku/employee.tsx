{
  /*
SPDX-FileCopyrightText: 2021 City of Turku

SPDX-License-Identifier: LGPL-2.1-or-later
*/
}

import React from 'react'

import { EmployeeCustomizations } from 'lib-customizations/types'

import TurkuLogo from './city-logo-citizen.png'
import featureFlags from './featureFlags'

const customizations: EmployeeCustomizations = {
  appConfig: {},
  translations: {
    fi: {
      // override translations here
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
            'Palveluntarvesopimuksen (enintään 147h/kk, enintään 166h/kk, tai enintään 84h/kk mukaiset etukäteen ilmoitetut poissaolot',
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
        assistanceNeed: {
          fields: {
            capacityFactor: 'Lapsen paikkatarve',
            // @ts-expect-error: Type 'Element' is not assignable to type 'string'
            capacityFactorInfo: (
              <p>
                Rakenteellinen tuki määräytyy yleensä lapsen iän ja palvelun
                tarpeen mukaan. Mikäli lapsella on sellainen tuen tarve, joka
                lisää rakenteellisen tuen tarvetta, lisätään tuen tarpeen
                kerroin tähän. Tuen tarpeen ja kertoimen lisää
                varhaiskasvatuksen erityisopettaja. Päiväkodinjohtaja lisää
                kertoimen integroidun ryhmän tai erityisryhmän osalta
              </p>
            ),
            bases: 'Perusteet'
          }
        },
        assistanceAction: {
          title: 'Tukitoimet ja tukipalvelut',
          fields: {
            actions: 'Tukitoimet ja tukipalvelut',
            measureTypes: {
              SPECIAL_ASSISTANCE_DECISION: 'Erityisen tuen päätös',
              SPECIAL_ASSISTANCE_DECISION_INFO:
                'Lapsella on pidennetty oppivelvollisuus. (Tieto menee KOSKI-palveluun)',
              INTENSIFIED_ASSISTANCE: 'Tehostettu tuki',
              INTENSIFIED_ASSISTANCE_INFO:
                'Lapsella on avustamispalvelu tai lapsi on pedagogisesti vahvistetussa ryhmässä. Koskee myös osaa laaja-alaisen veon tukea saavista lapsista. ',
              EXTENDED_COMPULSORY_EDUCATION: 'Pidennetty oppivelvollisuus',
              EXTENDED_COMPULSORY_EDUCATION_INFO:
                'Päätös tehdään perusopetuksessa. (Tieto menee KOSKI-palveluun)',
              CHILD_SERVICE: 'Lastensuojelu',
              CHILD_SERVICE_INFO:
                'Merkitään lapselle, jolla varhaiskasvatus on lastensuojelun avohuollon tukitoimena perhe- ja sosiaalipalvelujen päätöksellä.',
              CHILD_ACCULTURATION_SUPPORT: 'Lapsen kotoutumisen tuki (ELY)',
              CHILD_ACCULTURATION_SUPPORT_INFO:
                'Lapsen tuen tarpeen perusteella järjestäjälle myönnetty korvaus (ELY)',
              TRANSPORT_BENEFIT: 'Harkinnanvarainen kuljetusetu',
              TRANSPORT_BENEFIT_INFO:
                'Harkinnanvarainen kuljetusetu. (Tieto menee KOSKI-palveluun)'
            }
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
        loginAD: 'Turku AD'
      },
      placement: {
        type: {
          DAYCARE: 'Varhaiskasvatus',
          DAYCARE_PART_TIME: 'Osapäiväinen varhaiskasvatus​',
          TEMPORARY_DAYCARE: 'Tilapäinen kokopäiväinen varhaiskasvatus',
          PRESCHOOL_DAYCARE: 'Esiopetusta täydentävä varhaiskasvatus',
          CLUB: 'Kerho',
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
        text: 'Olet kirjautunut sisään eVaka Turku -palveluun. Käyttäjätunnuksellesi ei ole vielä annettu oikeuksia, jotka mahdollistavat palvelun käytön. Tarvittavat käyttöoikeudet saat omalta esimieheltäsi.'
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
  assistanceMeasures: [
    'SPECIAL_ASSISTANCE_DECISION',
    'INTENSIFIED_ASSISTANCE',
    'EXTENDED_COMPULSORY_EDUCATION',
    'CHILD_ACCULTURATION_SUPPORT',
    'TRANSPORT_BENEFIT'
  ],
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
    'FREE_ABSENCE',
    'PARENTLEAVE'
  ],
  voucherValueDecisionTypes: [
    'NORMAL',
    'RELIEF_ACCEPTED',
    'RELIEF_PARTLY_ACCEPTED',
    'RELIEF_REJECTED'
  ],
  placementPlanRejectReasons: ['REASON_1', 'REASON_2', 'OTHER'],
  unitProviderTypes: [
    'MUNICIPAL',
    'PURCHASED',
    'PRIVATE',
    'PRIVATE_SERVICE_VOUCHER'
  ]
}

export default customizations
