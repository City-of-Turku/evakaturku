{
  /*
SPDX-FileCopyrightText: 2021 City of Turku

SPDX-License-Identifier: LGPL-2.1-or-later
*/
}

import { FeatureFlags } from 'lib-customizations/types'

const featureFlags: FeatureFlags = {
  citizenShiftCareAbsenceEnabled: true,
  daycareApplication: {
    dailyTimesEnabled: false
  },
  groupsTableServiceNeedsEnabled: true,
  evakaLogin: true,
  financeBasicsPage: true,
  urgencyAttachmentsEnabled: false,
  preschoolEnabled: true,
  assistanceActionOtherEnabled: false,
  experimental: {
    messageAttachments: true,
    realtimeStaffAttendance: true,
    personalDetailsPage: true,
    mobileMessages: true
  },
  adminSettingsEnabled: true
}

export default featureFlags
