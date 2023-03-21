-- SPDX-FileCopyrightText: 2021 City of Turku
--
-- SPDX-License-Identifier: LGPL-2.1-or-later

INSERT INTO assistance_basis_option
    (value, name_fi, description_fi, display_order)
VALUES
    ('GENERAL_ASSISTANCE_NEED', 'Yleisen tuen tukipalvelu', 'Koskee varhaiskasvatusta', 100),
    ('INTENSIFIED_ASSISTANCE', 'Tehostettu tuki', 'Varhaiskasvatuksessa tehdään hallintopäätös, esiopetuksessa ei.', 200),
    ('SPECIAL_ASSISTANCE_DECISION', 'Erityinen tuki', 'Varhaiskasvatuksessa ja esiopetuksessa tehdään hallintopäätös.', 300),
    ('DEVELOPMENTAL_DISABILITY_1', 'Kehitysvamma', 'Kehitysvammalain nojalla myönnettyjä palveluja saaville lapsille laaditaan erityishuolto-ohjelma. Erityishuolto-ohjelma sisältää asiakkaalle kehitysvammalain nojalla myönnetyt palvelu. Tieto menee KOSKI-palveluun.', 305),
    ('DEVELOPMENTAL_DISABILITY_2', 'Pidennetty oppivelvollisuus', 'Päätös tehdään esiopetuksessa. Tieto menee KOSKI-palveluun', 310),
    ('OTHER_REASON', 'Muu peruste', NULL, 320)

ON CONFLICT (value) DO
UPDATE SET
    name_fi = EXCLUDED.name_fi,
    description_fi = EXCLUDED.description_fi,
    display_order = EXCLUDED.display_order
WHERE
    assistance_basis_option.name_fi <> EXCLUDED.name_fi OR
    assistance_basis_option.description_fi IS DISTINCT FROM EXCLUDED.description_fi OR
    assistance_basis_option.display_order <> EXCLUDED.display_order;
