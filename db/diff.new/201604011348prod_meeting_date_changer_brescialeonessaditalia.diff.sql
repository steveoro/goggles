--
-- Changing meeting 15258-brescialeonessaditalia from 2015-12-20 to 2015-12-13
-- 01 April 2016 15:48:58
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-12-13'
  WHERE (`id`=15258);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-13'
  WHERE (`id`=1078);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-13'
  WHERE (`id`=1079);

-- 15258-brescialeonessaditalia date change done
-- Script ended
