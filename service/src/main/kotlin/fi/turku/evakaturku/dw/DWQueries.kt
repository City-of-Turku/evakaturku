package fi.turku.evakaturku.dw

import fi.espoo.evaka.shared.db.Database
import fi.espoo.evaka.shared.db.QuerySql
import kotlin.reflect.KClass

object DWQueries {
    val getAbsences =
        csvQuery<DWAbsence> {
            sql(
                """
                SELECT
                    ab.child_id as lapsenID,
                    ab.date as poissaolonpvm,
                    ab.absence_type as poissaolontyyppi,
                    ab.category as poissaolonkategoria,
                    pl.type as sijoitustyyppi
                FROM absence ab, placement pl
                WHERE current_date::DATE - INTERVAL '3 months' <= ab.date
                    AND ab.child_id = pl.child_id
                    AND pl.start_date <= ab.date
                    AND pl.end_date >= ab.date
                ORDER BY ab.date, ab.child_id
                """.trimIndent(),
            )
        }

    val getAssistanceNeedDecisions =
        csvQuery<DWAssistanceNeedDecision> {
            sql(
                """
                SELECT
                    now() AT TIME ZONE 'Europe/Helsinki'               AS aikaleima,
                    decision_number                                    AS päätos_tuesta,
                    child_id                                           AS lapsen_id,
                    lower(validity_period)                             AS tuen_alkupvm,
                    upper(validity_period)                             AS tuen_loppupvm,
                    structural_motivation_opt_smaller_group            AS pienennetty_ryhmä,
                    structural_motivation_opt_special_group            AS erityisryhmä,
                    structural_motivation_opt_small_group              AS pienryhmä,
                    structural_motivation_opt_group_assistant          AS ryhmäkohtainen_avustaja,
                    structural_motivation_opt_child_assistant          AS lapsikohtainen_avustaja,
                    structural_motivation_opt_additional_staff         AS henkilöresurssien_lisäys,
                    service_opt_consultation_special_ed                AS veon_antama_konsultaatio,
                    service_opt_part_time_special_ed                   AS veon_osa_aikainen_opetus,
                    service_opt_full_time_special_ed                   AS veon_kokoaikainen_opetus,
                    service_opt_interpretation_and_assistance_services AS tulkitsemis_ja_avustamispalvelut,
                    service_opt_special_aides                          AS apuvälineet,
                    assistance_levels                                  AS tuen_taso
                FROM assistance_need_decision
                WHERE current_date::DATE - INTERVAL '3 years' <= upper(validity_period)
                """.trimIndent(),
            )
        }

    val getChildAggregate =
        csvQuery<DWChildAggregate> {
            sql(
                """
                SELECT distinct
                    now() AT TIME ZONE 'Europe/Helsinki'    	AS pvm,
                    child.id                                    AS lapsen_id,
                    child.social_security_number                AS henkilöturvatunnus,
                    child.date_of_birth                         AS syntymäaika,
                    child.language                              AS kieli,
                    child.street_address                        AS postiosoite,
                    child.postal_code                           AS postinumero,
                    child.post_office                           AS postitoimipaikka,
                    child.nationalities                         AS kansalaisuudet
                FROM (
                    SELECT
                        p.id,
                        p.social_security_number,
                        p.date_of_birth,
                        p.language,
                        p.street_address,
                        p.postal_code,
                        p.post_office,
                        p.nationalities
                    FROM person p
                        JOIN placement pl ON pl.child_id = p.id
                            AND pl.end_date >= current_date::DATE - INTERVAL '3 years'
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
                        LEFT JOIN assistance_need_voucher_coefficient anvc ON p.id = anvc.child_id
                            AND anvc.validity_period && daterange(sn.start_date, sn.end_date, '[]')
                    UNION
                    SELECT
                        p.id,
                        p.social_security_number,
                        p.date_of_birth,
                        p.language,
                        p.street_address,
                        p.postal_code,
                        p.post_office,
                        p.nationalities
                    FROM assistance_need_decision aneed
                        JOIN person p ON aneed.child_id = p.id
                    WHERE current_date::DATE - INTERVAL '3 years' <= upper(validity_period)
                    UNION
                    SELECT
                        p.id,
                        p.social_security_number,
                        p.date_of_birth,
                        p.language,
                        p.street_address,
                        p.postal_code,
                        p.post_office,
                        p.nationalities
                    FROM fee_decision fd
                        JOIN fee_decision_child fdc on fd.id = fdc.fee_decision_id
                        JOIN person p on fdc.child_id = p.id
                        JOIN daycare d ON fdc.placement_unit_id = d.id
                        JOIN care_area ca ON d.care_area_id = ca.id
                    WHERE fd.status = 'SENT'
                        AND fd.decision_number IS NOT NULL -- ei tuoda effican päätöksiä
                        AND current_date::DATE - INTERVAL '3 years' <= upper(fd.valid_during)
                    UNION
                    SELECT
                        p.id,
                        p.social_security_number,
                        p.date_of_birth,
                        p.language,
                        p.street_address,
                        p.postal_code,
                        p.post_office,
                        p.nationalities
                    FROM voucher_value_decision vvd
                        JOIN person p on vvd.child_id = p.id
                        JOIN daycare d ON vvd.placement_unit_id = d.id
                        JOIN care_area ca ON d.care_area_id = ca.id
                    WHERE vvd.status = 'SENT'
                        AND vvd.decision_number IS NOT NULL -- ei tuoda effican päätöksiä
                        AND current_date::DATE - INTERVAL '3 years' <= vvd.valid_to
                ) child
                """.trimIndent(),
            )
        }

