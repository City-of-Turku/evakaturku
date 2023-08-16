# SPDX-FileCopyrightText: 2021 City of Turku
#
# SPDX-License-Identifier: LGPL-2.1-or-later

/^(espooLogoAlt[[:blank:]]*=[[:blank:]]*).*/{
s//\1Åbo stads logotyp/g
w /dev/stdout
}
/^(doAcknowledgeResourcesPrivacyPolicyLink[[:blank:]]*=[[:blank:]]*).*/{
s//\1https:\/\/www.turku.fi\/sv\/information-om-abo\/datasekretess/g
w /dev/stdout
}
/^(doAcknowledgeResourcesyDataProtectionLink[[:blank:]]*=[[:blank:]]*).*/{
s//\1https:\/\/www.turku.fi\/sv\/information-om-abo\/datasekretess/g
w /dev/stdout
}
/^(doGiveFeedbackLink[[:blank:]]*=[[:blank:]]*).*/{
s//\1https:\/\/opaskartta.turku.fi\/eFeedback\/sv/g
w /dev/stdout
}
/^(updatePasswordHelp[[:blank:]]*=[[:blank:]]*).*/{
s//\1Lösenordet måste bestå av minst 8 tecken och innehålla minst en stor bokstav, en liten bokstav, en siffra och ett specialtecken. Lösenordet får inte vara ett ofta använt ord./g
w /dev/stdout
}
