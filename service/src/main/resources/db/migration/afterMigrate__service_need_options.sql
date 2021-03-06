-- SPDX-FileCopyrightText: 2021 City of Turku
--
-- SPDX-License-Identifier: LGPL-2.1-or-later

INSERT INTO service_need_option
    (id, name_fi, name_sv, name_en, valid_placement_type, default_option, fee_coefficient, voucher_value_coefficient, occupancy_coefficient, daycare_hours_per_week, part_day, part_week, fee_description_fi, fee_description_sv, voucher_value_description_fi, voucher_value_description_sv, display_order, occupancy_coefficient_under_3y)
VALUES
    ('50358394-b961-11eb-b51f-67ac436e5636', 'Kokopäiväinen', 'Kokopäiväinen', 'Full-time', 'DAYCARE', TRUE, 1.0, 1.0, 1.0, 40, FALSE, FALSE, 'Kokopäiväinen', 'Kokopäiväinen', 'Kokopäiväinen', 'Kokopäiväinen', null, 1.75),
    ('86ef70a0-bf85-11eb-91e6-1fb57a101161', 'Kokopäiväinen', 'Kokopäiväinen', 'Full-time', 'DAYCARE', FALSE, 1.0, 1.0, 1.0, 40, FALSE, FALSE, 'Kokopäiväinen', 'Kokopäiväinen', 'Kokopäiväinen', 'Kokopäiväinen', 0, 1.75),
    ('503590f0-b961-11eb-b520-53740af3f7ee', 'Kokopäiväinen, 10 pv sopimus', 'Kokopäiväinen, 10 pv sopimus', 'Full-time, 10 day agreement', 'DAYCARE', FALSE, 0.5, 0.5, 0.5, 20, FALSE, TRUE, 'Kokopäiväinen, 10 pv sopimus', 'Kokopäiväinen, 10 pv sopimus', 'Kokopäiväinen, 10 pv sopimus', 'Kokopäiväinen, 10 pv sopimus', 1, 1.75),
    ('503591ae-b961-11eb-b521-1fca99358eef', 'Kokopäiväinen, 15 pv sopimus', 'Kokopäiväinen, 15 pv sopimus', 'Full-time, 15 day agreement', 'DAYCARE', FALSE, 0.75, 0.75, 0.75, 30, FALSE, TRUE, 'Kokopäiväinen, 15 pv sopimus', 'Kokopäiväinen, 15 pv sopimus', 'Kokopäiväinen, 15 pv sopimus', 'Kokopäiväinen, 15 pv sopimus', 2, 1.75),
    ('50359212-b961-11eb-b522-074fb05f7086', 'Osapäiväinen, max 5h päivässä', 'Osapäiväinen, max 5h päivässä', 'Part-time, max 5h per day', 'DAYCARE_PART_TIME', TRUE, 0.6, 0.6, 0.6, 25, TRUE, FALSE, 'Osapäiväinen, max 5h päivässä', 'Osapäiväinen, max 5h päivässä', 'Osapäiväinen, max 5h päivässä', 'Osapäiväinen, max 5h päivässä', null, 1.75),
    ('86ef7370-bf85-11eb-91e7-6fcd728c518d', 'Osapäiväinen, max 5h päivässä', 'Osapäiväinen, max 5h päivässä', 'Part-time, max 5h per day', 'DAYCARE_PART_TIME', FALSE, 0.6, 0.6, 0.6, 25, TRUE, FALSE, 'Osapäiväinen, max 5h päivässä', 'Osapäiväinen, max 5h päivässä', 'Osapäiväinen, max 5h päivässä', 'Osapäiväinen, max 5h päivässä', 1001, 1.75),
    ('50359280-b961-11eb-b523-237115533645', 'Osapäiväinen, max 5h päivässä; 10 pv sopimus', 'Osapäiväinen, max 5h päivässä; 10 pv sopimus', 'Part-time, max 5h per day; 10 day agreement', 'DAYCARE_PART_TIME', FALSE, 0.3, 0.3, 0.3, 12, TRUE, TRUE, 'Osapäiväinen, max 5h päivässä; 10 pv sopimus', 'Osapäiväinen, max 5h päivässä; 10 pv sopimus', 'Osapäiväinen, max 5h päivässä; 10 pv sopimus', 'Osapäiväinen, max 5h päivässä; 10 pv sopimus', 1002, 1.75),
    ('503592da-b961-11eb-b524-7f27c780d83a', 'Osapäiväinen, max 5h päivässä; 15 pv sopimus', 'Osapäiväinen, max 5h päivässä; 15 pv sopimus', 'Part-time, max 5h per day; 15 day agreement', 'DAYCARE_PART_TIME', FALSE, 0.45, 0.45, 0.45, 18, TRUE, TRUE, 'Osapäiväinen, max 5h päivässä; 15 pv sopimus', 'Osapäiväinen, max 5h päivässä; 15 pv sopimus', 'Osapäiväinen, max 5h päivässä; 15 pv sopimus', 'Osapäiväinen, max 5h päivässä; 15 pv sopimus', 1003, 1.75),
    ('50359334-b961-11eb-b525-f3febdfea5d3', 'Osapäiväinen, max 20h viikossa', 'Osapäiväinen, max 20h viikossa', 'Part-time, max 20h per week', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 0.5, 20, TRUE, FALSE, 'Osapäiväinen, max 20h viikossa', 'Osapäiväinen, max 20h viikossa', 'Osapäiväinen, max 20h viikossa', 'Osapäiväinen, max 20h viikossa', 1000, 1.75),
    ('5035938e-b961-11eb-b526-6b30323c87a8', 'Tilapäinen varhaiskasvatus', 'Tilapäinen varhaiskasvatus', 'Temporary daycare', 'TEMPORARY_DAYCARE', TRUE, 1.0, 1.0, 1.0, 40, FALSE, FALSE, 'Tilapäinen varhaiskasvatus', 'Tilapäinen varhaiskasvatus', 'Tilapäinen varhaiskasvatus', 'Tilapäinen varhaiskasvatus', null, 1.75),
    ('0bfc6c92-ff2a-11eb-a785-2724e8e5e7ee', 'Esiopetusta täydentävä varhaiskasvatus - max 5 h päivässä', 'Esiopetusta täydentävä varhaiskasvatus - max 5 h päivässä', 'Preschool daycare - max 5 h per day', 'PRESCHOOL_DAYCARE', TRUE, 0.6, 0.6, 0.6, 25, TRUE, FALSE, 'Esiopetusta täydentävä varhaiskasvatus - max 5 h päivässä', 'Esiopetusta täydentävä varhaiskasvatus - max 5 h päivässä', 'Esiopetusta täydentävä varhaiskasvatus - max 5 h päivässä', 'Esiopetusta täydentävä varhaiskasvatus - max 5 h päivässä', null, 1.75),
    ('503593e8-b961-11eb-b527-a3dcdfb628ec', 'Esiopetusta täydentävä varhaiskasvatus - max 5 h päivässä', 'Esiopetusta täydentävä varhaiskasvatus - max 5 h päivässä', 'Preschool daycare - max 5 h per day', 'PRESCHOOL_DAYCARE', FALSE, 0.6, 0.6, 0.6, 25, TRUE, FALSE, 'Esiopetusta täydentävä varhaiskasvatus - max 5 h päivässä', 'Esiopetusta täydentävä varhaiskasvatus - max 5 h päivässä', 'Esiopetusta täydentävä varhaiskasvatus - max 5 h päivässä', 'Esiopetusta täydentävä varhaiskasvatus - max 5 h päivässä', 2000, 1.75),
    ('50359442-b961-11eb-b528-df3290c0d63e', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä', 'Preschool daycare – over 5 h per day', 'PRESCHOOL_DAYCARE', FALSE, 0.8, 0.8, 0.8, 32, FALSE, FALSE, 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä', 2100, 1.75),
    ('bc6a42d0-fa74-11eb-9a2b-d315a7916074', 'Esiopetusta täydentävä varhaiskasvatus – max 5 h päivässä; 10 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – max 5 h päivässä; 10 pv sopimus', 'Preschool daycare – max 5 h per day; 10 day agreement', 'PRESCHOOL_DAYCARE', FALSE, 0.3, 0.3, 0.3, 12, TRUE, TRUE, 'Esiopetusta täydentävä varhaiskasvatus – max 5 h päivässä; 10 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – max 5 h päivässä; 10 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – max 5 h päivässä; 10 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – max 5 h päivässä; 10 pv sopimus', 2200, 1.75),
    ('bc6a44ec-fa74-11eb-9a2c-73b53c2af869', 'Esiopetusta täydentävä varhaiskasvatus – max 5 h päivässä; 15 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – max 5 h päivässä; 15 pv sopimus', 'Preschool daycare – max 5 h per day; 15 day agreement', 'PRESCHOOL_DAYCARE', FALSE, 0.45, 0.45, 0.45, 18, TRUE, TRUE, 'Esiopetusta täydentävä varhaiskasvatus – max 5 h päivässä; 15 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – max 5 h päivässä; 15 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – max 5 h päivässä; 15 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – max 5 h päivässä; 15 pv sopimus', 2300, 1.75),
    ('bc6a4550-fa74-11eb-9a2d-035acd5db9aa', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä; 10 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä; 10 pv sopimus', 'Preschool daycare – over 5 h per day; 10 day agreement', 'PRESCHOOL_DAYCARE', FALSE, 0.4, 0.4, 0.4, 18, FALSE, TRUE, 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä; 10 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä; 10 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä; 10 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä; 10 pv sopimus', 2400, 1.75),
    ('bc6a45a0-fa74-11eb-9a2e-fb411a8588da', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä; 15 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä; 15 pv sopimus', 'Preschool daycare – over 5 h per day; 15 day agreement', 'PRESCHOOL_DAYCARE', FALSE, 0.6, 0.6, 0.6, 24, FALSE, TRUE, 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä; 15 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä; 15 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä; 15 pv sopimus', 'Esiopetusta täydentävä varhaiskasvatus – yli 5 h päivässä; 15 pv sopimus', 2500, 1.75),
    ('ff6ddcd4-fa8a-11eb-8592-2f2b4e398fcb', 'Kerho', 'Kerho', 'Club', 'CLUB', TRUE, 0.0, 0.0, 1.0, 0, TRUE, TRUE, 'Kerho', 'Kerho', 'Kerho', 'Kerho', null, 1.75),
    ('1b4413f6-d99d-11eb-89ac-a3a978104bce', 'Koululaisen vuorohoito', 'Koululaisen vuorohoito', 'School shift care', 'SCHOOL_SHIFT_CARE', TRUE, 1.0, 1.0, 1.0, 40, TRUE, FALSE, 'Koululaisen vuorohoito', 'Koululaisen vuorohoito', 'Koululaisen vuorohoito', 'Koululaisen vuorohoito', null, 1.75)
