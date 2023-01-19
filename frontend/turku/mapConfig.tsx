{
  /*
SPDX-FileCopyrightText: 2021 City of Turku

SPDX-License-Identifier: LGPL-2.1-or-later
*/
}

import { MapConfig } from 'lib-customizations/types'

const mapConfig: MapConfig = {
  center: [60.451389, 22.266667],
  initialZoom: 11,
  addressZoom: 14,
  searchAreaRect: {
    maxLatitude: 65.02936831566872,
    minLatitude: 65.00209678931624,
    maxLongitude: 25.55391750178106,
    minLongitude: 25.448039386735797
  },
  careTypeFilters: ['DAYCARE', 'PRESCHOOL', 'CLUB'],
  unitProviderTypeFilters: [
    'MUNICIPAL',
    'PRIVATE',
    'PRIVATE_SERVICE_VOUCHER',
    'PURCHASED'
  ]
}

export default mapConfig
