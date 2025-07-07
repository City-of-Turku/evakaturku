-- SPDX-FileCopyrightText: 2021 City of Turku
--
-- SPDX-License-Identifier: LGPL-2.1-or-later

INSERT INTO preschool_term
    (id, finnish_preschool, swedish_preschool, extended_term, application_period, term_breaks)
VALUES
    ('cc7ff86a-9e0a-11ec-8258-c3cde24890e3', '[2021-08-10,2022-06-03]', '[2021-08-10,2022-06-03]', '[2021-08-09,2022-06-04]', '[2021-01-01,2021-08-10]', '{}'),
    ('de297918-2205-11ed-850c-4bf450c37db6', '[2022-08-10,2023-05-31]', '[2022-08-10,2023-05-31]', '[2022-08-10,2023-05-31]', '[2022-01-10,2023-01-23]', '{}'),
    ('206764be-5683-11ed-b185-bbe4b6fc15e9', '[2023-08-10,2024-05-31]', '[2023-08-10,2024-05-31]', '[2023-08-10,2024-05-31]', '[2023-01-02,2023-01-15]', datemultirange('[2023-10-16,2023-10-22]', '[2023-12-23,2024-01-07]','[2024-02-19,2024-02-25]')),
    ('4b15798a-56d7-11ee-85b7-c759263b7b59', '[2024-08-08,2025-05-31]', '[2024-08-08,2025-05-31]', '[2024-08-08,2025-05-31]', '[2023-11-02,2024-01-15]', datemultirange('[2024-10-14,2024-10-20]', '[2024-12-21,2025-01-06]','[2025-02-17,2025-02-23]'))

ON CONFLICT (id) DO
UPDATE SET
    finnish_preschool = EXCLUDED.finnish_preschool,
    swedish_preschool = EXCLUDED.swedish_preschool,
    extended_term = EXCLUDED.extended_term,
    application_period = EXCLUDED.application_period,
    term_breaks = EXCLUDED.term_breaks
WHERE
    preschool_term.finnish_preschool <> EXCLUDED.finnish_preschool OR
    preschool_term.swedish_preschool <> EXCLUDED.swedish_preschool OR
    preschool_term.extended_term <> EXCLUDED.extended_term OR
    preschool_term.application_period <> EXCLUDED.application_period OR
    preschool_term.term_breaks <> EXCLUDED.term_breaks;

