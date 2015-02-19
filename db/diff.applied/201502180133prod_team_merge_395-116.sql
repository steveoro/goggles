-- Merging 'LARUS NUOTO' (id: 395) => 'AS LARUS NUOTO' (id: 116)...


-- Updates for MeetingIndividualResult:
UPDATE `meeting_individual_results`
  SET `team_id`=116, `team_affiliation_id`=309
  WHERE (`id`=122647);
UPDATE `meeting_individual_results`
  SET `team_id`=116, `team_affiliation_id`=309
  WHERE (`id`=122931);

-- Updates for MeetingRelaySwimmer:

-- Updates for MeetingRelayResult:

-- Updates for MeetingTeamScore:
UPDATE `meeting_team_scores`
  SET `team_id`=116, `team_affiliation_id`=309
  WHERE (`id`=1792);

-- Updates for MeetingEntry:

-- Updates for TeamManager:

-- Updates for TeamPassageTemplate:

-- Updates for ComputedSeasonRanking:

-- Updates for IndividualRecord:

-- Updates for Badge:
UPDATE `badges`
  SET `team_id`=116, `team_affiliation_id`=309
  WHERE (`id`=10942);

-- Updates for DataImportTeamAlias:

-- Updates for Passage:

-- Updates for GoggleCupStandard:

-- Updates for GoggleCup:

-- Updates for TeamAffiliation:

-- Alias creation for master Team:
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (92, '2015-02-18 00:33:11', '2015-02-18 00:33:11', 'LARUS NUOTO', 116);


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
DELETE FROM `team_affiliations` WHERE (`id`=615);


-- Deletes for Team:
DELETE FROM `teams` WHERE (`id`=395);

