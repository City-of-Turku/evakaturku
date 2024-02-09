-- SPDX-FileCopyrightText: 2022 City of Turku
--
-- SPDX-License-Identifier: LGPL-2.1-or-later

INSERT INTO service_need_option
    (id, name_fi, name_sv, name_en, valid_placement_type, default_option, fee_coefficient, occupancy_coefficient, daycare_hours_per_week, part_day, part_week, fee_description_fi, fee_description_sv, voucher_value_description_fi, voucher_value_description_sv, display_order, occupancy_coefficient_under_3y, show_for_citizen,realized_occupancy_coefficient, realized_occupancy_coefficient_under_3y, daycare_hours_per_month)
VALUES
    --DAYCARE
    ('50358394-b961-11eb-b51f-67ac436e5636', 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Early childhood education over 35h/week (over 147h/month)', 'DAYCARE', TRUE, 1.0, 1.0, 40, FALSE, FALSE, 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', null, 1.75, true,1.0,1.75, 210),
    ('86ef70a0-bf85-11eb-91e6-1fb57a101161', 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Early childhood education over 35h/week (over 147h/month)', 'DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 0, 1.75, true,1.0,1.75, 210),
    ('503590f0-b961-11eb-b520-53740af3f7ee', 'Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Early childhood education at most 35h/week (at most 147h/month)', 'DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 1, 1.75, true,1.0,1.75,147),
    ('503591ae-b961-11eb-b521-1fca99358eef', 'Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Early childhood education at most 27,5h/week (at most 116h/month)', 'DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 2, 1.75, true,1.0,1.75,116),
    ('684e4f0a-537b-11ed-aabb-d33da20b2117', 'Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', 'Service voucher evening care over 35h/week (over 147h/month)', 'DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', 'Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', 3, 1.75, false,1.0,1.75,0),
    ('cc81be76-537b-11ed-aabd-d7571a7aed5f', 'Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', 'Service voucher evening care at most 35h/week (at most 147h/month)', 'DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', 'Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', 4, 1.75, false,1.0,1.75,0),
    ('b244ea0e-5382-11ed-b846-d7ebbaaf5fd5', 'Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', 'Service voucher evening care at most 27,5h/week (at most 116h/month)', 'DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', 'Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', 5, 1.75, false,1.0,1.75,0),
    ('4062cdca-5387-11ed-b84a-6fc9185df882', 'Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', 'Service voucher weekend care over 35h/week (over 147h/month)', 'DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', 'Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', 6, 1.75, false,1.0,1.75,0),
    ('d6e2a50e-5387-11ed-b84c-b7756f2c8248', 'Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', 'Service voucher weekend care at most 35h/week (at most 147h/month)', 'DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', 'Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', 7, 1.75, false,1.0,1.75,0),
    ('3e1852be-5388-11ed-b84e-e7d4a93b269e', 'Palvelusetelin viikonloppu enintään  27,5h/vko (enintään 116h/kk)', 'Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', 'Service voucher weekend care at most 27,5h/week (at most 116h/month)', 'DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Palvelusetelin viikonloppu enintään  27,5h/vko (enintään 116h/kk)', 'Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', 'Palvelusetelin viikonloppu enintään 27,5h/vko (enintään 116h/kk)', 'Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', 8, 1.75, false,1.0,1.75,0),
    ('ac879588-6afe-11ed-b107-b3c1585b8c2a', 'Ryhmäperhepäivähoidon palveluseteli yli 35/vko (yli 147h/kk)', 'Gruppfamiljedagvårds servicecedeln över 35h/vecka (över 147h/mån)', 'Group family day care service voucher 35h/week (over 147h/month)', 'DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli yli 35/vko (yli 147h/kk)', 'Gruppfamiljedagvårds servicecedeln över 35h/vecka (över 147h/mån)', 'Ryhmäperhepäivähoidon palveluseteli yli 35/vko (yli 147h/kk)', 'Gruppfamiljedagvårds servicecedeln över 35h/vecka (över 147h/mån)', 9, 1.75, false,1.0,1.75,0),
    ('ac879d76-6afe-11ed-b108-9fb58b2968d5', 'Ryhmäperhepäivähoidon palveluseteli enintään 35h/vko (enintään 147h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 35h/vecka (högst 147h/mån)', 'Group family day care service voucher at most 35h/week (at most 147h/month)', 'DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli enintään 35h/vko (enintään 147h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 35h/vecka (högst 147h/mån)', 'Ryhmäperhepäivähoidon palveluseteli enintään 35h/vko (enintään 147h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 35h/vecka (högst 147h/mån)', 10, 1.75, false,1.0,1.75,0),
    ('ac879dee-6afe-11ed-b109-c7ee3c340bf7', 'Ryhmäperhepäivähoidon palveluseteli enintään 27,5h/vko (enintään 116h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 27,5h/vecka (högst 116h/mån)', 'Group family day care service voucher at most 27,5h/week (at most 116h/month)', 'DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli enintään 27,5h/vko (enintään 116h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 27,5h/vecka (högst 116h/mån)', 'Ryhmäperhepäivähoidon palveluseteli enintään 27h/vko (enintään 116h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 27,5h/vecka (högst 116h/mån)', 11, 1.75, false,1.0,1.75,0),
    ('ac879e48-6afe-11ed-b10a-9791c734c144', 'Perhepäivähoidon palveluseteli yli 35/vko (yli 147h/kk)', 'Familjedagvårds servicecedeln över 35h/vecka (över 147h/mån)', 'Family day care service voucher over 35h/week (over 147h/month)', 'DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Perhepäivähoidon palveluseteli yli 35/vko (yli 147h/kk)', 'Familjedagvårds servicecedeln över 35h/vecka (över 147h/mån)', 'Perhepäivähoidon palveluseteli yli 35/vko (yli 147h/kk)', 'Familjedagvårds servicecedeln över 35h/vecka (över 147h/mån)', 12, 1.75, false,1.0,1.75,0),
    ('ac879e8e-6afe-11ed-b10b-436cbc3d57e9', 'Perhepäivähoidon palveluseteli enintään 35h/vko (enintään 147h/kk)', 'Familjedagvårds servicecedeln högst 35h/vecka (högst 147h/mån)', 'Family day care service voucher at most 35h/week (at most 147h/month)', 'DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Perhepäivähoidon palveluseteli enintään 35h/vko (enintään 147h/kk)', 'Familjedagvårds servicecedeln högst 35h/vecka (högst 147h/mån)', 'Perhepäivähoidon palveluseteli enintään 35h/vko (enintään 147h/kk)', 'Familjedagvårds servicecedeln högst 35h/vecka (högst 147h/mån)', 13, 1.75, false,1.0,1.75,0),
    ('ac879ede-6afe-11ed-b10c-636ae14462ef', 'Perhepäivähoidon palveluseteli enintään 27,5h/vko (enintään 116h/kk)', 'Familjedagvårds servicecedeln högst 27,5h/vecka (högst 116h/mån)', 'Family day care service voucher at most 27,5h/week (at most 116h/month)', 'DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Perhepäivähoidon palveluseteli enintään 27,5h/vko (enintään 116h/kk)', 'Familjedagvårds servicecedeln högst 27,5h/vecka (högst 116h/mån)', 'Perhepäivähoidon palveluseteli enintään 27h/vko (enintään 116h/kk)', 'Familjedagvårds servicecedeln högst 27,5h/vecka (högst 116h/mån)', 14, 1.75, false,1.0,1.75,0),


    --DAYCARE_PART_TIME
    ('503592da-b961-11eb-b524-7f27c780d83a', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', TRUE, 0.5, 0.5, 20, TRUE, FALSE, 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', null, 1.75, true,0.5,1.75,84),
    ('85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 20, TRUE, FALSE, 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 15, 1.75, true,0.5,1.75,84),
    ('aed93b48-5384-11ed-b848-435687237b8e', 'Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', 'Service voucher evening care at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 20, TRUE, FALSE, 'Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', 'Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', 16, 1.75, false,0.5,1.75,0),
    ('b01d3d66-5388-11ed-b850-3bbd85d56f15', 'Palvelusetelin viikonloppu enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', 'Service voucher weekend care at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 20, TRUE, FALSE, 'Palvelusetelin viikonloppu enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', 'Palvelusetelin viikonloppu enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', 17, 1.75, false,0.5,1.75,0),
    ('ac879f24-6afe-11ed-b10d-3fe2c69846ef', 'Ryhmäperhepäivähoidon palveluseteli enintään 20h/vko (enintään 84h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 20h/vecka (högst 84h/mån)', 'Group family day care service voucher at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 20, TRUE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli enintään 20h/vko (enintään 84h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 20h/vecka (högst 84h/mån)', 'Ryhmäperhepäivähoidon palveluseteli enintään 20h/vko (enintään 84h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 20h/vecka (högst 84h/mån)', 18, 1.75, false,0.5,1.75,0),
    ('ac879f74-6afe-11ed-b10e-2bf83788be72', 'Perhepäivähoidon palveluseteli enintään 20h/vko (enintään 84h/kk)', 'Familjedagvårds servicecedeln högst 20h/vecka (högst 84h/mån)', 'Family day care service voucher at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 20, TRUE, FALSE, 'Perhepäivähoidon palveluseteli enintään 20h/vko (enintään 84h/kk)', 'Familjedagvårds servicecedeln högst 20h/vecka (högst 84h/mån)', 'Perhepäivähoidon palveluseteli enintään 20h/vko (enintään 84h/kk)', 'Familjedagvårds servicecedeln högst 20h/vecka (högst 84h/mån)', 19, 1.75, false,0.5,1.75,0),

    --DAYCARE_FIVE_YEAR_OLDS
    ('a867f3ec-5368-11ed-8d0b-b31b59a849a1', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', 'Free of charge early education for 5 years old', 'DAYCARE_FIVE_YEAR_OLDS', TRUE, 0.0, 0.5, 20, TRUE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', null, 1.75, false,0.5,1.75,84),
    ('c73c5cea-5368-11ed-8d0c-8fb44e947bc6', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', 'Free of charge early education for 5 years old', 'DAYCARE_FIVE_YEAR_OLDS', FALSE, 0.0, 0.5, 20, TRUE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', 250, 1.75, false,0.5,1.75,84),
    ('267946fa-6fb1-11ed-8c85-4725b99d6549', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar', 'Group family day care service voucher free of charge early education for 5 years old', 'DAYCARE_FIVE_YEAR_OLDS', FALSE, 0.0, 0.5, 20, TRUE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar', 251, 1.75, false,0.5,1.75,0),
    ('26794f24-6fb1-11ed-8c86-1f58d027951d', 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar', 'Family day care service voucher free of charge early education for 5 years old', 'DAYCARE_FIVE_YEAR_OLDS', FALSE, 0.0, 0.5, 20, TRUE, FALSE, 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar', 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar', 252, 1.75, false,0.5,1.75,0),


    --DAYCARE_PART_TIME_FIVE_YEAR_OLDS
    ('153a6364-536a-11ed-8d0f-d7a4b2b860f1', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Free of charge early education for 5 years old + Early childhood education over 35h/week (over 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', TRUE, 1.0, 1.0, 40, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', null, 1.75, false,1.0,1.75,210),
    ('325c97b4-536a-11ed-8d10-4b3a543573f7', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Free of charge early education for 5 years old + Early childhood education over 35h/week (over 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 1.0, 1.0, 40, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 200, 1.75, false,1.0,1.75,210),
    ('73976b22-536b-11ed-8d13-57ff6a3494ef', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Free of charge early education for 5 years old + Early childhood education at most 35h/week (at most 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.85, 1.0, 35, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 210, 1.75, false,1.0,1.75,147),
    ('3172d514-536c-11ed-8d15-dfe8e83094cd', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Free of charge early education for 5 years old + Early childhood education at most 27,5h/week (at most 116h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 220, 1.75, false,1.0,1.75,116),
    ('e94a8bae-536d-11ed-8d17-9b8007da5dec', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Free of charge early education for 5 years old + Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.5, 1.0, 20, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 230, 1.75, false,1.0,1.75,84),
    ('a2877f1a-7087-11ed-a559-4fa06829e6fd', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Group family day care service voucher free of charge early education for 5 years old + Early childhood education over 35h/week (over 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 232, 1.75, false,1.0,1.75,0),
    ('a2878c8a-7087-11ed-a55a-ffa38e3847aa', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Group family day care service voucher free of charge early education for 5 years old + Early childhood education at most 35h/week (at most 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 234, 1.75, false,1.0,1.75,0),
    ('a2878d2a-7087-11ed-a55b-2f42cae1743e', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Group family day care service voucher free of charge early education for 5 years old + Early childhood education at most 27,5h/week (at most 116h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 236, 1.75, false,1.0,1.75,0),
    ('a2878d84-7087-11ed-a55c-53988f52a3bf', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Group family day care service voucher free of charge early education for 5 years old + Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 238, 1.75, false,1.0,1.75,0),
    ('a2879072-7087-11ed-a55d-6f35f6f6df2f', 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Family day care service voucher free of charge early education for 5 years old + Early childhood education over 35h/week (over 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 240, 1.75, false,1.0,1.75,0),
    ('a28790e0-7087-11ed-a55e-0700a24f1119', 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Family day care service voucher free of charge early education for 5 years old + Early childhood education at most 35h/week (at most 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 242, 1.75, false,1.0,1.75,0),
    ('a2879554-7087-11ed-a55f-df43279a1ac6', 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Family day care service voucher free of charge early education for 5 years old + Early childhood education at most 27,5h/week (at most 116h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 244, 1.75, false,1.0,1.75,0),
    ('a2879860-7087-11ed-a560-2b2470e04de6', 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Family day care service voucher free of charge early education for 5 years old+ Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Perhepäivähoiton palveluseteli 5v maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 246, 1.75, false,1.0,1.75,0),
    ('99cd40ce-8cd6-11ed-ad37-c7c08035a833', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', 'Free of charge early education for 5 years old + Service voucher evening care over 35h/week (over 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 1.0, 1.0, 40, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', 247, 1.75, false,1.0,1.75,0),
    ('99cd517c-8cd6-11ed-ad38-7b2aa4f8b7be', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', 'Free of charge early education for 5 years old + Service voucher evening care at most 35h/week (at most 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.85, 1.0, 35, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', 248, 1.75, false,1.0,1.75,0),
    ('99cd5938-8cd6-11ed-ad39-9fefd8a84f78', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', 'Free of charge early education for 5 years old + Service voucher evening care at most 27,5h/week (at most 116h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', 249, 1.75, false,1.0,1.75,0),
    ('99cd59ec-8cd6-11ed-ad3a-bbf83318f2f1', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', 'Free of charge early education for 5 years old + Service voucher evening care at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.5, 1.0, 20, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', 250, 1.75, false,1.0,1.75,0),
    ('99cd5a6e-8cd6-11ed-ad3b-e78efee7f61a', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', 'Free of charge early education for 5 years old + Service voucher weekend care over 35h/week (over 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 1.0, 1.0, 40, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', 251, 1.75, false,1.0,1.75,0),
    ('99cd5ae6-8cd6-11ed-ad3c-9f9e7d8ac30e', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', 'Free of charge early education for 5 years old + Service voucher weekend care at most 35h/week (at most 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.85, 1.0, 35, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', 252, 1.75, false,1.0,1.75,0),
    ('99cd5b9a-8cd6-11ed-ad3d-8f81b097a236', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin viikonloppu enintään  27,5h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', 'Free of charge early education for 5 years old + Service voucher weekend care at most 27,5h/week (at most 116h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin viikonloppu enintään  27,5h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin viikonloppu enintään  27,5h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', 253, 1.75, false,1.0,1.75,0),
    ('99cd5bf4-8cd6-11ed-ad3e-77990db3e351', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin viikonloppu enintään  20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', 'Free of charge early education for 5 years old + Service voucher weekend care at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.5, 1.0, 20, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin viikonloppu enintään  20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Palvelusetelin viikonloppu enintään  20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', 254, 1.75, false,1.0,1.75,0),


    --PRESCHOOL
    ('bc6a4550-fa74-11eb-9a2d-035acd5db9aa', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Preschool 4h/day', 'PRESCHOOL', TRUE, 0, 0.5, 20, TRUE, FALSE, 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', null, 1.75, false,0.5,1.75,84),
    ('5c21d452-4f90-11ed-8be7-bf748cc343bf', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Preschool 4h/day', 'PRESCHOOL', FALSE, 0, 0.5, 20, TRUE, FALSE, 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 50, 1.75, false,0.5,1.75,84),
    ('a678968e-536f-11ed-8d19-5715e16c8489', 'Kaksivuotinen esiopetuskokeilu', 'Tvåårig förskole', 'Two year preschool education', 'PRESCHOOL', FALSE, 0, 0.5, 20, TRUE, FALSE, 'Kaksivuotinen esiopetuskokeilu', 'Tvåårig förskole', 'Kaksivuotinen esiopetuskokeilu', 'Tvåårig förskole', 50, 1.75, false,0.5,1.75,84),

    --PRESCHOOL_DAYCARE
    ('0bfc6c92-ff2a-11eb-a785-2724e8e5e7ee', 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Preschool 4h/day + Early childhood education over 35h/week (over 147h/month)', 'PRESCHOOL_DAYCARE', TRUE, 1.0, 1.0, 40, FALSE, FALSE, 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', null, 1.75, false,1.0,1.75,210),
    ('503593e8-b961-11eb-b527-a3dcdfb628ec', 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Preschool 4h/day + Early childhood education over 35h/week (over 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 2000, 1.75, false,1.0,1.75,210),
    ('50359442-b961-11eb-b528-df3290c0d63e', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Preschool 4h/day + Early childhood education at most 35h/week (at most 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Esiopetus 4h/pv + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 2100, 1.75, false,1.0,1.75,147),
    ('bc6a42d0-fa74-11eb-9a2b-d315a7916074', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Preschool 4h/day + Early childhood education at most 27,5h/week (at most 116h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.65, 1.0, 27.5, TRUE, TRUE, 'Esiopetus 4h/pv + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 2200, 1.75, false,1.0,1.75,116),
    ('50359212-b961-11eb-b522-074fb05f7086', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Preschool 4h/day + Early childhood education at most 20h/week (at most 84h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Esiopetus 4h/pv + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 2250, 1.75, false,1.0,1.75,84),
    ('e1d0d78a-5371-11ed-8d1b-cb612aa6780b', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus yli 35h/vko (147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Two year preschool education + Early childhood education over 35h/week (over 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus yli 35h/vko (147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus yli 35h/vko (147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 2260, 1.75, false,1.0,1.75,210),
    ('7b2ff2e4-5372-11ed-8d1d-5f26eff8b49b', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Two year preschool education + Early childhood education at most 35h/week (at most 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 2270, 1.75, false,1.0,1.75,147),
    ('0004e312-5373-11ed-8d1f-575317e00afc', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Two year preschool education + Early childhood education at most 27,5h/week (at most 116h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.65, 1.0, 27.5, TRUE, TRUE, 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 2280, 1.75, false,1.0,1.75,116),
    ('6fdc7ad8-5373-11ed-8d21-87047833ff0b', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Two year preschool education + Early childhood education at most 20h/week (at most 84h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 2290, 1.75, false,1.0,1.75,84),
    ('576f6cf8-8cbc-11ed-b639-afa50c9355c1', 'Esiopetus 4h/pv + Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', 'Preschool 4h/day + Service voucher evening care over 35h/week (over 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Esiopetus 4h/pv + Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', 'Esiopetus 4h/pv + Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', 2291, 1.75, false,1.0,1.75,0),
    ('576fa380-8cbc-11ed-b63a-8bb1a5b587a0', 'Esiopetus 4h/pv + Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', 'Preschool 4h/day + Service voucher evening care at most 35h/week (at most 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Esiopetus 4h/pv + Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', 'Esiopetus 4h/pv + Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', 2292, 1.75, false,1.0,1.75,0),
    ('576fa452-8cbc-11ed-b63b-67fc666e0fa8', 'Esiopetus 4h/pv + Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', 'Preschool 4h/day + Service voucher evening care at most 27,5h/week (at most 116h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.65, 1.0, 27.5, TRUE, TRUE, 'Esiopetus 4h/pv + Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', 'Esiopetus 4h/pv + Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', 2293, 1.75, false,1.0,1.75,0),
    ('576fa4ac-8cbc-11ed-b63c-2ff2276ab9f2', 'Esiopetus 4h/pv + Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', 'Preschool 4h/day + Service voucher evening care at most 20h/week (at most 84h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Esiopetus 4h/pv + Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', 'Esiopetus 4h/pv + Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', 2294, 1.75, false,1.0,1.75,0),
    ('576fa8f8-8cbc-11ed-b63d-8fb27ef151a1', 'Esiopetus 4h/pv + Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', 'Preschool 4h/day + Service voucher weekend care over 35h/week (over 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Esiopetus 4h/pv + Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', 'Esiopetus 4h/pv + Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', 2295, 1.75, false,1.0,1.75,0),
    ('576fa966-8cbc-11ed-b63e-630258790f77', 'Esiopetus 4h/pv + Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', 'Preschool 4h/day + Service voucher weekend care at most 35h/week (at most 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Esiopetus 4h/pv + Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', 'Esiopetus 4h/pv + Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', 2296, 1.75, false,1.0,1.75,0),
    ('576fa9b6-8cbc-11ed-b63f-8bf378c64b67', 'Esiopetus 4h/pv + Palvelusetelin viikonloppu enintään  27,5h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', 'Preschool 4h/day + Service voucher weekend care at most 27,5h/week (at most 116h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.65, 1.0, 27.5, TRUE, TRUE, 'Esiopetus 4h/pv + Palvelusetelin viikonloppu enintään  27,5h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', 'Esiopetus 4h/pv + Palvelusetelin viikonloppu enintään  27,5h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', 2297, 1.75, false,1.0,1.75,0),
    ('576fe070-8cbc-11ed-b640-675064ab6753', 'Esiopetus 4h/pv + Palvelusetelin viikonloppu enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', 'Preschool 4h/day + Service voucher evening care at most 20h/week (at most 84h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Esiopetus 4h/pv + Palvelusetelin viikonloppu enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', 'Esiopetus 4h/pv + Palvelusetelin viikonloppu enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', 2298, 1.75, false,1.0,1.75,0),

    --PREPARATORY
    ('1b4413f6-d99d-11eb-89ac-a3a978104bce', 'Valmistava opetus', 'Förbererande utbilndning', 'Preparatory education', 'PREPARATORY', TRUE, 0, 0.54, 25, TRUE, FALSE, 'Valmistava opetus', 'Förbererande utbilndning', 'Valmistava opetus', 'Förbererande utbilndning', null, 1.75, false,0.54,1.75,84),
    ('d6d5a660-4f90-11ed-8be9-6f76cd90c246', 'Valmistava opetus', 'Förbererande utbilndning', 'Preparatory education', 'PREPARATORY', FALSE, 0, 0.54, 25, TRUE, FALSE, 'Valmistava opetus', 'Förbererande utbilndning', 'Valmistava opetus', 'Förbererande utbilndning', 2220, 1.75, false,0.54,1.75,84),

    --PREPARATORY_DAYCARE
    ('bc6a44ec-fa74-11eb-9a2c-73b53c2af869', 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Preparatory education + Early childhood education over 35h/week (over 147h/month)', 'PREPARATORY_DAYCARE', TRUE, 1.0, 1.0, 40, FALSE, FALSE, 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 2300, 1.75, false,1.0,1.75,210),
    ('bc6a45a0-fa74-11eb-9a2e-fb411a8588da', 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Preparatory education + Early childhood education over 35h/week (over 147h/month)', 'PREPARATORY_DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 2350, 1.75, false,1.0,1.75,210),
    ('86ef7370-bf85-11eb-91e7-6fcd728c518d', 'Valmistava opetus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Preparatory education + Early childhood education at most 35h/week (at most 147h/month)', 'PREPARATORY_DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Valmistava opetus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Valmistava opetus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 2400, 1.75, false,1.0,1.75,147),
    ('50359280-b961-11eb-b523-237115533645', 'Valmistava opetus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Preparatory education + Early childhood education at most 27,5h/week (at most 116h/month)', 'PREPARATORY_DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Valmistava opetus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Valmistava opetus + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 2450, 1.75, false,1.0,1.75,116),
    ('5e82f704-4f8f-11ed-8be5-bbe76169415f', 'Valmistava opetus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Preparatory education + Early childhood education at most 20h/week (at most 84h/month)', 'PREPARATORY_DAYCARE', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Valmistava opetus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Valmistava opetus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 2500, 1.75, false,1.0,1.75,84),

    --TEMPORARY_DAYCARE
    ('5035938e-b961-11eb-b526-6b30323c87a8', 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 'Temporary early childhood education', 'TEMPORARY_DAYCARE', TRUE, 1.0, 0.54, 40, FALSE, FALSE, 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', null, 1.75, false,0.54,1.75,210),
    ('e549007e-4f91-11ed-8beb-2f7e83af8ba6', 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 'Temporary early childhood education', 'TEMPORARY_DAYCARE', FALSE, 1.0, 0.54, 40, FALSE, FALSE, 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 2600, 1.75, false,0.54,1.75,210),

    --CLUB
    ('ff6ddcd4-fa8a-11eb-8592-2f2b4e398fcb', 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 'Open early childhood education at most 10h/week', 'CLUB', TRUE, 1.0, 0.54, 10, FALSE, FALSE, 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', null, 1.75, true,0.54,1.75,40),
    ('4d246a6c-4f92-11ed-8bed-2f5b3226e682', 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 'Open early childhood education at most 10h/week', 'CLUB', FALSE, 1.0, 0.54, 10, FALSE, FALSE, 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 2700, 1.75, true,0.54,1.75,40),
    ('50359334-b961-11eb-b525-f3febdfea5d3', 'Avoin varhaiskasvatus enintään 15h/vko', 'Öppen småbarnspedagogik högst 15h/vecka', 'Open early childhood education at most 15h/week', 'CLUB', FALSE, 1.0, 0.54, 15, FALSE, FALSE, 'Avoin varhaiskasvatus enintään 15h/vko', 'Öppen småbarnspedagogik högst 15h/vecka', 'Avoin varhaiskasvatus enintään 15h/vko', 'Öppen småbarnspedagogik högst 15h/vecka', 2750, 1.75, true,0.54,1.75,60),
    ('25d79184-e415-4fe3-bac6-3b719b050685', 'Avoin varhaiskasvatus maksuton kerho/puisto', 'Öppen småbarnspedagogik avgiftsfri klubb/park', 'Open early childhood education free of charge club/park', 'CLUB', FALSE, 0, 0.54, 20, FALSE, FALSE, 'Avoin varhaiskasvatus maksuton kerho/puisto', 'Öppen småbarnspedagogik avgiftsfri klubb/park', 'Avoin varhaiskasvatus maksuton kerho/puisto', 'Öppen småbarnspedagogik avgiftsfri klubb/park', 2800, 1.75, true, 0.54, 1.75,84)



ON CONFLICT (id) DO
UPDATE SET
    name_fi = EXCLUDED.name_fi,
    name_sv = EXCLUDED.name_sv,
    name_en = EXCLUDED.name_en,
    valid_placement_type = EXCLUDED.valid_placement_type,
    default_option = EXCLUDED.default_option,
    fee_coefficient = EXCLUDED.fee_coefficient,
    occupancy_coefficient = EXCLUDED.occupancy_coefficient,
    daycare_hours_per_week = EXCLUDED.daycare_hours_per_week,
    part_day = EXCLUDED.part_day,
    part_week = EXCLUDED.part_week,
    fee_description_fi = EXCLUDED.fee_description_fi,
    fee_description_sv = EXCLUDED.fee_description_sv,
    voucher_value_description_fi = EXCLUDED.voucher_value_description_fi,
    voucher_value_description_sv = EXCLUDED.voucher_value_description_sv,
    display_order = EXCLUDED.display_order,
    occupancy_coefficient_under_3y = EXCLUDED.occupancy_coefficient_under_3y,
    show_for_citizen = EXCLUDED.show_for_citizen,
    daycare_hours_per_month = EXCLUDED.daycare_hours_per_month
WHERE
    service_need_option.name_fi <> EXCLUDED.name_fi OR
    service_need_option.name_sv <> EXCLUDED.name_sv OR
    service_need_option.name_en <> EXCLUDED.name_en OR
    service_need_option.valid_placement_type <> EXCLUDED.valid_placement_type OR
    service_need_option.default_option <> EXCLUDED.default_option OR
    service_need_option.fee_coefficient <> EXCLUDED.fee_coefficient OR
    service_need_option.occupancy_coefficient <> EXCLUDED.occupancy_coefficient OR
    service_need_option.daycare_hours_per_week <> EXCLUDED.daycare_hours_per_week OR
    service_need_option.part_day <> EXCLUDED.part_day OR
    service_need_option.part_week <> EXCLUDED.part_week OR
    service_need_option.fee_description_fi <> EXCLUDED.fee_description_fi OR
    service_need_option.fee_description_sv <> EXCLUDED.fee_description_sv OR
    service_need_option.voucher_value_description_fi <> EXCLUDED.voucher_value_description_fi OR
    service_need_option.voucher_value_description_sv <> EXCLUDED.voucher_value_description_sv OR
    service_need_option.display_order <> EXCLUDED.display_order OR
    service_need_option.occupancy_coefficient_under_3y <> EXCLUDED.occupancy_coefficient_under_3y OR
    service_need_option.show_for_citizen <> EXCLUDED.show_for_citizen OR
    service_need_option.daycare_hours_per_month <> EXCLUDED.daycare_hours_per_month;


INSERT INTO service_need_option_voucher_value (
    id,service_need_option_id,validity,base_value,coefficient,value,base_value_under_3y,coefficient_under_3y,value_under_3y
)
VALUES

    -- 2018-08-01 - 2020-07-31

    --DAYCARE
    --DAYCARE_PART_TIME
    ('d6e4e96a-7243-11ed-b736-33cd63c3b5f0','50358394-b961-11eb-b51f-67ac436e5636',daterange('2018-08-01', '2020-07-31', '[]'),82800,1.0,82800,125000,1.0,125000),
    ('d6e4e9e2-7243-11ed-b737-8f4e928d4ca4','86ef70a0-bf85-11eb-91e6-1fb57a101161',daterange('2018-08-01', '2020-07-31', '[]'),82800,1.0,82800,125000,1.0,125000),
    ('d6e4ea5a-7243-11ed-b738-4bb5fc74a1af','503590f0-b961-11eb-b520-53740af3f7ee',daterange('2018-08-01', '2020-07-31', '[]'),74500,1.0,74500,112500,1.0,112500),
    ('d6e4ead2-7243-11ed-b739-0bbed005f808','503591ae-b961-11eb-b521-1fca99358eef',daterange('2018-08-01', '2020-07-31', '[]'),74500,0.75,62100,112500,0.75,93800),
    ('d6e4eb54-7243-11ed-b73a-cf56212c76fa','503592da-b961-11eb-b524-7f27c780d83a',daterange('2018-08-01', '2020-07-31', '[]'),74500,0.6,49700,112500,0.6,75000),
    ('d6e4ebcc-7243-11ed-b73b-73a1d9ac628c','85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0',daterange('2018-08-01', '2020-07-31', '[]'),74500,0.6,49700,112500,0.6,75000),
    ('d6e4ec44-7243-11ed-b73c-fbf8d87b093c','ac879588-6afe-11ed-b107-b3c1585b8c2a',daterange('2018-08-01', '2020-07-31', '[]'),120200,1.0,120200,120200,1.0,120200),
    ('d6e4f414-7243-11ed-b73d-e718f60f427f','ac879d76-6afe-11ed-b108-9fb58b2968d5',daterange('2018-08-01', '2020-07-31', '[]'),108200,1.0,108200,108200,1.0,108200),
    ('d6e4f4f0-7243-11ed-b73e-3347a45618af','ac879dee-6afe-11ed-b109-c7ee3c340bf7',daterange('2018-08-01', '2020-07-31', '[]'),108200,0.75,90200,108200,0.75,90200),
    ('d6e4f5c2-7243-11ed-b73f-dbfbed824b9f','ac879f24-6afe-11ed-b10d-3fe2c69846ef',daterange('2018-08-01', '2020-07-31', '[]'),108200,0.6,72100,108200,0.6,72100),
    ('d6e4f6a8-7243-11ed-b740-035d8880a768','4062cdca-5387-11ed-b84a-6fc9185df882',daterange('2018-08-01', '2020-07-31', '[]'),140800,1.0,140800,212500,1.0,212500),
    ('d6e4fd74-7243-11ed-b741-7fcd4e3a19ad','d6e2a50e-5387-11ed-b84c-b7756f2c8248',daterange('2018-08-01', '2020-07-31', '[]'),140800,1.0,126700,212500,1.0,191300),
    ('d6e4fe46-7243-11ed-b742-9fbcea70ff68','3e1852be-5388-11ed-b84e-e7d4a93b269e',daterange('2018-08-01', '2020-07-31', '[]'),140800,0.75,105600,212500,0.75,159400),
    ('d6e4fec8-7243-11ed-b743-2bf2f60fd08c','b01d3d66-5388-11ed-b850-3bbd85d56f15',daterange('2018-08-01', '2020-07-31', '[]'),140800,0.6,84500,212500,0.6,127500),
    ('d6e4ff40-7243-11ed-b744-475d569453a6','684e4f0a-537b-11ed-aabb-d33da20b2117',daterange('2018-08-01', '2020-07-31', '[]'),124200,1.0,124200,187500,1.0,187500),
    ('d6e4ffb8-7243-11ed-b745-fbc7afb6dc04','cc81be76-537b-11ed-aabd-d7571a7aed5f',daterange('2018-08-01', '2020-07-31', '[]'),124200,1.0,111800,187500,1.0,168800),
    ('d6e50030-7243-11ed-b746-538308f4620a','b244ea0e-5382-11ed-b846-d7ebbaaf5fd5',daterange('2018-08-01', '2020-07-31', '[]'),124200,0.75,93200,187500,0.75,140700),
    ('d6e500a8-7243-11ed-b747-234d4e0a9daf','aed93b48-5384-11ed-b848-435687237b8e',daterange('2018-08-01', '2020-07-31', '[]'),124200,0.6,74500,187500,0.6,112500),

    --PRESCHOOL
    ('d6e50120-7243-11ed-b748-aba6fcf3b4a0','bc6a4550-fa74-11eb-9a2d-035acd5db9aa',daterange('2018-08-01', '2020-07-31', '[]'),46300,1.0,46300,46300,1.0,46300),
    ('d6e50198-7243-11ed-b749-a71af641a01d','5c21d452-4f90-11ed-8be7-bf748cc343bf',daterange('2018-08-01', '2020-07-31', '[]'),46300,1.0,46300,46300,1.0,46300),

    --PRESCHOOL_DAYCARE
    ('d938842a-75f8-11ed-8894-735696ebc06f','0bfc6c92-ff2a-11eb-a785-2724e8e5e7ee',daterange('2018-08-01', '2020-07-31', '[]'),129100,1.0,129100,129100,1.0,129100),
    ('d93884b6-75f8-11ed-8895-a77e605c439f','503593e8-b961-11eb-b527-a3dcdfb628ec',daterange('2018-08-01', '2020-07-31', '[]'),129100,1.0,129100,129100,1.0,129100),
    ('d9388542-75f8-11ed-8896-ff1bb4ca9b01','50359442-b961-11eb-b528-df3290c0d63e',daterange('2018-08-01', '2020-07-31', '[]'),129100,1.0,129100,129100,1.0,129100),
    ('d93885c4-75f8-11ed-8897-0b12d5ca4efa','bc6a42d0-fa74-11eb-9a2b-d315a7916074',daterange('2018-08-01', '2020-07-31', '[]'),129100,0.84,108400,129100,0.84,108400),
    ('d9388650-75f8-11ed-8898-cbc180ed6fe9','50359212-b961-11eb-b522-074fb05f7086',daterange('2018-08-01', '2020-07-31', '[]'),129100,0.74,96000,129100,0.74,96000),
    ('d93886d2-75f8-11ed-8899-eff576238e4e','e1d0d78a-5371-11ed-8d1b-cb612aa6780b',daterange('2018-08-01', '2020-07-31', '[]'),129100,1.0,129100,129100,1.0,129100),
    ('d938875e-75f8-11ed-889a-736243f81408','7b2ff2e4-5372-11ed-8d1d-5f26eff8b49b',daterange('2018-08-01', '2020-07-31', '[]'),129100,1.0,129100,129100,1.0,129100),
    ('d93887e0-75f8-11ed-889b-f791f2a53feb','0004e312-5373-11ed-8d1f-575317e00afc',daterange('2018-08-01', '2020-07-31', '[]'),129100,0.84,108400,129100,0.84,108400),
    ('d938886c-75f8-11ed-889c-732ef2fe5f0f','6fdc7ad8-5373-11ed-8d21-87047833ff0b',daterange('2018-08-01', '2020-07-31', '[]'),129100,0.74,96000,129100,0.74,96000),
    ('4bf46356-8cc6-11ed-852d-0772f0ae4852','576f6cf8-8cbc-11ed-b639-afa50c9355c1',daterange('2018-08-01', '2020-07-31', '[]'),170500,1.0,170500,170500,1.0,170500),
    ('4bf47292-8cc6-11ed-852e-97b391e9345c','576fa380-8cbc-11ed-b63a-8bb1a5b587a0',daterange('2018-08-01', '2020-07-31', '[]'),170500,1.0,170500,170500,1.0,170500),
    ('4bf47378-8cc6-11ed-852f-072d40c56f0b','576fa452-8cbc-11ed-b63b-67fc666e0fa8',daterange('2018-08-01', '2020-07-31', '[]'),170500,0.82,139500,170500,0.82,139500),
    ('4bf47418-8cc6-11ed-8530-1b4409f50c85','576fa4ac-8cbc-11ed-b63c-2ff2276ab9f2',daterange('2018-08-01', '2020-07-31', '[]'),170500,0.71,120800,170500,0.71,120800),
    ('4bf474a4-8cc6-11ed-8531-4bb80f92d806','576fa8f8-8cbc-11ed-b63d-8fb27ef151a1',daterange('2018-08-01', '2020-07-31', '[]'),187100,1.0,187100,187100,1.0,187100),
    ('4bf47530-8cc6-11ed-8532-23c7948f46ba','576fa966-8cbc-11ed-b63e-630258790f77',daterange('2018-08-01', '2020-07-31', '[]'),187100,1.0,187100,187100,1.0,187100),
    ('4bf475b2-8cc6-11ed-8533-674aab096e1b','576fa9b6-8cbc-11ed-b63f-8bf378c64b67',daterange('2018-08-01', '2020-07-31', '[]'),187100,0.81,151900,187100,0.81,151900),
    ('4bf4763e-8cc6-11ed-8534-bf5196ee50a2','576fe070-8cbc-11ed-b640-675064ab6753',daterange('2018-08-01', '2020-07-31', '[]'),187100,0.7,130800,187100,0.7,130800),

    --DAYCARE_PART_TIME_FIVE_YEAR_OLDS
    ('84b8e97a-763a-11ed-ae62-b3e5f26534c0','153a6364-536a-11ed-8d0f-d7a4b2b860f1',daterange('2018-08-01', '2020-07-31', '[]'),120000,1.0,120000,120000,1.0,120000),
    ('84b8f028-763a-11ed-ae63-0fb139eb84f0','325c97b4-536a-11ed-8d10-4b3a543573f7',daterange('2018-08-01', '2020-07-31', '[]'),120000,1.0,120000,120000,1.0,120000),
    ('84b8f0f0-763a-11ed-ae64-f3037729606a','73976b22-536b-11ed-8d13-57ff6a3494ef',daterange('2018-08-01', '2020-07-31', '[]'),120000,1.0,120000,120000,1.0,120000),
    ('84b8f23a-763a-11ed-ae65-13bcdfdee835','3172d514-536c-11ed-8d15-dfe8e83094cd',daterange('2018-08-01', '2020-07-31', '[]'),120000,0.83,93300,120000,0.83,93300),
    ('84b8f2d0-763a-11ed-ae66-43f24d4bbef9','e94a8bae-536d-11ed-8d17-9b8007da5dec',daterange('2018-08-01', '2020-07-31', '[]'),120000,0.72,86900,120000,0.72,86900),
    ('84b8f35c-763a-11ed-ae67-1b37acad1eec','a2877f1a-7087-11ed-a559-4fa06829e6fd',daterange('2018-08-01', '2020-07-31', '[]'),154700,1.0,154700,154700,1.0,154700),
    ('84b8fba4-763a-11ed-ae68-1f1f0506b8df','a2878c8a-7087-11ed-a55a-ffa38e3847aa',daterange('2018-08-01', '2020-07-31', '[]'),154700,1.0,154700,154700,1.0,154700),
    ('84b8fc94-763a-11ed-ae69-0398bb12139e','a2878d2a-7087-11ed-a55b-2f42cae1743e',daterange('2018-08-01', '2020-07-31', '[]'),154700,0.82,127400,154700,0.82,127400),
    ('84b8fd5c-763a-11ed-ae6a-8387f72e127c','a2878d84-7087-11ed-a55c-53988f52a3bf',daterange('2018-08-01', '2020-07-31', '[]'),154700,0.71,109300,154700,0.71,109300),
    ('14b6244e-8ce7-11ed-94c6-47fa2296ac57','99cd40ce-8cd6-11ed-ad37-c7c08035a833',daterange('2018-08-01', '2020-07-31', '[]'),161400,1.0,161400,161400,1.0,161400),
    ('14b639e8-8ce7-11ed-94c7-4710d430d05c','99cd517c-8cd6-11ed-ad38-7b2aa4f8b7be',daterange('2018-08-01', '2020-07-31', '[]'),161400,1.0,161400,161400,1.0,161400),
    ('14b63af6-8ce7-11ed-94c8-83c09bbf7b18','99cd5938-8cd6-11ed-ad39-9fefd8a84f78',daterange('2018-08-01', '2020-07-31', '[]'),161400,0.81,130400,161400,0.81,130400),
    ('14b63ba0-8ce7-11ed-94c9-8760823bb112','99cd59ec-8cd6-11ed-ad3a-bbf83318f2f1',daterange('2018-08-01', '2020-07-31', '[]'),161400,0.69,111700,161400,0.69,111700),
    ('14b63c40-8ce7-11ed-94ca-c7fc47869b37','99cd5a6e-8cd6-11ed-ad3b-e78efee7f61a',daterange('2018-08-01', '2020-07-31', '[]'),178000,1.0,178000,178000,1.0,178000),
    ('14b63cd6-8ce7-11ed-94cb-8303b91286a0','99cd5ae6-8cd6-11ed-ad3c-9f9e7d8ac30e',daterange('2018-08-01', '2020-07-31', '[]'),178000,1.0,178000,178000,1.0,178000),
    ('14b63d76-8ce7-11ed-94cc-1fbf500d74c5','99cd5b9a-8cd6-11ed-ad3d-8f81b097a236',daterange('2018-08-01', '2020-07-31', '[]'),178000,0.80,142800,178000,0.80,142800),
    ('14b63e0c-8ce7-11ed-94cd-2350e4f34307','99cd5bf4-8cd6-11ed-ad3e-77990db3e351',daterange('2018-08-01', '2020-07-31', '[]'),178000,0.68,121700,178000,0.68,121700),

    --OTHER_ONES - SET TO DEFAULT VOUCHER VALUE
    ('3938940c-7471-11ed-b37d-7b906c4a9bbe','86ef7370-bf85-11eb-91e7-6fcd728c518d',daterange('2018-08-01', '2020-07-31', '[]'),82800,1.0,82800,125000,1.0,125000),
    ('39389484-7471-11ed-b37e-6f6d10e6ac6a','50359280-b961-11eb-b523-237115533645',daterange('2018-08-01', '2020-07-31', '[]'),82800,1.0,82800,125000,1.0,125000),
    ('39389506-7471-11ed-b37f-ab640f0f7a8f','5e82f704-4f8f-11ed-8be5-bbe76169415f',daterange('2018-08-01', '2020-07-31', '[]'),82800,1.0,82800,125000,1.0,125000),
    ('3938957e-7471-11ed-b380-db09b0a4a759','50359334-b961-11eb-b525-f3febdfea5d3',daterange('2018-08-01', '2020-07-31', '[]'),82800,1.0,82800,125000,1.0,125000),
    ('39389600-7471-11ed-b381-cf8a65b1e71f','5035938e-b961-11eb-b526-6b30323c87a8',daterange('2018-08-01', '2020-07-31', '[]'),82800,1.0,82800,125000,1.0,125000),
    ('39389678-7471-11ed-b382-f7fe79b1ab54','e549007e-4f91-11ed-8beb-2f7e83af8ba6',daterange('2018-08-01', '2020-07-31', '[]'),82800,1.0,82800,125000,1.0,125000),
    ('393896fa-7471-11ed-b383-d3bd90e258fb','bc6a44ec-fa74-11eb-9a2c-73b53c2af869',daterange('2018-08-01', '2020-07-31', '[]'),82800,1.0,82800,125000,1.0,125000),
    ('39389772-7471-11ed-b384-2b1bd8b2e480','bc6a45a0-fa74-11eb-9a2e-fb411a8588da',daterange('2018-08-01', '2020-07-31', '[]'),82800,1.0,82800,125000,1.0,125000),
    ('393897f4-7471-11ed-b385-47eb74c79465','ff6ddcd4-fa8a-11eb-8592-2f2b4e398fcb',daterange('2018-08-01', '2020-07-31', '[]'),82800,1.0,82800,125000,1.0,125000),
    ('3938986c-7471-11ed-b386-6797de9dbcce','4d246a6c-4f92-11ed-8bed-2f5b3226e682',daterange('2018-08-01', '2020-07-31', '[]'),82800,1.0,82800,125000,1.0,125000),
    ('393898ee-7471-11ed-b387-4bfe1c33f056','d6d5a660-4f90-11ed-8be9-6f76cd90c246',daterange('2018-08-01', '2020-07-31', '[]'),82800,1.0,82800,125000,1.0,125000),
    ('3938997a-7471-11ed-b388-afdfcd087259','1b4413f6-d99d-11eb-89ac-a3a978104bce',daterange('2018-08-01', '2020-07-31', '[]'),82800,1.0,82800,125000,1.0,125000),

    -- 2018-11-01 - 2020-07-31

    --DAYCARE_FIVE_YEAR_OLDS
    ('d6e4e82a-7243-11ed-b734-eb5c7c879c7f','267946fa-6fb1-11ed-8c85-4725b99d6549',daterange('2018-11-01', '2020-07-31', '[]'),82700,0.45,37200,82700,0.45,37200),
    ('d6e4e8de-7243-11ed-b735-a3b53946d5c4','26794f24-6fb1-11ed-8c86-1f58d027951d',daterange('2018-11-01', '2020-07-31', '[]'),82700,0.45,37200,82700,0.45,37200),

    -- 2019-11-01 - 2022-04-30

    --DAYCARE
    --DAYCARE_PART_TIME
    ('d6e4e564-7243-11ed-b72e-4319e06954e9','ac879e48-6afe-11ed-b10a-9791c734c144',daterange('2019-11-01', '2022-04-30', '[]'),85000,1.0,85000,85000,1.0,85000),
    ('d6e4e5dc-7243-11ed-b72f-0362200bb95e','ac879e8e-6afe-11ed-b10b-436cbc3d57e9',daterange('2019-11-01', '2022-04-30', '[]'),76500,1.0,76500,76500,1.0,76500),
    ('d6e4e64a-7243-11ed-b730-d35372fd5b7f','ac879ede-6afe-11ed-b10c-636ae14462ef',daterange('2019-11-01', '2022-04-30', '[]'),76500,0.75,63800,76500,0.75,63800),
    ('d6e4e6c2-7243-11ed-b731-3f28deeeb27b','ac879f74-6afe-11ed-b10e-2bf83788be72',daterange('2019-11-01', '2022-04-30', '[]'),76500,0.6,51000,76500,0.6,51000),


    --DAYCARE_FIVE_YEAR_OLDS
    ('d6e4e73a-7243-11ed-b732-7f0ca18aeafe','a867f3ec-5368-11ed-8d0b-b31b59a849a1',daterange('2019-11-01', '2022-04-30', '[]'),37200,1.0,37200,37200,1.0,37200),
    ('d6e4e7b2-7243-11ed-b733-6be8c7bd0822','c73c5cea-5368-11ed-8d0c-8fb44e947bc6',daterange('2019-11-01', '2022-04-30', '[]'),37200,1.0,37200,37200,1.0,37200),

    --DAYCARE_PART_TIME_FIVE_YEAR_OLDS
    ('84b8e772-763a-11ed-ae5e-bbe0bb7e8275','a2879072-7087-11ed-a55d-6f35f6f6df2f',daterange('2019-11-01', '2022-04-30', '[]'),113700,1.0,113700,113700,1.0,113700),
    ('84b8e7f4-763a-11ed-ae5f-433f26dca0a8','a28790e0-7087-11ed-a55e-0700a24f1119',daterange('2019-11-01', '2022-04-30', '[]'),113700,1.0,113700,113700,1.0,113700),
    ('84b8e876-763a-11ed-ae60-b74c19cf97d4','a2879554-7087-11ed-a55f-df43279a1ac6',daterange('2019-11-01', '2022-04-30', '[]'),113700,0.75,85300,113700,0.75,85300),
    ('84b8e8f8-763a-11ed-ae61-5fc8f0b130f7','a2879860-7087-11ed-a560-2b2470e04de6',daterange('2019-11-01', '2022-04-30', '[]'),113700,0.6,68200,113700,0.6,68200),

    -- 2021-08-01 - 2022-04-30

    --PRESCHOOL
    ('d6e4d592-7243-11ed-b717-ff5bf99243dc','a678968e-536f-11ed-8d19-5715e16c8489',daterange('2021-08-01', '2022-04-30', '[]'),48100,1.0,48100,48100,1.0,48100),

    -- 2020-08-01 - 2022-04-30

    --DAYCARE
    --DAYCARE_PART_TIME
    ('d6e4d614-7243-11ed-b718-ff0af4decf20','50358394-b961-11eb-b51f-67ac436e5636',daterange('2020-08-01', '2022-04-30', '[]'),86000,1.0,86000,129900,1.0,129900),
    ('d6e4d682-7243-11ed-b719-937521407f3b','86ef70a0-bf85-11eb-91e6-1fb57a101161',daterange('2020-08-01', '2022-04-30', '[]'),86000,1.0,86000,129900,1.0,129900),
    ('d6e4d6f0-7243-11ed-b71a-9ffb49a0a30a','503590f0-b961-11eb-b520-53740af3f7ee',daterange('2020-08-01', '2022-04-30', '[]'),77400,1.0,77400,116900,1.0,116900),
    ('d6e4d768-7243-11ed-b71b-93d8f47437c5','503591ae-b961-11eb-b521-1fca99358eef',daterange('2020-08-01', '2022-04-30', '[]'),77400,0.75,64500,116900,0.75,97400),
    ('d6e4d7d6-7243-11ed-b71c-b77d326d66cc','503592da-b961-11eb-b524-7f27c780d83a',daterange('2020-08-01', '2022-04-30', '[]'),77400,0.6,51600,116900,0.6,77900),
    ('d6e4d844-7243-11ed-b71d-b3b0c7099a28','85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0',daterange('2020-08-01', '2022-04-30', '[]'),77400,0.6,51600,116900,0.6,77900),
    ('d6e4d8b2-7243-11ed-b71e-a3799f33e22e','ac879588-6afe-11ed-b107-b3c1585b8c2a',daterange('2020-08-01', '2022-04-30', '[]'),120200,1.0,120200,120200,1.0,120200),
    ('d6e4d92a-7243-11ed-b71f-fb2924388738','ac879d76-6afe-11ed-b108-9fb58b2968d5',daterange('2020-08-01', '2022-04-30', '[]'),108200,1.0,108200,108200,1.0,108200),
    ('d6e4d998-7243-11ed-b720-3bfea86e9546','ac879dee-6afe-11ed-b109-c7ee3c340bf7',daterange('2020-08-01', '2022-04-30', '[]'),108200,0.75,90200,108200,0.75,90200),
    ('d6e4da06-7243-11ed-b721-57715c5ee7be','ac879f24-6afe-11ed-b10d-3fe2c69846ef',daterange('2020-08-01', '2022-04-30', '[]'),108200,0.6,72100,108200,0.6,72100),
    ('d6e4dfb0-7243-11ed-b722-c3baf0b9cac5','4062cdca-5387-11ed-b84a-6fc9185df882',daterange('2020-08-01', '2022-04-30', '[]'),146200,1.0,146200,220800,1.0,220800),
    ('d6e4e032-7243-11ed-b723-532d7d87900f','d6e2a50e-5387-11ed-b84c-b7756f2c8248',daterange('2020-08-01', '2022-04-30', '[]'),146200,1.0,131600,220800,1.0,198700),
    ('d6e4e0aa-7243-11ed-b724-4bff5d3a3b0f','3e1852be-5388-11ed-b84e-e7d4a93b269e',daterange('2020-08-01', '2022-04-30', '[]'),146200,0.75,109700,220800,0.75,165600),
    ('d6e4e12c-7243-11ed-b725-33b2ae347ab9','b01d3d66-5388-11ed-b850-3bbd85d56f15',daterange('2020-08-01', '2022-04-30', '[]'),146200,0.6,87700,220800,0.6,132500),
    ('d6e4e1a4-7243-11ed-b726-5bedebbee596','684e4f0a-537b-11ed-aabb-d33da20b2117',daterange('2020-08-01', '2022-04-30', '[]'),129000,1.0,129000,194800,1.0,194800),
    ('d6e4e212-7243-11ed-b727-9f0f6b675def','cc81be76-537b-11ed-aabd-d7571a7aed5f',daterange('2020-08-01', '2022-04-30', '[]'),129000,1.0,116100,194800,1.0,175300),
    ('d6e4e294-7243-11ed-b728-2f5a1c0e4228','b244ea0e-5382-11ed-b846-d7ebbaaf5fd5',daterange('2020-08-01', '2022-04-30', '[]'),129000,0.75,96800,194800,0.75,146100),
    ('d6e4e302-7243-11ed-b729-7b2eadb56000','aed93b48-5384-11ed-b848-435687237b8e',daterange('2020-08-01', '2022-04-30', '[]'),129000,0.6,77400,194800,0.6,116900),

    --PRESCHOOL
    ('d6e4e38e-7243-11ed-b72a-cb986d5d220b','bc6a4550-fa74-11eb-9a2d-035acd5db9aa',daterange('2020-08-01', '2022-04-30', '[]'),48100,1.0,48100,48100,1.0,48100),
    ('d6e4e406-7243-11ed-b72b-b7f78b2e86a2','5c21d452-4f90-11ed-8be7-bf748cc343bf',daterange('2020-08-01', '2022-04-30', '[]'),48100,1.0,48100,48100,1.0,48100),

    --PRESCHOOL_DAYCARE
    ('d9387e12-75f8-11ed-888b-ff0097376aa2','0bfc6c92-ff2a-11eb-a785-2724e8e5e7ee',daterange('2020-08-01', '2022-04-30', '[]'),134100,1.0,134100,134100,1.0,134100),
    ('d9387eda-75f8-11ed-888c-5bc95a4e1727','503593e8-b961-11eb-b527-a3dcdfb628ec',daterange('2020-08-01', '2022-04-30', '[]'),134100,1.0,134100,134100,1.0,134100),
    ('d9387fa2-75f8-11ed-888d-f30dc87f604c','50359442-b961-11eb-b528-df3290c0d63e',daterange('2020-08-01', '2022-04-30', '[]'),134100,1.0,134100,134100,1.0,134100),
    ('d938806a-75f8-11ed-888e-13c50873e077','bc6a42d0-fa74-11eb-9a2b-d315a7916074',daterange('2020-08-01', '2022-04-30', '[]'),134100,0.84,112600,134100,0.84,112600),
    ('d938813c-75f8-11ed-888f-a3bde3587e31','50359212-b961-11eb-b522-074fb05f7086',daterange('2020-08-01', '2022-04-30', '[]'),134100,0.74,99700,134100,0.74,99700),
    ('d93881d2-75f8-11ed-8890-13e18ec64817','e1d0d78a-5371-11ed-8d1b-cb612aa6780b',daterange('2020-08-01', '2022-04-30', '[]'),134100,1.0,134100,134100,1.0,134100),
    ('d938829a-75f8-11ed-8891-b3b85a225c90','7b2ff2e4-5372-11ed-8d1d-5f26eff8b49b',daterange('2020-08-01', '2022-04-30', '[]'),134100,1.0,134100,134100,1.0,134100),
    ('d9388326-75f8-11ed-8892-af9fc8df4b4c','0004e312-5373-11ed-8d1f-575317e00afc',daterange('2020-08-01', '2022-04-30', '[]'),134100,0.84,112600,134100,0.84,112600),
    ('d93883a8-75f8-11ed-8893-0377a7a7047a','6fdc7ad8-5373-11ed-8d21-87047833ff0b',daterange('2020-08-01', '2022-04-30', '[]'),134100,0.74,99700,134100,0.74,99700),
    ('d819fc70-8cc5-11ed-8525-43b354f0cf6a','576f6cf8-8cbc-11ed-b639-afa50c9355c1',daterange('2020-08-01', '2022-04-30', '[]'),177100,1.0,177100,177100,1.0,177100),
    ('d81a0b20-8cc5-11ed-8526-3f659de47304','576fa380-8cbc-11ed-b63a-8bb1a5b587a0',daterange('2020-08-01', '2022-04-30', '[]'),177100,1.0,177100,177100,1.0,177100),
    ('d81a0bde-8cc5-11ed-8527-9b9f4045094d','576fa452-8cbc-11ed-b63b-67fc666e0fa8',daterange('2020-08-01', '2022-04-30', '[]'),177100,0.81,157800,177100,0.81,157800),
    ('d81a0c74-8cc5-11ed-8528-6f8c58357121','576fa4ac-8cbc-11ed-b63c-2ff2276ab9f2',daterange('2020-08-01', '2022-04-30', '[]'),177100,0.71,125500,177100,0.71,125500),
    ('d81a0cf6-8cc5-11ed-8529-1fc676b5ab38','576fa8f8-8cbc-11ed-b63d-8fb27ef151a1',daterange('2020-08-01', '2022-04-30', '[]'),194300,1.0,194300,194300,1.0,194300),
    ('d81a0d82-8cc5-11ed-852a-ff7f3780a62c','576fa966-8cbc-11ed-b63e-630258790f77',daterange('2020-08-01', '2022-04-30', '[]'),194300,1.0,194300,194300,1.0,194300),
    ('d81a0e04-8cc5-11ed-852b-e72808e1ffa8','576fa9b6-8cbc-11ed-b63f-8bf378c64b67',daterange('2020-08-01', '2022-04-30', '[]'),194300,0.81,157800,194300,0.81,157800),
    ('d81a0e86-8cc5-11ed-852c-f715d9322b1a','576fe070-8cbc-11ed-b640-675064ab6753',daterange('2020-08-01', '2022-04-30', '[]'),194300,0.7,135800,194300,0.7,135800),

    --DAYCARE_FIVE_YEAR_OLDS
    ('d6e4e474-7243-11ed-b72c-f348aea912ea','267946fa-6fb1-11ed-8c85-4725b99d6549',daterange('2020-08-01', '2022-04-30', '[]'),86000,0.45,38700,86000,0.45,38700),
    ('d6e4e4ec-7243-11ed-b72d-43bcc924c75a','26794f24-6fb1-11ed-8c86-1f58d027951d',daterange('2020-08-01', '2022-04-30', '[]'),86000,0.45,38700,86000,0.45,38700),

    --DAYCARE_PART_TIME_FIVE_YEAR_OLDS
    ('84b8e272-763a-11ed-ae55-6b3c3760481f','153a6364-536a-11ed-8d0f-d7a4b2b860f1',daterange('2020-08-01', '2022-04-30', '[]'),124700,1.0,124700,124700,1.0,124700),
    ('84b8e2fe-763a-11ed-ae56-2fad9022548d','325c97b4-536a-11ed-8d10-4b3a543573f7',daterange('2020-08-01', '2022-04-30', '[]'),124700,1.0,124700,124700,1.0,124700),
    ('84b8e380-763a-11ed-ae57-3bcfde67db7a','73976b22-536b-11ed-8d13-57ff6a3494ef',daterange('2020-08-01', '2022-04-30', '[]'),124700,1.0,124700,124700,1.0,124700),
    ('84b8e40c-763a-11ed-ae58-6feebc467a86','3172d514-536c-11ed-8d15-dfe8e83094cd',daterange('2020-08-01', '2022-04-30', '[]'),124700,0.83,103200,124700,0.83,103200),
    ('84b8e4ca-763a-11ed-ae59-e3f07f9868de','e94a8bae-536d-11ed-8d17-9b8007da5dec',daterange('2020-08-01', '2022-04-30', '[]'),124700,0.72,90300,124700,0.72,90300),
    ('84b8e54c-763a-11ed-ae5a-b352c51ab51c','a2877f1a-7087-11ed-a559-4fa06829e6fd',daterange('2020-08-01', '2022-04-30', '[]'),158900,1.0,158900,158900,1.0,158900),
    ('84b8e5d8-763a-11ed-ae5b-c7f26ed063f9','a2878c8a-7087-11ed-a55a-ffa38e3847aa',daterange('2020-08-01', '2022-04-30', '[]'),158900,1.0,158900,158900,1.0,158900),
    ('84b8e664-763a-11ed-ae5c-8fcf956a1d3c','a2878d2a-7087-11ed-a55b-2f42cae1743e',daterange('2020-08-01', '2022-04-30', '[]'),158900,0.81,128900,158900,0.81,128900),
    ('84b8e6f0-763a-11ed-ae5d-9f4941887f2f','a2878d84-7087-11ed-a55c-53988f52a3bf',daterange('2020-08-01', '2022-04-30', '[]'),158900,0.7,110800,158900,0.7,110800),
    ('7a3f52be-8ce6-11ed-94be-b31e932089db','99cd40ce-8cd6-11ed-ad37-c7c08035a833',daterange('2020-08-01', '2022-04-30', '[]'),167700,1.0,167700,167700,1.0,167700),
    ('7a3f5ae8-8ce6-11ed-94bf-cb4ebafc0920','99cd517c-8cd6-11ed-ad38-7b2aa4f8b7be',daterange('2020-08-01', '2022-04-30', '[]'),167700,1.0,167700,167700,1.0,167700),
    ('7a3f5bc4-8ce6-11ed-94c0-1372e2d953e9','99cd5938-8cd6-11ed-ad39-9fefd8a84f78',daterange('2020-08-01', '2022-04-30', '[]'),167700,0.81,135500,167700,0.81,135500),
    ('7a3f64de-8ce6-11ed-94c1-e3d17e2d2e90','99cd59ec-8cd6-11ed-ad3a-bbf83318f2f1',daterange('2020-08-01', '2022-04-30', '[]'),167700,0.69,116100,167700,0.69,116100),
    ('7a3f6600-8ce6-11ed-94c2-f781dcff1a29','99cd5a6e-8cd6-11ed-ad3b-e78efee7f61a',daterange('2020-08-01', '2022-04-30', '[]'),184900,1.0,184900,184900,1.0,184900),
    ('7a3f66e6-8ce6-11ed-94c3-474e567ac492','99cd5ae6-8cd6-11ed-ad3c-9f9e7d8ac30e',daterange('2020-08-01', '2022-04-30', '[]'),184900,1.0,184900,184900,1.0,184900),
    ('7a3f67ae-8ce6-11ed-94c4-3f3b01e23e1f','99cd5b9a-8cd6-11ed-ad3d-8f81b097a236',daterange('2020-08-01', '2022-04-30', '[]'),184900,0.80,148400,184900,0.80,148400),
    ('7a3f684e-8ce6-11ed-94c5-5b15d4af2cee','99cd5bf4-8cd6-11ed-ad3e-77990db3e351',daterange('2020-08-01', '2022-04-30', '[]'),184900,0.68,126400,184900,0.68,126400),

    --OTHER_ONES - SET TO DEFAULT VOUCHER VALUE
    ('39388e3a-7471-11ed-b371-7bd4075ea501','86ef7370-bf85-11eb-91e7-6fcd728c518d',daterange('2020-08-01', '2022-04-30', '[]'),86000,1.0,86000,129900,1.0,129900),
    ('39388eb2-7471-11ed-b372-ef2c1bb05945','50359280-b961-11eb-b523-237115533645',daterange('2020-08-01', '2022-04-30', '[]'),86000,1.0,86000,129900,1.0,129900),
    ('39388f2a-7471-11ed-b373-cb772e3ca2cd','5e82f704-4f8f-11ed-8be5-bbe76169415f',daterange('2020-08-01', '2022-04-30', '[]'),86000,1.0,86000,129900,1.0,129900),
    ('39388fa2-7471-11ed-b374-1386d7aa8b23','50359334-b961-11eb-b525-f3febdfea5d3',daterange('2020-08-01', '2022-04-30', '[]'),86000,1.0,86000,129900,1.0,129900),
    ('39389024-7471-11ed-b375-7b788e1dbbff','5035938e-b961-11eb-b526-6b30323c87a8',daterange('2020-08-01', '2022-04-30', '[]'),86000,1.0,86000,129900,1.0,129900),
    ('39389092-7471-11ed-b376-3f0c7b851fd1','e549007e-4f91-11ed-8beb-2f7e83af8ba6',daterange('2020-08-01', '2022-04-30', '[]'),86000,1.0,86000,129900,1.0,129900),
    ('39389114-7471-11ed-b377-6b276ad137a6','bc6a44ec-fa74-11eb-9a2c-73b53c2af869',daterange('2020-08-01', '2022-04-30', '[]'),86000,1.0,86000,129900,1.0,129900),
    ('3938918c-7471-11ed-b378-bbeb37dd4f42','bc6a45a0-fa74-11eb-9a2e-fb411a8588da',daterange('2020-08-01', '2022-04-30', '[]'),86000,1.0,86000,129900,1.0,129900),
    ('3938920e-7471-11ed-b379-c74f1be0057a','ff6ddcd4-fa8a-11eb-8592-2f2b4e398fcb',daterange('2020-08-01', '2022-04-30', '[]'),86000,1.0,86000,129900,1.0,129900),
    ('39389286-7471-11ed-b37a-371f6f150a44','4d246a6c-4f92-11ed-8bed-2f5b3226e682',daterange('2020-08-01', '2022-04-30', '[]'),86000,1.0,86000,129900,1.0,129900),
    ('39389312-7471-11ed-b37b-c3c6816d2290','d6d5a660-4f90-11ed-8be9-6f76cd90c246',daterange('2020-08-01', '2022-04-30', '[]'),86000,1.0,86000,129900,1.0,129900),
    ('39389394-7471-11ed-b37c-3f996134749b','1b4413f6-d99d-11eb-89ac-a3a978104bce',daterange('2020-08-01', '2022-04-30', '[]'),86000,1.0,86000,129900,1.0,129900),

    -- 2022-05-01 - 2022-07-31

    --DAYCARE
    --DAYCARE_PART_TIME
    ('d6e45766-7243-11ed-b6fa-c72037d30345','50358394-b961-11eb-b51f-67ac436e5636',daterange('2022-05-01', '2022-07-31', '[]'),90200,1.0,90200,136200,1.0,136200),
    ('d6e4c8b8-7243-11ed-b6fb-6f4669d094e2','86ef70a0-bf85-11eb-91e6-1fb57a101161',daterange('2022-05-01', '2022-07-31', '[]'),90200,1.0,90200,136200,1.0,136200),
    ('d6e4c9a8-7243-11ed-b6fc-57945b3f75cd','503590f0-b961-11eb-b520-53740af3f7ee',daterange('2022-05-01', '2022-07-31', '[]'),81200,1.0,81200,122600,1.0,122600),
    ('d6e4ca20-7243-11ed-b6fd-bf32b2b8e4d1','503591ae-b961-11eb-b521-1fca99358eef',daterange('2022-05-01', '2022-07-31', '[]'),81200,0.75,67700,122600,0.75,102200),
    ('d6e4ca8e-7243-11ed-b6fe-136c5104802f','503592da-b961-11eb-b524-7f27c780d83a',daterange('2022-05-01', '2022-07-31', '[]'),81200,0.6,54100,122600,0.6,81700),
    ('d6e4cafc-7243-11ed-b6ff-f794913418a6','85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0',daterange('2022-05-01', '2022-07-31', '[]'),81200,0.6,54100,122600,0.6,81700),
    ('d6e4cb92-7243-11ed-b700-4bc83b752d7d','ac879588-6afe-11ed-b107-b3c1585b8c2a',daterange('2022-05-01', '2022-07-31', '[]'),120200,1.0,120200,120200,1.0,120200),
    ('d6e4cc00-7243-11ed-b701-032e785d1eae','ac879d76-6afe-11ed-b108-9fb58b2968d5',daterange('2022-05-01', '2022-07-31', '[]'),108200,1.0,108200,108200,1.0,108200),
    ('d6e4cc6e-7243-11ed-b702-0f8fc50b473f','ac879dee-6afe-11ed-b109-c7ee3c340bf7',daterange('2022-05-01', '2022-07-31', '[]'),108200,0.75,90200,108200,0.75,90200),
    ('d6e4ccdc-7243-11ed-b703-236f97bc725d','ac879f24-6afe-11ed-b10d-3fe2c69846ef',daterange('2022-05-01', '2022-07-31', '[]'),108200,0.6,72100,108200,0.6,72100),
    ('d6e4cd4a-7243-11ed-b704-1fadcfb31468','ac879e48-6afe-11ed-b10a-9791c734c144',daterange('2022-05-01', '2022-07-31', '[]'),89200,1.0,89200,89200,1.0,89200),
    ('d6e4cdae-7243-11ed-b705-437cf1fa73d4','ac879e8e-6afe-11ed-b10b-436cbc3d57e9',daterange('2022-05-01', '2022-07-31', '[]'),80300,1.0,80300,80300,1.0,80300),
    ('d6e4ce1c-7243-11ed-b706-27d67f825024','ac879ede-6afe-11ed-b10c-636ae14462ef',daterange('2022-05-01', '2022-07-31', '[]'),80300,0.75,66900,80300,0.75,66900),
    ('d6e4ce8a-7243-11ed-b707-2f5dc31f151d','ac879f74-6afe-11ed-b10e-2bf83788be72',daterange('2022-05-01', '2022-07-31', '[]'),80300,0.6,53500,80300,0.6,53500),
    ('d6e4ceee-7243-11ed-b708-6bfdcd462f9a','4062cdca-5387-11ed-b84a-6fc9185df882',daterange('2022-05-01', '2022-07-31', '[]'),153300,1.0,153300,231500,1.0,231500),
    ('d6e4cf5c-7243-11ed-b709-db69c5cf1db3','d6e2a50e-5387-11ed-b84c-b7756f2c8248',daterange('2022-05-01', '2022-07-31', '[]'),153300,1.0,138000,231500,1.0,208400),
    ('d6e4cfc0-7243-11ed-b70a-9b87ef6d73af','3e1852be-5388-11ed-b84e-e7d4a93b269e',daterange('2022-05-01', '2022-07-31', '[]'),153300,0.75,115000,231500,0.75,173700),
    ('d6e4d02e-7243-11ed-b70b-0f1897e79c99','b01d3d66-5388-11ed-b850-3bbd85d56f15',daterange('2022-05-01', '2022-07-31', '[]'),153300,0.6,92000,231500,0.6,138900),
    ('d6e4d0b0-7243-11ed-b70c-7fdbc5f71fa9','684e4f0a-537b-11ed-aabb-d33da20b2117',daterange('2022-05-01', '2022-07-31', '[]'),135300,1.0,135300,204300,1.0,204300),
    ('d6e4d11e-7243-11ed-b70d-879b46b97097','cc81be76-537b-11ed-aabd-d7571a7aed5f',daterange('2022-05-01', '2022-07-31', '[]'),135300,1.0,121800,204300,1.0,183900),
    ('d6e4d18c-7243-11ed-b70e-9f871a38f750','b244ea0e-5382-11ed-b846-d7ebbaaf5fd5',daterange('2022-05-01', '2022-07-31', '[]'),135300,0.75,101500,204300,0.75,153200),
    ('d6e4d1fa-7243-11ed-b70f-dbc6b5ad04ab','aed93b48-5384-11ed-b848-435687237b8e',daterange('2022-05-01', '2022-07-31', '[]'),135300,0.6,81200,204300,0.6,122600),

    --PRESCHOOL
    ('d6e4d29a-7243-11ed-b710-b316c1774326','bc6a4550-fa74-11eb-9a2d-035acd5db9aa',daterange('2022-05-01', '2022-07-31', '[]'),50500,1.0,50500,50500,1.0,50500),
    ('d6e4d308-7243-11ed-b711-0308615a88e4','5c21d452-4f90-11ed-8be7-bf748cc343bf',daterange('2022-05-01', '2022-07-31', '[]'),50500,1.0,50500,50500,1.0,50500),
    ('d6e4d376-7243-11ed-b712-83dec6ea882b','a678968e-536f-11ed-8d19-5715e16c8489',daterange('2022-05-01', '2022-07-31', '[]'),50500,1.0,50500,50500,1.0,50500),

    --PRESCHOOL_DAYCARE
    ('d937db4c-75f8-11ed-8882-13d8b833cecf','0bfc6c92-ff2a-11eb-a785-2724e8e5e7ee',daterange('2022-05-01', '2022-07-31', '[]'),140700,1.0,140700,140700,1.0,140700),
    ('d938705c-75f8-11ed-8883-d3371e596a43','503593e8-b961-11eb-b527-a3dcdfb628ec',daterange('2022-05-01', '2022-07-31', '[]'),140700,1.0,140700,140700,1.0,140700),
    ('d938716a-75f8-11ed-8884-2f6cb9b305cb','50359442-b961-11eb-b528-df3290c0d63e',daterange('2022-05-01', '2022-07-31', '[]'),140700,1.0,140700,140700,1.0,140700),
    ('d9387200-75f8-11ed-8885-4b28057453fb','bc6a42d0-fa74-11eb-9a2b-d315a7916074',daterange('2022-05-01', '2022-07-31', '[]'),140700,0.84,118200,140700,0.84,118200),
    ('d938757a-75f8-11ed-8886-bbd097058604','50359212-b961-11eb-b522-074fb05f7086',daterange('2022-05-01', '2022-07-31', '[]'),140700,0.74,104600,140700,0.74,104600),
    ('d9387606-75f8-11ed-8887-0f26c24f1b75','e1d0d78a-5371-11ed-8d1b-cb612aa6780b',daterange('2022-05-01', '2022-07-31', '[]'),140700,1.0,140700,140700,1.0,140700),
    ('d9387b7e-75f8-11ed-8888-a3b4d26a4a6c','7b2ff2e4-5372-11ed-8d1d-5f26eff8b49b',daterange('2022-05-01', '2022-07-31', '[]'),140700,1.0,140700,140700,1.0,140700),
    ('d9387c5a-75f8-11ed-8889-eb082dc5a77f','0004e312-5373-11ed-8d1f-575317e00afc',daterange('2022-05-01', '2022-07-31', '[]'),140700,0.84,118200,140700,0.84,118200),
    ('d9387d40-75f8-11ed-888a-273f605e8bef','6fdc7ad8-5373-11ed-8d21-87047833ff0b',daterange('2022-05-01', '2022-07-31', '[]'),140700,0.74,104600,140700,0.74,104600),
    ('34a2d3c8-8cc5-11ed-851d-2fed29d49b4f','576f6cf8-8cbc-11ed-b639-afa50c9355c1',daterange('2022-05-01', '2022-07-31', '[]'),185800,1.0,185800,185800,1.0,185800),
    ('34a30910-8cc5-11ed-851e-0790ee786724','576fa380-8cbc-11ed-b63a-8bb1a5b587a0',daterange('2022-05-01', '2022-07-31', '[]'),185800,1.0,185800,185800,1.0,185800),
    ('34a30a00-8cc5-11ed-851f-efc8668f4dc1','576fa452-8cbc-11ed-b63b-67fc666e0fa8',daterange('2022-05-01', '2022-07-31', '[]'),185800,0.82,152000,185800,0.82,152000),
    ('34a30a8c-8cc5-11ed-8520-c729e0e18eff','576fa4ac-8cbc-11ed-b63c-2ff2276ab9f2',daterange('2022-05-01', '2022-07-31', '[]'),185800,0.71,131700,185800,0.71,131700),
    ('34a30b18-8cc5-11ed-8521-37ef2d8453c7','576fa8f8-8cbc-11ed-b63d-8fb27ef151a1',daterange('2022-05-01', '2022-07-31', '[]'),203800,1.0,203800,203800,1.0,203800),
    ('34a30b9a-8cc5-11ed-8522-d7213680d5c1','576fa966-8cbc-11ed-b63e-630258790f77',daterange('2022-05-01', '2022-07-31', '[]'),203800,1.0,203800,203800,1.0,203800),
    ('34a30c26-8cc5-11ed-8523-c300697748b1','576fa9b6-8cbc-11ed-b63f-8bf378c64b67',daterange('2022-05-01', '2022-07-31', '[]'),203800,0.81,165500,203800,0.81,165500),
    ('34a30c9e-8cc5-11ed-8524-8312859841f1','576fe070-8cbc-11ed-b640-675064ab6753',daterange('2022-05-01', '2022-07-31', '[]'),203800,0.70,142500,203800,0.70,142500),


    --DAYCARE_FIVE_YEAR_OLDS
    ('d6e4d3e4-7243-11ed-b713-d7331ee90177','a867f3ec-5368-11ed-8d0b-b31b59a849a1',daterange('2022-05-01', '2022-07-31', '[]'),40600,1.0,40600,40600,1.0,40600),
    ('d6e4d452-7243-11ed-b714-6f029d4ffcda','c73c5cea-5368-11ed-8d0c-8fb44e947bc6',daterange('2022-05-01', '2022-07-31', '[]'),40600,1.0,40600,40600,1.0,40600),
    ('d6e4d4c0-7243-11ed-b715-e3dca8f03b28','267946fa-6fb1-11ed-8c85-4725b99d6549',daterange('2022-05-01', '2022-07-31', '[]'),54100,1.0,54100,54100,1.0,54100),
    ('d6e4d524-7243-11ed-b716-137f5cc13e7f','26794f24-6fb1-11ed-8c86-1f58d027951d',daterange('2022-05-01', '2022-07-31', '[]'),40100,1.0,40100,40100,1.0,40100),

    --DAYCARE_PART_TIME_FIVE_YEAR_OLDS
    ('84b81f90-763a-11ed-ae48-3b9861857080','153a6364-536a-11ed-8d0f-d7a4b2b860f1',daterange('2022-05-01', '2022-07-31', '[]'),130800,1.0,130800,130800,1.0,130800),
    ('84b8d73c-763a-11ed-ae49-b7cdbebbe258','325c97b4-536a-11ed-8d10-4b3a543573f7',daterange('2022-05-01', '2022-07-31', '[]'),130800,1.0,130800,130800,1.0,130800),
    ('84b8d886-763a-11ed-ae4a-3b2e8e6e0011','73976b22-536b-11ed-8d13-57ff6a3494ef',daterange('2022-05-01', '2022-07-31', '[]'),130800,1.0,130800,130800,1.0,130800),
    ('84b8d91c-763a-11ed-ae4b-1ff0486ecc74','3172d514-536c-11ed-8d15-dfe8e83094cd',daterange('2022-05-01', '2022-07-31', '[]'),130800,0.83,108300,130800,0.83,108300),
    ('84b8d9a8-763a-11ed-ae4c-7ba11b1d73d0','e94a8bae-536d-11ed-8d17-9b8007da5dec',daterange('2022-05-01', '2022-07-31', '[]'),130800,0.72,94700,130800,0.72,94700),
    ('84b8dd40-763a-11ed-ae4d-cfde9fbbf06e','a2877f1a-7087-11ed-a559-4fa06829e6fd',daterange('2022-05-01', '2022-07-31', '[]'),174300,1.0,174300,174300,1.0,174300),
    ('84b8ddcc-763a-11ed-ae4e-279203f753a7','a2878c8a-7087-11ed-a55a-ffa38e3847aa',daterange('2022-05-01', '2022-07-31', '[]'),174300,1.0,174300,174300,1.0,174300),
    ('84b8de4e-763a-11ed-ae4f-af84d5dcfa42','a2878d2a-7087-11ed-a55b-2f42cae1743e',daterange('2022-05-01', '2022-07-31', '[]'),174300,0.83,144300,174300,0.83,144300),
    ('84b8deda-763a-11ed-ae50-17d54a5f6049','a2878d84-7087-11ed-a55c-53988f52a3bf',daterange('2022-05-01', '2022-07-31', '[]'),174300,0.72,126200,174300,0.72,126200),
    ('84b8df5c-763a-11ed-ae51-e38f0b527771','a2879072-7087-11ed-a55d-6f35f6f6df2f',daterange('2022-05-01', '2022-07-31', '[]'),130900,1.0,130900,130900,1.0,130900),
    ('84b8dfde-763a-11ed-ae52-eb02c82ae38c','a28790e0-7087-11ed-a55e-0700a24f1119',daterange('2022-05-01', '2022-07-31', '[]'),130900,1.0,130900,130900,1.0,130900),
    ('84b8e060-763a-11ed-ae53-dbd1fa2bd0c6','a2879554-7087-11ed-a55f-df43279a1ac6',daterange('2022-05-01', '2022-07-31', '[]'),130900,0.82,107000,130900,0.82,107000),
    ('84b8e1e6-763a-11ed-ae54-778634a0b256','a2879860-7087-11ed-a560-2b2470e04de6',daterange('2022-05-01', '2022-07-31', '[]'),130900,0.72,93600,130900,0.72,93600),
    ('9ea7da5c-8ce3-11ed-94b6-1732d64c5e6b','99cd40ce-8cd6-11ed-ad37-c7c08035a833',daterange('2022-05-01', '2022-07-31', '[]'),175900,1.0,175900,175900,1.0,175900),
    ('9ea7e27c-8ce3-11ed-94b7-c3bab8294856','99cd517c-8cd6-11ed-ad38-7b2aa4f8b7be',daterange('2022-05-01', '2022-07-31', '[]'),175900,1.0,175900,175900,1.0,175900),
    ('9ea7e34e-8ce3-11ed-94b8-0baa53d3b339','99cd5938-8cd6-11ed-ad39-9fefd8a84f78',daterange('2022-05-01', '2022-07-31', '[]'),175900,0.81,142100,175900,0.81,142100),
    ('9ea7e3e4-8ce3-11ed-94b9-db8c35229d49','99cd59ec-8cd6-11ed-ad3a-bbf83318f2f1',daterange('2022-05-01', '2022-07-31', '[]'),175900,0.69,121800,175900,0.69,121800),
    ('9ea7e470-8ce3-11ed-94ba-b3b605069c7d','99cd5a6e-8cd6-11ed-ad3b-e78efee7f61a',daterange('2022-05-01', '2022-07-31', '[]'),193900,1.0,193900,193900,1.0,193900),
    ('9ea7e4fc-8ce3-11ed-94bb-efdd642a4842','99cd5ae6-8cd6-11ed-ad3c-9f9e7d8ac30e',daterange('2022-05-01', '2022-07-31', '[]'),193900,1.0,193900,193900,1.0,193900),
    ('9ea7e588-8ce3-11ed-94bc-bb124f4d1b61','99cd5b9a-8cd6-11ed-ad3d-8f81b097a236',daterange('2022-05-01', '2022-07-31', '[]'),193900,0.80,155600,193900,0.80,155600),
    ('9ea7e60a-8ce3-11ed-94bd-33b03210c4bc','99cd5bf4-8cd6-11ed-ad3e-77990db3e351',daterange('2022-05-01', '2022-07-31', '[]'),193900,0.68,132600,193900,0.68,132600),

    --OTHER_ONES - SET TO DEFAULT VOUCHER VALUE
    ('3937fae2-7471-11ed-b365-3b1a552a3f41','86ef7370-bf85-11eb-91e7-6fcd728c518d',daterange('2022-05-01', '2022-07-31', '[]'),81200,1.0,81200,122600,1.0,122600),
    ('3938855c-7471-11ed-b366-bbf21c25c6cd','50359280-b961-11eb-b523-237115533645',daterange('2022-05-01', '2022-07-31', '[]'),81200,1.0,81200,122600,1.0,122600),
    ('393886a6-7471-11ed-b367-434527b4c232','5e82f704-4f8f-11ed-8be5-bbe76169415f',daterange('2022-05-01', '2022-07-31', '[]'),81200,1.0,81200,122600,1.0,122600),
    ('39388732-7471-11ed-b368-cf973e58ccb9','50359334-b961-11eb-b525-f3febdfea5d3',daterange('2022-05-01', '2022-07-31', '[]'),81200,1.0,81200,122600,1.0,122600),
    ('393887f0-7471-11ed-b369-93b0eda5efc5','5035938e-b961-11eb-b526-6b30323c87a8',daterange('2022-05-01', '2022-07-31', '[]'),81200,1.0,81200,122600,1.0,122600),
    ('39388872-7471-11ed-b36a-c7b70a51af76','e549007e-4f91-11ed-8beb-2f7e83af8ba6',daterange('2022-05-01', '2022-07-31', '[]'),81200,1.0,81200,122600,1.0,122600),
    ('39388b38-7471-11ed-b36b-571daa9cdf79','bc6a44ec-fa74-11eb-9a2c-73b53c2af869',daterange('2022-05-01', '2022-07-31', '[]'),81200,1.0,81200,122600,1.0,122600),
    ('39388bba-7471-11ed-b36c-8b449aae17e9','bc6a45a0-fa74-11eb-9a2e-fb411a8588da',daterange('2022-05-01', '2022-07-31', '[]'),81200,1.0,81200,122600,1.0,122600),
    ('39388c32-7471-11ed-b36d-e7ab57020679','ff6ddcd4-fa8a-11eb-8592-2f2b4e398fcb',daterange('2022-05-01', '2022-07-31', '[]'),81200,1.0,81200,122600,1.0,122600),
    ('39388caa-7471-11ed-b36e-f3fa6164b716','4d246a6c-4f92-11ed-8bed-2f5b3226e682',daterange('2022-05-01', '2022-07-31', '[]'),81200,1.0,81200,122600,1.0,122600),
    ('39388d40-7471-11ed-b36f-3fa1fe3b1086','d6d5a660-4f90-11ed-8be9-6f76cd90c246',daterange('2022-05-01', '2022-07-31', '[]'),81200,1.0,81200,122600,1.0,122600),
    ('39388db8-7471-11ed-b370-c70d7dc7a193','1b4413f6-d99d-11eb-89ac-a3a978104bce',daterange('2022-05-01', '2022-07-31', '[]'),81200,1.0,81200,122600,1.0,122600),

    -- 2022-08-01 - 2023-02-28

    --DAYCARE
    --DAYCARE_PART_TIME
    ('a51a05ce-148c-11ed-be1e-138f17756ad7','50358394-b961-11eb-b51f-67ac436e5636',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51aacf4-148c-11ed-be1e-733f9c20ff61','86ef70a0-bf85-11eb-91e6-1fb57a101161',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51aaf88-148c-11ed-be1e-db2e9883417e','503590f0-b961-11eb-b520-53740af3f7ee',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51ab19a-148c-11ed-be1e-4be88e69e52e','503591ae-b961-11eb-b521-1fca99358eef',daterange('2022-08-01', '2023-02-28', '[]'),91100,0.75,68300,154900,0.75,116200),
    ('a51abaa0-148c-11ed-be1e-931156918f24','503592da-b961-11eb-b524-7f27c780d83a',daterange('2022-08-01', '2023-02-28', '[]'),91100,0.6,54700,154900,0.6,92900),
    ('cdbaef90-5364-11ed-8d0a-07b4d2f136e5','85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0',daterange('2022-08-01', '2023-02-28', '[]'),91100,0.6,54700,154900,0.6,92900),
    ('7f508678-537b-11ed-aabc-e70dcfac9cad','684e4f0a-537b-11ed-aabb-d33da20b2117',daterange('2022-08-01', '2023-02-28', '[]'),136700,1.0,136700,263300,1.0,263300),
    ('e353987c-537b-11ed-aabe-7f6f40f38599','cc81be76-537b-11ed-aabd-d7571a7aed5f',daterange('2022-08-01', '2023-02-28', '[]'),136700,1.0,136700,263300,1.0,263300),
    ('eb28f84c-5382-11ed-b847-b355c925e27b','b244ea0e-5382-11ed-b846-d7ebbaaf5fd5',daterange('2022-08-01', '2023-02-28', '[]'),136700,0.75,102500,263300,0.75,197500),
    ('ddcae960-5384-11ed-b849-839f0dabcdbe','aed93b48-5384-11ed-b848-435687237b8e',daterange('2022-08-01', '2023-02-28', '[]'),136700,0.6,82000,263300,0.6,158000),
    ('5a0f5cc0-5387-11ed-b84b-4f8d5bbe2d9f','4062cdca-5387-11ed-b84a-6fc9185df882',daterange('2022-08-01', '2023-02-28', '[]'),154900,1.0,154900,263300,1.0,263300),
    ('ece6571a-5387-11ed-b84d-27fd4e7ce997','d6e2a50e-5387-11ed-b84c-b7756f2c8248',daterange('2022-08-01', '2023-02-28', '[]'),154900,1.0,154900,263300,1.0,263300),
    ('59a8e7c8-5388-11ed-b84f-3baba6888e6e','3e1852be-5388-11ed-b84e-e7d4a93b269e',daterange('2022-08-01', '2023-02-28', '[]'),154900,0.75,116200,263300,0.75,197500),
    ('c6f1b472-5388-11ed-b851-c3900328e2e4','b01d3d66-5388-11ed-b850-3bbd85d56f15',daterange('2022-08-01', '2023-02-28', '[]'),154900,0.6,92900,263300,0.6,158000),
    ('1e68df8a-6b00-11ed-bdb4-df44abd9caa0','ac879588-6afe-11ed-b107-b3c1585b8c2a',daterange('2022-08-01', '2023-02-28', '[]'),121400,1.0,121400,121400,1.0,121400),
    ('1e6987be-6b00-11ed-bdb5-676e2e55d011','ac879d76-6afe-11ed-b108-9fb58b2968d5',daterange('2022-08-01', '2023-02-28', '[]'),121400,1.0,121400,121400,1.0,121400),
    ('1e6988e0-6b00-11ed-bdb6-3f91824eb8e3','ac879dee-6afe-11ed-b109-c7ee3c340bf7',daterange('2022-08-01', '2023-02-28', '[]'),121400,0.75,91100,121400,0.75,91100),
    ('1e698958-6b00-11ed-bdb7-5b0d2654eff3','ac879f24-6afe-11ed-b10d-3fe2c69846ef',daterange('2022-08-01', '2023-02-28', '[]'),121400,0.6,72800,121400,0.6,72800),
    ('1e6989c6-6b00-11ed-bdb8-7fe5bde22c43','ac879e48-6afe-11ed-b10a-9791c734c144',daterange('2022-08-01', '2023-02-28', '[]'),90000,1.0,90000,90000,1.0,90000),
    ('1e698a34-6b00-11ed-bdb9-2bc6dfb887e0','ac879e8e-6afe-11ed-b10b-436cbc3d57e9',daterange('2022-08-01', '2023-02-28', '[]'),90000,1.0,90000,90000,1.0,90000),
    ('1e698a98-6b00-11ed-bdba-f3ed1d15f96c','ac879ede-6afe-11ed-b10c-636ae14462ef',daterange('2022-08-01', '2023-02-28', '[]'),90000,0.75,67500,90000,0.75,67500),
    ('1e698b06-6b00-11ed-bdbb-07fc5478868e','ac879f74-6afe-11ed-b10e-2bf83788be72',daterange('2022-08-01', '2023-02-28', '[]'),90000,0.6,54000,90000,0.6,54000),

    --DAYCARE_FIVE_YEAR_OLDS
    ('ea01ccd8-5368-11ed-8d0d-8b4935d05e97','a867f3ec-5368-11ed-8d0b-b31b59a849a1',daterange('2022-08-01', '2023-02-28', '[]'),41000,1.0,41000,41000,1.0,41000),
    ('fd502424-5368-11ed-8d0e-d7e0ea1247b9','c73c5cea-5368-11ed-8d0c-8fb44e947bc6',daterange('2022-08-01', '2023-02-28', '[]'),41000,1.0,41000,41000,1.0,41000),
    ('b8159630-6fb2-11ed-9bd6-df1d69c40100','267946fa-6fb1-11ed-8c85-4725b99d6549',daterange('2022-08-01', '2023-02-28', '[]'),54600,1.0,54600,54600,1.0,54600),
    ('b816805e-6fb2-11ed-9bd7-f3c20b046d31','26794f24-6fb1-11ed-8c86-1f58d027951d',daterange('2022-08-01', '2023-02-28', '[]'),40500,1.0,40500,40500,1.0,40500),

    --DAYCARE_PART_TIME_FIVE_YEAR_OLDS
    ('4c67845c-536a-11ed-8d11-97b77098a2ac','153a6364-536a-11ed-8d0f-d7a4b2b860f1',daterange('2022-08-01', '2023-02-28', '[]'),132100,1.0,132100,132100,1.0,132100),
    ('6106a848-536a-11ed-8d12-9b8d0bb52ef5','325c97b4-536a-11ed-8d10-4b3a543573f7',daterange('2022-08-01', '2023-02-28', '[]'),132100,1.0,132100,132100,1.0,132100),
    ('931b15a2-536b-11ed-8d14-f743f93c7f0d','73976b22-536b-11ed-8d13-57ff6a3494ef',daterange('2022-08-01', '2023-02-28', '[]'),132100,1.0,132100,132100,1.0,132100),
    ('4a1f4610-536c-11ed-8d16-ef79cd92be44','3172d514-536c-11ed-8d15-dfe8e83094cd',daterange('2022-08-01', '2023-02-28', '[]'),132100,0.83,109300,132100,0.83,109300),
    ('00e6e6a4-536e-11ed-8d18-c74c7ee8eee7','e94a8bae-536d-11ed-8d17-9b8007da5dec',daterange('2022-08-01', '2023-02-28', '[]'),132100,0.72,95700,132100,0.72,95700),
    ('cdd6c148-7088-11ed-a759-cb6f7e91fff1','a2877f1a-7087-11ed-a559-4fa06829e6fd',daterange('2022-08-01', '2023-02-28', '[]'),176000,1.0,176000,176000,1.0,176000),
    ('cdd7653a-7088-11ed-a75a-6bd92b763473','a2878c8a-7087-11ed-a55a-ffa38e3847aa',daterange('2022-08-01', '2023-02-28', '[]'),176000,1.0,176000,176000,1.0,176000),
    ('cdd7663e-7088-11ed-a75b-ef5fb52280a9','a2878d2a-7087-11ed-a55b-2f42cae1743e',daterange('2022-08-01', '2023-02-28', '[]'),176000,0.83,145700,176000,0.83,145700),
    ('cdd766b6-7088-11ed-a75c-ff8cc1bb61f7','a2878d84-7087-11ed-a55c-53988f52a3bf',daterange('2022-08-01', '2023-02-28', '[]'),176000,0.72,127400,176000,0.72,127400),
    ('cdd7672e-7088-11ed-a75d-c7357b09b35c','a2879072-7087-11ed-a55d-6f35f6f6df2f',daterange('2022-08-01', '2023-02-28', '[]'),130500,1.0,130500,130500,1.0,130500),
    ('cdd7679c-7088-11ed-a75e-bf7d24c40ca5','a28790e0-7087-11ed-a55e-0700a24f1119',daterange('2022-08-01', '2023-02-28', '[]'),130500,1.0,130500,130500,1.0,130500),
    ('cdd7680a-7088-11ed-a75f-fbdc40b677b6','a2879554-7087-11ed-a55f-df43279a1ac6',daterange('2022-08-01', '2023-02-28', '[]'),130500,0.83,108000,130500,0.83,108000),
    ('cdd7686e-7088-11ed-a760-df0ced05f7d6','a2879860-7087-11ed-a560-2b2470e04de6',daterange('2022-08-01', '2023-02-28', '[]'),130500,0.72,94500,130500,0.72,94500),
    ('24d7e452-8ce2-11ed-94ae-13346d5f9b33','99cd40ce-8cd6-11ed-ad37-c7c08035a833',daterange('2022-08-01', '2023-02-28', '[]'),177700,1.0,177700,177700,1.0,177700),
    ('24d7fb2c-8ce2-11ed-94af-e7556175da7b','99cd517c-8cd6-11ed-ad38-7b2aa4f8b7be',daterange('2022-08-01', '2023-02-28', '[]'),177700,1.0,177700,177700,1.0,177700),
    ('24d7fc08-8ce2-11ed-94b0-1ba947e14fc4','99cd5938-8cd6-11ed-ad39-9fefd8a84f78',daterange('2022-08-01', '2023-02-28', '[]'),177700,0.81,143500,177700,0.81,143500),
    ('24d7fca8-8ce2-11ed-94b1-83aa509283a6','99cd59ec-8cd6-11ed-ad3a-bbf83318f2f1',daterange('2022-08-01', '2023-02-28', '[]'),177700,0.69,123000,177700,0.69,123000),
    ('24d7fd3e-8ce2-11ed-94b2-37d9c6bd3bfb','99cd5a6e-8cd6-11ed-ad3b-e78efee7f61a',daterange('2022-08-01', '2023-02-28', '[]'),195900,1.0,195900,195900,1.0,195900),
    ('24d7fdca-8ce2-11ed-94b3-eb8fea4ede07','99cd5ae6-8cd6-11ed-ad3c-9f9e7d8ac30e',daterange('2022-08-01', '2023-02-28', '[]'),195900,1.0,195900,195900,1.0,195900),
    ('24d7fe56-8ce2-11ed-94b4-4f8904fa88cd','99cd5b9a-8cd6-11ed-ad3d-8f81b097a236',daterange('2022-08-01', '2023-02-28', '[]'),195900,0.80,157200,195900,0.80,157200),
    ('24d80aea-8ce2-11ed-94b5-7bc627e82c21','99cd5bf4-8cd6-11ed-ad3e-77990db3e351',daterange('2022-08-01', '2023-02-28', '[]'),195900,0.68,133900,195900,0.68,133900),

    --PRESCHOOL
    ('a51acacc-148c-11ed-be1e-6f6c58c226d4','bc6a4550-fa74-11eb-9a2d-035acd5db9aa',daterange('2022-08-01', '2023-02-28', '[]'),50900,1.0,50900,50900,1.0,50900),
    ('7ea85b54-4f90-11ed-8be8-b7c388bb843a','5c21d452-4f90-11ed-8be7-bf748cc343bf',daterange('2022-08-01', '2023-02-28', '[]'),50900,1.0,50900,50900,1.0,50900),
    ('be76e8a8-536f-11ed-8d1a-771bf17e50e9','a678968e-536f-11ed-8d19-5715e16c8489',daterange('2022-08-01', '2023-02-28', '[]'),50900,1.0,50900,50900,1.0,50900),

    --PRESCHOOL_DAYCARE
    ('a51ac130-148c-11ed-be1e-9fbce6d355c2','0bfc6c92-ff2a-11eb-a785-2724e8e5e7ee',daterange('2022-08-01', '2023-02-28', '[]'),142000,1.0,142000,142000,1.0,142000),
    ('a51ac31a-148c-11ed-be1e-e3e34511e46f','503593e8-b961-11eb-b527-a3dcdfb628ec',daterange('2022-08-01', '2023-02-28', '[]'),142000,1.0,142000,142000,1.0,142000),
    ('a51ac504-148c-11ed-be1e-0f887ecb00af','50359442-b961-11eb-b528-df3290c0d63e',daterange('2022-08-01', '2023-02-28', '[]'),142000,1.0,142000,142000,1.0,142000),
    ('a51ac6ee-148c-11ed-be1e-ebc76f5037c4','bc6a42d0-fa74-11eb-9a2b-d315a7916074',daterange('2022-08-01', '2023-02-28', '[]'),142000,0.84,119200,142000,0.84,119200),
    ('a51ab398-148c-11ed-be1e-df739d9aecb9','50359212-b961-11eb-b522-074fb05f7086',daterange('2022-08-01', '2023-02-28', '[]'),142000,0.74,105600,142000,0.74,105600),
    ('f91efad4-5371-11ed-8d1c-9b47b58ecc8d','e1d0d78a-5371-11ed-8d1b-cb612aa6780b',daterange('2022-08-01', '2023-02-28', '[]'),142000,1.0,142000,142000,1.0,142000),
    ('975e4498-5372-11ed-8d1e-9313c98eed17','7b2ff2e4-5372-11ed-8d1d-5f26eff8b49b',daterange('2022-08-01', '2023-02-28', '[]'),142000,1.0,142000,142000,1.0,142000),
    ('1812f160-5373-11ed-8d20-cf346dae72fa','0004e312-5373-11ed-8d1f-575317e00afc',daterange('2022-08-01', '2023-02-28', '[]'),142000,0.84,119200,142000,0.84,119200),
    ('8698eb1c-5373-11ed-8d22-afd0f4472e7b','6fdc7ad8-5373-11ed-8d21-87047833ff0b',daterange('2022-08-01', '2023-02-28', '[]'),142000,0.74,105600,142000,0.74,105600),
    ('af55ca40-8cc4-11ed-8515-5f67e4373fd4','576f6cf8-8cbc-11ed-b639-afa50c9355c1',daterange('2022-08-01', '2023-02-28', '[]'),187600,1.0,187600,187600,1.0,187600),
    ('af578452-8cc4-11ed-8516-6b2e30ad77c0','576fa380-8cbc-11ed-b63a-8bb1a5b587a0',daterange('2022-08-01', '2023-02-28', '[]'),187600,1.0,187600,187600,1.0,187600),
    ('af578600-8cc4-11ed-8517-9f0e14016ab5','576fa452-8cbc-11ed-b63b-67fc666e0fa8',daterange('2022-08-01', '2023-02-28', '[]'),187600,0.82,153400,187600,0.82,153400),
    ('af5786f0-8cc4-11ed-8518-234ea248d6a3','576fa4ac-8cbc-11ed-b63c-2ff2276ab9f2',daterange('2022-08-01', '2023-02-28', '[]'),187600,0.71,132900,187600,0.71,132900),
    ('af5787d6-8cc4-11ed-8519-67b722276df1','576fa8f8-8cbc-11ed-b63d-8fb27ef151a1',daterange('2022-08-01', '2023-02-28', '[]'),205800,1.0,205800,205800,1.0,205800),
    ('af5788d0-8cc4-11ed-851a-271fb62f9d14','576fa966-8cbc-11ed-b63e-630258790f77',daterange('2022-08-01', '2023-02-28', '[]'),205800,1.0,205800,205800,1.0,205800),
    ('af5789a2-8cc4-11ed-851b-435a07707160','576fa9b6-8cbc-11ed-b63f-8bf378c64b67',daterange('2022-08-01', '2023-02-28', '[]'),205800,0.81,167100,205800,0.81,167100),
    ('af578a6a-8cc4-11ed-851c-43a9077a1de9','576fe070-8cbc-11ed-b640-675064ab6753',daterange('2022-08-01', '2023-02-28', '[]'),205800,0.7,143800,205800,0.7,143800),

    --OTHER_ONES - SET TO DEFAULT VOUCHER VALUE
    ('a51ab5b4-148c-11ed-be1e-8785a13fca88','86ef7370-bf85-11eb-91e7-6fcd728c518d',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51ab870-148c-11ed-be1e-6fcae4f7e94b','50359280-b961-11eb-b523-237115533645',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('93660830-4f8f-11ed-8be6-8b783396d6b7','5e82f704-4f8f-11ed-8be5-bbe76169415f',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51abc9e-148c-11ed-be1e-e7efda66457b','50359334-b961-11eb-b525-f3febdfea5d3',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51abf3c-148c-11ed-be1e-2f734e058208','5035938e-b961-11eb-b526-6b30323c87a8',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('0bde3d76-4f92-11ed-8bec-0bbb7f91fc71','e549007e-4f91-11ed-8beb-2f7e83af8ba6',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51ac8e2-148c-11ed-be1e-db830daa047b','bc6a44ec-fa74-11eb-9a2c-73b53c2af869',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51acd56-148c-11ed-be1e-17764348bca7','bc6a45a0-fa74-11eb-9a2e-fb411a8588da',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51acf5e-148c-11ed-be1e-836c2b35ecb6','ff6ddcd4-fa8a-11eb-8592-2f2b4e398fcb',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('66a28654-4f92-11ed-8bee-077eea087eb0','4d246a6c-4f92-11ed-8bed-2f5b3226e682',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('fad5ddb4-4f90-11ed-8bea-8b352f1dca97','d6d5a660-4f90-11ed-8be9-6f76cd90c246',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51ad148-148c-11ed-be1e-0bdf6a5141f9','1b4413f6-d99d-11eb-89ac-a3a978104bce',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),
    ('7cc131c5-eccc-40f0-90f0-ff90155add2a','25d79184-e415-4fe3-bac6-3b719b050685',daterange('2022-08-01', '2023-02-28', '[]'),91100,1.0,91100,154900,1.0,154900),


    -- 2023-03-01 -> 2023-08-31

    --DAYCARE
    --DAYCARE_PART_TIME

    ('14a95a1c-c4ae-11ed-b008-23a00c242386','50358394-b961-11eb-b51f-67ac436e5636',daterange('2023-03-01', '2023-08-31', '[]'),93700,1.0,93700,159300,1.0,159300),
    ('14a96d90-c4ae-11ed-b009-3bc5d0e85a75','86ef70a0-bf85-11eb-91e6-1fb57a101161',daterange('2023-03-01', '2023-08-31', '[]'),93700,1.0,93700,159300,1.0,159300),
    ('14a970d8-c4ae-11ed-b00a-17d6484c0930','503590f0-b961-11eb-b520-53740af3f7ee',daterange('2023-03-01', '2023-08-31', '[]'),93700,1.0,93700,159300,1.0,159300),
    ('14a97178-c4ae-11ed-b00b-a386419a5763','503591ae-b961-11eb-b521-1fca99358eef',daterange('2023-03-01', '2023-08-31', '[]'),93700,0.75,70300,159300,0.75,119500),
    ('14a97506-c4ae-11ed-b00d-17ebdd64cf94','85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0',daterange('2023-03-01', '2023-08-31', '[]'),93700,0.6,56200,159300,0.6,95600),
    ('893682a2-c4b7-11ed-9b71-c71d75a24f0e','684e4f0a-537b-11ed-aabb-d33da20b2117',daterange('2023-03-01', '2023-08-31', '[]'),140600,1.0,140600,238900,1.0,238900),
    ('8936dc8e-c4b7-11ed-9b72-8be0b969f415','cc81be76-537b-11ed-aabd-d7571a7aed5f',daterange('2023-03-01', '2023-08-31', '[]'),140600,1.0,140600,238900,1.0,238900),
    ('8936e030-c4b7-11ed-9b73-632398fee997','b244ea0e-5382-11ed-b846-d7ebbaaf5fd5',daterange('2023-03-01', '2023-08-31', '[]'),140600,0.75,105400,238900,0.75,179200),
    ('8936e99a-c4b7-11ed-9b74-7751004a089e','aed93b48-5384-11ed-b848-435687237b8e',daterange('2023-03-01', '2023-08-31', '[]'),140600,0.6,84300,238900,0.6,143400),
    ('37d0ffbc-c4b9-11ed-9b75-53d350d3e6fe','4062cdca-5387-11ed-b84a-6fc9185df882',daterange('2023-03-01', '2023-08-31', '[]'),159300,1.0,159300,270800,1.0,270800),
    ('37d116e6-c4b9-11ed-9b76-ef33393e0964','d6e2a50e-5387-11ed-b84c-b7756f2c8248',daterange('2023-03-01', '2023-08-31', '[]'),159300,1.0,159300,270800,1.0,270800),
    ('37d210a0-c4b9-11ed-9b77-2794b9ab5a32','3e1852be-5388-11ed-b84e-e7d4a93b269e',daterange('2023-03-01', '2023-08-31', '[]'),159300,0.75,119500,270800,0.75,203100),
    ('37d212d0-c4b9-11ed-9b78-e739b2a3a090','b01d3d66-5388-11ed-b850-3bbd85d56f15',daterange('2023-03-01', '2023-08-31', '[]'),159300,0.6,95600,270800,0.6,162500),
    ('14a97204-c4ae-11ed-b00c-27112c0e0d80','503592da-b961-11eb-b524-7f27c780d83a',daterange('2023-03-01', '2023-08-31', '[]'),93700,0.6,56200,159300,0.6,95600),

    --DAYCARE_FIVE_YEAR_OLDS

    ('62e1ded2-c4b0-11ed-b011-eb91e20e7d1a','a867f3ec-5368-11ed-8d0b-b31b59a849a1',daterange('2023-03-01', '2023-08-31', '[]'),42200,1.0,42200,42200,1.0,42200),
    ('62e1edbe-c4b0-11ed-b012-1f618f5cd1ac','c73c5cea-5368-11ed-8d0c-8fb44e947bc6',daterange('2023-03-01', '2023-08-31', '[]'),42200,1.0,42200,42200,1.0,42200),


    --DAYCARE_PART_TIME_FIVE_YEAR_OLDS

    ('85a760bc-c4c5-11ed-9ba0-b3287f9b5ea4','153a6364-536a-11ed-8d0f-d7a4b2b860f1',daterange('2023-03-01', '2023-08-31', '[]'),135900,1.0,135900,135900,1.0,135900),
    ('85a77052-c4c5-11ed-9ba1-7b4762ad203f','325c97b4-536a-11ed-8d10-4b3a543573f7',daterange('2023-03-01', '2023-08-31', '[]'),135900,1.0,135900,135900,1.0,135900),
    ('85a7711a-c4c5-11ed-9ba2-2338e507e6f8','73976b22-536b-11ed-8d13-57ff6a3494ef',daterange('2023-03-01', '2023-08-31', '[]'),135900,1.0,135900,135900,1.0,135900),
    ('85a77476-c4c5-11ed-9ba3-d795cf8bc157','3172d514-536c-11ed-8d15-dfe8e83094cd',daterange('2023-03-01', '2023-08-31', '[]'),135900,0.83,112500,135900,0.83,112500),
    ('85a77516-c4c5-11ed-9ba4-bb70f8a86e3b','e94a8bae-536d-11ed-8d17-9b8007da5dec',daterange('2023-03-01', '2023-08-31', '[]'),135900,0.72,98400,135900,0.72,98400),
    ('5ffa13a8-c4c7-11ed-9bad-83ba890b3e7b','99cd40ce-8cd6-11ed-ad37-c7c08035a833',daterange('2023-03-01', '2023-08-31', '[]'),182800,1.0,182800,182800,1.0,182800),
    ('5ffa24a6-c4c7-11ed-9bae-3b419dd950f0','99cd517c-8cd6-11ed-ad38-7b2aa4f8b7be',daterange('2023-03-01', '2023-08-31', '[]'),182800,1.0,182800,182800,1.0,182800),
    ('5ffa2582-c4c7-11ed-9baf-e35e888b8dca','99cd5938-8cd6-11ed-ad39-9fefd8a84f78',daterange('2023-03-01', '2023-08-31', '[]'),182800,0.81,147600,182800,0.81,147600),
    ('5ffa2622-c4c7-11ed-9bb0-4f11d94886dd','99cd59ec-8cd6-11ed-ad3a-bbf83318f2f1',daterange('2023-03-01', '2023-08-31', '[]'),182800,0.69,126500,182800,0.69,126500),
    ('d240bef8-c4c7-11ed-9bb1-bfb6bcd95765','99cd5a6e-8cd6-11ed-ad3b-e78efee7f61a',daterange('2023-03-01', '2023-08-31', '[]'),201500,1.0,201500,201500,1.0,201500),
    ('d2417352-c4c7-11ed-9bb2-bf1492cd563b','99cd5ae6-8cd6-11ed-ad3c-9f9e7d8ac30e',daterange('2023-03-01', '2023-08-31', '[]'),201500,1.0,201500,201500,1.0,201500),
    ('d2417564-c4c7-11ed-9bb3-f32e5580d861','99cd5b9a-8cd6-11ed-ad3d-8f81b097a236',daterange('2023-03-01', '2023-08-31', '[]'),201500,0.80,161700,201500,0.80,161700),
    ('d2417b18-c4c7-11ed-9bb4-ab6034ec8045','99cd5bf4-8cd6-11ed-ad3e-77990db3e351',daterange('2023-03-01', '2023-08-31', '[]'),201500,0.68,137800,201500,0.68,137800),

    --PRESCHOOL

    ('b165fde6-c4af-11ed-b00e-b7bc9a06a7d3','bc6a4550-fa74-11eb-9a2d-035acd5db9aa',daterange('2023-03-01', '2023-08-31', '[]'),52400,1.0,52400,52400,1.0,52400),
    ('b1660d22-c4af-11ed-b00f-0b69ed012f69','5c21d452-4f90-11ed-8be7-bf748cc343bf',daterange('2023-03-01', '2023-08-31', '[]'),52400,1.0,52400,52400,1.0,52400),
    ('b1661056-c4af-11ed-b010-2b6ba9964cb7','a678968e-536f-11ed-8d19-5715e16c8489',daterange('2023-03-01', '2023-08-31', '[]'),52400,1.0,52400,52400,1.0,52400),

    --PRESCHOOL_DAYCARE

    ('638d2c9e-c4bd-11ed-9b8d-b3bfa935ff16','0bfc6c92-ff2a-11eb-a785-2724e8e5e7ee',daterange('2023-03-01', '2023-08-31', '[]'),146100,1.0,146100,146100,1.0,146100),
    ('638d39be-c4bd-11ed-9b8e-bf8ba3c06fa1','503593e8-b961-11eb-b527-a3dcdfb628ec',daterange('2023-03-01', '2023-08-31', '[]'),146100,1.0,146100,146100,1.0,146100),
    ('638d3d42-c4bd-11ed-9b8f-070c7f8cf124','50359442-b961-11eb-b528-df3290c0d63e',daterange('2023-03-01', '2023-08-31', '[]'),146100,1.0,146100,146100,1.0,146100),
    ('638d3dec-c4bd-11ed-9b90-d762fdf746ef','bc6a42d0-fa74-11eb-9a2b-d315a7916074',daterange('2023-03-01', '2023-08-31', '[]'),146100,0.84,122700,146100,0.84,122700),
    ('638d410c-c4bd-11ed-9b91-6b7073b728fd','50359212-b961-11eb-b522-074fb05f7086',daterange('2023-03-01', '2023-08-31', '[]'),146100,0.74,108600,146100,0.60,87700),
    ('309e11a8-c4c3-11ed-9b9a-7b643eae8cea','e1d0d78a-5371-11ed-8d1b-cb612aa6780b',daterange('2023-03-01', '2023-08-31', '[]'),146100,1.0,146100,146100,1.0,146100),
    ('309e20e4-c4c3-11ed-9b9b-3f1caf24374f','7b2ff2e4-5372-11ed-8d1d-5f26eff8b49b',daterange('2023-03-01', '2023-08-31', '[]'),146100,1.0,146100,146100,1.0,146100),
    ('309e2486-c4c3-11ed-9b9c-039f51de7891','0004e312-5373-11ed-8d1f-575317e00afc',daterange('2023-03-01', '2023-08-31', '[]'),146100,0.84,122700,146100,0.84,122700),
    ('309e294a-c4c3-11ed-9b9d-376cedcd0eeb','6fdc7ad8-5373-11ed-8d21-87047833ff0b',daterange('2023-03-01', '2023-08-31', '[]'),146100,0.74,108600,146100,0.60,87700),
    ('bf53d5b8-c4be-11ed-9b92-cbd2417c874d','576f6cf8-8cbc-11ed-b639-afa50c9355c1',daterange('2023-03-01', '2023-08-31', '[]'),193000,1.0,193000,193000,1.0,193000),
    ('bf542c20-c4be-11ed-9b93-1f417a4a2cb0','576fa380-8cbc-11ed-b63a-8bb1a5b587a0',daterange('2023-03-01', '2023-08-31', '[]'),193000,1.0,193000,193000,1.0,193000),
    ('bf542de2-c4be-11ed-9b94-e39acc8fe513','576fa452-8cbc-11ed-b63b-67fc666e0fa8',daterange('2023-03-01', '2023-08-31', '[]'),193000,0.82,157800,193000,0.82,157800),
    ('bf543e72-c4be-11ed-9b95-1b54b9d8e20d','576fa4ac-8cbc-11ed-b63c-2ff2276ab9f2',daterange('2023-03-01', '2023-08-31', '[]'),193000,0.71,136700,193000,0.71,136700),
    ('4abb35f6-c4bf-11ed-9b96-3bf490883b63','576fa8f8-8cbc-11ed-b63d-8fb27ef151a1',daterange('2023-03-01', '2023-08-31', '[]'),211700,1.0,211700,211700,1.0,211700),
    ('4abb41f4-c4bf-11ed-9b97-cbfea5f8e304','576fa966-8cbc-11ed-b63e-630258790f77',daterange('2023-03-01', '2023-08-31', '[]'),211700,1.0,211700,211700,1.0,211700),
    ('4abb42da-c4bf-11ed-9b98-338de8ee93f7','576fa9b6-8cbc-11ed-b63f-8bf378c64b67',daterange('2023-03-01', '2023-08-31', '[]'),211700,0.81,171900,211700,0.81,171900),
    ('4abb4384-c4bf-11ed-9b99-c7ae7241ec3a','576fe070-8cbc-11ed-b640-675064ab6753',daterange('2023-03-01', '2023-08-31', '[]'),211700,0.70,148000,211700,0.70,148000),

    -- 2023-03-01 ->

    --DAYCARE
    --DAYCARE_PART_TIME
    ('dd9b0ba4-c4b9-11ed-9b79-d764cdaee299','ac879588-6afe-11ed-b107-b3c1585b8c2a',daterange('2023-03-01', NULL, '[]'),124900,1.0,124900,124900,1.0,124900),
    ('dd9b1504-c4b9-11ed-9b7a-470da8296e46','ac879d76-6afe-11ed-b108-9fb58b2968d5',daterange('2023-03-01', NULL, '[]'),124900,1.0,124900,124900,1.0,124900),
    ('dd9b1680-c4b9-11ed-9b7b-1b5f07c99504','ac879dee-6afe-11ed-b109-c7ee3c340bf7',daterange('2023-03-01', NULL, '[]'),124900,0.75,93700,124900,0.75,93700),
    ('dd9b1784-c4b9-11ed-9b7c-4b6ce2a725b9','ac879f24-6afe-11ed-b10d-3fe2c69846ef',daterange('2023-03-01', NULL, '[]'),124900,0.6,74900,124900,0.6,74900),
    ('605ccf5a-c4ba-11ed-9b7d-03d3a908d3d7','ac879e48-6afe-11ed-b10a-9791c734c144',daterange('2023-03-01', NULL, '[]'),92600,1.0,92600,92600,1.0,92600),
    ('605cdafe-c4ba-11ed-9b7e-97dd7868994e','ac879e8e-6afe-11ed-b10b-436cbc3d57e9',daterange('2023-03-01', NULL, '[]'),92600,1.0,92600,92600,1.0,92600),
    ('605cdbee-c4ba-11ed-9b7f-03447fd4b5cb','ac879ede-6afe-11ed-b10c-636ae14462ef',daterange('2023-03-01', NULL, '[]'),92600,0.75,69500,92600,0.75,69500),
    ('605cdc8e-c4ba-11ed-9b80-3f04e03a5b1b','ac879f74-6afe-11ed-b10e-2bf83788be72',daterange('2023-03-01', NULL, '[]'),92600,0.6,55600,92600,0.6,55600),

    --DAYCARE_FIVE_YEAR_OLDS
    ('b1ca330a-c4c4-11ed-9b9e-e7c3a931d622','267946fa-6fb1-11ed-8c85-4725b99d6549',daterange('2023-03-01', NULL, '[]'),56200,1.0,56200,56200,1.0,56200),
    ('b1ca44e4-c4c4-11ed-9b9f-7ba36b43453a','26794f24-6fb1-11ed-8c86-1f58d027951d',daterange('2023-03-01', NULL, '[]'),41700,1.0,41700,41700,1.0,41700),

    --DAYCARE_PART_TIME_FIVE_YEAR_OLDS
    ('18c46494-c4c6-11ed-9ba5-ab907afacef8','a2877f1a-7087-11ed-a559-4fa06829e6fd',daterange('2023-03-01', NULL, '[]'),181100,1.0,181100,181100,1.0,181100),
    ('18c47574-c4c6-11ed-9ba6-77ff82d4bd9a','a2878c8a-7087-11ed-a55a-ffa38e3847aa',daterange('2023-03-01', NULL, '[]'),181100,1.0,181100,181100,1.0,181100),
    ('18c47650-c4c6-11ed-9ba7-9f7b367aa829','a2878d2a-7087-11ed-a55b-2f42cae1743e',daterange('2023-03-01', NULL, '[]'),181100,0.83,149900,181100,0.83,149900),
    ('18c476f0-c4c6-11ed-9ba8-837dbe8340d5','a2878d84-7087-11ed-a55c-53988f52a3bf',daterange('2023-03-01', NULL, '[]'),181100,0.72,131100,181100,0.72,131100),
    ('a4e51e46-c4c6-11ed-9ba9-23ee07316d91','a2879072-7087-11ed-a55d-6f35f6f6df2f',daterange('2023-03-01', NULL, '[]'),134300,1.0,134300,134300,1.0,134300),
    ('a4e531a6-c4c6-11ed-9baa-b736669a07a9','a28790e0-7087-11ed-a55e-0700a24f1119',daterange('2023-03-01', NULL, '[]'),134300,1.0,134300,134300,1.0,134300),
    ('a4e5328c-c4c6-11ed-9bab-9787f41f0cbe','a2879554-7087-11ed-a55f-df43279a1ac6',daterange('2023-03-01', NULL, '[]'),134300,0.83,111200,134300,0.83,111200),
    ('a4e5332c-c4c6-11ed-9bac-b3e08d58dcce','a2879860-7087-11ed-a560-2b2470e04de6',daterange('2023-03-01', NULL, '[]'),134300,0.72,97300,134300,0.72,97300),

    --OTHER_ONES - SET TO DEFAULT VOUCHER VALUE
    ('4c1f7456-c4bb-11ed-9b81-9746f304915f','86ef7370-bf85-11eb-91e7-6fcd728c518d',daterange('2023-03-01', NULL, '[]'),93700,1.0,93700,159300,1.0,159300),
    ('4c1f8086-c4bb-11ed-9b82-0b6e72bcabdb','50359280-b961-11eb-b523-237115533645',daterange('2023-03-01', NULL, '[]'),93700,1.0,93700,159300,1.0,159300),
    ('4c1f83f6-c4bb-11ed-9b83-5b7ea6a885bc','5e82f704-4f8f-11ed-8be5-bbe76169415f',daterange('2023-03-01', NULL, '[]'),93700,1.0,93700,159300,1.0,159300),
    ('4c1f8720-c4bb-11ed-9b84-3707ffa9f245','50359334-b961-11eb-b525-f3febdfea5d3',daterange('2023-03-01', NULL, '[]'),93700,1.0,93700,159300,1.0,159300),
    ('4c1f87c0-c4bb-11ed-9b85-dbd1bff54cbf','5035938e-b961-11eb-b526-6b30323c87a8',daterange('2023-03-01', NULL, '[]'),93700,1.0,93700,159300,1.0,159300),
    ('4c1f884c-c4bb-11ed-9b86-dfa56f637fd0','e549007e-4f91-11ed-8beb-2f7e83af8ba6',daterange('2023-03-01', NULL, '[]'),93700,1.0,93700,159300,1.0,159300),
    ('4c1f8b44-c4bb-11ed-9b87-f706cf49b321','bc6a44ec-fa74-11eb-9a2c-73b53c2af869',daterange('2023-03-01', NULL, '[]'),93700,1.0,93700,159300,1.0,159300),
    ('4c1f8bd0-c4bb-11ed-9b88-7fd6d0ca60bd','bc6a45a0-fa74-11eb-9a2e-fb411a8588da',daterange('2023-03-01', NULL, '[]'),93700,1.0,93700,159300,1.0,159300),
    ('4c1f8c66-c4bb-11ed-9b89-d74fa7ab346e','ff6ddcd4-fa8a-11eb-8592-2f2b4e398fcb',daterange('2023-03-01', NULL, '[]'),93700,1.0,93700,159300,1.0,159300),
    ('4c1f8cf2-c4bb-11ed-9b8a-f7f99cd99363','4d246a6c-4f92-11ed-8bed-2f5b3226e682',daterange('2023-03-01', NULL, '[]'),93700,1.0,93700,159300,1.0,159300),
    ('4c1f8d7e-c4bb-11ed-9b8b-63d8777b55cb','d6d5a660-4f90-11ed-8be9-6f76cd90c246',daterange('2023-03-01', NULL, '[]'),93700,1.0,93700,159300,1.0,159300),
    ('4c1f8e0a-c4bb-11ed-9b8c-c7e5d69365ac','1b4413f6-d99d-11eb-89ac-a3a978104bce',daterange('2023-03-01', NULL, '[]'),93700,1.0,93700,159300,1.0,159300),
    ('4bda56af-396e-4074-a396-f62b066f3c6f','25d79184-e415-4fe3-bac6-3b719b050685',daterange('2023-03-01', NULL, '[]'),93700,1.0,93700,159300,1.0,159300),


    -- 2023-09-01 ->

    --DAYCARE
    --DAYCARE_PART_TIME

    ('712bacc6-591a-11ee-9af5-7770652ee9d3','50358394-b961-11eb-b51f-67ac436e5636',daterange('2023-09-01', NULL, '[]'),96700,1.0,96700,164400,1.0,164400),
    ('c31600b6-57b4-11ee-97e3-c7c480d2847b','86ef70a0-bf85-11eb-91e6-1fb57a101161',daterange('2023-09-01', NULL, '[]'),96700,1.0,96700,164400,1.0,164400),
    ('15b76c9c-57b5-11ee-97e4-a70fb4125b2a','503590f0-b961-11eb-b520-53740af3f7ee',daterange('2023-09-01', NULL, '[]'),96700,1.0,96700,164400,1.0,164400),
    ('663e2bce-57b5-11ee-97e5-6ffce7d50011','503591ae-b961-11eb-b521-1fca99358eef',daterange('2023-09-01', NULL, '[]'),96700,0.75,72500,164400,0.75,123300),
    ('db20337c-591a-11ee-9af6-eba9762c568f','503592da-b961-11eb-b524-7f27c780d83a',daterange('2023-09-01', NULL, '[]'),96700,0.6,58000,164400,0.6,98600),
    ('ef10be50-5934-11ee-9344-9742289d6ffe','85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0',daterange('2023-09-01', NULL, '[]'),96700,0.6,58000,164400,0.6,98600),
    ('82d1ebf2-57b7-11ee-97e6-c719e01e9700','684e4f0a-537b-11ed-aabb-d33da20b2117',daterange('2023-09-01', NULL, '[]'),145100,1.0,145100,246600,1.0,246600),
    ('8b758d40-57b7-11ee-97e7-0773f6068d91','cc81be76-537b-11ed-aabd-d7571a7aed5f',daterange('2023-09-01', NULL, '[]'),145100,1.0,145100,246600,1.0,246600),
    ('df9259b2-57b7-11ee-97e8-23cb98c4aec4','b244ea0e-5382-11ed-b846-d7ebbaaf5fd5',daterange('2023-09-01', NULL, '[]'),145100,0.75,108800,246600,0.75,184900),
    ('1faca8b8-57b8-11ee-97e9-db6959518be2','aed93b48-5384-11ed-b848-435687237b8e',daterange('2023-09-01', NULL, '[]'),145100,0.6,87000,246600,0.6,148000),
    ('25bc46c0-5865-11ee-bacc-6367733662ee','4062cdca-5387-11ed-b84a-6fc9185df882',daterange('2023-09-01', NULL, '[]'),164400,1.0,164400,279500,1.0,279500),
    ('51b94610-5865-11ee-bacd-37f00cb52212','d6e2a50e-5387-11ed-b84c-b7756f2c8248',daterange('2023-09-01', NULL, '[]'),164400,1.0,164400,279500,1.0,279500),
    ('807674f0-5865-11ee-bace-03294bdce63c','3e1852be-5388-11ed-b84e-e7d4a93b269e',daterange('2023-09-01', NULL, '[]'),164400,0.75,123300,279500,0.75,209600),
    ('b0c6cb46-5865-11ee-bacf-97e5261b2940','b01d3d66-5388-11ed-b850-3bbd85d56f15',daterange('2023-09-01', NULL, '[]'),164400,0.6,98600,279500,0.6,167700),

    --DAYCARE_FIVE_YEAR_OLDS

    ('8288b152-591b-11ee-9af7-57a8ff1accfe','a867f3ec-5368-11ed-8d0b-b31b59a849a1',daterange('2023-09-01', NULL, '[]'),43500,1.0,43500,43500,1.0,43500),
    ('93a2de72-591b-11ee-9af8-279a44c0fe1a','c73c5cea-5368-11ed-8d0c-8fb44e947bc6',daterange('2023-09-01', NULL, '[]'),43500,1.0,43500,43500,1.0,43500),

    --DAYCARE_PART_TIME_FIVE_YEAR_OLDS

    ('582610b6-591c-11ee-9af9-47d49868574d','153a6364-536a-11ed-8d0f-d7a4b2b860f1',daterange('2023-09-01', NULL, '[]'),140200,1.0,140200,140200,1.0,140200),
    ('89c2498c-591c-11ee-9afa-1fdedec0d726','325c97b4-536a-11ed-8d10-4b3a543573f7',daterange('2023-09-01', NULL, '[]'),140200,1.0,140200,140200,1.0,140200),
    ('a8d7e1f6-591c-11ee-9afb-8bab370b4be1','73976b22-536b-11ed-8d13-57ff6a3494ef',daterange('2023-09-01', NULL, '[]'),140200,1.0,140200,140200,1.0,140200),
    ('d19f71c6-591c-11ee-9afc-7ffaa7e3613d','3172d514-536c-11ed-8d15-dfe8e83094cd',daterange('2023-09-01', NULL, '[]'),140200,0.83,116000,140200,0.83,116000),
    ('0a7f6794-591d-11ee-9afd-c3fb1662501f','e94a8bae-536d-11ed-8d17-9b8007da5dec',daterange('2023-09-01', NULL, '[]'),140200,0.72,101500,140200,0.72,101500),
    ('4f6353ca-591d-11ee-9afe-5b36230c3608','99cd40ce-8cd6-11ed-ad37-c7c08035a833',daterange('2023-09-01', NULL, '[]'),188600,1.0,188600,188600,1.0,188600),
    ('9f47e8ec-591d-11ee-9aff-cf06029a1a08','99cd517c-8cd6-11ed-ad38-7b2aa4f8b7be',daterange('2023-09-01', NULL, '[]'),188600,1.0,188600,188600,1.0,188600),
    ('cbbb300a-591d-11ee-9b00-cfcdbd901a83','99cd5938-8cd6-11ed-ad39-9fefd8a84f78',daterange('2023-09-01', NULL, '[]'),188600,0.81,152300,188600,0.81,152300),
    ('fe41536a-591d-11ee-9b01-7baa8dc4bad3','99cd59ec-8cd6-11ed-ad3a-bbf83318f2f1',daterange('2023-09-01', NULL, '[]'),188600,0.69,130500,188600,0.69,130500),
    ('dee3d0da-5925-11ee-b358-37d213d4a91e','99cd5a6e-8cd6-11ed-ad3b-e78efee7f61a',daterange('2023-09-01', NULL, '[]'),207900,1.0,207900,207900,1.0,207900),
    ('fac4c26e-5925-11ee-b359-0f1f4877ed40','99cd5ae6-8cd6-11ed-ad3c-9f9e7d8ac30e',daterange('2023-09-01', NULL, '[]'),207900,1.0,207900,207900,1.0,207900),
    ('14cbbe38-5926-11ee-b35a-3fb8e71d184e','99cd5b9a-8cd6-11ed-ad3d-8f81b097a236',daterange('2023-09-01', NULL, '[]'),207900,0.80,166800,207900,0.80,166800),
    ('3d5472b4-5926-11ee-b35b-b744b3e7495f','99cd5bf4-8cd6-11ed-ad3e-77990db3e351',daterange('2023-09-01', NULL, '[]'),207900,0.68,142100,207900,0.68,142100),

    --PRESCHOOL

    ('def147b4-5926-11ee-b35c-eb781b782679','bc6a4550-fa74-11eb-9a2d-035acd5db9aa',daterange('2023-09-01', NULL, '[]'),54100,1.0,54100,54100,1.0,54100),
    ('ff6eed0c-5926-11ee-b35d-df40304d924a','5c21d452-4f90-11ed-8be7-bf748cc343bf',daterange('2023-09-01', NULL, '[]'),54100,1.0,54100,54100,1.0,54100),
    ('2ecc5c60-5927-11ee-b35e-03d9c36bebc2','a678968e-536f-11ed-8d19-5715e16c8489',daterange('2023-09-01', NULL, '[]'),54100,1.0,54100,54100,1.0,54100),

    --PRESCHOOL_DAYCARE

    ('5b7d6614-5927-11ee-b35f-13c4a9f1350e','0bfc6c92-ff2a-11eb-a785-2724e8e5e7ee',daterange('2023-09-01', NULL, '[]'),150800,1.0,150800,150800,1.0,150800),
    ('0ac3788e-5928-11ee-b360-23a1d23cd197','503593e8-b961-11eb-b527-a3dcdfb628ec',daterange('2023-09-01', NULL, '[]'),150800,1.0,150800,150800,1.0,150800),
    ('2c353a16-5928-11ee-b361-77e11ef03199','50359442-b961-11eb-b528-df3290c0d63e',daterange('2023-09-01', NULL, '[]'),150800,1.0,150800,150800,1.0,150800),
    ('59529ab6-5928-11ee-b362-3f8afc26d63b','bc6a42d0-fa74-11eb-9a2b-d315a7916074',daterange('2023-09-01', NULL, '[]'),150800,0.84,126600,150800,0.84,126600),
    ('7ccad44a-5928-11ee-b363-67637526c3b2','50359212-b961-11eb-b522-074fb05f7086',daterange('2023-09-01', NULL, '[]'),150800,0.74,112100,150800,0.60,112100),
    ('e28e1098-5929-11ee-b364-8307451b3f14','e1d0d78a-5371-11ed-8d1b-cb612aa6780b',daterange('2023-09-01', NULL, '[]'),150800,1.0,150800,150800,1.0,150800),
    ('225b8e44-592a-11ee-b365-230631af9f58','7b2ff2e4-5372-11ed-8d1d-5f26eff8b49b',daterange('2023-09-01', NULL, '[]'),150800,1.0,150800,150800,1.0,150800),
    ('3be44edc-592a-11ee-b366-9be87dd033bc','0004e312-5373-11ed-8d1f-575317e00afc',daterange('2023-09-01', NULL, '[]'),150800,0.84,126600,150800,0.84,126600),
    ('52e1cb5a-592a-11ee-b367-7744bf929823','6fdc7ad8-5373-11ed-8d21-87047833ff0b',daterange('2023-09-01', NULL, '[]'),150800,0.74,112100,150800,0.60,112100),
    ('8dab9f68-592a-11ee-b368-8f3355305422','576f6cf8-8cbc-11ed-b639-afa50c9355c1',daterange('2023-09-01', NULL, '[]'),199200,1.0,199200,199200,1.0,199200),
    ('afb15ca6-592a-11ee-b369-4fe7f1d83731','576fa380-8cbc-11ed-b63a-8bb1a5b587a0',daterange('2023-09-01', NULL, '[]'),199200,1.0,199200,199200,1.0,199200),
    ('c906937e-592a-11ee-b36a-23bb3c7ee35e','576fa452-8cbc-11ed-b63b-67fc666e0fa8',daterange('2023-09-01', NULL, '[]'),199200,0.82,162900,199200,0.82,162900),
    ('e22c277e-592a-11ee-b36b-b3613f72e421','576fa4ac-8cbc-11ed-b63c-2ff2276ab9f2',daterange('2023-09-01', NULL, '[]'),199200,0.71,141100,199200,0.71,141100),
    ('6d535df4-592b-11ee-b36c-a7e0fbdbb8e8','576fa8f8-8cbc-11ed-b63d-8fb27ef151a1',daterange('2023-09-01', NULL, '[]'),218500,1.0,218500,218500,1.0,218500),
    ('86ad49d6-592b-11ee-b36d-0bc2a6093d63','576fa966-8cbc-11ed-b63e-630258790f77',daterange('2023-09-01', NULL, '[]'),218500,1.0,218500,218500,1.0,218500),
    ('9ecf2fb6-592b-11ee-b36e-23c430326676','576fa9b6-8cbc-11ed-b63f-8bf378c64b67',daterange('2023-09-01', NULL, '[]'),218500,0.81,177400,218500,0.81,177400),
    ('c11ece3c-592b-11ee-b36f-e7342954d072','576fe070-8cbc-11ed-b640-675064ab6753',daterange('2023-09-01', NULL, '[]'),218500,0.70,152700,218500,0.70,152700)

ON CONFLICT (id) DO
UPDATE SET
    validity = EXCLUDED.validity,
    base_value = EXCLUDED.base_value,
    coefficient = EXCLUDED.coefficient,
    value = EXCLUDED.value,
    base_value_under_3y = EXCLUDED.base_value_under_3y,
    coefficient_under_3y = EXCLUDED.coefficient_under_3y,
    value_under_3y = EXCLUDED.value_under_3y
WHERE
    service_need_option_voucher_value.validity <> EXCLUDED.validity OR
    service_need_option_voucher_value.base_value <> EXCLUDED.base_value OR
    service_need_option_voucher_value.coefficient <> EXCLUDED.coefficient OR
    service_need_option_voucher_value.value <> EXCLUDED.value OR
    service_need_option_voucher_value.base_value_under_3y <> EXCLUDED.base_value_under_3y OR
    service_need_option_voucher_value.coefficient_under_3y <> EXCLUDED.coefficient_under_3y OR
    service_need_option_voucher_value.value_under_3y <> EXCLUDED.value_under_3y;
