-- Leega
-- 20/04/2016
-- Fix CSI relay categories

/*
select *
from category_types ct
where ct.season_id in (131, 141, 151)
	and ct.is_a_relay;
*/

update category_types
set description = 'STAFF. M 120-160', short_name = '120-160', age_end = 160
where id in (691, 831, 906);
update category_types
set description = 'STAFF. M OLTRE 160', short_name = '>160', age_begin = 161
where id in (692, 832, 907);
