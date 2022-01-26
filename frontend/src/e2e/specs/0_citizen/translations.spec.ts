// SPDX-FileCopyrightText: 2021 City of Turku
//
// SPDX-License-Identifier: LGPL-2.1-or-later

import { translations } from 'lib-customizations/citizen'
import React from 'react'
import { isArray, toArray, isObject } from 'lodash'

const checkTurkuTranslation = (value: string, errors: string[]) => {
    if (value.toLowerCase().includes('espoo')) {
        console.error(value)
        errors.push(value);
    }
}

const checkTurkuTranslationInner = (object: any, errors: string[]) => {
    if (React.isValidElement(object)) {
        checkTurkuTranslation(JSON.stringify(object), errors);
    } else if (isObject(object)) {
        Object.keys(object).forEach(key => {
            checkTurkuTranslationInner(object[key], errors)
        });
    } else if (isArray(object)) {
        let valAsArray = toArray(object)
        for (let val in valAsArray) {
            checkTurkuTranslationInner(val, errors)
        }
    } else {
        checkTurkuTranslation(object, errors)
    }
}

const checkTurkuTranslations = (translationsFi: { [key: string]: any }): string[] => {
    let errors: string[] = []
    for (const key of Object.keys(translationsFi)) {
        checkTurkuTranslationInner(translationsFi[key], errors)
    }
    return errors
}

describe('Citizen translations', () => {
  test('fi', async () => {
    const errors = checkTurkuTranslations(translations.fi)
    expect(errors).toEqual([])
  })
})
