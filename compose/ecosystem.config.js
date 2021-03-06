// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

const path = require('path')

const defaults = {
  autorestart: false
}

module.exports = {
  apps: [{
    name: 'apigw',
    script: 'yarn && yarn clean && yarn dev',
    cwd: path.resolve(__dirname, '../evaka/apigw'),
    env: {
      EVAKA_CUSTOMER_SAML_ENTRYPOINT: 'http://localhost:8080/auth/realms/citizens/protocol/saml',
      EVAKA_CUSTOMER_SAML_ISSUER: 'evakaturku',
      EVAKA_SAML_ENTRYPOINT: 'http://localhost:8080/auth/realms/employees/protocol/saml',
      EVAKA_SAML_ISSUER: 'evakaturku',
      AD_SAML_EXTERNAL_ID_PREFIX: 'turku-ad'
    },
    ...defaults
  }, {
    name: 'frontend',
    script: 'yarn && yarn clean && EVAKA_CUSTOMIZATIONS=turku yarn dev',
    cwd: path.resolve(__dirname, '../evaka/frontend'),
    env: {
      'ICONS': process.env.ICONS
    },
    ...defaults
  }, {
    name: 'service',
    script: `${__dirname}/../evaka/compose/run-after-db.sh`,
    args: './gradlew --no-daemon bootRun',
    cwd: path.resolve(__dirname, '../service'),
    ...defaults
  },
  ],
}
