-- Merging 'CO.GE.SE.COOP.SOC.S' (id: 156) => 'CO.GE.SE. S.BENEDET' (id: 135)...


-- Updates for MeetingIndividualResult:
UPDATE `meeting_individual_results`
  SET `team_id`=135, `team_affiliation_id`=328, `badge_id`=5709
  WHERE (`id`=105824);

-- Updates for MeetingRelaySwimmer:

-- Updates for MeetingRelayResult:

-- Updates for MeetingTeamScore:

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
  VALUES (50, '2015-02-13 17:15:11', '2015-02-13 17:15:11', 'CO.GE.SE.COOP.SOC.S', 135);


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
DELETE FROM `badges` WHERE (`id`=6006);


-- Deletes for DataImportTeamAlias:

-- Deletes for GoggleCupStandard:

-- Deletes for GoggleCup:

-- Deletes for Passage:

-- Deletes for TeamAffiliation:
DELETE FROM `team_affiliations` WHERE (`id`=351);


-- Deletes for Team:
DELETE FROM `teams` WHERE (`id`=156);

