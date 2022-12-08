-- SPDX-FileCopyrightText: 2022 City of Turku
--
-- SPDX-License-Identifier: LGPL-2.1-or-later

INSERT INTO holiday
(date, description)
VALUES
    -- 2023
    ('2023-01-01', 'uudenvuodenpäivä'),
    ('2023-01-06', 'loppiainen'),
    ('2023-04-07', 'pitkäperjantai'),
    ('2023-04-09', 'pääsiäispäivä'),
    ('2023-04-10', 'toinen pääsiäispäivä'),
    ('2023-05-01', 'vappu'),
    ('2023-05-18', 'helatorstai'),
    ('2023-05-28', 'helluntai'),
    ('2023-06-23', 'juhannusaatto'),
    ('2023-06-24', 'juhannuspäivä'),
    ('2023-11-04', 'pyhäinpäivä'),
    ('2023-12-06', 'itsenäisyyspäivä'),
    ('2023-12-24', 'jouluaatto'),
    ('2023-12-25', 'joulupäivä'),
    ('2023-12-26', 'tapaninpäivä'),
    -- 2022
    ('2022-01-01', 'uudenvuodenpäivä'),
    ('2022-01-06', 'loppiainen'),
    ('2022-04-15', 'pitkäperjantai'),
    ('2022-04-17', 'pääsiäispäivä'),
    ('2022-04-18', 'toinen pääsiäispäivä'),
    ('2022-05-01', 'vappu'),
    ('2022-05-26', 'helatorstai'),
    ('2022-06-05', 'helluntai'),
    ('2022-06-24', 'juhannusaatto'),
    ('2022-06-25', 'juhannuspäivä'),
    ('2022-11-05', 'pyhäinpäivä'),
    ('2022-12-06', 'itsenäisyyspäivä'),
    ('2022-12-24', 'jouluaatto'),
    ('2022-12-25', 'joulupäivä'),
    ('2022-12-26', 'tapaninpäivä'),
    -- 2021
    ('2021-01-01', 'uudenvuodenpäivä'),
    ('2021-01-06', 'loppiainen'),
    ('2021-04-02', 'pitkäperjantai'),
    ('2021-04-04', 'pääsiäispäivä'),
    ('2021-04-05', 'toinen pääsiäispäivä'),
    ('2021-05-01', 'vappu'),
    ('2021-05-13', 'helatorstai'),
    ('2021-05-23', 'helluntai'),
    ('2021-06-25', 'juhannusaatto'),
    ('2021-06-26', 'juhannuspäivä'),
    ('2021-11-06', 'pyhäinpäivä'),
    ('2021-12-06', 'itsenäisyyspäivä'),
    ('2021-12-24', 'jouluaatto'),
    ('2021-12-25', 'joulupäivä'),
    ('2021-12-26', 'tapaninpäivä'),
    -- 2020
    ('2020-01-01', 'uudenvuodenpäivä'),
    ('2020-01-06', 'loppiainen'),
    ('2020-04-10', 'pitkäperjantai'),
    ('2020-04-12', 'pääsiäispäivä'),
    ('2020-04-13', 'toinen pääsiäispäivä'),
    ('2020-05-01', 'vappu'),
    ('2020-05-21', 'helatorstai'),
    ('2020-05-31', 'helluntai'),
    ('2020-06-19', 'juhannusaatto'),
    ('2020-06-20', 'juhannuspäivä'),
    ('2020-10-31', 'pyhäinpäivä'),
    ('2020-12-06', 'itsenäisyyspäivä'),
    ('2020-12-24', 'jouluaatto'),
    ('2020-12-25', 'joulupäivä'),
    ('2020-12-26', 'tapaninpäivä'),
    -- 2019
    ('2019-01-01', 'uudenvuodenpäivä'),
    ('2019-01-06', 'loppiainen'),
    ('2019-04-19', 'pitkäperjantai'),
    ('2019-04-21', 'pääsiäispäivä'),
    ('2019-04-22', 'toinen pääsiäispäivä'),
    ('2019-05-01', 'vappu'),
    ('2019-05-30', 'helatorstai'),
    ('2019-06-09', 'helluntai'),
    ('2019-06-21', 'juhannusaatto'),
    ('2019-06-22', 'juhannuspäivä'),
    ('2019-11-02', 'pyhäinpäivä'),
    ('2019-12-06', 'itsenäisyyspäivä'),
    ('2019-12-24', 'jouluaatto'),
    ('2019-12-25', 'joulupäivä'),
    ('2019-12-26', 'tapaninpäivä')
    ON CONFLICT (date) DO
UPDATE SET
    description = EXCLUDED.description
WHERE
    holiday.description <> EXCLUDED.description;