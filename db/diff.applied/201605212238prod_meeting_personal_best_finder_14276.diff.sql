--
-- Swimmer personal bests updates for Meeting REGIONALI VENETO E FRIULI 2015 (14276)
-- 21-05-2016 22:38
--
-- ANTONIOL MIRKO: Reset 100 FARFALLA - 50 metri (was  1'23"44)
UPDATE `meeting_individual_results`
  SET `is_personal_best`=0
  WHERE (`id`=201084);
-- ANTONIOL MIRKO 100 FARFALLA - 50 metri:  1'23"16
UPDATE `meeting_individual_results`
  SET `is_personal_best`=1
  WHERE (`id`=382174);
-- BASSO MAURO 200 STILE LIBERO - 50 metri:  3'07"91
UPDATE `meeting_individual_results`
  SET `is_personal_best`=1
  WHERE (`id`=383244);
-- BET LORIS 200 DORSO - 50 metri:  3'20"32
UPDATE `meeting_individual_results`
  SET `is_personal_best`=1
  WHERE (`id`=382889);
-- BET LORIS: Reset 100 RANA - 50 metri (was  1'39"37)
UPDATE `meeting_individual_results`
  SET `is_personal_best`=0
  WHERE (`id`=153022);
-- BET LORIS 100 RANA - 50 metri:  1'37"47
UPDATE `meeting_individual_results`
  SET `is_personal_best`=1
  WHERE (`id`=382503);
-- BOER MATTIA: Reset 100 RANA - 50 metri (was  1'28"45)
UPDATE `meeting_individual_results`
  SET `is_personal_best`=0
  WHERE (`id`=206335);
-- BOER MATTIA 100 RANA - 50 metri:  1'24"70
UPDATE `meeting_individual_results`
  SET `is_personal_best`=1
  WHERE (`id`=382417);
-- BORTOLUZZI ANDREA 50 FARFALLA - 50 metri:  0'31"36
UPDATE `meeting_individual_results`
  SET `is_personal_best`=1
  WHERE (`id`=383546);
-- BORTOLUZZI ANDREA 100 FARFALLA - 50 metri:  1'10"59
UPDATE `meeting_individual_results`
  SET `is_personal_best`=1
  WHERE (`id`=382186);
-- BURIN GIORGIO: Reset 800 STILE LIBERO - 50 metri (was 13'29"00)
UPDATE `meeting_individual_results`
  SET `is_personal_best`=0
  WHERE (`id`=348298);
-- BURIN GIORGIO 800 STILE LIBERO - 50 metri: 13'15"10
UPDATE `meeting_individual_results`
  SET `is_personal_best`=1
  WHERE (`id`=384122);
