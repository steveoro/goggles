-- Merging 'CSS COORD SERV. SPORT SSD SRL' (id: 158) => 'CSS -SD COOP SPORTIVA DIL' (id: 68)...


-- Updates for MeetingIndividualResult:
UPDATE `meeting_individual_results`
  SET `team_id`=68, `team_affiliation_id`=261
  WHERE (`id`=105660);
UPDATE `meeting_individual_results`
  SET `team_id`=68, `team_affiliation_id`=261
  WHERE (`id`=105991);
UPDATE `meeting_individual_results`
  SET `team_id`=68, `team_affiliation_id`=261, `badge_id`=5189
  WHERE (`id`=106592);
UPDATE `meeting_individual_results`
  SET `team_id`=68, `team_affiliation_id`=261
  WHERE (`id`=106653);
UPDATE `meeting_individual_results`
  SET `team_id`=68, `team_affiliation_id`=261, `badge_id`=5189
  WHERE (`id`=106881);

-- Updates for MeetingRelaySwimmer:

-- Updates for MeetingRelayResult:

-- Updates for MeetingTeamScore:
UPDATE `meeting_team_scores`
  SET `team_id`=68, `team_affiliation_id`=261
  WHERE (`id`=888);

-- Updates for MeetingEntry:

-- Updates for TeamManager:

-- Updates for TeamPassageTemplate:

-- Updates for ComputedSeasonRanking:

-- Updates for IndividualRecord:

-- Updates for Badge:
UPDATE `badges`
  SET `team_id`=68, `team_affiliation_id`=261
  WHERE (`id`=5844);
UPDATE `badges`
  SET `team_id`=68, `team_affiliation_id`=261
  WHERE (`id`=6144);

-- Updates for DataImportTeamAlias:

-- Updates for Passage:

-- Updates for GoggleCupStandard:

-- Updates for GoggleCup:

-- Updates for TeamAffiliation:

-- Alias creation for master Team:
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (47, '2015-02-13 17:13:51', '2015-02-13 17:13:51', 'CSS COORD SERV. SPORT SSD SRL', 68);


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
DELETE FROM `badges` WHERE (`id`=6442);


-- Deletes for DataImportTeamAlias:

-- Deletes for GoggleCupStandard:

-- Deletes for GoggleCup:

-- Deletes for Passage:

-- Deletes for TeamAffiliation:
DELETE FROM `team_affiliations` WHERE (`id`=353);


-- Deletes for Team:
DELETE FROM `teams` WHERE (`id`=158);

