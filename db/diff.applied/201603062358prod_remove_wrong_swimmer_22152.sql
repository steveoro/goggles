-- Leega
-- 06/03/2016
-- Remove worng swimmer ODORICI MASISMO 1966
-- (the right one is ODORICI MASSIMO 1970)
delete from meeting_entries where swimmer_id = 22152;
delete from badges where swimmer_id = 22152;
delete from swimmers where id = 22152;
