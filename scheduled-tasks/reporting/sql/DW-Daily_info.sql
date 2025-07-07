-- SPDX-FileCopyrightText: 2023-2025 City of Turku
--
-- SPDX-License-Identifier: LGPL-2.1-or-later

SELECT
    now() AT TIME ZONE 'Europe/Helsinki'    AS pvm,
    p.id                                    AS lapsen_id,
    p.social_security_number                AS henkilöturvatunnus,
    p.date_of_birth                         AS syntymäaika,
    p.language                              AS kieli,
    p.street_address                        AS postiosoite,
    p.postal_code                           AS postinumero,
    p.post_office                           AS postitoimipaikka,
    p.nationalities                         AS kansalaisuudet,
    pl.type                                 AS sijoitustyyppi,
    pl.unit_id                              AS sijoitusyksikkö_id,
    pl.start_date                           AS sijoituksen_aloitus_pvm,
    pl.end_date                             AS sijoituksen_loppu_pvm,
    d.name                                  AS yksikön_nimi,
    d.care_area_id                          AS palvelualue_id,
    ca.name                                 AS palvelualue,
    d.type                                  AS toimintamuoto,
    d.provider_type                         AS järjestämistapa,
    d.dw_cost_center                        AS kustannuspaikka,
    dgp.start_date                          AS sijoitusryhmä_aloitus_pvm,
    dgp.end_date                            AS sijoitysryhmä_loppu_pvm,
    dg.id                                   AS sijoitusryhmä_id,
    dg.name                                 AS sijoitusryhmä,
    bc.unit_id                              AS varahoitoyksikkö_id,
    bc.start_date                           AS varahoitoyksikkö_aloitus_pvm,
    bc.end_date                             AS varahoitoyksikkö_loppu_pvm,
    bu.name                                 AS varahoitoyksikkö,
    bc.group_id                             AS varahoitoryhmä_id,
    bg.name                                 AS varahoitoryhmä,
    sn.id IS NOT NULL                       AS palveluntarve_merkitty,
    sno.name_fi                             AS palveluntarve,
    sno.id                                  AS palveluntarve_id,
    sno.part_day                            AS osapäiväinen,
    sno.part_week                           AS osaviikkoinen,
    sn.start_date                           AS palveluntarpeen_aloitus_pvm,
    sn.end_date                             AS palveluntarpeen_loppu_pvm,
    sn.shift_care                           AS vuorohoito,
    sno.daycare_hours_per_week              AS tunteja_viikossa,
    sno.realized_occupancy_coefficient      AS palveluntarvekerroin,
    da.level                                AS tuentarve_varhaiskasvatuksessa,
    lower(da.valid_during)                  AS tuentarve_varha_aloitus_pvm,
    upper(da.valid_during)                  AS tuentarve_varha_loppu_pvm,
    pa.level                                AS tuentarve_esiopetuksessa,
    lower(pa.valid_during)                  AS tuentarve_esiop_aloitus_pvm,
    upper(pa.valid_during)                  AS tuentarve_esiop_loppu_pvm,
    anvc.coefficient                        AS tuentarpeen_kerroin,
    lower(anvc.validity_period)             AS kerroin_aloitus_pvm,
    upper(anvc.validity_period)             AS kerroin_loppu_pvm,
    af.capacity_factor                      AS lapsen_kapasiteetti,
    lower(af.valid_during)                  AS kapasiteetti_aloitus_pvm,
    upper(af.valid_during)                  AS kapasiteetti_loppu_pvm,
    array(
        SELECT distinct absence_type
        FROM absence
        WHERE child_id = p.id
            AND absence.date >= pl.start_date
            AND absence.date <= pl.end_date
    )                                       AS poissaolon_syy
FROM person p
    JOIN placement pl ON pl.child_id = p.id
        AND pl.end_date >= :date_val::DATE - INTERVAL '3 years'
    JOIN daycare d ON pl.unit_id = d.id
    JOIN care_area ca ON d.care_area_id = ca.id
    JOIN daycare_group_placement dgp ON pl.id = dgp.daycare_placement_id
        AND daterange(dgp.start_date, dgp.end_date, '[]') && daterange(pl.start_date, pl.end_date, '[]')
    JOIN daycare_group dg ON d.id = dg.daycare_id
        AND dgp.daycare_group_id = dg.id
    LEFT JOIN backup_care bc ON p.id = bc.child_id
        AND daterange(bc.start_date, bc.end_date, '[]') && daterange(dgp.start_date, dgp.end_date, '[]')
    LEFT JOIN daycare bu ON bu.id = bc.unit_id
    LEFT JOIN daycare_group bg ON bg.id = bc.group_id
    LEFT JOIN service_need sn ON pl.id = sn.placement_id
        AND daterange(sn.start_date, sn.end_date, '[]') && daterange(pl.start_date, pl.end_date, '[]')
    LEFT JOIN service_need_option sno ON sno.id = sn.option_id
    LEFT JOIN daycare_assistance da ON p.id = da.child_id
        AND da.valid_during && daterange(pl.start_date, pl.end_date, '[]')
    LEFT JOIN preschool_assistance pa ON p.id = pa.child_id
        AND pa.valid_during && daterange(pl.start_date, pl.end_date, '[]')
    LEFT JOIN assistance_factor af ON p.id = af.child_id
        AND af.valid_during && daterange(pl.start_date, pl.end_date, '[]')
    LEFT JOIN assistance_need_voucher_coefficient anvc ON p.id = anvc.child_id
        AND anvc.validity_period && daterange(sn.start_date, sn.end_date, '[]');
