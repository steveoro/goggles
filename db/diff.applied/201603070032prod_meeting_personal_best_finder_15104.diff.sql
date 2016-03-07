--
-- Swimmer personal bests updates for Meeting 4A PROVA REGIONALE CSI 2015/2016 (15104)
-- 07-03-2016 00:32
--
-- MARCHETTA LEONARDO 100 MISTI - 25 metri:  1'05"00
UPDATE `meeting_individual_results`
  SET `is_personal_best`=1
  WHERE (`id`=285617);
-- DEL RIO SIMONE: Reset 100 MISTI - 25 metri (was  1'18"85)
UPDATE `meeting_individual_results`
  SET `is_personal_best`=0
  WHERE (`id`=118135);
-- DEL RIO SIMONE 100 MISTI - 25 metri:  1'18"50
UPDATE `meeting_individual_results`
  SET `is_personal_best`=1
  WHERE (`id`=285624);
-- CUCCONI FRANCESCO: Reset 100 MISTI - 25 metri (was  1'08"70)
UPDATE `meeting_individual_results`
  SET `is_personal_best`=0
  WHERE (`id`=17696);
-- CUCCONI FRANCESCO 100 MISTI - 25 metri:  1'07"10
UPDATE `meeting_individual_results`
  SET `is_personal_best`=1
  WHERE (`id`=285619);
-- MARTINELLI CARLOTTA: Reset 100 MISTI - 25 metri (was  1'20"30)
UPDATE `meeting_individual_results`
  SET `is_personal_best`=0
  WHERE (`id`=255322);
-- MARTINELLI CARLOTTA 100 MISTI - 25 metri:  1'20"00
UPDATE `meeting_individual_results`
  SET `is_personal_best`=1
  WHERE (`id`=285615);
-- DAVOLIO ERICA: Reset 100 MISTI - 25 metri (was  1'19"10)
UPDATE `meeting_individual_results`
  SET `is_personal_best`=0
  WHERE (`id`=255030);
-- DAVOLIO ERICA 100 MISTI - 25 metri:  1'15"80
UPDATE `meeting_individual_results`
  SET `is_personal_best`=1
  WHERE (`id`=285611);
-- Found 5 new personal bests
-- Personal bests update for meeting 15104 terminated.
