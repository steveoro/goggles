--
-- Changing meeting 15202-riccione from 2015-12-06 to 2015-12-05
-- 07 December 2015 14:36:17
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-12-05'
  WHERE (`id`=15202);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-05'
  WHERE (`id`=958);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-05'
  WHERE (`id`=959);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-06'
  WHERE (`id`=960);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-06'
  WHERE (`id`=961);

-- 15202-riccione date change done
-- Script ended
