-- Leega
-- 19/04/2016
-- Fix wrong meeting code
update meetings 
set code = 'striano'
where code = 'strianocittadistriano';