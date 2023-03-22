package fi.turku.evakaturku.payment.service

import com.jcraft.jsch.SftpException
import fi.espoo.evaka.invoicing.domain.Payment
import fi.espoo.evaka.invoicing.domain.PaymentIntegrationClient
import fi.espoo.evaka.shared.db.Database
import fi.turku.evakaturku.invoice.service.SftpSender
import mu.KotlinLogging
import java.text.SimpleDateFormat
import java.util.*

private val logger = KotlinLogging.logger {}

class TurkuPaymentIntegrationClient(
    private val paymentGenerator: SapPaymentGenerator,
    private val sftpSender: SftpSender,
    private val preSchoolAccountingValue: Int
): PaymentIntegrationClient {

    override fun send(payments: List<Payment>, tx: Database.Transaction): PaymentIntegrationClient.SendResult {

        var failedList: MutableList<Payment> = mutableListOf()

        logger.info { "TurkuPaymentIntegrationClient.send() called with ${payments.size} payments" }
        val generatorResult = paymentGenerator.generatePayments(payments, preSchoolAccountingValue, tx)
        var successList = generatorResult.sendResult.succeeded
        failedList.addAll(generatorResult.sendResult.failed)

        var serialNumber = 1

        if (!successList.isEmpty()) {
            generatorResult.paymentStrings.forEach {
                try {
                    //TODO: loop every unit and add new number
                    val filename = SimpleDateFormat("'OLVAK_1002_0000001_'yyMMdd-hhmmss").format(Date()) + '-' + serialNumber.toString() + ".xml"
                    sftpSender.send(it, filename)
                    serialNumber++
                    logger.info { "Successfully sent ${successList.size} payments" }
                } catch (e: SftpException) {
                    logger.error { "Failed to send ${successList.size} payments" }
                    // TODO: only add payments whose sending failed to failedList
                    failedList.addAll(successList)
                    successList = listOf()
                }
            }
        }

        logger.info { "TurkuPaymentIntegrationClient.send() returning" }
        return PaymentIntegrationClient.SendResult(successList, failedList)
    }
}