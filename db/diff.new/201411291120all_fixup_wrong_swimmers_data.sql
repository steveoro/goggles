-- Wrong swimmers data
update swimmers s set s.last_name = 'PEDERZANI', s.complete_name = 'PEDERZANI GIULIA' where s.id = 1848;
update swimmers s set s.first_name = 'MIRKO', s.complete_name = 'LASI MIRKO' where s.id = 1060;
update swimmers s set s.year_of_birth = 1968 where s.id = 1808;

-- Wrong team name
update meeting_entries mn set mn.team_id = 290 where mn.team_id = 41;

commit;