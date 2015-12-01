/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Leega
-- Suppressing duplicated swimmer BARCHI DANILO (20982)
delete from meeting_entries where swimmer_id = 20982;
delete from badges where swimmer_id = 20982;
delete from swimmers where id = 20982;

-- Suppressing duplicated swimmer BARCHI DANILO (21045)
-- Move badge, entries and results (no passages were found)
update badges set swimmer_id = 1250 where swimmer_id = 21045;
update meeting_individual_results set swimmer_id = 1250 where swimmer_id = 21045;
update meeting_entries set swimmer_id = 1250 where swimmer_id = 21045;
delete from swimmers where id = 21045;

-- Suppressing duplicated swimmer GILIBERTI LORENZO (21008 -> 1688)
-- Move badge, entries and results (no relay and passages were found)
update badges set swimmer_id = 1688 where swimmer_id = 21008;
update meeting_individual_results set swimmer_id = 1688 where swimmer_id = 21008;
update meeting_entries set swimmer_id = 1688 where swimmer_id = 21008;
update meeting_relay_swimmers set swimmer_id = 1688 where swimmer_id = 21008;
update passages set swimmer_id = 1688 where swimmer_id = 21008;
delete from swimmers where id = 21008;
update swimmers set year_of_birth = 1985 where id = 1688;

commit;