    val getDailyInfos =
        csvQuery<DWDailyInfo> {
            sql(
                """
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
                        AND pl.end_date >= current_date::DATE - INTERVAL '3 years'
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
                        AND anvc.validity_period && daterange(sn.start_date, sn.end_date, '[]')

                """.trimIndent(),
            )
        }

    val getDailyUnitsAndGroupsAttendances =
        csvQuery<DWDailyUnitAndGroupAttendance> {
            sql(
                """
                WITH caretaker_counts_on_date AS (
                    SELECT
                        u.id                           AS unit_id,
                        g.id                           AS group_id,
                        t::date                        AS date,
                        COALESCE(
                            SUM(
                                CASE
                                    WHEN saa.arrived IS NOT null AND (t::DATE = DATE(saa.arrived) OR t::DATE = DATE(saa.departed))
                                        THEN ROUND(EXTRACT(EPOCH FROM (
                                            LEAST(saa.departed, timezone('Europe/Helsinki', (t::DATE + 1)::DATE::TIMESTAMP)) -
                                            GREATEST(saa.arrived, timezone('Europe/Helsinki', t::DATE::TIMESTAMP))
                                        )) / 3600 / 7.65 * saa.occupancy_coefficient / 7, 4)
                                    ELSE s.count
                                END
                            ), 0.0
                        )                               AS caretaker_count
                    FROM generate_series(current_date::DATE - interval '2 week', current_date::DATE, '1 day') t
                        CROSS JOIN daycare_group g
                        JOIN daycare u ON g.daycare_id = u.id
                            AND daterange(g.start_date, g.end_date, '[]') @> t::DATE
                        LEFT JOIN (
                            SELECT group_id, arrived, departed, occupancy_coefficient
                            FROM staff_attendance_realtime
                            WHERE departed IS NOT NULL
                                AND type = ANY('{PRESENT,OVERTIME,JUSTIFIED_CHANGE}'::staff_attendance_type[])
                                AND (current_date::DATE - interval '2 week' <= DATE(arrived) OR current_date::DATE - interval '2 week' <= DATE(departed))
                            UNION ALL
                            SELECT group_id, arrived, departed, occupancy_coefficient
                            FROM staff_attendance_external
                            WHERE departed IS NOT NULL
                                AND (current_date::DATE - interval '2 week' <= DATE(arrived) OR current_date::DATE - interval '2 week' <= DATE(departed))
                        ) saa ON g.id = saa.group_id
                        LEFT JOIN staff_attendance s ON g.id = s.group_id
                            AND t::DATE = s.date
                    WHERE date_part('isodow', t::DATE) = ANY(u.operation_days)
                        AND daterange(u.opening_date, u.closing_date, '[]') @> t::DATE
                    GROUP BY u.id, g.id, t
                ),
                default_sn_coefficients AS (
                    SELECT
                        occupancy_coefficient,
                        occupancy_coefficient_under_3y,
                        realized_occupancy_coefficient,
                        realized_occupancy_coefficient_under_3y,
                        valid_placement_type
                    FROM service_need_option
                    WHERE default_option
                ),
                daycare_group_placements_aggregate AS (
                    SELECT
                        dgp.id                                              AS group_placement_id,
                        dgp.daycare_group_id                                AS group_id,
                        dgp.start_date                                      AS start_date,
                        dgp.end_date                                        AS end_date,
                        pl.child_id                                         AS child_id,
                        pl.unit_id                                          AS unit_id,
                        pl.type                                             AS pl_type,
                        sn.start_date                                       AS sn_start,
                        sn.end_date                                         AS sn_end,
                        sno.id                                              AS sno_id,
                        p.date_of_birth                                     AS child_birth_date
                    FROM daycare_group_placement dgp
                        JOIN placement pl ON dgp.daycare_placement_id = pl.id
                        JOIN daycare u ON u.id = pl.unit_id
                        JOIN person p ON p.id = pl.child_id
                        LEFT JOIN service_need sn ON sn.placement_id = pl.id
                            AND daterange(sn.start_date, sn.end_date, '[]') && daterange(dgp.start_date, dgp.end_date, '[]')
                        LEFT JOIN service_need_option sno ON sn.option_id = sno.id
                    WHERE current_date::DATE - interval '2 week' <= dgp.end_date
                )
                SELECT
                    now() AT TIME ZONE 'Europe/Helsinki'       AS aikaleima,
                    ccod.date                                  AS poiminta_ajalta_pvm,
                    d.name                                     AS toimintayksikkö,
                    d.id                                       AS toimintayksikkö_id,
                    (
                        SELECT count(distinct p.child_id)
                        FROM placement p
                        WHERE p.unit_id = d.id
                            AND p.start_date <= ccod.date
                            AND ccod.date <= p.end_date
                    )                                          AS toimintayksikön_lapsimäärä,
                    (
                        SELECT count(distinct p.child_id)
                        FROM placement p
                        WHERE p.unit_id = d.id
                            AND p.start_date < date_trunc('month', ccod.date)
                            AND date_trunc('month', ccod.date) < p.end_date --Edellisen kuun viimeisen päivän mukaan
                    )                                          AS toimintayksikön_lapsimäärä_ed_kuun_lopussa,
                    dg.name                                    AS ryhmä,
                    dg.id                                      AS ryhmä_id,
                    dc.amount                                  AS henkilökuntaa_ryhmässä,
                    ccod.caretaker_count                       AS henkilökuntaa_läsnä,
                    (
                        SELECT count(DISTINCT child_att.child_id)
                        FROM child_attendance child_att
                        WHERE child_att.unit_id = d.id
                            AND child_att.date = ccod.date
                            AND EXISTS (
                                SELECT group_placement_id, group_id, start_date, end_date, child_id, unit_id, pl_type, sn_start, sn_end, sno_id, child_birth_date
                                FROM daycare_group_placements_aggregate dgpa
                                WHERE dgpa.group_id = dg.id
                                    AND daterange(dgpa.start_date, dgpa.end_date, '[]') @> ccod.date
                                    AND dgpa.child_id = child_att.child_id
                            )
                    )                                           AS lapsia_läsnä_ryhmässä,
                    (
                        SELECT SUM(
                            (
                                coalesce(af.capacity_factor, 1)
                            ) * (
                                CASE
                                    WHEN (d.type && array['FAMILY', 'GROUP_FAMILY']::care_types[]) = TRUE
                                        THEN 1.75
                                    WHEN ccod.date < (dgpa.child_birth_date + interval '3 year')::DATE
                                        THEN (
                                            coalesce(sno.realized_occupancy_coefficient_under_3y, dsc.realized_occupancy_coefficient_under_3y)
                                        )
                                    ELSE (
                                        coalesce(sno.realized_occupancy_coefficient, dsc.realized_occupancy_coefficient)
                                    )
                                END
                            )
                        )
                        FROM child_attendance child_att
                            JOIN daycare_group_placements_aggregate dgpa ON dgpa.child_id = child_att.child_id
                                AND daterange(dgpa.start_date, dgpa.end_date, '[]') @> ccod.date
                                AND daterange(dgpa.sn_start, dgpa.sn_end, '[]') @> ccod.date
                            LEFT JOIN assistance_factor af ON af.child_id = dgpa.child_id
                                AND af.valid_during @> ccod.date
                            LEFT JOIN service_need_option sno ON sno.id = dgpa.sno_id
                            JOIN default_sn_coefficients dsc ON dsc.valid_placement_type = dgpa.pl_type
                        WHERE child_att.unit_id = d.id
                            AND child_att.date = ccod.date
                            AND dgpa.group_id = dg.id
                    )                                      AS laskennallinen_lapsia_läsnä_ryhmässä,
                    (
                        SELECT COUNT(distinct child_att.child_id)
                        FROM child_attendance child_att
                        WHERE child_att.unit_id = d.id
                            AND child_att.date = ccod.date
                    )                                      AS lapsia_läsnä_yksikössä,
                    (
                        SELECT COUNT(distinct dgpa.child_id)
                        FROM daycare_group_placements_aggregate dgpa
                        WHERE dgpa.group_id = dg.id
                            AND daterange(dgpa.start_date, dgpa.end_date, '[]') @> ccod.date
                    )                                      AS ryhmän_lapsimäärä,
                    (
                        SELECT SUM(
                            (
                                coalesce(af.capacity_factor, 1)
                            ) * (
                                CASE
                                    WHEN (d.type && array['FAMILY', 'GROUP_FAMILY']::care_types[]) = TRUE
                                        THEN 1.75
                                    WHEN ccod.date < (dgpa.child_birth_date + interval '3 year')::DATE
                                        THEN (
                                            coalesce(sno.realized_occupancy_coefficient_under_3y, dsc.realized_occupancy_coefficient_under_3y)
                                        )
                                    ELSE (
                                        coalesce(sno.realized_occupancy_coefficient, dsc.realized_occupancy_coefficient)
                                    )
                                END
                            )
                        )
                        FROM daycare_group_placements_aggregate dgpa
                            LEFT JOIN assistance_factor af ON af.child_id = dgpa.child_id
                                AND af.valid_during @> ccod.date
                            LEFT JOIN service_need_option sno ON sno.id = dgpa.sno_id
                            JOIN default_sn_coefficients dsc ON dsc.valid_placement_type = dgpa.pl_type
                        WHERE dgpa.group_id = dg.id
                            AND daterange(dgpa.start_date, dgpa.end_date, '[]') @> ccod.date
                            AND daterange(dgpa.sn_start, dgpa.sn_end, '[]') @> ccod.date
                    )                                      AS laskennallinen_ryhmän_lapsimäärä,
                    (
                        SELECT COUNT(distinct p.child_id)
                        FROM daycare_group_placement dgp
                            JOIN placement p ON dgp.daycare_placement_id = p.id
                        WHERE dgp.daycare_group_id = dg.id
                            AND dgp.start_date < date_trunc('month', ccod.date)
                            AND date_trunc('month', ccod.date) < dgp.end_date --Edellisen kuun viimeisen päivän mukaan
                    )                                      AS ryhmän_lapsimäärä_ed_kuun_lopussa
                FROM daycare_group dg
                    JOIN daycare d ON dg.daycare_id = d.id
                    JOIN care_area ca ON ca.id = d.care_area_id
                    LEFT JOIN caretaker_counts_on_date ccod on ccod.group_id = dg.id
                    JOIN daycare_caretaker dc ON dg.id = dc.group_id
                        AND dc.start_date <= ccod.date
                        AND (dc.end_date >= ccod.date or dc.end_date is null)
                WHERE (current_date::DATE - interval '3 months' <= d.closing_date OR d.closing_date is null)
                    AND (current_date::DATE - interval '3 months' <= dg.end_date OR dg.end_date is null)
                GROUP by
                    ccod.date,
                    d.name,
                    d.id,
                    dg.name,
                    dg.id,
                    dc.amount,
                    ccod.caretaker_count

                """.trimIndent(),
            )
        }

