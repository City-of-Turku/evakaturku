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
    FROM generate_series(:date_val::DATE - interval '1 week', :date_val::DATE, '1 day') t
        CROSS JOIN daycare_group g
        JOIN daycare u ON g.daycare_id = u.id
            AND daterange(g.start_date, g.end_date, '[]') @> t::DATE
        LEFT JOIN (
            SELECT group_id, arrived, departed, occupancy_coefficient
            FROM staff_attendance_realtime
            WHERE departed IS NOT NULL
                AND type = ANY('{PRESENT,OVERTIME,JUSTIFIED_CHANGE}'::staff_attendance_type[])
                AND (:date_val::DATE - interval '1 week' <= DATE(arrived) OR :date_val::DATE - interval '1 week' <= DATE(departed))
            UNION ALL
            SELECT group_id, arrived, departed, occupancy_coefficient
            FROM staff_attendance_external
            WHERE departed IS NOT NULL
                AND (:date_val::DATE - interval '1 week' <= DATE(arrived) OR :date_val::DATE - interval '1 week' <= DATE(departed))
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
    WHERE :date_val::DATE - interval '1 week' <= dgp.end_date
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
        SELECT count(distinct child_att.child_id)
        FROM child_attendance child_att
        WHERE child_att.unit_id = d.id
            AND child_att.date = ccod.date
            AND EXISTS (
                SELECT *
                FROM daycare_group_placements_aggregate dgpa
                WHERE dgpa.group_id = dg.id
                  and daterange(dgpa.start_date, dgpa.end_date, '[]') @> ccod.date
                  AND dgpa.child_id = child_att.child_id
            )
    )                                           AS lapsia_läsnä_ryhmässä,
    (
        SELECT SUM(
            (
                CASE
                   WHEN af.capacity_factor IS NOT NULL
                       THEN af.capacity_factor
                   ELSE 1
                END
            ) * (
                CASE
                    WHEN (d.type && array['FAMILY', 'GROUP_FAMILY']::care_types[]) = TRUE
                        THEN 1.75
                    WHEN ccod.date < (dgpa.child_birth_date + interval '3 year')::DATE
                        THEN (
                            CASE
                                WHEN sno.realized_occupancy_coefficient_under_3y IS NOT NULL
                                    THEN sno.realized_occupancy_coefficient_under_3y
                                ELSE dsc.realized_occupancy_coefficient_under_3y
                            END
                        )
                    ELSE (
                        CASE
                            WHEN sno.realized_occupancy_coefficient IS NOT NULL
                                THEN sno.realized_occupancy_coefficient
                            ELSE dsc.realized_occupancy_coefficient
                        END
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
                CASE
                    WHEN af.capacity_factor IS NOT NULL
                       THEN af.capacity_factor
                    ELSE 1
                END
            ) * (
                CASE
                    WHEN (d.type && array['FAMILY', 'GROUP_FAMILY']::care_types[]) = TRUE
                       THEN 1.75
                    WHEN ccod.date < (dgpa.child_birth_date + interval '3 year')::DATE
                        THEN (
                            CASE
                                WHEN sno.realized_occupancy_coefficient_under_3y IS NOT NULL
                                    THEN sno.realized_occupancy_coefficient_under_3y
                                ELSE dsc.realized_occupancy_coefficient_under_3y
                            END
                        )
                    ELSE (
                        CASE
                            WHEN sno.realized_occupancy_coefficient IS NOT NULL
                                THEN sno.realized_occupancy_coefficient
                            ELSE dsc.realized_occupancy_coefficient
                        END
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
WHERE (:date_val::DATE - interval '3 months' <= d.closing_date OR d.closing_date is null)
    AND (:date_val::DATE - interval '3 months' <= dg.end_date OR dg.end_date is null)
GROUP by
    ccod.date,
    d.name,
    d.id,
    dg.name,
    dg.id,
    dc.amount,
    ccod.caretaker_count;
