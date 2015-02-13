-- Merging 'Circolo Canottieri' (id: 242) => 'C.C. ANIENE ASD' (id: 89)...


-- Updates for MeetingIndividualResult:
UPDATE `meeting_individual_results`
  SET `team_id`=89, `team_affiliation_id`=282
  WHERE (`id`=107980);
UPDATE `meeting_individual_results`
  SET `team_id`=89, `team_affiliation_id`=282
  WHERE (`id`=107997);
UPDATE `meeting_individual_results`
  SET `team_id`=89, `team_affiliation_id`=282, `badge_id`=6666
  WHERE (`id`=108021);
UPDATE `meeting_individual_results`
  SET `team_id`=89, `team_affiliation_id`=282
  WHERE (`id`=108034);
UPDATE `meeting_individual_results`
  SET `team_id`=89, `team_affiliation_id`=282, `badge_id`=5205
  WHERE (`id`=108042);
UPDATE `meeting_individual_results`
  SET `team_id`=89, `team_affiliation_id`=282
  WHERE (`id`=108073);
UPDATE `meeting_individual_results`
  SET `team_id`=89, `team_affiliation_id`=282
  WHERE (`id`=108140);
UPDATE `meeting_individual_results`
  SET `team_id`=89, `team_affiliation_id`=282, `badge_id`=5205
  WHERE (`id`=108149);

-- Updates for MeetingRelaySwimmer:

-- Updates for MeetingRelayResult:

-- Updates for MeetingTeamScore:

-- Updates for MeetingEntry:

-- Updates for TeamManager:

-- Updates for TeamPassageTemplate:

-- Updates for ComputedSeasonRanking:

-- Updates for IndividualRecord:

-- Updates for Badge:
UPDATE `badges`
  SET `team_id`=89, `team_affiliation_id`=282
  WHERE (`id`=7079);
UPDATE `badges`
  SET `team_id`=89, `team_affiliation_id`=282
  WHERE (`id`=7090);
UPDATE `badges`
  SET `team_id`=89, `team_affiliation_id`=282
  WHERE (`id`=7114);

-- Updates for DataImportTeamAlias:

-- Updates for Passage:

-- Updates for GoggleCupStandard:

-- Updates for GoggleCup:

-- Updates for TeamAffiliation:

-- Alias creation for master Team:
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (48, '2015-02-13 17:14:20', '2015-02-13 17:14:20', 'Circolo Canottieri', 89);


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
DELETE FROM `badges` WHERE (`id`=7107);

DELETE FROM `badges` WHERE (`id`=7120);


-- Deletes for DataImportTeamAlias:

-- Deletes for GoggleCupStandard:

-- Deletes for GoggleCup:

-- Deletes for Passage:

-- Deletes for TeamAffiliation:
DELETE FROM `team_affiliations` WHERE (`id`=437);


-- Deletes for Team:
DELETE FROM `teams` WHERE (`id`=242);

