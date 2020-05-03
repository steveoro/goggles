#
# == SwimmerCareer
#
# Pattern to retrieve swimmer career
# Swimmer's carrer is intended as the list of swimmer results ordered by date
# Results will be also separate by pool type and event type
#
# @author   Leega
#
class MeetingResults
  # These must be initialized on creation:
  attr_reader :meeting

  # These can be edited later on:
  attr_accessor :data_retrieved, :max_updated_at

  # Initialization
  #
  # == Params:
  # An instance of swimmer
  # The ending date to search (now if not specified)
  # The starting date to search (no limit if not specified)
  #
  def initialize( meeting )
    @meeting   = meeting

    @max_updated_at   = 0
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
    select ms.session_order,
      me.event_order,
      et.code as event_code,
      ht.code as heat_type,
      gt.code as gender_code,
      ct.age_begin,
      ct.code as category_code,
    	mir.rank,
      mir.is_disqualified,
      mir.minutes,
      mir.seconds,
      mir.hundreds,
      mir.is_personal_best,
      mir.reaction_time,
      mir.standard_points,
      mir.meeting_individual_points,
      mir.goggle_cup_points,
      mir.team_points,
      s.complete_name,
      s.year_of_birth,
      ta.name as team_name,
      mir.team_id,
      mir.swimmer_id,
      meeting_event_id,
      meeting_program_id
    from meeting_sessions ms
    	join meeting_events me on me.meeting_session_id = ms.id
      join heat_types ht on ht.id = me.heat_type_id
    	join meeting_programs mp on mp.meeting_event_id = me.id
        join meeting_individual_results mir on mir.meeting_program_id = mp.id
        join event_types et on et.id = me.event_type_id
        join gender_types gt on gt.id = mp.gender_type_id
        join category_types ct on ct.id = mp.category_type_id
        join team_affiliations ta on ta.id = mir.team_affiliation_id
        join swimmers s on s.id = mir.swimmer_id
    where ms.meeting_id = VAR_MEETING_ID
    order by ms.session_order, me.event_order, ht.code, gt.code, ct.age_begin, mir.is_disqualified, mir.rank
    "

    # Prepare data retrieve query with swimemr and date inteval as parameters
    data_retrieve_query.gsub!('VAR_MEETING_ID', @meeting.id.to_s)

    # Retrieve data
    @data_retrieved = ActiveRecord::Base.connection.exec_query(data_retrieve_query)
  end

  # Gets swimmer's career (results) dao populated with data retrieve result
  #
  def set_meeting_results_dao
    sc = MeetingResultsDAO.new( @meeting )

    #retrieve_data if @data_retrieved.nil?
    if !@data_retrieved.nil?
      current_program = nil

      # Cycle between retrieved data to populate DAO
      @data_retrieved.each do |result|
        event_id = result['meeting_event_id']
        me = MeetingResultsEventDAO.new( event_id, result['event_code'] ) if !sc.events.has_key?(event_id)
        sc.events[event_id] = me

        program_id = result['meeting_program_id']
        mp = MeetingResultsProgramDAO.new( program_id, result['event_code'], result['gender_code'], result['category_code'] ) if !sc.programs.has_key?(program_id)
        me.programs[program_id] = mp

        mp.results << MeetingResultsIndividualDAO2.new( result )

        # Sets max updated at value
        sc.updated_at = result['updated_at'] if sc.updated_at = 0 || sc.updated_at < result['updated_at']
      end
    end
    sc
  end
end
