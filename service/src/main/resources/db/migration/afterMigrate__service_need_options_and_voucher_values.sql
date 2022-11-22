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
    ('503591ae-b961-11eb-b521-1fca99358eef', 'Varhaiskasvatus enintään 27,5h/vko (enintään 116h/kk)', 'Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Early childhood education at most 27,5h/week (at most 116h/month)', 'DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 2, 1.75, true),
    ('684e4f0a-537b-11ed-aabb-d33da20b2117', 'Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', 'Service voucher evening care over 35h/week (over 147h/month)', 'DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', 'Palvelusetelin vuorohoito yli 35/vko (yli 147h/kk)', 'Servicecedeln skiftesverksamhet över 35h/vecka (över 147h/mån)', 3, 1.75, false),
    ('cc81be76-537b-11ed-aabd-d7571a7aed5f', 'Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', 'Service voucher evening care at most 35h/week (at most 147h/month)', 'DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', 'Palvelusetelin vuorohoito enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln skiftesverksamhet högst 35h/vecka (högst 147h/mån)', 4, 1.75, false),
    ('b244ea0e-5382-11ed-b846-d7ebbaaf5fd5', 'Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', 'Service voucher evening care at most 27,5h/week (at most 116h/month)', 'DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', 'Palvelusetelin vuorohoito enintään 27,5h/vko (enintään 116h/kk)', 'Servicecedeln skiftesverksamhet högst 27,5h/vecka (högst 116h/mån)', 5, 1.75, false),
    ('4062cdca-5387-11ed-b84a-6fc9185df882', 'Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', 'Service voucher weekend care over 35h/week (over 147h/month)', 'DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', 'Palvelusetelin viikonloppu yli 35/vko (yli 147h/kk)', 'Servicecedeln veckoslut över 35h/vecka (över 147h/mån)', 6, 1.75, false),
    ('d6e2a50e-5387-11ed-b84c-b7756f2c8248', 'Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', 'Service voucher weekend care at most 35h/week (at most 147h/month)', 'DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', 'Palvelusetelin viikonloppu enintään 35h/vko (enintään 147h/kk)', 'Servicecedeln veckoslut högst 35h/vecka (högst 147h/mån)', 7, 1.75, false),
    ('3e1852be-5388-11ed-b84e-e7d4a93b269e', 'Palvelusetelin viikonloppu enintään  27,5h/vko (enintään 116h/kk)', 'Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', 'Service voucher weekend care at most 27,5h/week (at most 116h/month)', 'DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Palvelusetelin viikonloppu enintään  27,5h/vko (enintään 116h/kk)', 'Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', 'Palvelusetelin viikonloppu enintään 27,5h/vko (enintään 116h/kk)', 'Servicecedeln veckoslut högst 27,5h/vecka (högst 116h/mån)', 8, 1.75, false),

    --DAYCARE_PART_TIME
    ('503592da-b961-11eb-b524-7f27c780d83a', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', TRUE, 0.5, 0.5, 20, TRUE, FALSE, 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', null, 1.75, true),
    ('85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 20, TRUE, FALSE, 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 10, 1.75, true),
    ('aed93b48-5384-11ed-b848-435687237b8e', 'Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', 'Service voucher evening care at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 20, TRUE, FALSE, 'Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', 'Palvelusetelin vuorohoito enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln skiftesverksamhet högst 20h/vecka (högst 84h/mån)', 11, 1.75, false),
    ('b01d3d66-5388-11ed-b850-3bbd85d56f15', 'Palvelusetelin viikonloppu enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', 'Service voucher weekend care at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 20, TRUE, FALSE, 'Palvelusetelin viikonloppu enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', 'Palvelusetelin viikonloppu enintään 20h/vko (enintään 84h/kk)', 'Servicecedeln veckoslut högst 20h/vecka (högst 84h/mån)', 12, 1.75, false),

    --DAYCARE_FIVE_YEAR_OLDS
    ('a867f3ec-5368-11ed-8d0b-b31b59a849a1', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', 'Free of charge early education for 5 years old', 'DAYCARE_FIVE_YEAR_OLDS', TRUE, 0.0, 0.5, 20, TRUE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', null, 1.75, false),
    ('c73c5cea-5368-11ed-8d0c-8fb44e947bc6', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', 'Free of charge early education for 5 years old', 'DAYCARE_FIVE_YEAR_OLDS', FALSE, 0.0, 0.5, 20, TRUE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', 250, 1.75, false),

    --DAYCARE_PART_TIME_FIVE_YEAR_OLDS
    ('153a6364-536a-11ed-8d0f-d7a4b2b860f1', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Free of charge early education for 5 years old + Early childhood education over 35h/week (over 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', TRUE, 1.0, 1.0, 40, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', null, 1.75, false),
    ('325c97b4-536a-11ed-8d10-4b3a543573f7', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Free of charge early education for 5 years old + Early childhood education over 35h/week (over 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 1.0, 1.0, 40, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 200, 1.75, false),
    ('73976b22-536b-11ed-8d13-57ff6a3494ef', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Free of charge early education for 5 years old + Early childhood education at most 35h/week (at most 147h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.85, 1.0, 35, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 210, 1.75, false),
    ('3172d514-536c-11ed-8d15-dfe8e83094cd', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Free of charge early education for 5 years old + Early childhood education at most 27,5h/week (at most 116h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 220, 1.75, false),
    ('e94a8bae-536d-11ed-8d17-9b8007da5dec', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Free of charge early education for 5 years old + Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.5, 1.0, 20, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', '5-vuotiaiden maksuton varhaiskasvatus + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Avgiftsfri småbarnspedagogik för 5-åringar + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 230, 1.75, false),

    --PRESCHOOL
    ('bc6a4550-fa74-11eb-9a2d-035acd5db9aa', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Preschool 4h/day', 'PRESCHOOL', TRUE, 0, 0.5, 20, TRUE, FALSE, 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', null, 1.75, false),
    ('5c21d452-4f90-11ed-8be7-bf748cc343bf', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Preschool 4h/day', 'PRESCHOOL', FALSE, 0, 0.5, 20, TRUE, FALSE, 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 50, 1.75, false),
    ('a678968e-536f-11ed-8d19-5715e16c8489', 'Kaksivuotinen esiopetuskokeilu', 'Tvåårig förskole', 'Two year preschool education', 'PRESCHOOL', FALSE, 0, 0.5, 20, TRUE, FALSE, 'Kaksivuotinen esiopetuskokeilu', 'Tvåårig förskole', 'Kaksivuotinen esiopetuskokeilu', 'Tvåårig förskole', 50, 1.75, false),

    --PRESCHOOL_DAYCARE
    ('0bfc6c92-ff2a-11eb-a785-2724e8e5e7ee', 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Preschool 4h/day + Early childhood education over 35h/week (over 147h/month)', 'PRESCHOOL_DAYCARE', TRUE, 1.0, 1.0, 40, FALSE, FALSE, 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', null, 1.75, false),
    ('503593e8-b961-11eb-b527-a3dcdfb628ec', 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Preschool 4h/day + Early childhood education over 35h/week (over 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 2000, 1.75, false),
    ('50359442-b961-11eb-b528-df3290c0d63e', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Preschool 4h/day + Early childhood education at most 35h/week (at most 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Esiopetus 4h/pv + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 2100, 1.75, false),
    ('bc6a42d0-fa74-11eb-9a2b-d315a7916074', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Preschool 4h/day + Early childhood education at most 27,5h/week (at most 116h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.65, 1.0, 27.5, TRUE, TRUE, 'Esiopetus 4h/pv + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 2200, 1.75, false),
    ('50359212-b961-11eb-b522-074fb05f7086', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Preschool 4h/day + Early childhood education at most 20h/week (at most 84h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Esiopetus 4h/pv + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Esiopetus 4h/pv + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Förskole undervisning 4h/dag + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 2250, 1.75, false),
    ('e1d0d78a-5371-11ed-8d1b-cb612aa6780b', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus yli 35h/vko (147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Two year preschool education + Early childhood education over 35h/week (over 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus yli 35h/vko (147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus yli 35h/vko (147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 2260, 1.75, false),
    ('7b2ff2e4-5372-11ed-8d1d-5f26eff8b49b', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Two year preschool education + Early childhood education at most 35h/week (at most 147h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 2270, 1.75, false),
    ('0004e312-5373-11ed-8d1f-575317e00afc', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Two year preschool education + Early childhood education at most 27,5h/week (at most 116h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.65, 1.0, 27.5, TRUE, TRUE, 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 2280, 1.75, false),
    ('6fdc7ad8-5373-11ed-8d21-87047833ff0b', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Two year preschool education + Early childhood education at most 20h/week (at most 84h/month)', 'PRESCHOOL_DAYCARE', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Kaksivuotinen esiopetuskokeilu + Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Tvåårig förskole undervisning + Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 2290, 1.75, false),

    --PREPARATORY
    ('1b4413f6-d99d-11eb-89ac-a3a978104bce', 'Valmistava opetus', 'Förbererande utbilndning', 'Preparatory education', 'PREPARATORY', TRUE, 0, 0.54, 25, TRUE, FALSE, 'Valmistava opetus', 'Förbererande utbilndning', 'Valmistava opetus', 'Förbererande utbilndning', null, 1.75, false),
    ('d6d5a660-4f90-11ed-8be9-6f76cd90c246', 'Valmistava opetus', 'Förbererande utbilndning', 'Preparatory education', 'PREPARATORY', FALSE, 0, 0.54, 25, TRUE, FALSE, 'Valmistava opetus', 'Förbererande utbilndning', 'Valmistava opetus', 'Förbererande utbilndning', 2220, 1.75, false),

    --PREPARATORY_DAYCARE
    ('bc6a44ec-fa74-11eb-9a2c-73b53c2af869', 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Preparatory education + Early childhood education over 35h/week (over 147h/month)', 'PREPARATORY_DAYCARE', TRUE, 1.0, 1.0, 40, FALSE, FALSE, 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 2300, 1.75, false),
    ('bc6a45a0-fa74-11eb-9a2e-fb411a8588da', 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Preparatory education + Early childhood education over 35h/week (over 147h/month)', 'PREPARATORY_DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Valmistava opetus + Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik över 35h/vecka (över 147h/mån)', 2350, 1.75, false),
    ('86ef7370-bf85-11eb-91e7-6fcd728c518d', 'Valmistava opetus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Preparatory education + Early childhood education at most 35h/week (at most 147h/month)', 'PREPARATORY_DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Valmistava opetus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Valmistava opetus + Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 2400, 1.75, false),
    ('50359280-b961-11eb-b523-237115533645', 'Valmistava opetus + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Preparatory education + Early childhood education at most 27,5h/week (at most 116h/month)', 'PREPARATORY_DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Valmistava opetus + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Valmistava opetus + Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Förbererande utbilndning + Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 2450, 1.75, false),
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


    --DAYCARE_FIVE_YEAR_OLDS
    ('ea01ccd8-5368-11ed-8d0d-8b4935d05e97','a867f3ec-5368-11ed-8d0b-b31b59a849a1',daterange('2022-08-01', NULL, '[]'),41000,1.0,41000,41000,1.0,41000),
    ('fd502424-5368-11ed-8d0e-d7e0ea1247b9','c73c5cea-5368-11ed-8d0c-8fb44e947bc6',daterange('2022-08-01', NULL, '[]'),41000,1.0,41000,41000,1.0,41000),

    --PRESCHOOL
    ('a51acacc-148c-11ed-be1e-6f6c58c226d4','bc6a4550-fa74-11eb-9a2d-035acd5db9aa',daterange('2022-08-01', NULL, '[]'),50900,1.0,50900,50900,1.0,50900),
    ('7ea85b54-4f90-11ed-8be8-b7c388bb843a','5c21d452-4f90-11ed-8be7-bf748cc343bf',daterange('2022-08-01', NULL, '[]'),50900,1.0,50900,50900,1.0,50900),
    ('be76e8a8-536f-11ed-8d1a-771bf17e50e9','a678968e-536f-11ed-8d19-5715e16c8489',daterange('2022-08-01', NULL, '[]'),50900,1.0,50900,50900,1.0,50900),

    --PRESCHOOL_DAYCARE
    ('a51ac31a-148c-11ed-be1e-e3e34511e46f','503593e8-b961-11eb-b527-a3dcdfb628ec',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900), --NEEDS RIGHT VALUES


    --OTHER_ONES - SET TO DEFAULT VOUCHER VALUE
    ('a51ab5b4-148c-11ed-be1e-8785a13fca88','86ef7370-bf85-11eb-91e7-6fcd728c518d',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51ab870-148c-11ed-be1e-6fcae4f7e94b','50359280-b961-11eb-b523-237115533645',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('93660830-4f8f-11ed-8be6-8b783396d6b7','5e82f704-4f8f-11ed-8be5-bbe76169415f',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51abc9e-148c-11ed-be1e-e7efda66457b','50359334-b961-11eb-b525-f3febdfea5d3',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51abf3c-148c-11ed-be1e-2f734e058208','5035938e-b961-11eb-b526-6b30323c87a8',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('0bde3d76-4f92-11ed-8bec-0bbb7f91fc71','e549007e-4f91-11ed-8beb-2f7e83af8ba6',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('4c67845c-536a-11ed-8d11-97b77098a2ac','153a6364-536a-11ed-8d0f-d7a4b2b860f1',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('6106a848-536a-11ed-8d12-9b8d0bb52ef5','325c97b4-536a-11ed-8d10-4b3a543573f7',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51ac504-148c-11ed-be1e-0f887ecb00af','50359442-b961-11eb-b528-df3290c0d63e',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,101280),
    ('a51ac6ee-148c-11ed-be1e-ebc76f5037c4','bc6a42d0-fa74-11eb-9a2b-d315a7916074',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51ab398-148c-11ed-be1e-df739d9aecb9','50359212-b961-11eb-b522-074fb05f7086',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('f91efad4-5371-11ed-8d1c-9b47b58ecc8d','e1d0d78a-5371-11ed-8d1b-cb612aa6780b',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('975e4498-5372-11ed-8d1e-9313c98eed17','7b2ff2e4-5372-11ed-8d1d-5f26eff8b49b',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('8698eb1c-5373-11ed-8d22-afd0f4472e7b','6fdc7ad8-5373-11ed-8d21-87047833ff0b',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('931b15a2-536b-11ed-8d14-f743f93c7f0d','73976b22-536b-11ed-8d13-57ff6a3494ef',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('4a1f4610-536c-11ed-8d16-ef79cd92be44','3172d514-536c-11ed-8d15-dfe8e83094cd',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('00e6e6a4-536e-11ed-8d18-c74c7ee8eee7','e94a8bae-536d-11ed-8d17-9b8007da5dec',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51ac8e2-148c-11ed-be1e-db830daa047b','bc6a44ec-fa74-11eb-9a2c-73b53c2af869',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51acd56-148c-11ed-be1e-17764348bca7','bc6a45a0-fa74-11eb-9a2e-fb411a8588da',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51acf5e-148c-11ed-be1e-836c2b35ecb6','ff6ddcd4-fa8a-11eb-8592-2f2b4e398fcb',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('66a28654-4f92-11ed-8bee-077eea087eb0','4d246a6c-4f92-11ed-8bed-2f5b3226e682',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('fad5ddb4-4f90-11ed-8bea-8b352f1dca97','d6d5a660-4f90-11ed-8be9-6f76cd90c246',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900),
    ('a51ad148-148c-11ed-be1e-0bdf6a5141f9','1b4413f6-d99d-11eb-89ac-a3a978104bce',daterange('2022-08-01', NULL, '[]'),91100,1.0,91100,154900,1.0,154900)
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
