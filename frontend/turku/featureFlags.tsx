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
    placementGuarantee: true,
    voucherUnitPayments: true,
    assistanceNeedDecisionsLanguageSelect: true,
    staffAttendanceTypes: true,
    childDocuments: true,
    intermittentShiftCare: true,
    assistanceNeedPreschoolDecisions: true,
    personDuplicate: false,
    citizenAttendanceSummary: false,
    noAbsenceType: false,
    hojks: true,
    employeeMobileStaffAttendanceEdit: true,
    employeeMobileChildAttendanceReservationEdit: true
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
    placementGuarantee: true,
    voucherUnitPayments: true,
    assistanceNeedDecisionsLanguageSelect: true,
    staffAttendanceTypes: true,
    childDocuments: true,
    intermittentShiftCare: true,
    assistanceNeedPreschoolDecisions: true,
    personDuplicate: false,
    citizenAttendanceSummary: false,
    noAbsenceType: false,
    hojks: true,
    employeeMobileStaffAttendanceEdit: true,
    employeeMobileChildAttendanceReservationEdit: true
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
    placementGuarantee: false,
    voucherUnitPayments: true,
    assistanceNeedDecisionsLanguageSelect: true,
    staffAttendanceTypes: true,
    childDocuments: true,
    intermittentShiftCare: false,
    assistanceNeedPreschoolDecisions: true,
    personDuplicate: false,
    citizenAttendanceSummary: false,
    noAbsenceType: false,
    hojks: true,
    employeeMobileStaffAttendanceEdit: false,
    employeeMobileChildAttendanceReservationEdit: false
  }
}

const featureFlags = features[env()]

export default featureFlags
