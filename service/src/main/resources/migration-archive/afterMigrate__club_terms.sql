-- SPDX-FileCopyrightText: 2021 City of Turku
--
-- SPDX-License-Identifier: LGPL-2.1-or-later

INSERT INTO club_term
    (id, term, application_period, term_breaks)
VALUES
    ('4df642ba-ac98-11eb-9ca8-2ff9d825b593', '[2021-08-10,2022-06-03]', '[2021-01-01,2021-08-10]', '{}'),
    ('4df67de8-ac98-11eb-9ca9-93954620f29f', '[2022-08-10,2023-06-02]', '[2022-01-01,2022-08-10]', '{}'),
    ('d599da5a-9176-11ed-b900-afcfcd769d84', '[2023-08-01,2024-06-21]', '[2023-01-01,2023-08-10]', datemultirange('[2023-12-06,2023-12-06]','[2023-12-23,2024-01-07]')),
    ('7c464cb0-56db-11ee-85b8-5bcffbd66c5d', '[2024-08-01,2025-06-21]', '[2024-01-01,2024-08-10]', datemultirange('[2024-12-06,2024-12-06]','[2024-12-21,2025-01-06]'))
ON CONFLICT (id) DO
UPDATE SET
    term = EXCLUDED.term,
    application_period = EXCLUDED.application_period,
    term_breaks = EXCLUDED.term_breaks
WHERE
    club_term.term <> EXCLUDED.term OR
    club_term.application_period <> EXCLUDED.application_period OR
    club_term.term_breaks <> EXCLUDED.term_breaks;
