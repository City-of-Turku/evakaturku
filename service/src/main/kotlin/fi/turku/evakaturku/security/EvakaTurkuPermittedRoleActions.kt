package fi.turku.evakaturku.security

import fi.espoo.evaka.shared.security.PermittedRoleActions

class EvakaTurkuPermittedRoleActions(private val defaults: PermittedRoleActions) : PermittedRoleActions by defaults {
}
