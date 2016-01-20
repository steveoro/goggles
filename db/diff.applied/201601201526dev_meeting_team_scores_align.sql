-- Leega
-- 20/01/2016
-- meeting_team_scores id realign on devel
update meeting_team_scores set id = 8771 where id = 8785;
update meeting_team_scores set id = 8781 where id = 8795;
update meeting_team_scores set id = 8774 where id = 8788;
update meeting_team_scores set id = 8780 where id = 8794;
update meeting_team_scores set id = 8770 where id = 8784;
update meeting_team_scores set id = 8773 where id = 8787;
update meeting_team_scores set id = 8778 where id = 8792;
update meeting_team_scores set id = 8772 where id = 8786;
update meeting_team_scores set id = 8776 where id = 8790;
update meeting_team_scores set id = 8777 where id = 8791;
update meeting_team_scores set id = 8779 where id = 8793;
update meeting_team_scores set id = 8775 where id = 8789;
update meeting_team_scores set id = 8782 where id = 8796;
update meeting_team_scores set id = 8783 where id = 8797;
update meeting_team_scores set id = 9651 where id = 9662;
update meeting_team_scores set id = 9657 where id = 9668;
update meeting_team_scores set id = 9658 where id = 9669;
update meeting_team_scores set id = 9655 where id = 9666;
update meeting_team_scores set id = 9659 where id = 9670;
update meeting_team_scores set id = 9654 where id = 9665;
update meeting_team_scores set id = 9653 where id = 9664;
update meeting_team_scores set id = 9656 where id = 9667;
update meeting_team_scores set id = 9650 where id = 9661;
update meeting_team_scores set id = 9652 where id = 9663;
update meeting_team_scores set id = 9660 where id = 9671;

/*
-- Control query
select p_mts.id as prod_id, d_mts.id as devel_id, p_mts.meeting_id, p_mts.team_id
from goggles.meeting_team_scores p_mts
	join goggles_development.meeting_team_scores d_mts on d_mts.meeting_id = p_mts.meeting_id and d_mts.team_id = p_mts.team_id
where not exists (select 1 from goggles_development.meeting_team_scores mts where mts.id = p_mts.id and mts.meeting_id = p_mts.meeting_id and mts.team_id = p_mts.team_id);
*/