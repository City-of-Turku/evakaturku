package fi.turku.evakaturku.invoice.service
import fi.espoo.evaka.invoicing.domain.InvoiceDetailed
import org.springframework.stereotype.Component

@Component
class InvoiceChecker {
    fun shouldSendManually(invoice: InvoiceDetailed): Boolean {
        return invoice.headOfFamily.ssn == null
    }
}
