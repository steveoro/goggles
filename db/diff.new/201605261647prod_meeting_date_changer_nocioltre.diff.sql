--
-- Changing meeting 15340-nocioltre from 2016-05-29 to 2016-06-02
-- 26 May 2016 16:47:19
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-06-02'
  WHERE (`id`=15340);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-06-02'
  WHERE (`id`=1238);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-06-02'
  WHERE (`id`=1239);

-- 15340-nocioltre date change done
-- Script ended