    val getDailyUnitsOccupanciesConfirmed =
        csvQuery<DWDailyUnitOccupancyConfirmed> {
            sql(
                """
                WITH
                caretaker_counts AS (
                    SELECT 
                        a.id                                    AS area_id, 
                        a.name                                  AS area_name, 
                        u.id                                    AS unit_id, 
                        u.name                                  AS unit_name, 
                        current_date::DATE                         AS date,
                        COALESCE(
                            SUM(c.amount),
                            0.0
                        ) AS caretaker_count
                    FROM daycare_group g
                        JOIN daycare u ON g.daycare_id = u.id
                            AND daterange(g.start_date, g.end_date, '[]') @> current_date::DATE
                        JOIN care_area a ON a.id = u.care_area_id
                        LEFT JOIN daycare_caretaker c ON g.id = c.group_id 
                            AND daterange(c.start_date, c.end_date, '[]') @> current_date::DATE
                    WHERE date_part('isodow', current_date::DATE) = ANY(u.operation_days)
                        AND daterange(u.opening_date, u.closing_date, '[]') @> current_date::DATE
                    GROUP BY a.id, u.id
                ),
                placements AS (
                    SELECT
                        p.id AS placement_id,
                        p.child_id,
                        p.unit_id,
                        p.type,
                        u.type && array['FAMILY', 'GROUP_FAMILY']::care_types[] AS family_unit_placement,
                        daterange(p.start_date, p.end_date, '[]') AS period
                    FROM placement p
                        JOIN daycare u ON p.unit_id = u.id
                    WHERE daterange(p.start_date, p.end_date, '[]') @> current_date::DATE
                ),
                default_sn_coefficients AS (
                    SELECT
                        occupancy_coefficient,
                        occupancy_coefficient_under_3y,
                        realized_occupancy_coefficient,
                        realized_occupancy_coefficient_under_3y,
                        valid_placement_type
                    FROM service_need_option 
                    WHERE default_option
                ),
                placements_on_date AS (
                    SELECT
                        cc.date,
                        cc.caretaker_count                          AS caretaker_count,
                        pl.placement_id                             AS placement_id,
                        pl.child_id                                 AS child_id,
                        pl.unit_id                                  AS unit_id,
                        coalesce(af.capacity_factor, 1)             AS assistance_coefficient,
                        CASE
                            WHEN pl.family_unit_placement = TRUE
                                THEN 1.75
                            WHEN cc.date < (p.date_of_birth + interval '3 year')::DATE
                                THEN (
                                    coalesce(sno.occupancy_coefficient_under_3y, dsc.occupancy_coefficient_under_3y)
                                )
                            ELSE (
                                coalesce(sno.occupancy_coefficient, dsc.occupancy_coefficient)
                            )
                        END                                         AS service_need_coefficient
                    from caretaker_counts cc
                        JOIN (
                            SELECT
                                p.id AS placement_id,
                                p.child_id,
                                p.unit_id,
                                p.type,
                                u.type && array['FAMILY', 'GROUP_FAMILY']::care_types[] AS family_unit_placement,
                                daterange(p.start_date, p.end_date, '[]') AS period
                            FROM placement p
                                JOIN daycare u ON p.unit_id = u.id
                            WHERE daterange(p.start_date, p.end_date, '[]') @> current_date::DATE
                        ) pl ON pl.unit_id = cc.unit_id
                        JOIN person p ON p.id = pl.child_id
                        LEFT JOIN assistance_factor af ON af.child_id = pl.child_id
                            AND af.valid_during @> cc.date
                        LEFT JOIN service_need sn ON sn.placement_id = pl.placement_id
                            AND daterange(sn.start_date, sn.end_date, '[]') @> cc.date
                        left JOIN service_need_option sno ON sn.option_id = sno.id
                        JOIN default_sn_coefficients dsc ON dsc.valid_placement_type = pl.type
                )
                SELECT
                    pod.date                                                       AS pvm,
                    pod.unit_id                                                    AS toimintayksikkö_id,
                    d.name                                                         AS toimintayksikkö,
                    pod.caretaker_count                                            AS kasvattajien_lkm,
                    COUNT(pod.placement_id)                                        AS sijoituksien_lkm,
                    SUM(pod.assistance_coefficient * pod.service_need_coefficient) AS täyttöaste_summa,
                    CASE
                        WHEN pod.caretaker_count IS NULL OR pod.caretaker_count = 0
                            THEN null
                        ELSE (SUM(pod.assistance_coefficient * pod.service_need_coefficient) / (pod.caretaker_count * 7)) * 100
                    END                                                                AS täyttöaste_prosentteina
                from placements_on_date pod
                    JOIN daycare d ON d.id = pod.unit_id
                group by
                    pod.date, pod.unit_id, d.name, pod.caretaker_count

                """.trimIndent(),
            )
        }

