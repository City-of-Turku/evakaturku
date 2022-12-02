-- SPDX-FileCopyrightText: 2022 City of Turku
--
-- SPDX-License-Identifier: LGPL-2.1-or-later

INSERT INTO service_need_option
    (id, name_fi, name_sv, name_en, valid_placement_type, default_option, fee_coefficient, occupancy_coefficient, daycare_hours_per_week, part_day, part_week, fee_description_fi, fee_description_sv, voucher_value_description_fi, voucher_value_description_sv, display_order, occupancy_coefficient_under_3y, show_for_citizen)
VALUES
    --DAYCARE
    ('50358394-b961-11eb-b51f-67ac436e5636', 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Early childhood education over 35h/week (over 147h/month)', 'DAYCARE', TRUE, 1.0, 1.0, 40, FALSE, FALSE, 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', null, 1.75, true),
    ('86ef70a0-bf85-11eb-91e6-1fb57a101161', 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Early childhood education over 35h/week (over 147h/month)', 'DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 0, 1.75, true),
    ('503590f0-b961-11eb-b520-53740af3f7ee', 'Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Early childhood education at most 35h/week (at most 147h/month)', 'DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 1, 1.75, true),
    ('503591ae-b961-11eb-b521-1fca99358eef', 'Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Early childhood education at most 27,5h/week (at most 116h/month)', 'DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 2, 1.75, true),
    ('684e4f0a-537b-11ed-aabb-d33da20b2117', 'Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', 'Service voucher evening care over 35h/week (over 147h/month)', 'DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', 'Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', 3, 1.75, false),
    ('cc81be76-537b-11ed-aabd-d7571a7aed5f', 'Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', 'Service voucher evening care at most 35h/week (at most 147h/month)', 'DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', 'Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', 4, 1.75, false),
    ('b244ea0e-5382-11ed-b846-d7ebbaaf5fd5', 'Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', 'Service voucher evening care at most 27,5h/week (at most 116h/month)', 'DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', 'Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', 5, 1.75, false),
    ('4062cdca-5387-11ed-b84a-6fc9185df882', 'Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', 'Service voucher weekend care over 35h/week (over 147h/month)', 'DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', 'Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', 6, 1.75, false),
    ('d6e2a50e-5387-11ed-b84c-b7756f2c8248', 'Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', 'Service voucher weekend care at most 35h/week (at most 147h/month)', 'DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', 'Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', 7, 1.75, false),
    ('3e1852be-5388-11ed-b84e-e7d4a93b269e', 'Palvelusetelin viikonloppu enintään  27,5h/vko (enintään 116h/kk)', 'Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', 'Service voucher weekend care at most 27,5h/week (at most 116h/month)', 'DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Palvelusetelin viikonloppu enintään  27,5h/vko (enintään 116h/kk)', 'Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', 'Palvelusetelin viikonloppu enintään 27,5h/vko (enintään 116h/kk)', 'Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', 8, 1.75, false),
    ('ac879588-6afe-11ed-b107-b3c1585b8c2a', 'Ryhmäperhepäivähoidon palveluseteli yli 35/vko (yli 147h/kk)', 'Gruppfamiljedagvårds servicecedeln över 35h/vecka (över 147h/mån)', 'Group family day care service voucher 35h/week (over 147h/month)', 'DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli yli 35/vko (yli 147h/kk)', 'Gruppfamiljedagvårds servicecedeln över 35h/vecka (över 147h/mån)', 'Ryhmäperhepäivähoidon palveluseteli yli 35/vko (yli 147h/kk)', 'Gruppfamiljedagvårds servicecedeln över 35h/vecka (över 147h/mån)', 9, 1.75, false),
    ('ac879d76-6afe-11ed-b108-9fb58b2968d5', 'Ryhmäperhepäivähoidon palveluseteli enintään 35h/vko (enintään 147h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 35h/vecka (högst 147h/mån)', 'Group family day care service voucher at most 35h/week (at most 147h/month)', 'DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli enintään 35h/vko (enintään 147h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 35h/vecka (högst 147h/mån)', 'Ryhmäperhepäivähoidon palveluseteli enintään 35h/vko (enintään 147h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 35h/vecka (högst 147h/mån)', 10, 1.75, false),
    ('ac879dee-6afe-11ed-b109-c7ee3c340bf7', 'Ryhmäperhepäivähoidon palveluseteli enintään 27,5h/vko (enintään 116h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 27,5h/vecka (högst 116h/mån)', 'Group family day care service voucher at most 27,5h/week (at most 116h/month)', 'DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli enintään 27,5h/vko (enintään 116h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 27,5h/vecka (högst 116h/mån)', 'Ryhmäperhepäivähoidon palveluseteli enintään 27h/vko (enintään 116h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 27,5h/vecka (högst 116h/mån)', 11, 1.75, false),
    ('ac879e48-6afe-11ed-b10a-9791c734c144', 'Perhepäivähoidon palveluseteli yli 35/vko (yli 147h/kk)', 'Familjedagvårds servicecedeln över 35h/vecka (över 147h/mån)', 'Family day care service voucher over 35h/week (over 147h/month)', 'DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Perhepäivähoidon palveluseteli yli 35/vko (yli 147h/kk)', 'Familjedagvårds servicecedeln över 35h/vecka (över 147h/mån)', 'Perhepäivähoidon palveluseteli yli 35/vko (yli 147h/kk)', 'Familjedagvårds servicecedeln över 35h/vecka (över 147h/mån)', 12, 1.75, false),
    ('ac879e8e-6afe-11ed-b10b-436cbc3d57e9', 'Perhepäivähoidon palveluseteli enintään 35h/vko (enintään 147h/kk)', 'Familjedagvårds servicecedeln högst 35h/vecka (högst 147h/mån)', 'Family day care service voucher at most 35h/week (at most 147h/month)', 'DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Perhepäivähoidon palveluseteli enintään 35h/vko (enintään 147h/kk)', 'Familjedagvårds servicecedeln högst 35h/vecka (högst 147h/mån)', 'Perhepäivähoidon palveluseteli enintään 35h/vko (enintään 147h/kk)', 'Familjedagvårds servicecedeln högst 35h/vecka (högst 147h/mån)', 13, 1.75, false),
    ('ac879ede-6afe-11ed-b10c-636ae14462ef', 'Perhepäivähoidon palveluseteli enintään 27,5h/vko (enintään 116h/kk)', 'Familjedagvårds servicecedeln högst 27,5h/vecka (högst 116h/mån)', 'Family day care service voucher at most 27,5h/week (at most 116h/month)', 'DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Perhepäivähoidon palveluseteli enintään 27,5h/vko (enintään 116h/kk)', 'Familjedagvårds servicecedeln högst 27,5h/vecka (högst 116h/mån)', 'Perhepäivähoidon palveluseteli enintään 27h/vko (enintään 116h/kk)', 'Familjedagvårds servicecedeln högst 27,5h/vecka (högst 116h/mån)', 14, 1.75, false),


    --DAYCARE_PART_TIME
    ('503592da-b961-11eb-b524-7f27c780d83a', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', TRUE, 0.5, 0.5, 20, TRUE, FALSE, 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', null, 1.75, true),
    ('85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 20, TRUE, FALSE, 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 15, 1.75, true),
    ('aed93b48-5384-11ed-b848-435687237b8e', 'Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', 'Service voucher evening care at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 20, TRUE, FALSE, 'Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', 'Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', 16, 1.75, false),
    ('b01d3d66-5388-11ed-b850-3bbd85d56f15', 'Palvelusetelin viikonloppu enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', 'Service voucher weekend care at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 20, TRUE, FALSE, 'Palvelusetelin viikonloppu enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', 'Palvelusetelin viikonloppu enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', 17, 1.75, false),
    ('ac879f24-6afe-11ed-b10d-3fe2c69846ef', 'Ryhmäperhepäivähoidon palveluseteli enintään 20h/vko (enintään 84h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 20h/vecka (högst 84h/mån)', 'Group family day care service voucher at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 20, TRUE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli enintään 20h/vko (enintään 84h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 20h/vecka (högst 84h/mån)', 'Ryhmäperhepäivähoidon palveluseteli enintään 20h/vko (enintään 84h/kk)', 'Gruppfamiljedagvårds servicecedeln högst 20h/vecka (högst 84h/mån)', 18, 1.75, false),
    ('ac879f74-6afe-11ed-b10e-2bf83788be72', 'Perhepäivähoidon palveluseteli enintään 20h/vko (enintään 84h/kk)', 'Familjedagvårds servicecedeln högst 20h/vecka (högst 84h/mån)', 'Family day care service voucher at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 20, TRUE, FALSE, 'Perhepäivähoidon palveluseteli enintään 20h/vko (enintään 84h/kk)', 'Familjedagvårds servicecedeln högst 20h/vecka (högst 84h/mån)', 'Perhepäivähoidon palveluseteli enintään 20h/vko (enintään 84h/kk)', 'Familjedagvårds servicecedeln högst 20h/vecka (högst 84h/mån)', 19, 1.75, false),

    --DAYCARE_FIVE_YEAR_OLDS
    ('a867f3ec-5368-11ed-8d0b-b31b59a849a1', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', 'Free of charge early education for 5 years old', 'DAYCARE_FIVE_YEAR_OLDS', TRUE, 0.0, 0.5, 20, TRUE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', null, 1.75, false),
    ('c73c5cea-5368-11ed-8d0c-8fb44e947bc6', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', 'Free of charge early education for 5 years old', 'DAYCARE_FIVE_YEAR_OLDS', FALSE, 0.0, 0.5, 20, TRUE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', 250, 1.75, false),
    ('267946fa-6fb1-11ed-8c85-4725b99d6549', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar', 'Group family day care service voucher free of charge early education for 5 years old', 'DAYCARE_FIVE_YEAR_OLDS', FALSE, 0.0, 0.5, 20, TRUE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar', 251, 1.75, false),
    ('26794f24-6fb1-11ed-8c86-1f58d027951d', 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar', 'Family day care service voucher free of charge early education for 5 years old', 'DAYCARE_FIVE_YEAR_OLDS', FALSE, 0.0, 0.5, 20, TRUE, FALSE, 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar', 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar', 252, 1.75, false),


    --DAYCARE_PART_TIME_FIVE_YEAR_OLDS
    ('153a6364-536a-11ed-8d0f-d7a4b2b860f1', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Free of charge early education for 5 years old + Early childhood education over 35h/week (over 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', TRUE, 1.0, 1.0, 40, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', null, 1.75, false),
    ('325c97b4-536a-11ed-8d10-4b3a543573f7', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Free of charge early education for 5 years old + Early childhood education over 35h/week (over 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 1.0, 1.0, 40, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 200, 1.75, false),
    ('73976b22-536b-11ed-8d13-57ff6a3494ef', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Free of charge early education for 5 years old + Early childhood education at most 35h/week (at most 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.85, 1.0, 35, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 210, 1.75, false),
    ('3172d514-536c-11ed-8d15-dfe8e83094cd', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Free of charge early education for 5 years old + Early childhood education at most 27,5h/week (at most 116h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 220, 1.75, false),
    ('e94a8bae-536d-11ed-8d17-9b8007da5dec', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Free of charge early education for 5 years old + Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.5, 1.0, 20, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 230, 1.75, false),
    ('a2877f1a-7087-11ed-a559-4fa06829e6fd', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Group family day care service voucher free of charge early education for 5 years old + Early childhood education over 35h/week (over 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 232, 1.75, false),
    ('a2878c8a-7087-11ed-a55a-ffa38e3847aa', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Group family day care service voucher free of charge early education for 5 years old + Early childhood education at most 35h/week (at most 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 234, 1.75, false),
    ('a2878d2a-7087-11ed-a55b-2f42cae1743e', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Group family day care service voucher free of charge early education for 5 years old + Early childhood education at most 27,5h/week (at most 116h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 236, 1.75, false),
    ('a2878d84-7087-11ed-a55c-53988f52a3bf', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Group family day care service voucher free of charge early education for 5 years old + Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Ryhmäperhepäivähoidon palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Gruppfamiljedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 238, 1.75, false),
    ('a2879072-7087-11ed-a55d-6f35f6f6df2f', 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Family day care service voucher free of charge early education for 5 years old + Early childhood education over 35h/week (over 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 240, 1.75, false),
    ('a28790e0-7087-11ed-a55e-0700a24f1119', 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Family day care service voucher free of charge early education for 5 years old + Early childhood education at most 35h/week (at most 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 242, 1.75, false),
    ('a2879554-7087-11ed-a55f-df43279a1ac6', 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Family day care service voucher free of charge early education for 5 years old + Early childhood education at most 27,5h/week (at most 116h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 244, 1.75, false),
    ('a2879860-7087-11ed-a560-2b2470e04de6', 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Family day care service voucher free of charge early education for 5 years old+ Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Perhepäivähoiton palveluseteli 5v maksuton varhaikasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Familjedagvårds servicecedeln avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 246, 1.75, false),



    --PRESCHOOL
    ('bc6a4550-fa74-11eb-9a2d-035acd5db9aa', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Preschool 4h/day', 'PRESCHOOL', TRUE, 0, 0.5, 20, TRUE, FALSE, 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', null, 1.75, false),
    ('5c21d452-4f90-11ed-8be7-bf748cc343bf', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Preschool 4h/day', 'PRESCHOOL', FALSE, 0, 0.5, 20, TRUE, FALSE, 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 50, 1.75, false),
    ('a678968e-536f-11ed-8d19-5715e16c8489', 'Kaksivuotinen esiopetuskokeilu', 'Tvåårig förskole', 'Two year preschool education', 'PRESCHOOL', FALSE, 0, 0.5, 20, TRUE, FALSE, 'Kaksivuotinen esiopetuskokeilu', 'Tvåårig förskole', 'Kaksivuotinen esiopetuskokeilu', 'Tvåårig förskole', 50, 1.75, false),

    --PRESCHOOL_DAYCARE
    ('0bfc6c92-ff2a-11eb-a785-2724e8e5e7ee', 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Preschool 4h/day + Early childhood education over 35h/week (over 147h/month)', 'PRESCHOOL_DAYCARE', TRUE, 1.0, 1.0, 40, FALSE, FALSE, 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', null, 1.75, false),
    ('503593e8-b961-11eb-b527-a3dcdfb628ec', 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Preschool 4h/day + Early childhood education over 35h/week (over 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 2000, 1.75, false),
    ('50359442-b961-11eb-b528-df3290c0d63e', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Preschool 4h/day + Early childhood education at most 35h/week (at most 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Esiopetus 4h/pv + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 2100, 1.75, false),
    ('bc6a42d0-fa74-11eb-9a2b-d315a7916074', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Preschool 4h/day + Early childhood education at most 27,5h/week (at most 116h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.65, 1.0, 27.5, TRUE, TRUE, 'Esiopetus 4h/pv + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 2200, 1.75, false),
    ('50359212-b961-11eb-b522-074fb05f7086', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Preschool 4h/day + Early childhood education at most 20h/week (at most 84h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Esiopetus 4h/pv + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 2250, 1.75, false),
    ('e1d0d78a-5371-11ed-8d1b-cb612aa6780b', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus yli 35h/vko (147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Two year preschool education + Early childhood education over 35h/week (over 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus yli 35h/vko (147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus yli 35h/vko (147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 2260, 1.75, false),
    ('7b2ff2e4-5372-11ed-8d1d-5f26eff8b49b', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Two year preschool education + Early childhood education at most 35h/week (at most 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 2270, 1.75, false),
    ('0004e312-5373-11ed-8d1f-575317e00afc', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Two year preschool education + Early childhood education at most 27,5h/week (at most 116h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.65, 1.0, 27.5, TRUE, TRUE, 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 2280, 1.75, false),
    ('6fdc7ad8-5373-11ed-8d21-87047833ff0b', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Two year preschool education + Early childhood education at most 20h/week (at most 84h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 2290, 1.75, false),

    --PREPARATORY
    ('1b4413f6-d99d-11eb-89ac-a3a978104bce', 'Valmistava opetus', 'Förbererande utbilndning', 'Preparatory education', 'PREPARATORY', TRUE, 0, 0.54, 25, TRUE, FALSE, 'Valmistava opetus', 'Förbererande utbilndning', 'Valmistava opetus', 'Förbererande utbilndning', null, 1.75, false),
    ('d6d5a660-4f90-11ed-8be9-6f76cd90c246', 'Valmistava opetus', 'Förbererande utbilndning', 'Preparatory education', 'PREPARATORY', FALSE, 0, 0.54, 25, TRUE, FALSE, 'Valmistava opetus', 'Förbererande utbilndning', 'Valmistava opetus', 'Förbererande utbilndning', 2220, 1.75, false),

    --PREPARATORY_DAYCARE
    ('bc6a44ec-fa74-11eb-9a2c-73b53c2af869', 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Preparatory education + Early childhood education over 35h/week (over 147h/month)', 'PREPARATORY_DAYCARE', TRUE, 1.0, 1.0, 40, FALSE, FALSE, 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 2300, 1.75, false),
    ('bc6a45a0-fa74-11eb-9a2e-fb411a8588da', 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Preparatory education + Early childhood education over 35h/week (over 147h/month)', 'PREPARATORY_DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 2350, 1.75, false),
    ('86ef7370-bf85-11eb-91e7-6fcd728c518d', 'Valmistava opetus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Preparatory education + Early childhood education at most 35h/week (at most 147h/month)', 'PREPARATORY_DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Valmistava opetus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Valmistava opetus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 2400, 1.75, false),
    ('50359280-b961-11eb-b523-237115533645', 'Valmistava opetus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Preparatory education + Early childhood education at most 27,5h/week (at most 116h/month)', 'PREPARATORY_DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Valmistava opetus + Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Valmistava opetus + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 2450, 1.75, false),
    ('5e82f704-4f8f-11ed-8be5-bbe76169415f', 'Valmistava opetus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Preparatory education + Early childhood education at most 20h/week (at most 84h/month)', 'PREPARATORY_DAYCARE', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Valmistava opetus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Valmistava opetus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 2500, 1.75, false),

    --TEMPORARY_DAYCARE
    ('5035938e-b961-11eb-b526-6b30323c87a8', 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 'Temporary early childhood education', 'TEMPORARY_DAYCARE', TRUE, 1.0, 0.54, 40, FALSE, FALSE, 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', null, 1.75, false),
    ('e549007e-4f91-11ed-8beb-2f7e83af8ba6', 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 'Temporary early childhood education', 'TEMPORARY_DAYCARE', FALSE, 1.0, 0.54, 40, FALSE, FALSE, 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 2600, 1.75, false),

    --CLUB
    ('ff6ddcd4-fa8a-11eb-8592-2f2b4e398fcb', 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 'Open early childhood education at most 10h/week', 'CLUB', TRUE, 1.0, 0.54, 10, FALSE, FALSE, 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', null, 1.75, true),
    ('4d246a6c-4f92-11ed-8bed-2f5b3226e682', 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 'Open early childhood education at most 10h/week', 'CLUB', FALSE, 1.0, 0.54, 10, FALSE, FALSE, 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 2700, 1.75, true),
    ('50359334-b961-11eb-b525-f3febdfea5d3', 'Avoin varhaiskasvatus enintään 15h/vko', 'Öppen småbarnspedagogik högst 15h/vecka', 'Open early childhood education at most 15h/week', 'CLUB', FALSE, 1.0, 0.54, 15, FALSE, FALSE, 'Avoin varhaiskasvatus enintään 15h/vko', 'Öppen småbarnspedagogik högst 15h/vecka', 'Avoin varhaiskasvatus enintään 15h/vko', 'Öppen småbarnspedagogik högst 15h/vecka', 2750, 1.75, true)

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
    show_for_citizen = EXCLUDED.show_for_citizen
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
    service_need_option.show_for_citizen <> EXCLUDED.show_for_citizen;


INSERT INTO service_need_option_voucher_value (
    id,service_need_option_id,validity,base_value,coefficient,value,base_value_under_3y,coefficient_under_3y,value_under_3y
)
VALUES
    --DAYCARE
    --DAYCARE_PART_TIME
    ('a51a05ce-148c-11ed-be1e-138f17756ad7','50358394-b961-11eb-b51f-67ac436e5636',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51aacf4-148c-11ed-be1e-733f9c20ff61','86ef70a0-bf85-11eb-91e6-1fb57a101161',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51aaf88-148c-11ed-be1e-db2e9883417e','503590f0-b961-11eb-b520-53740af3f7ee',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51ab19a-148c-11ed-be1e-4be88e69e52e','503591ae-b961-11eb-b521-1fca99358eef',daterange('2022-08-01', NULL, '[]'),91100,0.75,68300,154900,0.75,116200),
    ('a51abaa0-148c-11ed-be1e-931156918f24','503592da-b961-11eb-b524-7f27c780d83a',daterange('2022-08-01', NULL, '[]'),91100,0.6,54700,154900,0.6,92900),
    ('cdbaef90-5364-11ed-8d0a-07b4d2f136e5','85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0',daterange('2022-08-01', NULL, '[]'),91100,0.6,54700,154900,0.6,92900),
    ('7f508678-537b-11ed-aabc-e70dcfac9cad','684e4f0a-537b-11ed-aabb-d33da20b2117',daterange('2022-08-01', NULL, '[]'),136700,1.0,136700,263300,1.0,263300),
    ('e353987c-537b-11ed-aabe-7f6f40f38599','cc81be76-537b-11ed-aabd-d7571a7aed5f',daterange('2022-08-01', NULL, '[]'),136700,1.0,136700,263300,1.0,263300),
    ('eb28f84c-5382-11ed-b847-b355c925e27b','b244ea0e-5382-11ed-b846-d7ebbaaf5fd5',daterange('2022-08-01', NULL, '[]'),136700,0.75,102500,263300,0.75,197500),
    ('ddcae960-5384-11ed-b849-839f0dabcdbe','aed93b48-5384-11ed-b848-435687237b8e',daterange('2022-08-01', NULL, '[]'),136700,0.6,82000,263300,0.6,158000),
    ('5a0f5cc0-5387-11ed-b84b-4f8d5bbe2d9f','4062cdca-5387-11ed-b84a-6fc9185df882',daterange('2022-08-01', NULL, '[]'),154900,1.0,154900,263300,1.0,263300),
    ('ece6571a-5387-11ed-b84d-27fd4e7ce997','d6e2a50e-5387-11ed-b84c-b7756f2c8248',daterange('2022-08-01', NULL, '[]'),154900,1.0,154900,263300,1.0,263300),
    ('59a8e7c8-5388-11ed-b84f-3baba6888e6e','3e1852be-5388-11ed-b84e-e7d4a93b269e',daterange('2022-08-01', NULL, '[]'),154900,0.75,116200,263300,0.75,197500),
    ('c6f1b472-5388-11ed-b851-c3900328e2e4','b01d3d66-5388-11ed-b850-3bbd85d56f15',daterange('2022-08-01', NULL, '[]'),154900,0.6,92900,263300,0.6,158000),
    ('1e68df8a-6b00-11ed-bdb4-df44abd9caa0','ac879588-6afe-11ed-b107-b3c1585b8c2a',daterange('2022-08-01', NULL, '[]'),121400,1.0,121400,121400,1.0,121400),
    ('1e6987be-6b00-11ed-bdb5-676e2e55d011','ac879d76-6afe-11ed-b108-9fb58b2968d5',daterange('2022-08-01', NULL, '[]'),121400,1.0,121400,121400,1.0,121400),
    ('1e6988e0-6b00-11ed-bdb6-3f91824eb8e3','ac879dee-6afe-11ed-b109-c7ee3c340bf7',daterange('2022-08-01', NULL, '[]'),121400,0.75,91100,121400,0.75,91100),
    ('1e698958-6b00-11ed-bdb7-5b0d2654eff3','ac879f24-6afe-11ed-b10d-3fe2c69846ef',daterange('2022-08-01', NULL, '[]'),121400,0.6,72800,121400,0.6,72800),
    ('1e6989c6-6b00-11ed-bdb8-7fe5bde22c43','ac879e48-6afe-11ed-b10a-9791c734c144',daterange('2022-08-01', NULL, '[]'),90000,1.0,90000,90000,1.0,90000),
    ('1e698a34-6b00-11ed-bdb9-2bc6dfb887e0','ac879e8e-6afe-11ed-b10b-436cbc3d57e9',daterange('2022-08-01', NULL, '[]'),90000,1.0,90000,90000,1.0,90000),
    ('1e698a98-6b00-11ed-bdba-f3ed1d15f96c','ac879ede-6afe-11ed-b10c-636ae14462ef',daterange('2022-08-01', NULL, '[]'),90000,0.75,67500,90000,0.75,67500),
    ('1e698b06-6b00-11ed-bdbb-07fc5478868e','ac879f74-6afe-11ed-b10e-2bf83788be72',daterange('2022-08-01', NULL, '[]'),90000,0.6,54000,90000,0.6,54000),

    --DAYCARE_FIVE_YEAR_OLDS
    ('ea01ccd8-5368-11ed-8d0d-8b4935d05e97','a867f3ec-5368-11ed-8d0b-b31b59a849a1',daterange('2022-08-01', NULL, '[]'),41000,1.0,41000,41000,1.0,41000),
    ('fd502424-5368-11ed-8d0e-d7e0ea1247b9','c73c5cea-5368-11ed-8d0c-8fb44e947bc6',daterange('2022-08-01', NULL, '[]'),41000,1.0,41000,41000,1.0,41000),
    ('b8159630-6fb2-11ed-9bd6-df1d69c40100','267946fa-6fb1-11ed-8c85-4725b99d6549',daterange('2022-08-01', NULL, '[]'),121400,0.45,54600,121400,0.45,54600),
    ('b816805e-6fb2-11ed-9bd7-f3c20b046d31','26794f24-6fb1-11ed-8c86-1f58d027951d',daterange('2022-08-01', NULL, '[]'),90000,0.45,40500,90000,0.45,40500),

    --DAYCARE_PART_TIME_FIVE_YEAR_OLDS
    ('4c67845c-536a-11ed-8d11-97b77098a2ac','153a6364-536a-11ed-8d0f-d7a4b2b860f1',daterange('2022-08-01', NULL, '[]'),132100,1.0,132100,132100,1.0,132100),
    ('6106a848-536a-11ed-8d12-9b8d0bb52ef5','325c97b4-536a-11ed-8d10-4b3a543573f7',daterange('2022-08-01', NULL, '[]'),132100,1.0,132100,132100,1.0,132100),
    ('931b15a2-536b-11ed-8d14-f743f93c7f0d','73976b22-536b-11ed-8d13-57ff6a3494ef',daterange('2022-08-01', NULL, '[]'),132100,1.0,132100,132100,1.0,132100),
    ('4a1f4610-536c-11ed-8d16-ef79cd92be44','3172d514-536c-11ed-8d15-dfe8e83094cd',daterange('2022-08-01', NULL, '[]'),132100,0.75,91100,132100,0.75,91100),
    ('00e6e6a4-536e-11ed-8d18-c74c7ee8eee7','e94a8bae-536d-11ed-8d17-9b8007da5dec',daterange('2022-08-01', NULL, '[]'),132100,0.6,79300,132100,0.6,79300),
    ('cdd6c148-7088-11ed-a759-cb6f7e91fff1','a2877f1a-7087-11ed-a559-4fa06829e6fd',daterange('2022-08-01', NULL, '[]'),176000,1.0,176000,176000,1.0,176000),
    ('cdd7653a-7088-11ed-a75a-6bd92b763473','a2878c8a-7087-11ed-a55a-ffa38e3847aa',daterange('2022-08-01', NULL, '[]'),176000,1.0,176000,176000,1.0,176000),
    ('cdd7663e-7088-11ed-a75b-ef5fb52280a9','a2878d2a-7087-11ed-a55b-2f42cae1743e',daterange('2022-08-01', NULL, '[]'),176000,0.75,132000,176000,0.75,132000),
    ('cdd766b6-7088-11ed-a75c-ff8cc1bb61f7','a2878d84-7087-11ed-a55c-53988f52a3bf',daterange('2022-08-01', NULL, '[]'),176000,0.6,105600,176000,0.6,105600),
    ('cdd7672e-7088-11ed-a75d-c7357b09b35c','a2879072-7087-11ed-a55d-6f35f6f6df2f',daterange('2022-08-01', NULL, '[]'),130500,1.0,130500,130500,1.0,130500),
    ('cdd7679c-7088-11ed-a75e-bf7d24c40ca5','a28790e0-7087-11ed-a55e-0700a24f1119',daterange('2022-08-01', NULL, '[]'),130500,1.0,130500,130500,1.0,130500),
    ('cdd7680a-7088-11ed-a75f-fbdc40b677b6','a2879554-7087-11ed-a55f-df43279a1ac6',daterange('2022-08-01', NULL, '[]'),130500,0.75,97900,130500,0.75,97900),
    ('cdd7686e-7088-11ed-a760-df0ced05f7d6','a2879860-7087-11ed-a560-2b2470e04de6',daterange('2022-08-01', NULL, '[]'),130500,0.6,78300,130500,0.6,78300),

    --PRESCHOOL
    ('a51acacc-148c-11ed-be1e-6f6c58c226d4','bc6a4550-fa74-11eb-9a2d-035acd5db9aa',daterange('2022-08-01', NULL, '[]'),50900,1.0,50900,50900,1.0,50900),
    ('7ea85b54-4f90-11ed-8be8-b7c388bb843a','5c21d452-4f90-11ed-8be7-bf748cc343bf',daterange('2022-08-01', NULL, '[]'),50900,1.0,50900,50900,1.0,50900),
    ('be76e8a8-536f-11ed-8d1a-771bf17e50e9','a678968e-536f-11ed-8d19-5715e16c8489',daterange('2022-08-01', NULL, '[]'),50900,1.0,50900,50900,1.0,50900),

    --PRESCHOOL_DAYCARE
    ('a51ac130-148c-11ed-be1e-9fbce6d355c2','0bfc6c92-ff2a-11eb-a785-2724e8e5e7ee',daterange('2022-08-01', NULL, '[]'),142000,1.0,142000,142000,1.0,142000),
    ('a51ac31a-148c-11ed-be1e-e3e34511e46f','503593e8-b961-11eb-b527-a3dcdfb628ec',daterange('2022-08-01', NULL, '[]'),142000,1.0,142000,142000,1.0,142000),
    ('a51ac504-148c-11ed-be1e-0f887ecb00af','50359442-b961-11eb-b528-df3290c0d63e',daterange('2022-08-01', NULL, '[]'),142000,1.0,142000,142000,1.0,142000),
    ('a51ac6ee-148c-11ed-be1e-ebc76f5037c4','bc6a42d0-fa74-11eb-9a2b-d315a7916074',daterange('2022-08-01', NULL, '[]'),142000,0.75,106500,142000,0.75,106500),
    ('a51ab398-148c-11ed-be1e-df739d9aecb9','50359212-b961-11eb-b522-074fb05f7086',daterange('2022-08-01', NULL, '[]'),142000,0.6,85200,142000,0.6,85200),
    ('f91efad4-5371-11ed-8d1c-9b47b58ecc8d','e1d0d78a-5371-11ed-8d1b-cb612aa6780b',daterange('2022-08-01', NULL, '[]'),142000,1.0,142000,142000,1.0,142000),
    ('975e4498-5372-11ed-8d1e-9313c98eed17','7b2ff2e4-5372-11ed-8d1d-5f26eff8b49b',daterange('2022-08-01', NULL, '[]'),142000,1.0,142000,142000,1.0,142000),
    ('1812f160-5373-11ed-8d20-cf346dae72fa','0004e312-5373-11ed-8d1f-575317e00afc',daterange('2022-08-01', NULL, '[]'),142000,0.75,106500,142000,0.75,106500),
    ('8698eb1c-5373-11ed-8d22-afd0f4472e7b','6fdc7ad8-5373-11ed-8d21-87047833ff0b',daterange('2022-08-01', NULL, '[]'),142000,0.6,85200,142000,0.6,85200),

    --OTHER_ONES - SET TO DEFAULT VOUCHER VALUE
    ('a51ab5b4-148c-11ed-be1e-8785a13fca88','86ef7370-bf85-11eb-91e7-6fcd728c518d',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51ab870-148c-11ed-be1e-6fcae4f7e94b','50359280-b961-11eb-b523-237115533645',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('93660830-4f8f-11ed-8be6-8b783396d6b7','5e82f704-4f8f-11ed-8be5-bbe76169415f',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51abc9e-148c-11ed-be1e-e7efda66457b','50359334-b961-11eb-b525-f3febdfea5d3',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51abf3c-148c-11ed-be1e-2f734e058208','5035938e-b961-11eb-b526-6b30323c87a8',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('0bde3d76-4f92-11ed-8bec-0bbb7f91fc71','e549007e-4f91-11ed-8beb-2f7e83af8ba6',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51ac8e2-148c-11ed-be1e-db830daa047b','bc6a44ec-fa74-11eb-9a2c-73b53c2af869',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51acd56-148c-11ed-be1e-17764348bca7','bc6a45a0-fa74-11eb-9a2e-fb411a8588da',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51acf5e-148c-11ed-be1e-836c2b35ecb6','ff6ddcd4-fa8a-11eb-8592-2f2b4e398fcb',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('66a28654-4f92-11ed-8bee-077eea087eb0','4d246a6c-4f92-11ed-8bed-2f5b3226e682',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('fad5ddb4-4f90-11ed-8bea-8b352f1dca97','d6d5a660-4f90-11ed-8be9-6f76cd90c246',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51ad148-148c-11ed-be1e-0bdf6a5141f9','1b4413f6-d99d-11eb-89ac-a3a978104bce',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),

    -- 2022-05-01 - 2022-07-31

    --DAYCARE
    --DAYCARE_PART_TIME
    ('','50358394-b961-11eb-b51f-67ac436e5636',daterange('2022-05-01', '2022-07-31' '[]'),81200,1.0,81200,122600,1.0,122600),
    ('','86ef70a0-bf85-11eb-91e6-1fb57a101161',daterange('2022-05-01', '2022-07-31' '[]'),81200,1.0,81200,122600,1.0,122600),
    ('','503590f0-b961-11eb-b520-53740af3f7ee',daterange('2022-05-01', '2022-07-31' '[]'),81200,1.0,81200,122600,1.0,122600),
    ('','503591ae-b961-11eb-b521-1fca99358eef',daterange('2022-05-01', '2022-07-31' '[]'),81200,0.75,67700,122600,0.75,102200),
    ('','503592da-b961-11eb-b524-7f27c780d83a',daterange('2022-05-01', '2022-07-31' '[]'),81200,0.6,54100,122600,0.6,81700),
    ('','85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0',daterange('2022-05-01', '2022-07-31' '[]'),81200,0.6,54100,122600,0.6,81700),

    --PRESCHOOL
    ('','bc6a4550-fa74-11eb-9a2d-035acd5db9aa',daterange('2022-05-01', '2022-07-31' '[]'),50500,1.0,50500,50500,1.0,50500),
    ('','5c21d452-4f90-11ed-8be7-bf748cc343bf',daterange('2022-05-01', '2022-07-31' '[]'),50500,1.0,50500,50500,1.0,50500),
    ('','a678968e-536f-11ed-8d19-5715e16c8489',daterange('2022-05-01', '2022-07-31' '[]'),50500,1.0,50500,50500,1.0,50500),

    --DAYCARE_FIVE_YEAR_OLDS
    ('','a867f3ec-5368-11ed-8d0b-b31b59a849a1',daterange('2022-05-01', '2022-07-31' '[]'),40600,1.0,40600,40600,1.0,40600),
    ('','c73c5cea-5368-11ed-8d0c-8fb44e947bc6',daterange('2022-05-01', '2022-07-31' '[]'),40600,1.0,40600,40600,1.0,40600),
    ('','267946fa-6fb1-11ed-8c85-4725b99d6549',daterange('2022-05-01', '2022-07-31' '[]'),120200,0.45,54100,120200,0.45,54100),
    ('','26794f24-6fb1-11ed-8c86-1f58d027951d',daterange('2022-05-01', '2022-07-31' '[]'),89100,0.45,40100,89100,0.45,40100),

    -- 2021-08-01 - 2022-04-30

    --PRESCHOOL
    ('','a678968e-536f-11ed-8d19-5715e16c8489',daterange('2021-08-01', '2022-04-30' '[]'),48100,1.0,48100,48100,1.0,48100),

    -- 2020-08-01 - 2022-04-30

    --DAYCARE
    --DAYCARE_PART_TIME
    ('','50358394-b961-11eb-b51f-67ac436e5636',daterange('2020-08-01', '2022-04-30' '[]'),77400,1.0,77400,116900,1.0,116900),
    ('','86ef70a0-bf85-11eb-91e6-1fb57a101161',daterange('2020-08-01', '2022-04-30' '[]'),77400,1.0,77400,116900,1.0,116900),
    ('','503590f0-b961-11eb-b520-53740af3f7ee',daterange('2020-08-01', '2022-04-30' '[]'),77400,1.0,77400,116900,1.0,116900),
    ('','503591ae-b961-11eb-b521-1fca99358eef',daterange('2020-08-01', '2022-04-30' '[]'),77400,0.75,64500,116900,0.75,97400),
    ('','503592da-b961-11eb-b524-7f27c780d83a',daterange('2020-08-01', '2022-04-30' '[]'),77400,0.6,51600,116900,0.6,77900),
    ('','85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0',daterange('2020-08-01', '2022-04-30' '[]'),77400,0.6,51600,116900,0.6,77900),

    --PRESCHOOL
    ('','bc6a4550-fa74-11eb-9a2d-035acd5db9aa',daterange('2020-08-01', '2022-04-30' '[]'),48100,1.0,48100,48100,1.0,48100),
    ('','5c21d452-4f90-11ed-8be7-bf748cc343bf',daterange('2020-08-01', '2022-04-30' '[]'),48100,1.0,48100,48100,1.0,48100),

    --DAYCARE_FIVE_YEAR_OLDS
    ('','267946fa-6fb1-11ed-8c85-4725b99d6549',daterange('2020-08-01', '2022-04-30' '[]'),86000,0.45,38700,86000,0.45,38700),
    ('','26794f24-6fb1-11ed-8c86-1f58d027951d',daterange('2020-08-01', '2022-04-30' '[]'),86000,0.45,38700,86000,0.45,38700),

    -- 2019-11-01 - 2022-04-30

    --DAYCARE_FIVE_YEAR_OLDS
    ('','a867f3ec-5368-11ed-8d0b-b31b59a849a1',daterange('2019-11-01', '2022-04-30' '[]'),37200,1.0,37200,37200,1.0,37200),
    ('','c73c5cea-5368-11ed-8d0c-8fb44e947bc6',daterange('2019-11-01', '2022-04-30' '[]'),37200,1.0,37200,37200,1.0,37200),

    -- 2018-11-01 - 2020-07-31

    --DAYCARE_FIVE_YEAR_OLDS
    ('','267946fa-6fb1-11ed-8c85-4725b99d6549',daterange('2018-11-01', '2020-07-31' '[]'),82700,0.45,37200,82700,0.45,37200),
    ('','26794f24-6fb1-11ed-8c86-1f58d027951d',daterange('2018-11-01', '2020-07-31' '[]'),82700,0.45,37200,82700,0.45,37200),

    -- 2018-08-01 - 2020-07-31

    --DAYCARE
    --DAYCARE_PART_TIME
    ('','50358394-b961-11eb-b51f-67ac436e5636',daterange('2018-08-01', '2020-07-31' '[]'),74500,1.0,74500,112500,1.0,112500),
    ('','86ef70a0-bf85-11eb-91e6-1fb57a101161',daterange('2018-08-01', '2020-07-31' '[]'),74500,1.0,74500,112500,1.0,112500),
    ('','503590f0-b961-11eb-b520-53740af3f7ee',daterange('2018-08-01', '2020-07-31' '[]'),74500,1.0,74500,112500,1.0,112500),
    ('','503591ae-b961-11eb-b521-1fca99358eef',daterange('2018-08-01', '2020-07-31' '[]'),74500,0.75,62100,112500,0.75,93800),
    ('','503592da-b961-11eb-b524-7f27c780d83a',daterange('2018-08-01', '2020-07-31' '[]'),74500,0.6,49700,112500,0.6,75000),
    ('','85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0',daterange('2018-08-01', '2020-07-31' '[]'),74500,0.6,49700,112500,0.6,75000),

    --PRESCHOOL
    ('','bc6a4550-fa74-11eb-9a2d-035acd5db9aa',daterange('2018-08-01', '2020-07-31' '[]'),46300,1.0,46300,46300,1.0,46300),
    ('','5c21d452-4f90-11ed-8be7-bf748cc343bf',daterange('2018-08-01', '2020-07-31' '[]'),46300,1.0,46300,46300,1.0,46300),




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
