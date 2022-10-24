-- SPDX-FileCopyrightText: 2021 City of Turku
--
-- SPDX-License-Identifier: LGPL-2.1-or-later

INSERT INTO service_need_option
    (id, name_fi, name_sv, name_en, valid_placement_type, default_option, fee_coefficient, occupancy_coefficient, daycare_hours_per_week, part_day, part_week, fee_description_fi, fee_description_sv, voucher_value_description_fi, voucher_value_description_sv, display_order, occupancy_coefficient_under_3y)
VALUES
    --DAYCARE
    ('50358394-b961-11eb-b51f-67ac436e5636', 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Early childhood education over 35h/week (over 147h/month)', 'DAYCARE', TRUE, 1.0, 1.0, 40, FALSE, FALSE, 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', null, 1.75),
    ('86ef70a0-bf85-11eb-91e6-1fb57a101161', 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Early childhood education over 35h/week (over 147h/month)', 'DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 'Varhaiskasvatus yli 35/vko (yli 147h/kk)', 'Småbarnspedagogik över 35h/vecka (över 147h/mån)', 0, 1.75),
    ('503590f0-b961-11eb-b520-53740af3f7ee', 'Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Early childhood education at most 35h/week (at most 147h/month)', 'DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 'Varhaiskasvatus enintään 35h/vko (enintään 147h/kk)', 'Småbarnspedagogik högst 35h/vecka (högst 147h/mån)', 1, 1.75),
    ('503591ae-b961-11eb-b521-1fca99358eef', 'Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Full-time, 15 day agreement', 'DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 'Varhaiskasvatus enintään 27h/vko (enintään 116h/kk)', 'Småbarnspedagogik högst 27,5h/vecka (högst 116h/mån)', 2, 1.75),

    --DAYCARE_PART_TIME
    ('503592da-b961-11eb-b524-7f27c780d83a', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', TRUE, 0.5, 0.5, 20, TRUE, FALSE, 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', null, 1.75),
    ('85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Early childhood education at most 20h/week (at most 84h/month)', 'DAYCARE_PART_TIME', FALSE, 0.5, 0.5, 20, TRUE, FALSE, 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 'Varhaiskasvatus enintään 20h/vko (enintään 84h/kk)', 'Småbarnspedagogik högst 20h/vecka (högst 84h/mån)', 3, 1.75),

    --DAYCARE_FIVE_YEAR_OLDS
    ('153a6364-536a-11ed-8d0f-d7a4b2b860f1', '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus yli 147h/kk (100%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik över 147h/mån (100%)', 'Free of charge early education for 5 years old + early childhood education over 147h/month (100%)', 'DAYCARE_FIVE_YEAR_OLDS', TRUE, 1.0, 1.0, 40, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus yli 147h/kk (100%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik över 147h/mån (100%)', '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus yli 147h/kk (100%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik över 147h/mån (100%)', null, 1.75),
    ('325c97b4-536a-11ed-8d10-4b3a543573f7', '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus yli 147h/kk (100%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik över 147h/mån (100%)', 'Free of charge early education for 5 years old + early childhood education over 147h/month (100%)', 'DAYCARE_FIVE_YEAR_OLDS', FALSE, 1.0, 1.0, 40, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus yli 147h/kk (100%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik över 147h/mån (100%)', '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus yli 147h/kk (100%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik över 147h/mån (100%)', 200, 1.75),
    ('73976b22-536b-11ed-8d13-57ff6a3494ef', '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus enintään 147h/kk (85%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik högst 147h/mån (85%)', 'Free of charge early education for 5 years old + early childhood education at most 147h/month (85%)', 'DAYCARE_FIVE_YEAR_OLDS', FALSE, 0.85, 1.0, 35, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus enintään 147h/kk (85%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik högst 147h/mån (85%)', '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus enintään 147h/kk (85%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik högst 147h/mån (85%)', 210, 1.75),
    ('3172d514-536c-11ed-8d15-dfe8e83094cd', '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus enintään 116h/kk (65%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik högst 116h/mån (65%)', 'Free of charge early education for 5 years old + early childhood education at most 116h/month  (65%)', 'DAYCARE_FIVE_YEAR_OLDS', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus enintään 116h/kk (65%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik högst 116h/mån (65%)', '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus enintään 116h/kk (65%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik högst 116h/mån (65%)', 220, 1.75),
    ('e94a8bae-536d-11ed-8d17-9b8007da5dec', '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus enintään 84h/kk (50%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik högst 84h/mån (50%)', 'Free of charge early education for 5 years old + early childhood education at most 84h/month (50%)', 'DAYCARE_FIVE_YEAR_OLDS', FALSE, 0.5, 1.0, 20, FALSE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus enintään 84h/kk (50%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik högst 84h/mån (50%)', '5-vuotiaiden maksuton varhaiskasvatus + varhaiskasvatus enintään 84h/kk (50%)', 'Avgiftsfri småbarnspedagogik för 5-åringar + småbarnspedagogik högst 84h/mån (50%)', 230, 1.75),

    --DAYCARE_PART_TIME_FIVE_YEAR_OLDS
    ('a867f3ec-5368-11ed-8d0b-b31b59a849a1', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', 'Free of charge early education for 5 years old', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', TRUE, 0.0, 0.5, 20, TRUE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', null, 1.75),
    ('c73c5cea-5368-11ed-8d0c-8fb44e947bc6', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', 'Free of charge early education for 5 years old', 'DAYCARE_PART_TIME_FIVE_YEAR_OLDS', FALSE, 0.0, 0.5, 20, TRUE, FALSE, '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', '5-vuotiaiden maksuton varhaiskasvatus', 'Avgiftsfri småbarnspedagogik för 5-åringar', 250, 1.75),

    --PRESCHOOL
    ('bc6a4550-fa74-11eb-9a2d-035acd5db9aa', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Preschool 4h/day', 'PRESCHOOL', TRUE, 0, 0.5, 20, TRUE, FALSE, 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', null, 1.75),
    ('5c21d452-4f90-11ed-8be7-bf748cc343bf', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Preschool 4h/day', 'PRESCHOOL', FALSE, 0, 0.5, 20, TRUE, FALSE, 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 'Esiopetus 4h/pv', 'Förskole undervisning 4h/dag', 50, 1.75),
    ('a678968e-536f-11ed-8d19-5715e16c8489', 'Kaksivuotinen esiopetuskokeilu', 'Tvåårig förskole', 'Two year preschool education', 'PRESCHOOL', FALSE, 0, 0.5, 20, TRUE, FALSE, 'Kaksivuotinen esiopetuskokeilu', 'Tvåårig förskole', 'Kaksivuotinen esiopetuskokeilu', 'Tvåårig förskole', 50, 1.75),

    --PRESCHOOL_DAYCARE
    ('0bfc6c92-ff2a-11eb-a785-2724e8e5e7ee', 'Esiopetus 4h/pv + varhaiskasvatus yli 147h/kk (100%)', 'Förskole undervisning 4h/dag + småbarnspedagogik över 147t/mån (100%)', 'Preschool 4h/day + early childhood education over 147h/month (100%)', 'PRESCHOOL_DAYCARE', TRUE, 1.0, 1.0, 40, FALSE, FALSE, 'Esiopetus 4h/pv + varhaiskasvatus yli 147h/kk (100%)', 'Förskole undervisning 4h/dag + småbarnspedagogik över 147t/mån (100%)', 'Esiopetus 4h/pv + varhaiskasvatus yli 147h/kk (100%)', 'Förskole undervisning 4h/dag + småbarnspedagogik över 147t/mån (100%)', null, 1.75),
    ('503593e8-b961-11eb-b527-a3dcdfb628ec', 'Esiopetus 4h/pv + varhaiskasvatus yli 147h/kk (100%)', 'Förskole undervisning 4h/dag + småbarnspedagogik över 147t/mån (100%)', 'Preschool 4h/day + early childhood education over 147h/month (100%)', 'PRESCHOOL_DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Esiopetus 4h/pv + varhaiskasvatus yli 147h/kk (100%)', 'Förskole undervisning 4h/dag + småbarnspedagogik över 147t/mån (100%)', 'Esiopetus 4h/pv + varhaiskasvatus yli 147h/kk (100%)', 'Förskole undervisning 4h/dag + småbarnspedagogik över 147t/mån (100%)', 2000, 1.75),
    ('50359442-b961-11eb-b528-df3290c0d63e', 'Esiopetus 4h/pv + varhaiskasvatus enintään 147h/kk (85%)', 'Förskole undervisning 4h/dag + småbarnspedagogik högst 147t/mån (85%)', 'Preschool 4h/day + early childhood education at most 147h/month (85%)', 'PRESCHOOL_DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Esiopetus 4h/pv + varhaiskasvatus enintään 147h/kk (85%)', 'Förskole undervisning 4h/dag + småbarnspedagogik högst 147t/mån (85%)', 'Esiopetus 4h/pv + varhaiskasvatus enintään 147h/kk (85%)', 'Förskole undervisning 4h/dag + småbarnspedagogik högst 147t/mån (85%)', 2100, 1.75),
    ('bc6a42d0-fa74-11eb-9a2b-d315a7916074', 'Esiopetus 4h/pv + varhaiskasvatus enintään 116h/kk (65%)', 'Förskole undervisning 4h/dag + småbarnspedagogik högst 116t/mån (65%)', 'Preschool 4h/day + early childhood education at most 116h/month (65%)', 'PRESCHOOL_DAYCARE', FALSE, 0.65, 1.0, 27.5, TRUE, TRUE, 'Esiopetus 4h/pv + varhaiskasvatus enintään 116h/kk (65%)', 'Förskole undervisning 4h/dag + småbarnspedagogik högst 116t/mån (65%)', 'Esiopetus 4h/pv + varhaiskasvatus enintään 116h/kk (65%)', 'Förskole undervisning 4h/dag + småbarnspedagogik högst 116t/mån (65%)', 2200, 1.75),
    ('50359212-b961-11eb-b522-074fb05f7086', 'Esiopetus 4h/pv + varhaiskasvatus enintään 84h/kk (50%)', 'Förskole undervisning 4h/dag + småbarnspedagogik högst 84t/mån (50%)', 'Preschool 4h/day + early childhood education at most 84h/month (50%)', 'PRESCHOOL_DAYCARE', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Esiopetus 4h/pv + varhaiskasvatus enintään 84h/kk (50%)', 'Förskole undervisning 4h/dag + småbarnspedagogik högst 84t/mån (50%)', 'Esiopetus 4h/pv + varhaiskasvatus enintään 84h/kk (50%)', 'Förskole undervisning 4h/dag + småbarnspedagogik högst 84t/mån (50%)', 2250, 1.75),
    ('e1d0d78a-5371-11ed-8d1b-cb612aa6780b', 'Kaksivuotinen esiopetuskokeilu + varhaiskasvatus yli 147h/kk (100%)', 'Tvåårig förskole undervisning + småbarnspedagogik över 147h/mån (100%)', 'Two year preschool education + early childhood education over 147h/month (100%)', 'PRESCHOOL_DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Kaksivuotinen esiopetuskokeilu + varhaiskasvatus yli 147h/kk (100%)', 'Tvåårig förskole undervisning + småbarnspedagogik över 147h/mån (100%)', 'Kaksivuotinen esiopetuskokeilu + varhaiskasvatus yli 147h/kk (100%)', 'Tvåårig förskole undervisning + småbarnspedagogik över 147h/mån (100%)', 2260, 1.75),
    ('7b2ff2e4-5372-11ed-8d1d-5f26eff8b49b', 'Kaksivuotinen esiopetuskokeilu + varhaiskasvatus enintään 147h/kk (85%)', 'Tvåårig förskole undervisning + småbarnspedagogik högst 147h/mån (85%)', 'Two year preschool education +  early childhood education at most 147h/month (85%)', 'PRESCHOOL_DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Kaksivuotinen esiopetuskokeilu + varhaiskasvatus enintään 147h/kk (85%)', 'Tvåårig förskole undervisning + småbarnspedagogik högst 147h/mån (85%)', 'Kaksivuotinen esiopetuskokeilu + varhaiskasvatus enintään 147h/kk (85%)', 'Tvåårig förskole undervisning + småbarnspedagogik högst 147h/mån (85%)', 2270, 1.75),
    ('0004e312-5373-11ed-8d1f-575317e00afc', 'Kaksivuotinen esiopetuskokeilu + varhaiskasvatus enintään 116h/kk (65%)', 'Tvåårig förskole undervisning + småbarnspedagogik högst 116h/mån (65%)', 'Two year preschool education + early childhood education at most 116h/month (65%)', 'PRESCHOOL_DAYCARE', FALSE, 0.65, 1.0, 27.5, TRUE, TRUE, 'Kaksivuotinen esiopetuskokeilu + varhaiskasvatus enintään 116h/kk (65%)', 'Tvåårig förskole undervisning + småbarnspedagogik högst 116h/mån (65%)', 'Kaksivuotinen esiopetuskokeilu + varhaiskasvatus enintään 116h/kk (65%)', 'Tvåårig förskole undervisning + småbarnspedagogik högst 116h/mån (65%)', 2280, 1.75),
    ('6fdc7ad8-5373-11ed-8d21-87047833ff0b', 'Kaksivuotinen esiopetuskokeilu + varhaiskasvatus enintään 84h/kk (50%)', 'Tvåårig förskole undervisning + småbarnspedagogik högst 84h/mån (50%)', 'Two year preschool education + early childhood education at most 84h/month (50%)', 'PRESCHOOL_DAYCARE', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Kaksivuotinen esiopetuskokeilu + varhaiskasvatus enintään 84h/kk (50%)', 'Tvåårig förskole undervisning + småbarnspedagogik högst 84h/mån (50%)', 'Kaksivuotinen esiopetuskokeilu + varhaiskasvatus enintään 84h/kk (50%)', 'Tvåårig förskole undervisning + småbarnspedagogik högst 84h/mån (50%)', 2290, 1.75),


    --PREPARATORY
    ('1b4413f6-d99d-11eb-89ac-a3a978104bce', 'Valmistava opetus', 'Förbererande utbilndning', 'Preparatory education', 'PREPARATORY', TRUE, 0, 0.54, 25, TRUE, FALSE, 'Valmistava opetus', 'Förbererande utbilndning', 'Valmistava opetus', 'Förbererande utbilndning', null, 1.75),
    ('d6d5a660-4f90-11ed-8be9-6f76cd90c246', 'Valmistava opetus', 'Förbererande utbilndning', 'Preparatory education', 'PREPARATORY', FALSE, 0, 0.54, 25, TRUE, FALSE, 'Valmistava opetus', 'Förbererande utbilndning', 'Valmistava opetus', 'Förbererande utbilndning', 2220, 1.75),


    --PREPARATORY_DAYCARE
    ('bc6a44ec-fa74-11eb-9a2c-73b53c2af869', 'Valmistava opetus + varhaiskasvatus yli 147h/kk (100%)', 'Förbererande utbilndning + småbarnspedagogik över 147h/mån  (100%)', 'Preschool daycare – max 5 h per day; 15 day agreement', 'PREPARATORY_DAYCARE', TRUE, 1.0, 1.0, 40, FALSE, FALSE, 'Valmistava opetus + varhaiskasvatus yli 147h/kk (100%)', 'Förbererande utbilndning + småbarnspedagogik över 147h/mån  (100%)', 'Valmistava opetus + varhaiskasvatus yli 147h/kk (100%)', 'Förbererande utbilndning + småbarnspedagogik över 147h/mån  (100%)', 2300, 1.75),
    ('bc6a45a0-fa74-11eb-9a2e-fb411a8588da', 'Valmistava opetus + varhaiskasvatus yli 147h/kk (100%)', 'Förbererande utbilndning + småbarnspedagogik över 147h/mån  (100%)', 'Preschool daycare – max 5 h per day; 15 day agreement', 'PREPARATORY_DAYCARE', FALSE, 1.0, 1.0, 40, FALSE, FALSE, 'Valmistava opetus + varhaiskasvatus yli 147h/kk (100%)', 'Förbererande utbilndning + småbarnspedagogik över 147h/mån  (100%)', 'Valmistava opetus + varhaiskasvatus yli 147h/kk (100%)', 'Förbererande utbilndning + småbarnspedagogik över 147h/mån  (100%)', 2350, 1.75),
    ('86ef7370-bf85-11eb-91e7-6fcd728c518d', 'Valmistava opetus + varhaiskasvatus enintään 147h/kk (85%)', 'Förbererande utbilndning + småbarnspedagogik högst 147h/mån (85%)', 'Preparatory education + early childhood education at most 147h/month (85%)', 'PREPARATORY_DAYCARE', FALSE, 0.85, 1.0, 35, FALSE, FALSE, 'Valmistava opetus + varhaiskasvatus enintään 147h/kk (85%)', 'Förbererande utbilndning + småbarnspedagogik högst 147h/mån (85%)', 'Valmistava opetus + varhaiskasvatus enintään 147h/kk (85%)', 'Förbererande utbilndning + småbarnspedagogik högst 147h/mån (85%)', 2400, 1.75),
    ('50359280-b961-11eb-b523-237115533645', 'Valmistava opetus + varhaiskasvatus enintään 116h/kk (65%)', 'Förbererande utbilndning + småbarnspedagogik högst 116h/mån (65%)', 'Preparatory education +early childhood education at most 116h/month  (65%)', 'PREPARATORY_DAYCARE', FALSE, 0.65, 1.0, 27.5, FALSE, FALSE, 'Valmistava opetus + varhaiskasvatus enintään 116h/kk (65%)', 'Förbererande utbilndning + småbarnspedagogik högst 116h/mån (65%)', 'Valmistava opetus + varhaiskasvatus enintään 116h/kk (65%)', 'Förbererande utbilndning + småbarnspedagogik högst 116h/mån (65%)', 2450, 1.75),
    ('5e82f704-4f8f-11ed-8be5-bbe76169415f', 'Valmistava opetus + varhaiskasvatus enintään 84h/kk (50%)', 'Förbererande utbilndning + småbarnspedagogik högst 84h/mån (50%)', 'Preparatory education + early childhood education at most 84h/month (50%)', 'PREPARATORY_DAYCARE', FALSE, 0.5, 1.0, 20, FALSE, FALSE, 'Valmistava opetus + varhaiskasvatus enintään 84h/kk (50%)', 'Förbererande utbilndning + småbarnspedagogik högst 84h/mån (50%)', 'Valmistava opetus + varhaiskasvatus enintään 84h/kk (50%)', 'Förbererande utbilndning + småbarnspedagogik högst 84h/mån (50%)', 2500, 1.75),


    --TEMPORARY_DAYCARE
    ('5035938e-b961-11eb-b526-6b30323c87a8', 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 'Temporary early childhood education', 'TEMPORARY_DAYCARE', TRUE, 1.0, 0.54, 40, FALSE, FALSE, 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', null, 1.75),
    ('e549007e-4f91-11ed-8beb-2f7e83af8ba6', 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 'Temporary early childhood education', 'TEMPORARY_DAYCARE', FALSE, 1.0, 0.54, 40, FALSE, FALSE, 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 'Tilapäinen varhaiskasvatus', 'Tillfällig småbarnspedagogik', 2600, 1.75),


    --CLUB
    ('ff6ddcd4-fa8a-11eb-8592-2f2b4e398fcb', 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 'Open early childhood education at most 10h/week', 'CLUB', TRUE, 1.0, 0.54, 10, FALSE, FALSE, 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', null, 1.75),
    ('4d246a6c-4f92-11ed-8bed-2f5b3226e682', 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 'Open early childhood education at most 10h/week', 'CLUB', FALSE, 1.0, 0.54, 10, FALSE, FALSE, 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 'Avoin varhaiskasvatus enintään 10h/vko', 'Öppen småbarnspedagogik högst 10h/vecka', 2700, 1.75),
    ('50359334-b961-11eb-b525-f3febdfea5d3', 'Avoin varhaiskasvatus enintään 15h/vko', 'Öppen småbarnspedagogik högst 15h/vecka', 'Open early childhood education at most 15h/week', 'CLUB', FALSE, 1.0, 0.54, 15, FALSE, FALSE, 'Avoin varhaiskasvatus enintään 15h/vko', 'Öppen småbarnspedagogik högst 15h/vecka', 'Avoin varhaiskasvatus enintään 15h/vko', 'Öppen småbarnspedagogik högst 15h/vecka', 2750, 1.75)

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
    occupancy_coefficient_under_3y = EXCLUDED.occupancy_coefficient_under_3y
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
    service_need_option.occupancy_coefficient_under_3y = EXCLUDED.occupancy_coefficient_under_3y;


INSERT INTO service_need_option_voucher_value (
    id,service_need_option_id,validity,base_value,coefficient,value,base_value_under_3y,coefficient_under_3y,value_under_3y
)
VALUES
    ('a51a05ce-148c-11ed-be1e-138f17756ad7','50358394-b961-11eb-b51f-67ac436e5636',daterange('2000-01-01', NULL, '[]'),82600,1.0,82600,126600,1.0,126600),
    ('a51aacf4-148c-11ed-be1e-733f9c20ff61','86ef70a0-bf85-11eb-91e6-1fb57a101161',daterange('2000-01-01', NULL, '[]'),82600,1.0,82600,126600,1.0,126600),
    ('ea01ccd8-5368-11ed-8d0d-8b4935d05e97','a867f3ec-5368-11ed-8d0b-b31b59a849a1',daterange('2000-01-01', NULL, '[]'),82600,1.0,0,126600,1.0,0),
    ('fd502424-5368-11ed-8d0e-d7e0ea1247b9','c73c5cea-5368-11ed-8d0c-8fb44e947bc6',daterange('2000-01-01', NULL, '[]'),82600,1.0,0,126600,1.0,0),
    ('a51aaf88-148c-11ed-be1e-db2e9883417e','503590f0-b961-11eb-b520-53740af3f7ee',daterange('2000-01-01', NULL, '[]'),82600,0.5,41300,126600,0.5,63300),
    ('a51ab19a-148c-11ed-be1e-4be88e69e52e','503591ae-b961-11eb-b521-1fca99358eef',daterange('2000-01-01', NULL, '[]'),82600,0.75,61950,126600,0.75,94950),
    ('a51ab5b4-148c-11ed-be1e-8785a13fca88','86ef7370-bf85-11eb-91e7-6fcd728c518d',daterange('2000-01-01', NULL, '[]'),82600,1.0,82600,126600,1.0,126600),
    ('a51ab870-148c-11ed-be1e-6fcae4f7e94b','50359280-b961-11eb-b523-237115533645',daterange('2000-01-01', NULL, '[]'),82600,0.3,24780,126600,0.3,37980),
    ('93660830-4f8f-11ed-8be6-8b783396d6b7','5e82f704-4f8f-11ed-8be5-bbe76169415f',daterange('2000-01-01', NULL, '[]'),82600,1.0,82600,126600,1.0,126600),
    ('a51abaa0-148c-11ed-be1e-931156918f24','503592da-b961-11eb-b524-7f27c780d83a',daterange('2000-01-01', NULL, '[]'),82600,0.45,37170,126600,0.45,56970),
    ('cdbaef90-5364-11ed-8d0a-07b4d2f136e5','85d1a0ca-5364-11ed-8d09-cb8b39c5e5e0',daterange('2000-01-01', NULL, '[]'),82600,0.45,37170,126600,0.45,56970),
    ('a51abc9e-148c-11ed-be1e-e7efda66457b','50359334-b961-11eb-b525-f3febdfea5d3',daterange('2000-01-01', NULL, '[]'),82600,0.5,41300,126600,0.5,63300),
    ('a51abf3c-148c-11ed-be1e-2f734e058208','5035938e-b961-11eb-b526-6b30323c87a8',daterange('2000-01-01', NULL, '[]'),82600,1.0,82600,126600,1.0,126600),
    ('0bde3d76-4f92-11ed-8bec-0bbb7f91fc71','e549007e-4f91-11ed-8beb-2f7e83af8ba6',daterange('2000-01-01', NULL, '[]'),82600,1.0,82600,126600,1.0,126600),
    ('a51ac130-148c-11ed-be1e-9fbce6d355c2','0bfc6c92-ff2a-11eb-a785-2724e8e5e7ee',daterange('2000-01-01', NULL, '[]'),82600,0.6,49560,126600,0.6,75960),
    ('4c67845c-536a-11ed-8d11-97b77098a2ac','153a6364-536a-11ed-8d0f-d7a4b2b860f1',daterange('2000-01-01', NULL, '[]'),82600,0.6,49560,126600,0.6,75960),
    ('6106a848-536a-11ed-8d12-9b8d0bb52ef5','325c97b4-536a-11ed-8d10-4b3a543573f7',daterange('2000-01-01', NULL, '[]'),82600,0.6,49560,126600,0.6,75960),
    ('a51ac31a-148c-11ed-be1e-e3e34511e46f','503593e8-b961-11eb-b527-a3dcdfb628ec',daterange('2000-01-01', NULL, '[]'),82600,0.6,49560,126600,0.6,75960),
    ('a51ac504-148c-11ed-be1e-0f887ecb00af','50359442-b961-11eb-b528-df3290c0d63e',daterange('2000-01-01', NULL, '[]'),82600,0.8,66080,126600,0.8,101280),
    ('a51ac6ee-148c-11ed-be1e-ebc76f5037c4','bc6a42d0-fa74-11eb-9a2b-d315a7916074',daterange('2000-01-01', NULL, '[]'),82600,0.3,24780,126600,0.3,37980),
    ('a51ab398-148c-11ed-be1e-df739d9aecb9','50359212-b961-11eb-b522-074fb05f7086',daterange('2000-01-01', NULL, '[]'),82600,0.6,49560,126600,0.6,75960),
    ('f91efad4-5371-11ed-8d1c-9b47b58ecc8d','e1d0d78a-5371-11ed-8d1b-cb612aa6780b',daterange('2000-01-01', NULL, '[]'),82600,0.8,66080,126600,0.8,101280),
    ('975e4498-5372-11ed-8d1e-9313c98eed17','7b2ff2e4-5372-11ed-8d1d-5f26eff8b49b',daterange('2000-01-01', NULL, '[]'),82600,0.6,49560,126600,0.6,75960),
    ('1812f160-5373-11ed-8d20-cf346dae72fa','0004e312-5373-11ed-8d1f-575317e00afc',daterange('2000-01-01', NULL, '[]'),82600,0.6,49560,126600,0.6,75960),
    ('8698eb1c-5373-11ed-8d22-afd0f4472e7b','6fdc7ad8-5373-11ed-8d21-87047833ff0b',daterange('2000-01-01', NULL, '[]'),82600,0.3,24780,126600,0.3,37980),
    ('931b15a2-536b-11ed-8d14-f743f93c7f0d','73976b22-536b-11ed-8d13-57ff6a3494ef',daterange('2000-01-01', NULL, '[]'),82600,0.8,66080,126600,0.8,101280),
    ('4a1f4610-536c-11ed-8d16-ef79cd92be44','3172d514-536c-11ed-8d15-dfe8e83094cd',daterange('2000-01-01', NULL, '[]'),82600,0.6,49560,126600,0.6,75960),
    ('00e6e6a4-536e-11ed-8d18-c74c7ee8eee7','e94a8bae-536d-11ed-8d17-9b8007da5dec',daterange('2000-01-01', NULL, '[]'),82600,0.3,24780,126600,0.3,37980),
    ('a51ac8e2-148c-11ed-be1e-db830daa047b','bc6a44ec-fa74-11eb-9a2c-73b53c2af869',daterange('2000-01-01', NULL, '[]'),82600,0.45,37170,126600,0.45,56970),
    ('a51acacc-148c-11ed-be1e-6f6c58c226d4','bc6a4550-fa74-11eb-9a2d-035acd5db9aa',daterange('2000-01-01', NULL, '[]'),82600,0.4,33040,126600,0.4,50640),
    ('7ea85b54-4f90-11ed-8be8-b7c388bb843a','5c21d452-4f90-11ed-8be7-bf748cc343bf',daterange('2000-01-01', NULL, '[]'),82600,0.4,33040,126600,0.4,50640),
    ('be76e8a8-536f-11ed-8d1a-771bf17e50e9','a678968e-536f-11ed-8d19-5715e16c8489',daterange('2000-01-01', NULL, '[]'),82600,0.4,33040,126600,0.4,50640),
    ('a51acd56-148c-11ed-be1e-17764348bca7','bc6a45a0-fa74-11eb-9a2e-fb411a8588da',daterange('2000-01-01', NULL, '[]'),82600,0.6,49560,126600,0.6,75960),
    ('a51acf5e-148c-11ed-be1e-836c2b35ecb6','ff6ddcd4-fa8a-11eb-8592-2f2b4e398fcb',daterange('2000-01-01', NULL, '[]'),82600,1.0,82600,126600,1.0,126600),
    ('66a28654-4f92-11ed-8bee-077eea087eb0','4d246a6c-4f92-11ed-8bed-2f5b3226e682',daterange('2000-01-01', NULL, '[]'),82600,1.0,82600,126600,1.0,126600),
    ('fad5ddb4-4f90-11ed-8bea-8b352f1dca97','d6d5a660-4f90-11ed-8be9-6f76cd90c246',daterange('2000-01-01', NULL, '[]'),82600,1.0,82600,126600,1.0,126600),
    ('a51ad148-148c-11ed-be1e-0bdf6a5141f9','1b4413f6-d99d-11eb-89ac-a3a978104bce',daterange('2000-01-01', NULL, '[]'),82600,1.0,82600,126600,1.0,126600)
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