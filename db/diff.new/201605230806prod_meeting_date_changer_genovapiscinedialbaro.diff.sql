--
-- Changing meeting 15331-genovapiscinedialbaro from 2016-05-21 to 2016-06-04
-- 23 May 2016 08:06:03
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-06-04'
  WHERE (`id`=15331);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-06-04'
  WHERE (`id`=1219);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-06-04'
  WHERE (`id`=1220);

-- 15331-genovapiscinedialbaro date change done
-- Script ended
