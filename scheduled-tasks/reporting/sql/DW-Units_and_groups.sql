SELECT
    now() AT TIME ZONE 'Europe/Helsinki'   AS aikaleima,
    d.name                                 AS toimintayksikkö,
    d.id                                   AS toimintayksikkö_id,
    d.opening_date                         AS toimintayksikön_alkupvm,
    d.closing_date                         AS toimintayksikön_loppupvm,
    d.type                                 AS toimintamuoto,
    d.provider_type                        AS järjestämistapa,
    ca.name                                AS palvelualue,
    ca.id                                  AS palvelualue_id,
    d.dw_cost_center                       AS dw_kustannuspaikka,
    (
        SELECT count(distinct p.child_id)
        FROM placement p
        WHERE p.unit_id = d.id
            AND daterange(p.start_date, p.end_date, '[]') && daterange(d.opening_date, d.closing_date, '[]')
    )                                      AS toimintayksikön_lapsimäärä,
    dg.name                                AS ryhmä,
    dg.id                                  AS ryhmä_id,
    dg.start_date                          AS ryhmän_alkupvm,
    dg.end_date                            AS ryhmän_loppupvm,
    (
        SELECT dc.amount AS latest_amount
        FROM daycare_caretaker dc
        WHERE dc.group_id = dg.id
        ORDER BY dc.start_date DESC LIMIT 1
    )                                      AS henkilökuntaa_ryhmässä_viim,
    (
        SELECT count(distinct p.child_id)
        FROM daycare_group_placement dgp
            JOIN placement p ON dgp.daycare_placement_id = p.id
        WHERE dgp.daycare_group_id = dg.id
            AND daterange(dgp.start_date, dgp.end_date, '[]') && daterange(dg.start_date, dg.end_date, '[]')
    )                                      AS ryhmän_lapsimäärä
FROM daycare_group dg
    JOIN daycare d on dg.daycare_id = d.id
    JOIN care_area ca on ca.id = d.care_area_id
WHERE (:date_val::DATE - interval '3 years' <= d.closing_date OR d.closing_date is null)
  AND (:date_val::DATE - interval '3 years' <= dg.end_date OR dg.end_date is null)
GROUP BY
    d.name,
    d.id,
    d.opening_date,
    d.closing_date,
    d.type,
    d.provider_type,
    ca.name,
    ca.id,
    d.dw_cost_center,
    dg.name,
    dg.id,
    dg.start_date,
    dg.end_date;