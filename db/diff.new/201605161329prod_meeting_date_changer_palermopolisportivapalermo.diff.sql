--
-- Changing meeting 14316-palermopolisportivapalermo from 2015-03-18 to 2015-04-18
-- 16 May 2016 13:29:46
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-04-18'
  WHERE (`id`=14316);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-04-18'
  WHERE (`id`=722);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-04-18'
  WHERE (`id`=755);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-04-19'
  WHERE (`id`=840);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-04-19'
  WHERE (`id`=918);

-- 14316-palermopolisportivapalermo date change done
-- Script ended
