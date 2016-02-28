--
-- Changing meeting 15279-regliguria from 2016-02-14 to 2016-02-21
-- 28 February 2016 16:33:06
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-02-21'
  WHERE (`id`=15279);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-02-21'
  WHERE (`id`=1114);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-02-21'
  WHERE (`id`=1115);

-- 15279-regliguria date change done
-- Script ended
