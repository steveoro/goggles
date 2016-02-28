-- Leega
-- 28/02/2016
-- Fix swimming pool jungle for Regionali Liguria
update meeting_sessions set swimming_pool_id = 176 where meeting_id = 13304;
update swimming_pools set name = 'Sciorba', address = 'Via Adamoli, 57', nick_name = 'genovasciorba25' where id = 106;
update meeting_sessions set swimming_pool_id = 106 where id in (806, 887, 1114, 1115); 
