// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

import config from 'e2e-test/config'
import { test, expect } from 'e2e-test/playwright'

test.describe('Citizen footer', () => {
  test('Turku footer label', async ({ evaka: page }) => {
    await page.goto(config.enduserUrl)
    await expect.poll(
      () => page.find('[data-qa="footer-citylabel"]').text)
      .toEqual(
      '© Turun kaupunki'
    )
  })

  test('Turku policy link', async ({ evaka: page }) => {
    await page.goto(config.enduserUrl)
    await expect.poll(
      () => page.find('[data-qa="footer-policy-link"]').getAttribute('href'))
    .toEqual(
      'https://www.turku.fi/tietosuoja'
    )
  })

  test('Turku feedback link', async ({ evaka: page }) => {
    await page.goto(config.enduserUrl)
    await expect.poll(
      () => page.find('[data-qa="footer-feedback-link"]').getAttribute('href'))
    .toEqual(
      'https://opaskartta.turku.fi/efeedback'
    )
  })
})
