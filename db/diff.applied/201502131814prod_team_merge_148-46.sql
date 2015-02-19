-- Merging 'A.S.DILETT. BERGAMO SWIM TEAM' (id: 148) => 'ASD BERGAMO SWIM TEAM' (id: 46)...


-- Updates for MeetingIndividualResult:
UPDATE `meeting_individual_results`
  SET `team_id`=46, `team_affiliation_id`=239, `badge_id`=5444
  WHERE (`id`=105944);
UPDATE `meeting_individual_results`
  SET `team_id`=46, `team_affiliation_id`=239
  WHERE (`id`=106200);
UPDATE `meeting_individual_results`
  SET `team_id`=46, `team_affiliation_id`=239, `badge_id`=5444
  WHERE (`id`=106559);
UPDATE `meeting_individual_results`
  SET `team_id`=46, `team_affiliation_id`=239
  WHERE (`id`=106640);

-- Updates for MeetingRelaySwimmer:

-- Updates for MeetingRelayResult:

-- Updates for MeetingTeamScore:
UPDATE `meeting_team_scores`
  SET `team_id`=46, `team_affiliation_id`=239
  WHERE (`id`=884);

-- Updates for MeetingEntry:

-- Updates for TeamManager:

-- Updates for TeamPassageTemplate:

-- Updates for ComputedSeasonRanking:

-- Updates for IndividualRecord:

-- Updates for Badge:
UPDATE `badges`
  SET `team_id`=46, `team_affiliation_id`=239
  WHERE (`id`=6291);

-- Updates for DataImportTeamAlias:

-- Updates for Passage:

-- Updates for GoggleCupStandard:

-- Updates for GoggleCup:

-- Updates for TeamAffiliation:

-- Alias creation for master Team:
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (49, '2015-02-13 17:14:46', '2015-02-13 17:14:46', 'A.S.DILETT. BERGAMO SWIM TEAM', 46);


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
DELETE FROM `badges` WHERE (`id`=6106);


-- Deletes for DataImportTeamAlias:

-- Deletes for GoggleCupStandard:

-- Deletes for GoggleCup:

-- Deletes for Passage:

-- Deletes for TeamAffiliation:
DELETE FROM `team_affiliations` WHERE (`id`=343);


-- Deletes for Team:
DELETE FROM `teams` WHERE (`id`=148);

