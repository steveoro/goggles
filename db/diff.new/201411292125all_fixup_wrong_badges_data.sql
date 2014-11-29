-- Fix up Wrong badges data
update badges b set b.team_affiliation_id = 499 where b.team_id = 290;
commit;
