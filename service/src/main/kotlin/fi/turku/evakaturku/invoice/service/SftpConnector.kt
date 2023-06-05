package fi.turku.evakaturku.invoice.service

import com.jcraft.jsch.ChannelSftp
import com.jcraft.jsch.JSch
import com.jcraft.jsch.Session
import org.springframework.stereotype.Component
import java.io.ByteArrayInputStream

@Component
class SftpConnector(val jsch: JSch) {

    lateinit var jschSession: Session
    lateinit var channelSftp: ChannelSftp

    @Throws(Exception::class)
    fun connect(address: String, username: String, password: String) {
        jschSession = jsch.getSession(username, address)
        jschSession.setConfig("StrictHostKeyChecking", "no")
        jschSession.setPassword(password)
        jschSession.connect()

        channelSftp = jschSession.openChannel("sftp") as ChannelSftp
        channelSftp.connect()
    }

    @Throws(Exception::class)
    fun send(filePath: String, proEInvoice: String) {
        channelSftp.put(ByteArrayInputStream(proEInvoice.toByteArray(Charsets.UTF_8)), filePath)
    }

    fun disconnect() {
        channelSftp.disconnect()
        jschSession.disconnect()
    }
}
