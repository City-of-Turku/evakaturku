# SPDX-FileCopyrightText: 2021 City of Turku
#
# SPDX-License-Identifier: LGPL-2.1-or-later

/^(espooLogoAlt[[:blank:]]*=[[:blank:]]*).*/{
s//\1Logo for City of Turku/g
w /dev/stdout
}
/^(doAcknowledgeResourcesPrivacyPolicyLink[[:blank:]]*=[[:blank:]]*).*/{
s//\1https:\/\/www.turku.fi\/en\/turku-info\/privacy-policy/g
w /dev/stdout
}
/^(doAcknowledgeResourcesyDataProtectionLink[[:blank:]]*=[[:blank:]]*).*/{
s//\1https:\/\/www.turku.fi\/en\/turku-info\/privacy-policy/g
w /dev/stdout
}
/^(doGiveFeedbackLink[[:blank:]]*=[[:blank:]]*).*/{
s//\1https:\/\/opaskartta.turku.fi\/en\/eFeedback\/en/g
w /dev/stdout
}
/^(updatePasswordHelp[[:blank:]]*=[[:blank:]]*).*/{
s//\1Password must be at least 8 characters long, including at least one capital letter, one lowercase letter, one number and one special character. Password can’t be commonly used./g
w /dev/stdout
}
