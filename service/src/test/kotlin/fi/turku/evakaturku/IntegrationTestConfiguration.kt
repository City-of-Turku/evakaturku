// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku

import com.auth0.jwt.algorithms.Algorithm
import com.auth0.jwt.interfaces.RSAKeyProvider
import fi.espoo.evaka.BucketEnv
import fi.espoo.evaka.EvakaEnv
import org.springframework.boot.test.context.TestConfiguration
import org.springframework.context.annotation.Bean
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider
import software.amazon.awssdk.services.s3.S3Client
import software.amazon.awssdk.services.s3.S3Configuration
import software.amazon.awssdk.services.s3.presigner.S3Presigner
import java.security.interfaces.RSAPrivateKey
import java.security.interfaces.RSAPublicKey

@TestConfiguration
class IntegrationTestConfiguration {

    @Bean
    fun s3Client(evakaEnv: EvakaEnv, bucketEnv: BucketEnv): S3Client {
        val client = S3Client.builder()
            .region(evakaEnv.awsRegion)
            .serviceConfiguration(S3Configuration.builder().pathStyleAccessEnabled(true).build())
            .endpointOverride(bucketEnv.s3MockUrl)
            .credentialsProvider(
                StaticCredentialsProvider.create(AwsBasicCredentials.create("foo", "bar"))
            )
            .build()

        client.createBucket { it.bucket(bucketEnv.decisions) }
        client.createBucket { it.bucket(bucketEnv.feeDecisions) }
        client.createBucket { it.bucket(bucketEnv.voucherValueDecisions) }
        client.createBucket { it.bucket(bucketEnv.attachments) }
        client.createBucket { it.bucket(bucketEnv.data) }

        return client
    }

    @Bean
    fun jwtAlgorithm(): Algorithm {
        return Algorithm.RSA256(JwtKeys(privateKeyId = null, privateKey = null, publicKeys = mapOf()))
    }

    @Bean
    fun s3Presigner(evakaEnv: EvakaEnv, bucketEnv: BucketEnv): S3Presigner =
            S3Presigner.builder()
                    .region(evakaEnv.awsRegion)
                    .serviceConfiguration(S3Configuration.builder().pathStyleAccessEnabled(true).build())
                    .endpointOverride(bucketEnv.s3MockUrl)
                    .credentialsProvider(
                            StaticCredentialsProvider.create(AwsBasicCredentials.create("foo", "bar"))
                    )
                    .build()
}

internal class JwtKeys(
    private val privateKeyId: String?,
    private val privateKey: RSAPrivateKey?,
    private val publicKeys: Map<String, RSAPublicKey>
) : RSAKeyProvider {
    override fun getPrivateKeyId(): String? = privateKeyId
    override fun getPrivateKey(): RSAPrivateKey? = privateKey
    override fun getPublicKeyById(keyId: String): RSAPublicKey? = publicKeys[keyId]
}