ON CONFLICT (id) DO
UPDATE SET
    name_fi = EXCLUDED.name_fi,
    name_sv = EXCLUDED.name_sv,
    name_en = EXCLUDED.name_en,
    valid_placement_type = EXCLUDED.valid_placement_type,
    default_option = EXCLUDED.default_option,
    fee_coefficient = EXCLUDED.fee_coefficient,
    voucher_value_coefficient = EXCLUDED.voucher_value_coefficient,
    occupancy_coefficient = EXCLUDED.occupancy_coefficient,
    daycare_hours_per_week = EXCLUDED.daycare_hours_per_week,
    part_day = EXCLUDED.part_day,
    part_week = EXCLUDED.part_week,
    fee_description_fi = EXCLUDED.fee_description_fi,
    fee_description_sv = EXCLUDED.fee_description_sv,
    voucher_value_description_fi = EXCLUDED.voucher_value_description_fi,
    voucher_value_description_sv = EXCLUDED.voucher_value_description_sv,
    display_order = EXCLUDED.display_order,
    occupancy_coefficient_under_3y = EXCLUDED.occupancy_coefficient_under_3y
WHERE
    service_need_option.name_fi <> EXCLUDED.name_fi OR
    service_need_option.name_sv <> EXCLUDED.name_sv OR
    service_need_option.name_en <> EXCLUDED.name_en OR
    service_need_option.valid_placement_type <> EXCLUDED.valid_placement_type OR
    service_need_option.default_option <> EXCLUDED.default_option OR
    service_need_option.fee_coefficient <> EXCLUDED.fee_coefficient OR
    service_need_option.voucher_value_coefficient <> EXCLUDED.voucher_value_coefficient OR
    service_need_option.occupancy_coefficient <> EXCLUDED.occupancy_coefficient OR
    service_need_option.daycare_hours_per_week <> EXCLUDED.daycare_hours_per_week OR
    service_need_option.part_day <> EXCLUDED.part_day OR
    service_need_option.part_week <> EXCLUDED.part_week OR
    service_need_option.fee_description_fi <> EXCLUDED.fee_description_fi OR
    service_need_option.fee_description_sv <> EXCLUDED.fee_description_sv OR
    service_need_option.voucher_value_description_fi <> EXCLUDED.voucher_value_description_fi OR
    service_need_option.voucher_value_description_sv <> EXCLUDED.voucher_value_description_sv OR
    service_need_option.display_order <> EXCLUDED.display_order OR
    service_need_option.occupancy_coefficient_under_3y = EXCLUDED.occupancy_coefficient_under_3y;