    val getDailyUnitsOccupanciesRealized =
        csvQuery<DWDailyUnitOccupancyRealized> {
            sql(
                """
                WITH
                caretaker_counts AS (
                    SELECT
                        a.id                            AS area_id,
                        a.name                          AS area_name,
                        u.id                            AS unit_id,
                        u.name                          AS unit_name,
                        current_date::DATE                 AS date,
                        COALESCE(
                            SUM(
                                CASE
                                    WHEN sar.arrived IS NOT null AND (current_date::DATE = DATE(sar.arrived) OR current_date::DATE = DATE(sar.departed))
                                        THEN ROUND(EXTRACT(EPOCH FROM (
                                            LEAST(sar.departed, timezone('Europe/Helsinki', (current_date::DATE + 1)::DATE::TIMESTAMP)) - GREATEST(sar.arrived, timezone('Europe/Helsinki', current_date::DATE::TIMESTAMP))
                                        )) / 3600 / 7.65 * sar.occupancy_coefficient / 7, 4)
                                    ELSE s.count
                                END
                            ),
                            0.0
                        )                               AS caretaker_count
                    FROM daycare_group g
                        JOIN daycare u ON g.daycare_id = u.id
                            AND daterange(g.start_date, g.end_date, '[]') @> current_date::DATE
                        JOIN care_area a ON a.id = u.care_area_id
                        LEFT JOIN (
                            SELECT group_id, arrived, departed, occupancy_coefficient
                            FROM staff_attendance_realtime
                            WHERE departed IS NOT NULL
                                AND type = ANY('{PRESENT,OVERTIME,JUSTIFIED_CHANGE}'::staff_attendance_type[])
                            UNION ALL
                            SELECT group_id, arrived, departed, occupancy_coefficient
                            FROM staff_attendance_external
                            WHERE departed IS NOT null
                        ) sar ON g.id = sar.group_id
                        LEFT JOIN staff_attendance s ON g.id = s.group_id
                            AND current_date::DATE = s.date
                    WHERE date_part('isodow', current_date::DATE) = ANY(u.operation_days)
                        AND daterange(u.opening_date, u.closing_date, '[]') @> current_date::DATE
                    GROUP BY a.id, u.id
                ),
                default_sn_coefficients AS (
                    SELECT
                        occupancy_coefficient,
                        occupancy_coefficient_under_3y,
                        realized_occupancy_coefficient,
                        realized_occupancy_coefficient_under_3y,
                        valid_placement_type
                    FROM service_need_option
                    WHERE default_option
                ),
                placements_realized AS (
                    SELECT
                        bc.id                                                   AS placement_id,
                        bc.child_id,
                        bc.unit_id,
                        pl.type,
                        u.type && array['FAMILY', 'GROUP_FAMILY']::care_types[] AS family_unit_placement,
                        daterange(bc.start_date, bc.end_date, '[]')             AS period
                    FROM backup_care bc
                        JOIN daycare u ON bc.unit_id = u.id
                        JOIN placement pl ON bc.child_id = pl.child_id
                            AND daterange(bc.start_date, bc.end_date, '[]') && daterange(pl.start_date, pl.end_date, '[]')
                    WHERE daterange(bc.start_date, bc.end_date, '[]') @> current_date::DATE
                        AND NOT EXISTS (
                            SELECT id, child_id, date, absence_type, modified_at, modified_by, category, questionnaire_id
                            FROM absence a
                            WHERE a.child_id = pl.child_id
                                AND current_date::DATE = a.date
                                AND array[a.category] && absence_categories(pl.type)
                        )
                    union
                    SELECT
                        pl.id                                                   AS placement_id,
                        pl.child_id,
                        pl.unit_id,
                        pl.type,
                        u.type && array['FAMILY', 'GROUP_FAMILY']::care_types[] AS family_unit_placement,
                        daterange(pl.start_date, pl.end_date, '[]')             AS period
                    FROM placement pl
                        JOIN daycare u ON pl.unit_id = u.id
                    where daterange(pl.start_date, pl.end_date, '[]') @> current_date::DATE
                        AND NOT EXISTS(
                            SELECT id, created, updated, child_id, unit_id, group_id, start_date, end_date
                            FROM backup_care bc
                            WHERE daterange(bc.start_date, bc.end_date, '[]') @> current_date::DATE
                                AND daterange(bc.start_date, bc.end_date, '[]') && daterange(pl.start_date, pl.end_date, '[]')
                                AND bc.child_id = pl.child_id
                        )
                        AND NOT EXISTS (
                            SELECT id, child_id, date, absence_type, modified_at, modified_by, category, questionnaire_id
                            FROM absence a
                            WHERE a.child_id = pl.child_id
                                AND current_date::DATE = a.date
                                AND array[a.category] && absence_categories(pl.type)
                        )
                ),
                placements_on_date AS (
                    SELECT
                        cc.date,
                        cc.caretaker_count                                  AS caretaker_count,
                        pr.placement_id                                     AS placement_id,
                        pr.child_id                                         AS child_id,
                        pr.unit_id                                          AS unit_id,
                        coalesce(af.capacity_factor, 1)                     AS assistance_coefficient,
                        CASE
                            WHEN pr.family_unit_placement = TRUE
                                THEN 1.75
                            WHEN cc.date < (p.date_of_birth + interval '3 year')::DATE
                                THEN (
                                    coalesce(sno.realized_occupancy_coefficient_under_3y, dsc.realized_occupancy_coefficient_under_3y)
                                )
                            ELSE (
                                coalesce(sno.realized_occupancy_coefficient, dsc.realized_occupancy_coefficient)
                            )
                        END AS service_need_coefficient
                    FROM caretaker_counts cc
                        JOIN placements_realized pr ON pr.unit_id = cc.unit_id
                        JOIN person p ON p.id = pr.child_id
                        LEFT JOIN assistance_factor af ON af.child_id = pr.child_id
                            AND af.valid_during @> cc.date
                        LEFT JOIN service_need sn ON sn.placement_id = pr.placement_id
                            AND daterange(sn.start_date, sn.end_date, '[]') @> cc.date
                        LEFT JOIN service_need_option sno ON sn.option_id = sno.id
                        JOIN default_sn_coefficients dsc ON dsc.valid_placement_type = pr.type
                )
                SELECT
                    pod.date                                                        AS pvm,
                    pod.unit_id                                                     AS toimintayksikkö_id,
                    d.name                                                          AS toimintayksikkö,
                    pod.caretaker_count                                             AS kasvattajien_lkm,
                    count(pod.placement_id)                                         AS sijoituksien_lkm,
                    SUM(pod.assistance_coefficient * pod.service_need_coefficient)  AS käyttöaste_summa,
                    CASE
                        WHEN pod.caretaker_count IS NULL OR pod.caretaker_count = 0
                            THEN null
                        ELSE (SUM(pod.assistance_coefficient * pod.service_need_coefficient) / (pod.caretaker_count * 7)) * 100
                    END                                                             AS käyttöaste_prosentteina
                FROM placements_on_date pod
                    JOIN daycare d ON d.id = pod.unit_id
                GROUP BY
                    pod.date, pod.unit_id, d.name, pod.caretaker_count

                """.trimIndent(),
            )
        }

