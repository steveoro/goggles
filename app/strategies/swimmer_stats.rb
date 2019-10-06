require 'wrappers/timing'

#
# == SwimmerStats
#
# Pattern to retrieve swimmers statistic data
# Swimemr statis are those sown in swimemr's radio tab
#
# @author   Leega
#
class SwimmerStats

  # These must be initialized on creation:
  attr_reader :swimmer, :swimmer_stats

  # These can be edited later on:
  #attr_accessor :current_seasons, :presence_data, :swimmers_summary

  # Initialization
  #
  # == Params:
  # An instance of season
  #
  def initialize(swimmer)
    @swimmer = swimmer
    @swimmer_stats = nil
  end

  # Retrieve data from DB using the current seasons
  # Use one single query to decrease db access
  # Force team_id and seasons ids in the query before execute
  # If non current seasons set no data will be retrieved
  #
  def retrieve_data
    @swimmer_stats = nil
    # Define query for data retrieve.
    # Query is defined in a weay that should be easily execute in an SQL client
    # So team_id and seasons_id will be forced in a second step
    data_retrieve_query = "
    select swm.complete_name, swm.year_of_birth,
    	sum(sbs.meeting_count) as meeting_count,
        sum(sbs.mir_count) as mir_count,
        sum(case when sbs.fed_code = 'FIN' then sbs.total_points else 0 end) as total_fin_points,
        sum(sbs.total_minutes) as total_minutes,
        sum(sbs.total_seconds) as total_seconds,
        sum(sbs.total_hundreds) as total_hundreds,
        sum(sbs.total_meters) as total_meters,
        sum(sbs.disqualified_count) as disqualified_count,
        max(sbs.max_points) as max_fin_points,
        min(case when sbs.fed_code = 'FIN' and substr(sbs.min_points, 1, 4) <> '0.00' then sbs.min_points else '9999:99999999' end) as min_fin_points,
        sum(case when sbs.fed_code = 'FIN' and sbs.event_count >= 18 then 1 else 0 end) as iron_count,
    	group_concat(distinct sbs.team_name_and_id separator ', '),
        min(sbs.min_date) as first_meeting,
        max(sbs.max_date) as last_meeting
    from swimmers swm
    join (
    	select mir.swimmer_id, mir.badge_id, ft.code as fed_code, concat(t.editable_name, ':', t.id) as team_name_and_id,
    		count(distinct ms.meeting_id) as meeting_count,
    		count(mir.id) as mir_count,
    		sum(mir.standard_points) as total_points,
    		sum(mir.minutes) as total_minutes,
    		sum(mir.seconds) as total_seconds,
    		sum(mir.hundreds) as total_hundreds,
    		sum(et.length_in_meters) as total_meters,
    		sum(mir.is_disqualified) as disqualified_count,
    		max(concat(mir.standard_points, ':', mir.id)) as max_points,
    		min(concat(mir.standard_points, ':', mir.id)) as min_points,
    		count(distinct et.code) as event_count,
            min(concat(ms.scheduled_date, ':', ms.meeting_id)) as min_date,
            max(concat(ms.scheduled_date, ':', ms.meeting_id)) as max_date
    	from meeting_individual_results mir
    		join meeting_programs mp on mp.id = mir.meeting_program_id
    		join meeting_events me on me.id = mp.meeting_event_id
    		join meeting_sessions ms on ms.id = me.meeting_session_id
    		join gender_types gt on gt.id = mp.gender_type_id
    		join category_types ct on ct.id = mp.category_type_id
    		join event_types et on et.id = me.event_type_id
    		join meetings m on m.id = ms.meeting_id
    		join seasons s on s.id = m.season_id
    		join season_types st on st.id = s.season_type_id
    		join federation_types ft on ft.id = st.federation_type_id
    		join badges b on b.id = mir.badge_id
    		join teams t on t.id = b.team_id
    	where mir.swimmer_id = VAR_SWIMMER_ID
    	group by mir.swimmer_id, mir.badge_id, ft.code, concat(t.editable_name, ':', t.id)
    ) as sbs on sbs.swimmer_id = swm.id
    where swm.id = VAR_SWIMMER_ID
    group by swm.id;
    "

    # Prepare data retrieve query with team and seasons as parameters
    data_retrieve_query.gsub!('VAR_SWIMMER_ID', @swimmer.id.to_s)

    # Retrieve data
    @swimmer_stats = ActiveRecord::Base.connection.exec_query(data_retrieve_query)
  end
  #-- --------------------------------------------------------------------------
  #++
end
