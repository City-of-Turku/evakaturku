// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

rootProject.name = "evakaturku-service"
includeBuild("../evaka/service") {
    dependencySubstitution {
        substitute(module("evaka:evaka-bom")).using(project(":evaka-bom"))
        substitute(module("evaka:evaka-service")).using(project(":"))
        substitute(module("evaka:custom-ktlint-rules")).using(project(":custom-ktlint-rules"))
    }
}

include("custom-ktlint-rules")

dependencyResolutionManagement {
    versionCatalogs {
        create("libs") {
            from(files("../evaka/service/gradle/libs.versions.toml"))
        }
    }
}
