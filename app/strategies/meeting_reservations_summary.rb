#
# == MeetingReservationSummary
#
# Pattern to retrieve meeting reservations summary data
# Checks for swimmer reservations and returns a DAO with retrieved data
# organized to allow summarizing show
#
# @author   Leega
#
class MeetingReservationsSummary
  # These must be initialized on creation:
  attr_reader :meeting, :team

  # These can be edited later on:
  attr_accessor :data_retrieved

  # Initialization
  #
  # == Params:
  # An instance of meeting
  #
  def initialize( meeting, team )
    @meeting = meeting
    @team    = team

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
    # So meeting_id will be forced in a second step
    data_retrieve_query = '
    select mr.swimmer_id, s.complete_name, ct.code as category_code, mer.meeting_event_id,
      mr.has_confirmed, me.event_order, et.code as event_code, me.is_out_of_race,
      mer.suggested_minutes as minutes, mer.suggested_seconds as seconds, mer.suggested_hundreds as hudreds,
      ms.session_order, ms.scheduled_date as session_date, substr(ms.begin_time, 1, 5) as begin_time, substr(ms.warm_up_time, 1, 5) as warm_up_time,
      mer.updated_at
    from meeting_reservations mr
     	join badges b on b.id = mr.badge_id
      join category_types ct on ct.id = b.category_type_id
      join swimmers s on s.id = mr.swimmer_id
    	join meeting_event_reservations mer on mer.meeting_id = mr.meeting_id and mer.badge_id = mr.badge_id
      join meeting_events me on me.id = mer.meeting_event_id
      join event_types et on et.id = me.event_type_id
      join meeting_sessions ms on ms.id = me.meeting_session_id
    where mr.meeting_id = VAR_MEETING_ID
      and mr.team_id = VAR_TEAM_ID
    	and not mr.is_not_coming
      and mer.is_doing_this
    order by s.complete_name, ms.session_order, me.event_order;
    '

    # Prepare data retrieve query with swimemr and date inteval as parameters
    data_retrieve_query.gsub!('VAR_MEETING_ID', @meeting.id.to_s)
    data_retrieve_query.gsub!('VAR_TEAM_ID', @team.id.to_s)

    # Retrieve data
    @data_retrieved = ActiveRecord::Base.connection.exec_query(data_retrieve_query)
  end

  # Gets meeting reservations summary dao populated with data retrieved
  #
  def set_meeting_reservation_summary_dao
    sc = SwimmerCareerDAO.new( @swimmer, @to_date, @fronm_date )

    #retrieve_data if @data_retrieved.nil?
    if !@data_retrieved.nil?
      # Cycle between retrieved data to populate DAO
      @data_retrieved.each do |result|
        # if pool_type not exists create it
        pool_code = result['pool_code']
        pool = sc.get_pool( pool_code )
        pool = sc.add_pool( pool_code ) if !pool

        # Add meeting data to pool collection if not present
        meeting_id = result['meeting_id'].to_i
        pool.add_meeting( meeting_id, result['meeting_date'], result['meeting_name'], result['federation_code'], result['category_code'], result['category_age'].to_i ) if !pool.meetings.has_key?( meeting_id )

        # Add result data to meeting collection (never already present)
        time_swam = Timing.new( result['hundreds'].to_i, result['seconds'].to_i, result['minutes'].to_i )
        event_code = result['event_code']
        pool.add_result( meeting_id, result['result_id'].to_i, result['event_order'].to_i, event_code, time_swam, result['is_disqualified'], result['is_personal_best'] )

        # Add passages if present
        if result['passages'] != 'null'
          resultDAO = pool.get_result( meeting_id, event_code )
          extract_passages( passage_keys, result['passages'] ).each do |passage|
            time_pass = Timing.new( passage[:hundreds], passage[:seconds], passage[:minutes] )
            time_from_start = Timing.new( passage[:hundreds_from_start], passage[:seconds_from_start], passage[:minutes_from_start] )
            resultDAO.add_passage( passage[:length_in_meters], time_pass, time_from_start )
          end
        end

        # Sets max updated at value
        sc.updated_at = result['updated_at'] if sc.updated_at = 0 || sc.updated_at < result['updated_at']
      end
    end
    sc
  end
  #-- --------------------------------------------------------------------------
  #++
end
