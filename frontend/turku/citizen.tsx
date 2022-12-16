{
  /*
SPDX-FileCopyrightText: 2021 City of Turku

SPDX-License-Identifier: LGPL-2.1-or-later
*/
}
import React from 'react'

import { CitizenCustomizations } from 'lib-customizations/types'

import TurkuLogo from './city-logo-citizen.png'
import enCustomizations from './enCustomizations'
import featureFlags from './featureFlags'
import fiCustomizations from './fiCustomizations'
import FooterLogo from './footer-logo-citizen.png'
import mapConfig from './mapConfig'

const customizations: CitizenCustomizations = {
  appConfig: {},
  langs: ['fi', 'en'],
  translations: {
    fi: fiCustomizations,
    sv: {},
    en: enCustomizations
  },
  cityLogo: {
    src: TurkuLogo,
    alt: 'Turku logo'
  },
  footerLogo: <img src={FooterLogo} alt="Turku Logo" />,
  routeLinkRootUrl: 'https://turku.digitransit.fi/',
  mapConfig,
  featureFlags,
  getMaxPreferredUnits() {
    return 3
  }
}

export default customizations
