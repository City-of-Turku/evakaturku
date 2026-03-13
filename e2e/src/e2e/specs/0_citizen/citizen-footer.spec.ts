// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

import config from 'e2e-test/config'
import { test } from 'e2e-test/playwright'
import { waitUntilEqual } from 'e2e-test/utils'

test.describe('Citizen footer', () => {
  test('Turku footer label', async ({ evaka: page }) => {
    await page.goto(config.enduserUrl)
    await waitUntilEqual(
      () => page.find('[data-qa="footer-citylabel"]').text,
      '© Turun kaupunki'
    )
  })

  test('Turku policy link', async ({ evaka: page }) => {
    await page.goto(config.enduserUrl)
    await waitUntilEqual(
      () => page.find('[data-qa="footer-policy-link"]').getAttribute('href'),
      'https://www.turku.fi/tietosuoja'
    )
  })

  test('Turku feedback link', async ({ evaka: page }) => {
    await page.goto(config.enduserUrl)
    await waitUntilEqual(
      () => page.find('[data-qa="footer-feedback-link"]').getAttribute('href'),
      'https://opaskartta.turku.fi/efeedback'
    )
  })
})
