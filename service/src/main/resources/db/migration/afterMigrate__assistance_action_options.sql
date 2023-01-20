-- SPDX-FileCopyrightText: 2021 City of Turku
--
-- SPDX-License-Identifier: LGPL-2.1-or-later

INSERT INTO assistance_action_option
    (value, name_fi, description_fi, display_order)
VALUES
    ('10', 'Avustajataso I', 'lapsikohtainen', 10),
    ('20', 'Avustajataso II', '2–3 lapselle', 20),
    ('30', 'Avustajataso III', '2–5 lapselle', 30),
    ('40', 'Tuen hoitaja', 'Tuen hoitaja on resurssi, mitä ei lasketa suhdelukuun. Pedagogisesti vahvistettu ryhmä.', 40),
    ('50', 'Pienennetty ryhmä', 'Ryhmän rakenne: Opettaja, lastenhoitaja ja avustaja tai tuen hoitaja. Lapsiluku 13 kpl, joista kolmella lapsella tuen tarve', 50),
    ('60', 'Alueellinen integroitu ryhmä', 'Ryhmän rakenne: VEO, opettaja ja kaksi lastenhoitajaa. Lapsiluku 14 kpl, joista viidellä tuen tarve.', 60),
    ('70', 'Erityisryhmä', 'Sarat-ryhmä. Ryhmän rakenne: VEO, sairaanhoitaja ja kaksi lastenhoitajaa. Lapsiluku 8 kpl, joista kaikilla tuen tarve.', 70),
    ('80', 'Ryhmän pienennyspäätös', 'Tehdään harkinnanvaraisesti', 80),
    ('90', 'Koululykkäys', 'Lähikoulun rehtorin päätöksellä', 90),
    ('100', 'Pidennetty oppivelvollisuus', 'Merkittävä, kun lapsella pidennetty oppivelvollisuus.', 100),
    ('110', 'Harkinnanvarainen kuljetusetu', 'Käytetään silloin kun lapselle on myönnetty harkinnanvarainen kuljetusetu', 110),
    ('120', 'Koululykkäys', 'Lähikoulun rehtorin päätöksellä', 120)

ON CONFLICT (value) DO
UPDATE SET
    name_fi = EXCLUDED.name_fi,
    description_fi = EXCLUDED.description_fi,
    display_order = EXCLUDED.display_order
WHERE
    assistance_action_option.name_fi <> EXCLUDED.name_fi OR
    assistance_action_option.description_fi IS DISTINCT FROM EXCLUDED.description_fi OR
    assistance_action_option.display_order <> EXCLUDED.display_order;
