--
-- Changing meeting 15316-palermopolisportivapalermo from 2016-03-16 to 2015-11-14
-- 29 December 2015 20:06:51
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-11-14'
  WHERE (`id`=15316);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-14'
  WHERE (`id`=1191);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-14'
  WHERE (`id`=1192);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-15'
  WHERE (`id`=1193);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-15'
  WHERE (`id`=1194);

-- 15316-palermopolisportivapalermo date change done
-- Script ended
