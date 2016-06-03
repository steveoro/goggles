-- Leega
-- 26/05/2016
-- Remove 2016 non existent meetings

-- 15341 - Spoleto - II Trofeo dei due mondi
delete from meeting_events where id > 0 and meeting_session_id in (select id from meeting_sessions where meeting_id = 15341);
delete from meeting_sessions where id > 0 and meeting_id = 15341;
delete from meetings where id = 15341;

-- 15343 - Padova - II Trofeo Città della speranza
delete from meeting_events where id > 0 and meeting_session_id in (select id from meeting_sessions where meeting_id = 15343);
delete from meeting_sessions where id > 0 and meeting_id = 15343;
delete from meetings where id = 15343;

-- 15222 - Firenze - Firenze Internationale meeting 2016
delete from meeting_events where id > 0 and meeting_session_id in (select id from meeting_sessions where meeting_id = 15222);
delete from meeting_sessions where id > 0 and meeting_id = 15222;
delete from meetings where id = 15222;