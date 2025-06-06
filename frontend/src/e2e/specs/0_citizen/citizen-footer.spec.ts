// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

import config from 'e2e-test/config'
import { waitUntilEqual } from 'e2e-test/utils'
import { Page } from 'e2e-test/utils/page'

let page: Page

beforeEach(async () => {
  page = await Page.open()
  await page.goto(config.enduserUrl)
})
afterEach(async () => {
  await page.close()
})

describe('Citizen footer', () => {
  test('Turku footer label', async () => {
    await waitUntilEqual(
      () => page.find('[data-qa="footer-citylabel"]').text,
      '© Turun kaupunki'
    )
  })
  test('Turku policy link', async () => {
    await waitUntilEqual(
      () => page.find('[data-qa="footer-policy-link"]').getAttribute('href'),
      'https://www.turku.fi/tietosuoja'
    )
  })
  test('Turku feedback link', async () => {
    await waitUntilEqual(
      () => page.find('[data-qa="footer-feedback-link"]').getAttribute('href'),
      'https://opaskartta.turku.fi/efeedback'
    )
  })
})
