-- Leega
-- 07/06/2016
-- Fix wrong bari meeting header

update meetings set code = 'baridiprimavera' where id = 13292;
update meetings set edition = 5 where id = 14301;
update meetings set edition = 6 where id = 15301;

/*
select m.id, m.description, m.edition, m.header_year, m.code
from meetings m
where m.code like '%bari%';
*/