    val getFeeDecisions =
        csvQuery<DWFeeDecision> {
            sql(
                """
                SELECT
                    now() AT TIME ZONE 'Europe/Helsinki'        AS aikaleima,
                    fd.decision_number                          AS maksupäätöksen_numero,
                    fd.id                                       AS maksupäätös_id,
                    lower(fd.valid_during)                      AS alkupvm,
                    upper(fd.valid_during) - interval '1 day'   AS loppupvm,
                    fd.decision_type                            AS huojennustyyppi,
                    fd.family_size                              AS perhekoko,
                    fd.total_fee                                AS kokonaismaksu,
                    fdc.child_id                                AS lapsi_id,
                    fdc.final_fee                               AS lapsikohtainen_maksu,
                    fdc.placement_type                          AS toimintamuoto,
                    ca.name                                     AS palvelualue,
                    ca.id                                       AS palvelualue_id,
                    d.name                                      AS toimipaikka,
                    d.id                                        AS toimipaikka_id,
                    d.dw_cost_center                            AS kustannuspaikka
                FROM fee_decision fd
                    JOIN fee_decision_child fdc on fd.id = fdc.fee_decision_id
                    JOIN daycare d ON fdc.placement_unit_id = d.id
                    JOIN care_area ca ON d.care_area_id = ca.id
                WHERE fd.status = 'SENT'
                    AND fd.decision_number IS NOT NULL -- ei tuoda effican päätöksiä
                    AND current_date::DATE - INTERVAL '3 years' <= upper(fd.valid_during)
                """.trimIndent(),
            )
        }

