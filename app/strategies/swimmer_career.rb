#
# == SwimmerCareer
#
# Pattern to retrieve swimmer career
# Swimmer's carrer is intended as the list of swimmer results ordered by date
# Results will be also separate by pool type and event type
#
# @author   Leega
#
class SwimmerCareer
  # These must be initialized on creation:
  attr_reader :swimmer, :to_date, :from_date

  # These can be edited later on:
  attr_accessor :data_retrieved

  # Initialization
  #
  # == Params:
  # An instance of swimmer
  # The ending date to search (now if not specified)
  # The starting date to search (no limit if not specified)
  #
  def initialize( swimmer, to_date = Date.today(), from_date = 0 )
    @swimmer   = swimmer
    @to_date   = to_date
    @from_date = from_date

    @data_retrieved   = nil
  end

  # Retrieve data from DB using the current seasons
  # Use one single query to decrease db access
  # Force team_id and seasons ids in the query before execute
  # If non current seasons set no data will be retrieved
  #
  def retrieve_data
    @data_retrieved = nil

    # Define query for data retrieve.
    # Query is defined in a way that should be easily execute in an SQL client
    # So swimmer_id and dtae interval will be forced in a second step
    data_retrieve_query = "
    select m.id as meeting_id,
    	m.description as meeting_name,
    	m.header_date as meeting_date,
      ft.code as federation_code,
      ct.code as category_code,
      et.code as event_code,
      et.style_order,
      mir.minutes,
      mir.seconds,
      mir.hundreds,
      mir.is_personal_best,
      mir.is_disqualified,
      mir.updated_at,
      (select group_concat(pt.length_in_meters, ';', p.minutes, ';', p.seconds, ';', p.hundreds, ';', p.minutes_from_start, ';', p.seconds_from_start, ';', p.hundreds_from_start)
      from passages p
    	join passage_types pt on pt.id = p.passage_type_id
      where p.meeting_individual_result_id = mir.id
      group by p.meeting_individual_result_id
      ) as passages
    from meeting_individual_results mir
    	join badges b on b.id = mir.badge_id
      join category_types ct on ct.id = b.category_type_id
      join seasons s on s.id = b.season_id
      join season_types st on st.id = s.season_type_id
      join federation_types ft on ft.id = st.federation_type_id
    	join meeting_programs mp on mp.id = mir.meeting_program_id
    	join meeting_events me on me.id = mp.meeting_event_id
    	join meeting_sessions ms on ms.id = me.meeting_session_id
      join meetings m on m.id = ms.meeting_id
    	join event_types et on et.id = me.event_type_id
    where mir.swimmer_id = VAR_SWIMMER_ID
    	and m.header_date between VAR_FROM_DATE and VAR_FROM_DATE
    order by m.header_date, et.style_order;
    "

    # Prepare data retrieve query with swimemr and date inteval as parameters
    data_retrieve_query.gsub!('VAR_SWIMMER_ID', @swimmer.id.to_s)
    data_retrieve_query.gsub!('VAR_TO_DATE', @to_date.to_s)
    data_retrieve_query.gsub!('VAR_FROM_DATE', @to_date.to_s)

    # Retrieve data
    @data_retrieved = ActiveRecord::Base.connection.exec_query(data_retrieve_query)
  end

  # Gets swimmer's career (results) dao populated with data retrieve result
  #
  def set_team_current_swimmers_dao
    sc = SwimmerCareerDAO.new( @swimmer )

    #retrieve_data if @data_retrieved.nil?
    if !@data_retrieved.nil?
      # Cycle between retrieved data to populate DAO
      @data_retrieved.each do |result|
      end
    end
    sc
  end
  #-- --------------------------------------------------------------------------
  #++
end
