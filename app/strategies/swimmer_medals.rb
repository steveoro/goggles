#
# == SwimmerMedals
#
# Pattern to retrieve swimmers statistic data
# Swimemr statis are those sown in swimemr's radio tab
#
# @author   Leega
#
class SwimmerMedals
  # These must be initialized on creation:
  attr_reader :swimmer, :swimmer_medals

  # These can be edited later on:
  #attr_accessor :current_seasons, :presence_data, :swimmers_summary

  # Initialization
  #
  # == Params:
  # An instance of season
  #
  def initialize(swimmer)
    @swimmer        = swimmer
    @swimmer_medals = nil
  end

  # Retrieve data from DB using the current seasons
  # Use one single query to decrease db access
  # Force team_id and seasons ids in the query before execute
  # If non current seasons set no data will be retrieved
  #
  def retrieve_data
    @swimmer_medals = nil
    # Define query for data retrieve.
    # Query is defined in a way that should be easily execute in an SQL client
    # So swimmer_id will be forced in a second step
    data_retrieve_query = '
    select
      et.is_a_relay as is_a_relay,
    	st.short_name as season_code,
      pt.code as pool_code,
      et.style_order as style_order,
      et.code as event_code,
      mt.code as medal_code,
  	  count(mir.id) as medals_count
    from meeting_individual_results mir
      join medal_types mt on mt.rank = mir.rank
    	join meeting_programs mp on mp.id = mir.meeting_program_id
    	join meeting_events me on me.id = mp.meeting_event_id
      join event_types et on et.id = me.event_type_id
      join pool_types pt on pt.id = mp.pool_type_id
      join badges b on b.id = mir.badge_id
      join seasons s on s.id = b.season_id
      join season_types st on st.id = s.season_type_id
    where not mir.is_disqualified
	    and not mir.is_out_of_race
    	and mir.swimmer_id = VAR_SWIMMER_ID
    group by et.is_a_relay, st.short_name, pt.code, et.style_order, et.code, mt.code
    union
    select
    	et.is_a_relay as is_a_relay,
    	st.short_name as season_code,
      pt.code as pool_code,
      et.style_order as style_order,
      et.code as event_code,
      mt.code as medal_code,
  	  count(mrr.id) as medals_count
    from meeting_relay_swimmers mrs
    	join meeting_relay_results mrr on mrr.id = mrs.meeting_relay_result_id
      join medal_types mt on mt.rank = mrr.rank
    	join meeting_programs mp on mp.id = mrr.meeting_program_id
    	join meeting_events me on me.id = mp.meeting_event_id
      join event_types et on et.id = me.event_type_id
      join pool_types pt on pt.id = mp.pool_type_id
      join badges b on b.id = mrs.badge_id
      join seasons s on s.id = b.season_id
      join season_types st on st.id = s.season_type_id
    where not mrr.is_disqualified
      and not mrr.is_out_of_race    
    	and mrs.swimmer_id = VAR_SWIMMER_ID
    group by et.is_a_relay, st.short_name, pt.code, et.style_order, et.code, mt.code;
    '

    # Prepare data retrieve query with swimmer as parameter
    data_retrieve_query.gsub!('VAR_SWIMMER_ID', @swimmer.id.to_s)

    # Retrieve data
    @swimmer_medals = ActiveRecord::Base.connection.exec_query(data_retrieve_query)
  end

  # Gets a swimmer stats dao populated with data retrieve result
  #
  def get_medals_dao
    smd = MedalsDAO.new()

    #retrieve_data if @swimmer_medals.nil?
    if !@swimmer_medals.nil?
      # Cycle medals and fill dao
      @swimmer_medals.each do |medals|
        is_a_relay = ( medals['is_a_relay'].to_i == 1 )
        smd.set_medals( is_a_relay, medals['season_code'], medals['pool_code'], medals['event_code'], medals['medal_code'], medals['medals_count'].to_i )
      end
    end
    smd
  end
  #-- --------------------------------------------------------------------------
  #++
end
