--
-- Changing meeting 15230-firenzeamicidelnuoto from 2015-10-25 to 2015-11-01
--
UPDATE `meetings`
  SET `header_date`='2015-11-01'
  WHERE (`id`=15230);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-01'
  WHERE (`id`=1023);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-01'
  WHERE (`id`=1024);
-- 15230-firenzeamicidelnuoto date changing script ended