    val getVoucherValueDecisions =
        csvQuery<DWVoucherValueDecision> {
            sql(
                """
                SELECT
                    now() AT TIME ZONE 'Europe/Helsinki'    AS aikaleima,
                    vvd.decision_number                     AS arvopäätöksen_numero,
                    vvd.valid_from                          AS alkupvm,
                    vvd.valid_to                            AS loppupvm,
                    vvd.decision_type                       AS huojennustyyppi,
                    vvd.family_size                         AS perhekoko,
                    vvd.voucher_value                       AS palvelusetelin_arvo,
                    vvd.final_co_payment                    AS omavastuuosuus,
                    vvd.child_id                            AS lapsen_id,
                    vvd.placement_type                      AS toimintamuoto,
                    ca.name                                 AS palvelualue,
                    ca.id                                   AS palvelualue_id,
                    d.name                                  AS toimipaikka,
                    d.id                                    AS toimipaikka_id
                FROM voucher_value_decision vvd
                    JOIN daycare d ON vvd.placement_unit_id = d.id
                    JOIN care_area ca ON d.care_area_id = ca.id
                WHERE vvd.status = 'SENT'
                    AND vvd.decision_number IS NOT NULL -- ei tuoda effican päätöksiä
                    AND current_date::DATE - INTERVAL '3 years' <= vvd.valid_to
                """.trimIndent(),
            )
        }

    interface CsvQuery {
        operator fun <R> invoke(
            tx: Database.Read,
            useResults: (records: Sequence<String>) -> R,
        ): R
    }

    class StreamingCsvQuery<T : Any>(
        private val clazz: KClass<T>,
        private val query: (Database.Read) -> Database.Result<T>,
    ) : CsvQuery {
        override operator fun <R> invoke(
            tx: Database.Read,
            useResults: (records: Sequence<String>) -> R,
        ): R =
            query(tx).useSequence { rows ->
                useResults(toCsvRecords(::convertToCsv, clazz, rows))
            }
    }

    private const val QUERY_STREAM_CHUNK_SIZE = 10_000

    private inline fun <reified T : Any> csvQuery(crossinline f: QuerySql.Builder.() -> QuerySql): CsvQuery =
        StreamingCsvQuery(T::class) { tx ->
            tx.createQuery { f() }.setFetchSize(QUERY_STREAM_CHUNK_SIZE).mapTo<T>()
        }
}
