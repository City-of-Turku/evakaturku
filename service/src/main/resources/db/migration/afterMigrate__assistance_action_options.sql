-- SPDX-FileCopyrightText: 2021 City of Turku
--
-- SPDX-License-Identifier: LGPL-2.1-or-later

INSERT INTO assistance_action_option
    (value, name_fi, description_fi, display_order)
VALUES
    ('10', 'Lapsikohtainen avustaja', NULL, 10),
    ('20', 'Ryhmäkohtainen avustaja', NULL, 20),
    ('40', 'Ryhmäkohtainen varhaiskasvatuksen lastenhoitaja (ei mitoitukseen laskettavat)', 'Resurssi, mitä ei lasketa suhdelukuun. Pedagogisesti vahvistettu ryhmä.', 40),
    ('50', 'Pienennetty ryhmä', 'Ryhmän rakenne: VO, LH ja avustaja tai TH. Lapsiluku 13 kpl, joista kolmella lapsella tuen tarve', 50),
    ('60', 'Alueellinen integroitu ryhmä', 'Ryhmän rakenne: VEO/VO, VO ja kaksi LH. Lapsiluku 14 kpl, joista viidellä tuen tarve', 60),
    ('70', 'Erityisryhmä', 'Sarat-ryhmä. Ryhmän rakenne: VO, SH ja kaksi LH. Lapsiluku 8 kpl, joista kaikilla erityisen tuen tarve', 70),
    ('80', 'Ryhmän pienennyspäätös', 'Tehdään harkinnanvaraisesti', 80),
    ('90', 'KV-laki', NULL, 90),
    ('100', 'Varhaiskasvatuksen erityisopettajan konsultaatio', NULL, 100),
    ('110', 'Varhaiskasvatuksen erityisopettajan osa-aikainen opetus', NULL, 110),
    ('120', 'Varhaiskasvatuksen erityisopettajan kokoaikainen opetus', NULL, 120)

ON CONFLICT (value) DO
UPDATE SET
    name_fi = EXCLUDED.name_fi,
    description_fi = EXCLUDED.description_fi,
    display_order = EXCLUDED.display_order
WHERE
    assistance_action_option.name_fi <> EXCLUDED.name_fi OR
    assistance_action_option.description_fi IS DISTINCT FROM EXCLUDED.description_fi OR
    assistance_action_option.display_order <> EXCLUDED.display_order;

