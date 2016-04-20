--
-- Changing meeting 15330-trevisoabettiol from 2016-04-20 to 2016-05-20
-- 20 April 2016 12:33:33
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-05-20'
  WHERE (`id`=15330);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-20'
  WHERE (`id`=1218);

-- 15330-trevisoabettiol date change done
-- Script ended
