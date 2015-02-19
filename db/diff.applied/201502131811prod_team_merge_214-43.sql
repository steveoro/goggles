-- Merging 'AMICI DEL NUOTO FIR' (id: 214) => 'MASTER AMICI DEL NUOTO' (id: 43)...


-- Updates for MeetingIndividualResult:
UPDATE `meeting_individual_results`
  SET `team_id`=43, `team_affiliation_id`=236, `badge_id`=5064
  WHERE (`id`=107636);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `team_affiliation_id`=236, `badge_id`=5071
  WHERE (`id`=107639);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `team_affiliation_id`=236, `badge_id`=5100
  WHERE (`id`=107653);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `team_affiliation_id`=236, `badge_id`=5143
  WHERE (`id`=107661);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `team_affiliation_id`=236, `badge_id`=5064
  WHERE (`id`=107699);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `team_affiliation_id`=236, `badge_id`=5071
  WHERE (`id`=107701);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `team_affiliation_id`=236, `badge_id`=5100
  WHERE (`id`=107712);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `team_affiliation_id`=236, `badge_id`=5143
  WHERE (`id`=107724);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `team_affiliation_id`=236, `badge_id`=5151
  WHERE (`id`=107731);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5064
  WHERE (`id`=108231);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5066
  WHERE (`id`=108235);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5071
  WHERE (`id`=108244);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5104
  WHERE (`id`=108261);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5109
  WHERE (`id`=108262);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5131
  WHERE (`id`=108281);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5143
  WHERE (`id`=108289);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5150
  WHERE (`id`=108298);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5151
  WHERE (`id`=108299);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5217
  WHERE (`id`=108378);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5071
  WHERE (`id`=108486);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5096
  WHERE (`id`=108496);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5097
  WHERE (`id`=108497);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5104
  WHERE (`id`=108499);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5109
  WHERE (`id`=108500);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5131
  WHERE (`id`=108512);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5151
  WHERE (`id`=108520);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5150
  WHERE (`id`=108523);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5161
  WHERE (`id`=108527);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5165
  WHERE (`id`=108529);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5217
  WHERE (`id`=108577);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5064
  WHERE (`id`=108587);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5066
  WHERE (`id`=108588);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5097
  WHERE (`id`=108610);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5096
  WHERE (`id`=108611);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5143
  WHERE (`id`=108639);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5161
  WHERE (`id`=108649);
UPDATE `meeting_individual_results`
  SET `team_id`=43, `badge_id`=5165
  WHERE (`id`=108653);

-- Updates for MeetingRelaySwimmer:

-- Updates for MeetingRelayResult:
UPDATE `meeting_relay_results`
  SET `team_id`=43
  WHERE (`id`=1342);
UPDATE `meeting_relay_results`
  SET `team_id`=43
  WHERE (`id`=1345);
UPDATE `meeting_relay_results`
  SET `team_id`=43
  WHERE (`id`=1356);

-- Updates for MeetingTeamScore:
UPDATE `meeting_team_scores`
  SET `team_id`=43
  WHERE (`id`=932);

-- Updates for MeetingEntry:

-- Updates for TeamManager:

-- Updates for TeamPassageTemplate:

-- Updates for ComputedSeasonRanking:

-- Updates for IndividualRecord:

-- Updates for Badge:

-- Updates for DataImportTeamAlias:
UPDATE `data_import_team_aliases`
  SET `team_id`=43
  WHERE (`id`=42);

-- Updates for Passage:

-- Updates for GoggleCupStandard:

-- Updates for GoggleCup:

-- Updates for TeamAffiliation:

-- Alias creation for master Team:
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (44, '2015-02-13 17:11:14', '2015-02-13 17:11:14', 'AMICI DEL NUOTO FIR', 43);


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
DELETE FROM `badges` WHERE (`id`=6899);

DELETE FROM `badges` WHERE (`id`=6901);

DELETE FROM `badges` WHERE (`id`=6913);

DELETE FROM `badges` WHERE (`id`=6920);

DELETE FROM `badges` WHERE (`id`=6961);

DELETE FROM `badges` WHERE (`id`=7219);

DELETE FROM `badges` WHERE (`id`=7237);

DELETE FROM `badges` WHERE (`id`=7238);

DELETE FROM `badges` WHERE (`id`=7253);

DELETE FROM `badges` WHERE (`id`=7267);

DELETE FROM `badges` WHERE (`id`=7315);

DELETE FROM `badges` WHERE (`id`=7370);

DELETE FROM `badges` WHERE (`id`=7371);

DELETE FROM `badges` WHERE (`id`=7378);

DELETE FROM `badges` WHERE (`id`=7379);


-- Deletes for DataImportTeamAlias:

-- Deletes for GoggleCupStandard:

-- Deletes for GoggleCup:

-- Deletes for Passage:

-- Deletes for TeamAffiliation:
DELETE FROM `team_affiliations` WHERE (`id`=409);


-- Deletes for Team:
DELETE FROM `teams` WHERE (`id`=214);

