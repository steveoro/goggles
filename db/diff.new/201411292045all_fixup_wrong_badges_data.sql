-- Fix up Wrong badges data
update badges b set b.team_id = 290 where b.team_id = 41 and b.team_affiliation_id is null;
update team_affiliations ta set ta.name = 'Gruppo Sportivo Riale', ta.number = '' where ta.id = 499;
update meeting_entries mn set mn.team_affiliation_id = 499 where mn.team_id = 290;
commit;
