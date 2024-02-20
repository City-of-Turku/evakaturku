WITH child_attendances AS (
    SELECT *
    FROM child_attendance child_att
    WHERE child_att.date = :date_val::DATE
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
daycare_group_placements_on_date as (
    SELECT
        dgp.id                                              AS group_placement_id,
        dgp.daycare_group_id								as group_id,
        pl.child_id                                         AS child_id,
        pl.unit_id                                          AS unit_id,
        CASE
            WHEN af.capacity_factor IS NOT NULL
                THEN af.capacity_factor
            ELSE 1
        END AS assistance_coefficient,
        CASE
            WHEN (u.type && array['FAMILY', 'GROUP_FAMILY']::care_types[]) = TRUE
                THEN 1.75
            WHEN :date_val::DATE < (p.date_of_birth + interval '3 year')::DATE
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
        END AS service_need_coefficient
    FROM daycare_group_placement dgp
        JOIN placement pl ON dgp.daycare_placement_id = pl.id
        JOIN daycare u ON u.id = pl.unit_id
        JOIN person p ON p.id = pl.child_id
        LEFT JOIN assistance_factor af ON af.child_id = pl.child_id
            AND af.valid_during @> :date_val::DATE
        LEFT JOIN service_need sn ON sn.placement_id = pl.id
            AND daterange(sn.start_date, sn.end_date, '[]') @> :date_val::DATE
        LEFT JOIN service_need_option sno ON sn.option_id = sno.id
        JOIN default_sn_coefficients dsc ON dsc.valid_placement_type = pl.type
    WHERE dgp.start_date <= :date_val::DATE
        AND :date_val::DATE <= dgp.end_date
)
SELECT
    now() AT TIME ZONE 'Europe/Helsinki'       AS aikaleima,
    :date_val::DATE 						   AS poiminta_ajalta_pvm,
    d.name                                     AS toimintayksikkö,
    d.id                                       AS toimintayksikkö_id,
    (
        SELECT count(distinct p.child_id)
        FROM placement p
        WHERE p.unit_id = d.id
            AND p.start_date <= :date_val::DATE
            AND :date_val::DATE <= p.end_date
    )                                          AS toimintayksikön_lapsimäärä,
    (
        SELECT count(distinct p.child_id)
        FROM placement p
        WHERE p.unit_id = d.id
            AND p.start_date < date_trunc('month', :date_val::DATE)
            AND date_trunc('month', :date_val::DATE) < p.end_date --Edellisen kuun viimeisen päivän mukaan
    )                                          AS toimintayksikön_lapsimäärä_ed_kuun_lopussa,
    dg.name                                    AS ryhmä,
    dg.id                                      AS ryhmä_id,
    dc.amount                                  AS henkilökuntaa_ryhmässä,
    sum(
        CASE
            WHEN sar.arrived IS NOT NULL
                THEN ROUND(
                    EXTRACT(
                        EPOCH FROM (
                            LEAST(sar.departed, timezone('Europe/Helsinki', (:date_val::DATE + interval '1' day)::date::timestamp)) -
                            GREATEST(sar.arrived, timezone('Europe/Helsinki', :date_val::DATE::timestamp))
                        )
                    ) / 3600 / 7.65 * sar.occupancy_coefficient / 7, 4
                )
            ELSE sa.count
            END
    )                                      AS henkilökuntaa_läsnä,
    (
        SELECT count(distinct child_att.child_id)
		FROM child_attendances child_att
		WHERE child_att.unit_id = d.id
            AND EXISTS (
                SELECT *
                FROM daycare_group_placements_on_date dgpod
                WHERE dgpod.group_id = dg.id
                    AND dgpod.child_id = child_att.child_id)
    )                                      AS lapsia_läsnä_ryhmässä,
    (
    	SELECT SUM(dgpod.assistance_coefficient * dgpod.service_need_coefficient)
		FROM child_attendances child_att
			JOIN daycare_group_placements_on_date dgpod ON dgpod.child_id = child_att.child_id
		WHERE child_att.unit_id = d.id AND dgpod.group_id = dg.id
    )                                      AS laskennallinen_lapsia_läsnä_ryhmässä,
    (
        SELECT COUNT(distinct child_att.child_id)
        FROM child_attendances child_att
        WHERE child_att.unit_id = d.id
    )                                      AS lapsia_läsnä_yksikössä,
    (
    	SELECT COUNT(distinct dgpod.child_id)
        FROM daycare_group_placements_on_date dgpod
        WHERE dgpod.group_id = dg.id
    )                                      AS ryhmän_lapsimäärä,
    (
        SELECT SUM(dgpod.assistance_coefficient * dgpod.service_need_coefficient)
        FROM daycare_group_placements_on_date dgpod
        WHERE dgpod.group_id = dg.id
    )                                      AS laskennallinen_ryhmän_lapsimäärä,
    (
        SELECT COUNT(distinct p.child_id)
        FROM daycare_group_placement dgp
            JOIN placement p ON dgp.daycare_placement_id = p.id
        WHERE dgp.daycare_group_id = dg.id
            AND dgp.start_date < date_trunc('month', :date_val::DATE)
            AND date_trunc('month', :date_val::DATE) < dgp.end_date --Edellisen kuun viimeisen päivän mukaan
    )                                      AS ryhmän_lapsimäärä_ed_kuun_lopussa
FROM daycare_group dg
    JOIN daycare d ON dg.daycare_id = d.id
    JOIN care_area ca ON ca.id = d.care_area_id
    JOIN daycare_caretaker dc ON dg.id = dc.group_id
        AND dc.start_date <= :date_val::DATE
        AND (dc.end_date >= :date_val::DATE or dc.end_date is null)
    LEFT JOIN staff_attendance sa ON dg.id = sa.group_id
        AND sa.date = :date_val::DATE
    LEFT JOIN (
        SELECT group_id, arrived, departed, occupancy_coefficient
        FROM staff_attendance_realtime
        WHERE departed IS NOT NULL
        AND type NOT IN ('OTHER_WORK', 'TRAINING')
        UNION ALL
        SELECT group_id, arrived, departed, occupancy_coefficient
        FROM staff_attendance_external
        WHERE departed IS NOT NULL
    ) sar ON sar.group_id = dg.id AND (date(arrived) = :date_val::DATE OR date(departed) = :date_val::DATE)
WHERE (:date_val::DATE - interval '3 months' <= d.closing_date OR d.closing_date is null)
  AND (:date_val::DATE - interval '3 months' <= dg.end_date OR dg.end_date is null)
GROUP BY
    d.name,
    d.id,
    dg.name,
    dg.id,
    dc.amount;