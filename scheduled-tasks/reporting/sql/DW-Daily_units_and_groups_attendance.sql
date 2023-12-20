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
                                    ) / 3600 / 7.75 * sar.occupancy_coefficient / 7,
                                4
                )
            ELSE sa.count
            END
    )                                      AS henkilökuntaa_läsnä,
    (
        SELECT count(*)
		FROM child_attendance child_att
		WHERE child_att.date = :date_val::DATE
		    AND child_att.unit_id = d.id
            AND EXISTS (
                SELECT *
                FROM daycare_group_placement dgp2
                    JOIN placement p2 on p2.id = dgp2.daycare_placement_id
                WHERE dgp2.daycare_group_id = dg.id
                    AND p2.child_id = child_att.child_id
                    AND dgp2.start_date <= :date_val::DATE
                    AND :date_val::DATE <= dgp2.end_date)
    )                                      AS lapsia_läsnä_ryhmässä,
    (
        SELECT COUNT(*)
        FROM child_attendance child_att
        WHERE child_att.date = :date_val::DATE AND child_att.unit_id = d.id
    )                                      AS lapsia_läsnä_yksikössä,
    (
        SELECT count(distinct p.child_id)
        FROM daycare_group_placement dgp
            JOIN placement p ON dgp.daycare_placement_id = p.id
        WHERE dgp.daycare_group_id = dg.id
            AND dgp.start_date <= :date_val::DATE
            AND :date_val::DATE <= dgp.end_date
    )                                      AS ryhmän_lapsimäärä,
    (
        SELECT count(distinct p.child_id)
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