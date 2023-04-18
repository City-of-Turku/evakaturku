// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

rootProject.name = "evakaturku-service"
includeBuild("../evaka/service")
includeBuild("../evaka/evaka-bom")

dependencyResolutionManagement {
    versionCatalogs {
        create("libs") {
            from(files("../evaka/service/gradle/libs.versions.toml"))
        }
    }
}
