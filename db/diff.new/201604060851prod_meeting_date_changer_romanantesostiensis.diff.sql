--
-- Changing meeting 15304-romanantesostiensis from 2016-03-26 to 2016-04-02
-- 06 April 2016 08:51:12
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-04-02'
  WHERE (`id`=15304);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-02'
  WHERE (`id`=1165);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-03'
  WHERE (`id`=1166);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-03'
  WHERE (`id`=1167);

-- 15304-romanantesostiensis date change done
-- Script ended
