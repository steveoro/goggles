--
-- Changing meeting 15300-lumezzanesprintalbatros from 2016-03-20 to 2016-04-03
-- 06 April 2016 08:51:45
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-04-03'
  WHERE (`id`=15300);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-03'
  WHERE (`id`=1157);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-03'
  WHERE (`id`=1158);

-- 15300-lumezzanesprintalbatros date change done
-- Script ended
