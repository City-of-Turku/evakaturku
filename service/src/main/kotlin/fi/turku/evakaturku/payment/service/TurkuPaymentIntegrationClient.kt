package fi.turku.evakaturku.payment.service

import com.jcraft.jsch.SftpException
import fi.espoo.evaka.invoicing.domain.Payment
import fi.espoo.evaka.invoicing.domain.PaymentIntegrationClient
import fi.turku.evakaturku.invoice.service.SftpSender
import mu.KotlinLogging
import java.text.SimpleDateFormat
import java.util.*

private val logger = KotlinLogging.logger {}

class TurkuPaymentIntegrationClient(
    private val paymentGenerator: SapPaymentGenerator,
    private val sftpSender: SftpSender
): PaymentIntegrationClient {

    override fun send(payments: List<Payment>): PaymentIntegrationClient.SendResult {

        var failedList: MutableList<Payment> = mutableListOf()

        logger.info { "TurkuPaymentIntegrationClient.send() called with ${payments.size} payments" }
        val generatorResult = paymentGenerator.generatePayments(payments)
        var successList = generatorResult.sendResult.succeeded
        failedList.addAll(generatorResult.sendResult.failed)

        if (!successList.isEmpty()) {
            try {
                //TODO: loop every unit and add new number
                val filename = SimpleDateFormat("'OLVAK_1002_0000001_'yyMMdd-hhmmss'-1.xml'").format(Date())
                sftpSender.send(generatorResult.paymentString, filename)
                logger.info { "Successfully sent ${successList.size} payments" }
            } catch (e: SftpException) {
                logger.error { "Failed to send ${successList.size} payments" }
                failedList.addAll(successList)
                successList = listOf()
            }
        }

        logger.info { "TurkuPaymentIntegrationClient.send() returning" }
        return PaymentIntegrationClient.SendResult(successList, failedList)
    }
}