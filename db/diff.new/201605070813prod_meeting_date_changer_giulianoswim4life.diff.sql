--
-- Changing meeting 15326-giulianoswim4life from 2016-05-02 to 2016-05-07
-- 07 May 2016 08:13:22
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-05-07'
  WHERE (`id`=15326);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-07'
  WHERE (`id`=1210);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-07'
  WHERE (`id`=1211);

-- 15326-giulianoswim4life date change done
-- Script ended
