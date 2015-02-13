-- Merging 'RN FRIULIA' (id: 261) => 'A.S.D.RARI NANTES FRIULIA' (id: 147)...


-- Updates for MeetingIndividualResult:
UPDATE `meeting_individual_results`
  SET `team_id`=147, `team_affiliation_id`=342, `badge_id`=6050
  WHERE (`id`=108163);
UPDATE `meeting_individual_results`
  SET `team_id`=147, `team_affiliation_id`=342, `badge_id`=5875
  WHERE (`id`=108169);
UPDATE `meeting_individual_results`
  SET `team_id`=147, `team_affiliation_id`=342, `badge_id`=6050
  WHERE (`id`=108400);
UPDATE `meeting_individual_results`
  SET `team_id`=147, `team_affiliation_id`=342, `badge_id`=5875
  WHERE (`id`=108408);

-- Updates for MeetingRelaySwimmer:

-- Updates for MeetingRelayResult:

-- Updates for MeetingTeamScore:
UPDATE `meeting_team_scores`
  SET `team_id`=147, `team_affiliation_id`=342
  WHERE (`id`=955);

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
  VALUES (52, '2015-02-13 17:16:00', '2015-02-13 17:16:00', 'RN FRIULIA', 147);


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
DELETE FROM `badges` WHERE (`id`=7170);

DELETE FROM `badges` WHERE (`id`=7176);


-- Deletes for DataImportTeamAlias:

-- Deletes for GoggleCupStandard:

-- Deletes for GoggleCup:

-- Deletes for Passage:

-- Deletes for TeamAffiliation:
DELETE FROM `team_affiliations` WHERE (`id`=458);


-- Deletes for Team:
DELETE FROM `teams` WHERE (`id`=261);

