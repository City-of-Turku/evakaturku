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
        LEFT JOIN assistance_need an ON p.id = an.child_id
            AND daterange(an.start_date, an.end_date, '[]') && daterange(pl.start_date, pl.end_date, '[]')
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
    WHERE :date_val::DATE <= upper(validity_period)
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
        AND :date_val::DATE <= upper(fd.valid_during)
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
        AND :date_val::DATE <= vvd.valid_to
) child;