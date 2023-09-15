{
  /*
SPDX-FileCopyrightText: 2021 City of Turku

SPDX-License-Identifier: LGPL-2.1-or-later
*/
}

import { FeatureFlags } from 'lib-customizations/types'

import { env, Env } from './env'

type Features = {
  default: FeatureFlags
} & {
  [k in Env]: FeatureFlags
}

const features: Features = {
  default: {
    citizenShiftCareAbsence: true,
    assistanceActionOther: true,
    financeDecisionHandlerSelect: false,
    feeDecisionPreschoolClubFilter: true,
    daycareApplication: {
      dailyTimes: true
    },
    preschoolApplication: {
      connectedDaycarePreferredStartDate: false,
      serviceNeedOption: false
    },
    decisionDraftMultipleUnits: false,
    preschool: true,
    preparatory: true,
    urgencyAttachments: true,
    childDiscussion: false,
    placementGuarantee: true,
    experimental: {
      leops: true,
      voucherUnitPayments: true,
      assistanceNeedDecisions: true,
      assistanceNeedDecisionsLanguageSelect: true,
      staffAttendanceTypes: true,
      fosterParents: true,
      serviceWorkerMessaging: true,
      childDocuments: true,
      intermittentShiftCare: true,
      assistanceNeedPreschoolDecisions: true,
      feeDecisionIgnoredStatus: true
    }
  },
  staging: {
    citizenShiftCareAbsence: true,
    assistanceActionOther: true,
    daycareApplication: {
      dailyTimes: true
    },
    preschoolApplication: {
      connectedDaycarePreferredStartDate: false,
      serviceNeedOption: false
    },
    decisionDraftMultipleUnits: false,
    preschool: true,
    preparatory: true,
    urgencyAttachments: true,
    financeDecisionHandlerSelect: false,
    feeDecisionPreschoolClubFilter: true,
    childDiscussion: false,
    placementGuarantee: true,
    experimental: {
      leops: true,
      voucherUnitPayments: true,
      assistanceNeedDecisions: true,
      assistanceNeedDecisionsLanguageSelect: true,
      staffAttendanceTypes: true,
      fosterParents: true,
      serviceWorkerMessaging: true,
      childDocuments: true,
      intermittentShiftCare: true,
      assistanceNeedPreschoolDecisions: true,
      feeDecisionIgnoredStatus: true
    }
  },
  prod: {
    citizenShiftCareAbsence: true,
    assistanceActionOther: true,
    daycareApplication: {
      dailyTimes: true
    },
    preschoolApplication: {
      connectedDaycarePreferredStartDate: false,
      serviceNeedOption: false
    },
    decisionDraftMultipleUnits: false,
    preschool: true,
    preparatory: true,
    urgencyAttachments: true,
    financeDecisionHandlerSelect: false,
    feeDecisionPreschoolClubFilter: true,
    childDiscussion: false,
    placementGuarantee: false,
    experimental: {
      leops: true,
      voucherUnitPayments: true,
      assistanceNeedDecisions: true,
      assistanceNeedDecisionsLanguageSelect: false,
      staffAttendanceTypes: true,
      fosterParents: true,
      serviceWorkerMessaging: true,
      childDocuments: true,
      intermittentShiftCare: false,
      assistanceNeedPreschoolDecisions: true,
      feeDecisionIgnoredStatus: false
    }
  }
}

const featureFlags = features[env()]

export default featureFlags
