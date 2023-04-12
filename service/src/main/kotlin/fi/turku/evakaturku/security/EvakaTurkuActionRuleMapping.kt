package fi.turku.evakaturku.security

import fi.espoo.evaka.application.ApplicationType
import fi.espoo.evaka.daycare.domain.ProviderType
import fi.espoo.evaka.shared.auth.UserRole
import fi.espoo.evaka.shared.security.Action
import fi.espoo.evaka.shared.security.actionrule.*

class EvakaTurkuActionRuleMapping : ActionRuleMapping {
    override fun rulesOf(action: Action.UnscopedAction): Sequence<UnscopedActionRule> = when (action) {
        Action.Global.READ_EMPLOYEES -> {
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR)
            )
        }
        Action.Global.READ_PLACEMENT_SKETCHING_REPORT -> {
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR)
            ) + sequenceOf(
                HasUnitRole(UserRole.UNIT_SUPERVISOR).withUnitProviderTypes(
                    ProviderType.MUNICIPAL,
                    ProviderType.PURCHASED,
                    ProviderType.PRIVATE,
                    ProviderType.MUNICIPAL_SCHOOL,
                    ProviderType.EXTERNAL_PURCHASED
                ).inAnyUnit()
            ) + sequenceOf(
                HasUnitRole(UserRole.EARLY_CHILDHOOD_EDUCATION_SECRETARY).inAnyUnit()
            )
        }
        Action.Global.PIN_CODE_PAGE -> sequenceOf(
            // removed director from default rules
            HasGlobalRole(UserRole.ADMIN, UserRole.REPORT_VIEWER, UserRole.SERVICE_WORKER),
            HasUnitRole(
                UserRole.UNIT_SUPERVISOR,
                UserRole.STAFF,
                UserRole.SPECIAL_EDUCATION_TEACHER,
                UserRole.EARLY_CHILDHOOD_EDUCATION_SECRETARY
            ).inAnyUnit()
        )
        Action.Global.SUBMIT_PATU_REPORT -> sequenceOf()
        else -> action.defaultRules.asSequence()
    }

    override fun <T> rulesOf(action: Action.ScopedAction<in T>): Sequence<ScopedActionRule<in T>> = when (action) {
        Action.Application.READ -> {
            @Suppress("UNCHECKED_CAST")
            sequenceOf(
                HasGlobalRole(UserRole.ADMIN, UserRole.SERVICE_WORKER, UserRole.DIRECTOR) as ScopedActionRule<in T>
            ) + sequenceOf(
                HasUnitRole(UserRole.UNIT_SUPERVISOR).inPlacementPlanUnitOfApplication(onlyAllowDeletedForTypes = setOf(
                    ApplicationType.PRESCHOOL)) as ScopedActionRule<in T>
            )
        }
        Action.Application.READ_ATTACHMENTS -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            )
        }
        Action.AssistanceNeedDecision.READ_DECISION_MAKER_OPTIONS -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            )
        }
        Action.Attachment.READ_INCOME_ATTACHMENT -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            )
        }

        Action.BackupCare.UPDATE,
        Action.BackupCare.DELETE -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasUnitRole(UserRole.STAFF).inPlacementUnitOfChildOfBackupCare() as ScopedActionRule<in T>
            )
        }
        Action.Child.CREATE_BACKUP_CARE,
        Action.Child.READ_ASSISTANCE_ACTION,
        Action.Child.READ_ASSISTANCE_NEED -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasUnitRole(UserRole.STAFF).inPlacementUnitOfChild() as ScopedActionRule<in T>
            )
        }
        Action.Child.READ_CHILD_CONSENTS -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            )
        }
        Action.Child.READ_APPLICATION -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>,
            ) + sequenceOf(
                HasUnitRole(UserRole.UNIT_SUPERVISOR).inPlacementUnitOfChild() as ScopedActionRule<in T>
            )
        }
        Action.Child.READ_ASSISTANCE_NEED -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasUnitRole(UserRole.STAFF).inPlacementUnitOfChild() as ScopedActionRule<in T>
            ) + sequenceOf(HasGlobalRole(UserRole.DIRECTOR, UserRole.FINANCE_ADMIN) as ScopedActionRule<in T>)
        }
        Action.Decision.DOWNLOAD_PDF -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            )
        }
        Action.FeeDecision.READ -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            )
        }
        Action.Group.READ_CARETAKERS -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            )
        }
        Action.Group.READ_ABSENCES -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            ) + sequenceOf(
                HasUnitRole(UserRole.EARLY_CHILDHOOD_EDUCATION_SECRETARY)
                    .inUnitOfGroup() as ScopedActionRule<in T>
            )
        }
        Action.Invoice.READ -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            )
        }
        Action.Parentship.READ -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            )
        }
        Action.Partnership.READ -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            )
        }
        Action.Person.READ_VOUCHER_VALUE_DECISIONS -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            )
        }
        Action.Unit.READ_MISSING_GROUP_PLACEMENTS -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            )
        }
        Action.Unit.READ_CHILD_ATTENDANCES -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            )
        }
        Action.VoucherValueDecision.READ -> {
            @Suppress("UNCHECKED_CAST")
            action.defaultRules.asSequence() + sequenceOf(
                HasGlobalRole(UserRole.DIRECTOR) as ScopedActionRule<in T>
            )
        }
        else -> action.defaultRules.asSequence()
    }
}
