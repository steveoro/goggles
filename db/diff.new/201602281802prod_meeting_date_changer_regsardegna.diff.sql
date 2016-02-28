--
-- Changing meeting 15286-regsardegna from 2016-02-27 to 2016-02-06
-- 28 February 2016 18:02:44
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-02-06'
  WHERE (`id`=15286);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-02-06'
  WHERE (`id`=1130);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-02-06'
  WHERE (`id`=1131);

-- 15286-regsardegna date change done
-- Script ended
