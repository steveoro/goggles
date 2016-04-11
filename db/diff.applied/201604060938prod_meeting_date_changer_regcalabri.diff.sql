--
-- Changing meeting 15297-regcalabri from 2016-03-13 to 2016-02-21
-- 06 April 2016 09:38:42
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-02-21'
  WHERE (`id`=15297);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-02-21'
  WHERE (`id`=1151);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-02-21'
  WHERE (`id`=1152);

-- 15297-regcalabri date change done
-- Script ended
