package fi.turku.evakaturku.invoice.service
import fi.espoo.evaka.invoicing.domain.InvoiceDetailed
import org.springframework.stereotype.Component

@Component
class InvoiceChecker {
    fun shouldSendManually(invoice: InvoiceDetailed): Boolean {
        if (invoice.headOfFamily.restrictedDetailsEnabled) return true
        if (invoice.headOfFamily.ssn == null) return true
        return false
    }
}