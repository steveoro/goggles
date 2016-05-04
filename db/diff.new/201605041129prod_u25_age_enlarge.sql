-- Leega
-- 04/05/2016
-- Enlarge U25 Category to include SEN&M20
-- In this way M20 and U25 will be correctly splitted
-- in record handling

update category_types
set age_begin = 16
where code = 'U25' and id > 0;

/*
select *
from category_types ct
where ct.code = 'U25';
*/
