-- Merging 'POLISPORTIVA GARDEN' (id: 291) => 'POLISPORTIVA GARDEN' (id: 259)...


-- Updates for MeetingIndividualResult:
UPDATE `meeting_individual_results`
  SET `team_id`=259
  WHERE (`id`=111116);
UPDATE `meeting_individual_results`
  SET `team_id`=259
  WHERE (`id`=111117);

-- Updates for MeetingRelaySwimmer:

-- Updates for MeetingRelayResult:

-- Updates for MeetingTeamScore:
UPDATE `meeting_team_scores`
  SET `team_id`=259
  WHERE (`id`=1087);

-- Updates for MeetingEntry:
UPDATE `meeting_entries`
  SET `team_id`=259
  WHERE (`id`=1217);
UPDATE `meeting_entries`
  SET `team_id`=259
  WHERE (`id`=1218);

-- Updates for TeamManager:

-- Updates for TeamPassageTemplate:

-- Updates for ComputedSeasonRanking:

-- Updates for IndividualRecord:

-- Updates for Badge:
UPDATE `badges`
  SET `team_id`=259
  WHERE (`id`=8427);

-- Updates for DataImportTeamAlias:

-- Updates for Passage:

-- Updates for GoggleCupStandard:

-- Updates for GoggleCup:

-- Updates for TeamAffiliation:
UPDATE `team_affiliations`
  SET `team_id`=259
  WHERE (`id`=504);

-- Alias creation for master Team:
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (74, '2015-02-17 16:50:24', '2015-02-17 16:50:24', 'POLISPORTIVA GARDEN', 259);


-- Deletes for MeetingIndividualResult:

-- Deletes for MeetingRelaySwimmer:

-- Deletes for MeetingRelayResult:

-- Deletes for MeetingTeamScore:

-- Deletes for MeetingEntry:

-- Deletes for TeamManager:

-- Deletes for TeamPassageTemplate:

-- Deletes for ComputedSeasonRanking:

-- Deletes for IndividualRecord:

-- Deletes for Badge:

-- Deletes for DataImportTeamAlias:

-- Deletes for GoggleCupStandard:

-- Deletes for GoggleCup:

-- Deletes for Passage:

-- Deletes for TeamAffiliation:

-- Deletes for Team:
DELETE FROM `teams` WHERE (`id`=291);


-- [Steve, 20150217]
-- Manual fix for gender_type_id of Swimmer 'BARTOLI ELENA':
UPDATE `swimmers` SET `gender_type_id` = '2' WHERE `swimmers`.`id` = 4064;
