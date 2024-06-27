package fi.turku.evakaturku.payment.service

import fi.espoo.evaka.invoicing.domain.Payment
import fi.espoo.evaka.invoicing.domain.PaymentIntegrationClient
import jakarta.xml.bind.JAXBException
import org.springframework.stereotype.Component
import kotlin.math.ceil

@Component
class SapPaymentGenerator(
    private val paymentChecker: PaymentChecker,
    private val paymentMarshaller: PaymentMarshaller,
    private val idocGenerator: IdocGenerator,
) {
    data class Result(
        val sendResult: PaymentIntegrationClient.SendResult = PaymentIntegrationClient.SendResult(),
        val paymentStrings: MutableList<String> = mutableListOf(),
    )

    fun generatePayments(
        payments: List<Payment>,
        preschoolValues: PreschoolValuesFetcher,
    ): Result {
        var successList = mutableListOf<Payment>()
        var failedList = mutableListOf<Payment>()

        val paymentStrings = mutableListOf<String>()

        val preSchoolerMap = preschoolValues.fetchPreschoolers(payments)
        val languageMap = preschoolValues.fetchUnitLanguages(payments)
        val preSchoolAccountingAmount = preschoolValues.fetchPreschoolAccountingAmount(payments[0].period)

        val (failed, succeeded) = payments.partition { payment -> paymentChecker.shouldFail(payment) }
        failedList.addAll(failed)

        succeeded.forEach {
            val monthlyAccountingAmount =
                if (it.period.start.monthValue == 8) {
                    ceil(
                        preSchoolAccountingAmount.toDouble() / 2,
                    ).toInt()
                } else {
                    preSchoolAccountingAmount
                }
            var preSchoolAmount = (preSchoolerMap[it.unit.id] ?: 0) * monthlyAccountingAmount
            val language = languageMap[it.unit.id] ?: "fi"
            val idocs: MutableList<FIDCCP02.IDOC> = mutableListOf()
            idocs.add(idocGenerator.generate(it, preSchoolAmount, language))

            try {
                paymentStrings.add(paymentMarshaller.marshal(idocs))
                successList.add(it)
            } catch (e: JAXBException) {
                failedList.add(it)
            }
        }

        return Result(PaymentIntegrationClient.SendResult(successList, failedList), paymentStrings)
    }
}
