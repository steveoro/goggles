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

  # Retrieve data from DB using rails model configuration
  # Use one single query to decrease db access
  # Force meeting_id in the query before execute
  # If non current meeting set no data will be retrieved
  #
  def retrieve_data
    @data_retrieved = nil

    @data_retrieved = @meeting.meeting_individual_results.
      includes(:meeting_event, :swimmer, :event_type, :category_type, :gender_type, :team_affiliation, meeting_event: [:heat_type]).
      to_a
  end

  # Retrieve data from DB using the current meeting
  # Use one single query to decrease db access
  # Force meeting_id in the query before execute
  # If non current meeting set no data will be retrieved
  #
  def retrieve_data_by_query
    @data_retrieved = nil

    # Define query for data retrieve.
    # Query is defined in a way that should be easily execute in an SQL client
    # So meeting_id will be forced in a second step
    data_retrieve_query = "
    select ms.session_order,
      me.event_order,
      et.code as event_code,
      ht.code as heat_type,
      me.is_out_of_race,
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
      mir.updated_at,
      mir.team_id,
      mir.swimmer_id,
      mp.meeting_event_id,
      mir.meeting_program_id
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
  def set_meeting_results_dao_from_query
    mrDAO = MeetingResultsDAO.new( @meeting )

    #retrieve_data if @data_retrieved.nil?
    if !@data_retrieved.nil?
      current_program = nil

      # Cycle between retrieved data to populate DAO
      @data_retrieved.each do |result|
        # Read event data
        event_id      = result['meeting_event_id'].to_i
        session_order = result['session_order'].to_i
        event_order   = result['event_order'].to_i
        event_code    = result['event_code']
        heat_code     = result['heat_code']
        event_key     = mrDAO.create_event_key(session_order, event_order, event_code, heat_code)

        # Read event from structure
        event = mrDAO.events[event_key]
        if !event
          # If event not altready present, ceate it
          event = MeetingResultsDAO::MeetingResultsEventDAO.new( event_id, event_code, session_order, event_order, result['heat_code'], result['is_out_of_race'] )
          mrDAO.events[event_key] = event
        end

        # Read program data
        program_id    = result['meeting_program_id']
        heat_code     = result['heat_code']
        gender_code   = result['gender_code']
        category_code = result['category_code']
        program_key   = mrDAO.create_program_key( event_code, heat_code, gender_code, category_code )

        # Read program from structure
        program = event.programs[program_key]
        if !program
          # If event not altready present, ceate it
          program = MeetingResultsDAO::MeetingResultsProgramDAO.new( program_id, event_code, heat_code, gender_code, category_code )
          event.programs[program_key] = program
        end


        #program.results << MeetingResultsDAO::MeetingResultsIndividualDAO.new(  )

        # Sets max updated at value
        mrDAO.updated_at = result['updated_at'] if mrDAO.updated_at = 0 || mrDAO.updated_at < result['updated_at']
      end
    end
    mrDAO
  end
end
