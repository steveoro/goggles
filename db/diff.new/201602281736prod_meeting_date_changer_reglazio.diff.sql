--
-- Changing meeting 15272-reglazio from 2016-01-30 to 2016-02-06
-- 28 February 2016 17:36:43
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-02-06'
  WHERE (`id`=15272);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-02-06'
  WHERE (`id`=1106);

-- 15272-reglazio date change done
-- Script ended
