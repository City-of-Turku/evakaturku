// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

import axios from 'axios'
import { DevApiError } from 'e2e-test/dev-api'
import config from 'e2e-test/config'

export const devClient = axios.create({
    baseURL: config.devApiGwUrl + '/turku'
})

export async function resetDatabaseForE2ETests(): Promise<void> {
    try {
        await devClient.post(`/reset-turku-db-for-e2e-tests`, null)
    } catch (e) {
        throw new DevApiError(e)
    }
}
