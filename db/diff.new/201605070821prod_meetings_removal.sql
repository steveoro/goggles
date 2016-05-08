-- Leega
-- 07/05/2016
-- Remove meetings not in official FIN calendar

-- 1. Remove meeting events
-- 2. Remove meeting sessions
-- 3. Remove meeting

-- 15234	07-11-2015	DISTANZE SPECIALI CAMPANIA 2015
delete from meeting_events where id > 0 and meeting_session_id in (select ms.id from meeting_sessions ms where ms.meeting_id = 15234);
delete from meeting_sessions where id > 0 and meeting_id = 15234;
delete from meetings where id = 15234;

-- 15235	08-11-2015	DISTANZE SPECIALI LIGURIA 2015
delete from meeting_events where id > 0 and meeting_session_id in (select ms.id from meeting_sessions ms where ms.meeting_id = 15235);
delete from meeting_sessions where id > 0 and meeting_id = 15235;
delete from meetings where id = 15235;

-- 15238	14-11-2015	II TROFEO IRONSWIM
delete from meeting_events where id > 0 and meeting_session_id in (select ms.id from meeting_sessions ms where ms.meeting_id = 15238);
delete from meeting_sessions where id > 0 and meeting_id = 15238;
delete from meetings where id = 15238;

-- 15241	15-11-2015	VII TROFEO CITTÀ DI ANDRIA
delete from meeting_events where id > 0 and meeting_session_id in (select ms.id from meeting_sessions ms where ms.meeting_id = 15241);
delete from meeting_sessions where id > 0 and meeting_id = 15241;
delete from meetings where id = 15241;

-- 15221	06-12-2015	II MEMORIAL E. BRUNELLI
delete from meeting_events where id > 0 and meeting_session_id in (select ms.id from meeting_sessions ms where ms.meeting_id = 15221);
delete from meeting_sessions where id > 0 and meeting_id = 15221;
delete from meetings where id = 15221;

-- 15319	17-04-2016	III TROFEO DEL PIAVE
delete from meeting_events where id > 0 and meeting_session_id in (select ms.id from meeting_sessions ms where ms.meeting_id = 15319);
delete from meeting_sessions where id > 0 and meeting_id = 15319;
delete from meetings where id = 15319;

-- 15323	24-04-2016	III MEETING TERRE DELLE SIRENE
delete from meeting_events where id > 0 and meeting_session_id in (select ms.id from meeting_sessions ms where ms.meeting_id = 15323);
delete from meeting_sessions where id > 0 and meeting_id = 15323;
delete from meetings where id = 15323;

-- 15328 - 08-05-2016 MERIDIANA MASTER CUP 2016
delete from meeting_events where id > 0 and meeting_session_id in (select ms.id from meeting_sessions ms where ms.meeting_id = 15328);
delete from meeting_sessions where id > 0 and meeting_id = 15328;
delete from meetings where id = 15328;
