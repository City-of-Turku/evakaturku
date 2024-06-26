// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

package fi.turku.evakaturku.util

import org.apache.http.HttpRequestInterceptor
import org.apache.http.message.BasicHeader
import java.nio.charset.StandardCharsets
import java.util.Base64

fun basicAuthInterceptor(
    username: String,
    password: String,
) = HttpRequestInterceptor { request, _ ->
    request.addHeader(BasicHeader("Authorization", "Basic ${encode("$username:$password")}"))
}

internal fun encode(data: String) = Base64.getEncoder().encodeToString(data.toByteArray(StandardCharsets.UTF_8))
