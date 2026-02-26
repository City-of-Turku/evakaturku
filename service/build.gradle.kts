import org.gradle.kotlin.dsl.gitProperties

plugins {
    alias(libs.plugins.kotlin.jvm)
    alias(libs.plugins.kotlin.spring)
    alias(libs.plugins.spring.boot)
    alias(libs.plugins.ktlint.gradle)
    id("com.gorylenko.gradle-git-properties") version "2.5.3"
}

java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(libs.versions.java.get())
    }
}

repositories {
    mavenCentral()
    maven("https://build.shibboleth.net/maven/releases") {
        content {
            includeGroup("net.shibboleth")
            includeGroup("net.shibboleth.utilities")
            includeGroup("org.opensaml")
        }
    }
}

dependencies {
    implementation(platform("evaka:evaka-bom"))
    testImplementation(platform("evaka:evaka-bom"))

    implementation("evaka:evaka-service")

    implementation("ch.qos.logback.access:logback-access-tomcat")
    implementation("io.github.oshai:kotlin-logging-jvm")
    implementation("net.logstash.logback:logstash-logback-encoder")
    implementation("org.thymeleaf:thymeleaf")

    implementation("org.springframework.boot:spring-boot-tomcat")
    implementation("org.springframework.boot:spring-boot-webservices")
    implementation("org.springframework.boot:spring-boot-jdbc")

    implementation("org.jdbi:jdbi3-core")
    implementation("com.github.mwiede:jsch")
    implementation("software.amazon.awssdk:s3")
    implementation("software.amazon.awssdk:http-auth-aws-crt")
    implementation("org.unbescape:unbescape:1.1.6.RELEASE")
    implementation("io.opentelemetry:opentelemetry-api")
    implementation("com.github.kagkarlsson:db-scheduler")

    implementation("org.jetbrains.kotlin:kotlin-reflect:")

    testImplementation("org.springframework.boot:spring-boot-starter-test") {
        exclude("com.vaadin.external.google", "android-json")
    }
    testImplementation("org.junit-pioneer:junit-pioneer:2.3.0") // for CartesianProductTest
    testImplementation("org.mockito.kotlin:mockito-kotlin")
    testImplementation("org.springframework.boot:spring-boot-starter-webservices-test")
    testImplementation("org.wiremock.integrations:wiremock-spring-boot:4.0.8")
    testImplementation("com.auth0:java-jwt")

    developmentOnly(platform("evaka:evaka-bom"))
    developmentOnly("org.springframework.boot:spring-boot-devtools")
}

springBoot {
    mainClass.set("fi.turku.evakaturku.EVakaTurkuMainKt")
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xjsr305=strict")
    }
}

tasks {
    test {
        useJUnitPlatform()
        systemProperty("spring.profiles.active", "integration-test,evakaturku")
    }
    bootRun {
        systemProperty("spring.profiles.active", "local,evakaturku-local")
    }
}

tasks.register<Test>("pdfGenerationTest") {
    useJUnitPlatform {
        includeTags("PDFGenerationTest")
    }
}

tasks.withType<Jar> {
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE
}

gitProperties {
    dotGitDirectory =
        project.rootProject.layout.projectDirectory
            .dir("../.git")
}

configure<org.jlleitschuh.gradle.ktlint.KtlintExtension> {
    version.set(
        libs.versions.ktlint
            .asProvider()
            .get(),
    )
}
