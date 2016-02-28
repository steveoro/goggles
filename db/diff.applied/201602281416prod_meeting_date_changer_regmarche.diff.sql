--
-- Changing meeting 15285-regmarche from 2016-02-21 to 2016-02-06
-- 28 February 2016 14:16:18
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-02-06'
  WHERE (`id`=15285);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-02-06'
  WHERE (`id`=1128);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-02-06'
  WHERE (`id`=1129);

-- 15285-regmarche date change done
-- Script ended
