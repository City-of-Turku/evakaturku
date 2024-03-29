# SPDX-FileCopyrightText: 2021 City of Turku
#
# SPDX-License-Identifier: LGPL-2.1-or-later

/^(espooLogoAlt[[:blank:]]*=[[:blank:]]*).*/{
s//\1Turun kaupungin logo/g
w /dev/stdout
}
/^(doAcknowledgeResourcesPrivacyPolicyLink[[:blank:]]*=[[:blank:]]*).*/{
s//\1https:\/\/www.turku.fi\/tietosuoja/g
w /dev/stdout
}
/^(doAcknowledgeResourcesyDataProtectionLink[[:blank:]]*=[[:blank:]]*).*/{
s//\1https:\/\/www.turku.fi\/tietosuoja/g
w /dev/stdout
}
/^(doGiveFeedbackLink[[:blank:]]*=[[:blank:]]*).*/{
s//\1https:\/\/opaskartta.turku.fi\/eFeedback/g
w /dev/stdout
}
/^(updatePasswordHelp[[:blank:]]*=[[:blank:]]*).*/{
s//\1Salasanassa tulee olla vähintään 8 merkkiä, sisältäen vähintään yhden ison ja pienen kirjaimen, numeron sekä erikoismerkin. Salasana ei saa olla yleisesti käytetty./g
w /dev/stdout
}
