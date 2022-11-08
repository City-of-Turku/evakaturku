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
    dailyTimesEnabled: true
  },
  groupsTableServiceNeedsEnabled: true,
  evakaLogin: true,
  financeBasicsPage: true,
  urgencyAttachmentsEnabled: true,
  preschoolEnabled: true,
  assistanceActionOtherEnabled: true,
  experimental: {
    messageAttachments: true,
    personalDetailsPage: true,
    voucherUnitPayments: true,
    assistanceNeedDecisions: true,
    assistanceNeedDecisionsLanguageSelect: false,
    mobileMessages: true,
    citizenVasu: true,
    fosterParents: true
  },
  adminSettingsEnabled: true
}

export default featureFlags
