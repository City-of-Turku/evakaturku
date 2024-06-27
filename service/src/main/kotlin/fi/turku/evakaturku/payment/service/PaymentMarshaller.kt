package fi.turku.evakaturku.payment.service

import jakarta.xml.bind.JAXBContext
import jakarta.xml.bind.Marshaller
import org.springframework.stereotype.Component
import java.io.StringWriter

@Component
class PaymentMarshaller {
    fun marshal(idocs: List<FIDCCP02.IDOC>): String {
        val contextObj: JAXBContext = JAXBContext.newInstance(FIDCCP02::class.java)

        val marshallerObj: Marshaller = contextObj.createMarshaller()
        marshallerObj.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true)

        val fidccp02 = fi.turku.evakaturku.payment.service.FIDCCP02()
        fidccp02.idoc = idocs

        val stringWriter = StringWriter()
        marshallerObj.marshal(fidccp02, stringWriter)
        return stringWriter.toString()
    }
}
