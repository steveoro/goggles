-- Merging 'ALTO RENO DE AKKER' (id: 51) => 'CIVATURS DE AKKER' (id: 255)...


-- Updates for MeetingIndividualResult:
UPDATE `meeting_individual_results`
  SET `team_id`=255, `team_affiliation_id`=452, `badge_id`=7217
  WHERE (`id`=104215);
UPDATE `meeting_individual_results`
  SET `team_id`=255, `team_affiliation_id`=452, `badge_id`=7217
  WHERE (`id`=104578);

-- Updates for MeetingRelaySwimmer:

-- Updates for MeetingRelayResult:

-- Updates for MeetingTeamScore:
UPDATE `meeting_team_scores`
  SET `team_id`=255, `team_affiliation_id`=452
  WHERE (`id`=815);

-- Updates for MeetingEntry:

-- Updates for TeamManager:

-- Updates for TeamPassageTemplate:

-- Updates for ComputedSeasonRanking:

-- Updates for IndividualRecord:

-- Updates for Badge:

-- Updates for DataImportTeamAlias:

-- Updates for Passage:

-- Updates for GoggleCupStandard:

-- Updates for GoggleCup:

-- Updates for TeamAffiliation:

-- Alias creation for master Team:
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (43, '2015-02-13 17:09:35', '2015-02-13 17:09:35', 'ALTO RENO DE AKKER', 255);


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
DELETE FROM `badges` WHERE (`id`=5065);


-- Deletes for DataImportTeamAlias:

-- Deletes for GoggleCupStandard:

-- Deletes for GoggleCup:

-- Deletes for Passage:

-- Deletes for TeamAffiliation:
DELETE FROM `team_affiliations` WHERE (`id`=244);


-- Deletes for Team:
DELETE FROM `teams` WHERE (`id`=51);

