{
  /*
SPDX-FileCopyrightText: 2021 City of Turku

SPDX-License-Identifier: LGPL-2.1-or-later
*/
}

import { EmployeeMobileCustomizations } from 'lib-customizations/types'

import featureFlags from './featureFlags'

const customizations: EmployeeMobileCustomizations = {
  appConfig: {},
  translations: {
    fi: {
      mobile: {
        landerText1: 'Tervetuloa käyttämään eVaka Turku -mobiilisovellusta!'
      }
    }
  },
  featureFlags
}

export default customizations
