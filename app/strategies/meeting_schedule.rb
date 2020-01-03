#
# == MeetingSchedule
#
# Pattern to retrieve meeting schedule data
# organized in a MeetingScheduleDAO structure
#
# @author   Leega
#
class MeetingSchedule
  # These must be initialized on creation:
  attr_reader :meeting

  # These can be edited later on:
  attr_accessor :schedule_data_retrieved

  # Initialization
  #
  # == Params:
  # An instance of meeting
  #
  def initialize( meeting )
    @meeting = meeting

    @schedule_data_retrieved    = nil
  end

  # Retrieve schedule data from DB using the current meeting
  # Use one single query to decrease db access
  # Force meeting id in the query before execute
  #
  def retrieve_schedule_data
    @schedule_data_retrieved = nil

    # Define query for data retrieve.
    # Query is defined in a way that should be easily execute in an SQL client
    # So meeting_id will be forced in a second step
    data_retrieve_query = '
    select ms.id as meeting_session_id,
    	ms.session_order, ms.scheduled_date, substr(ms.begin_time, 1, 5) as begin_time, substr(ms.warm_up_time, 1, 5) as warm_up_time, ms.notes as session_notes,
	    sp.id as swimming_pool_id, sp.name as pool_name, sp.address as pool_address, c.name as city, sp.maps_uri, pt.code as pool_type,
      me.id as meeting_event_id, me.event_order, et.code as event_code, et.is_a_relay,
      me.is_out_of_race, me.has_separate_gender_start_list as has_separate_gender, me.has_separate_category_start_list as has_separate_categories, me.notes as event_notes
    from meeting_sessions ms
	    join swimming_pools sp on sp.id = ms.swimming_pool_id
      join pool_types pt on pt.id = sp.pool_type_id
      join meeting_events me on me.meeting_session_id = ms.id
      join event_types et on et.id = me.event_type_id
      join cities c on c.id = sp.city_id
    where ms.meeting_id = VAR_MEETING_ID
    order by ms.session_order, me.event_order;
    '

    # Prepare data retrieve query with swimemr and date inteval as parameters
    data_retrieve_query.gsub!('VAR_MEETING_ID', @meeting.id.to_s)

    # Retrieve data
    @schedule_data_retrieved = ActiveRecord::Base.connection.exec_query(data_retrieve_query)
  end

  # Gets meeting schedule dao populated with data retrieved
  #
  def set_meeting_schedule_dao
    ms = MeetingScheduleDAO.new( @meeting )

    # Sets schedule data
    #retrieve_schedule_data if @schedule_data_retrieved.nil?
    if !@schedule_data_retrieved.nil?
      current_session = 0

      # Cycle between retrieved data to populate DAO
      @schedule_data_retrieved.each do |schedule|
        # Check meeting session
        session = schedule['meeting_session_id'].to_i
        if session != current_session
          # Session doesn't already exists. Should create
          meeting_date = schedule['scheduled_date']
          current_session = session
          ms.add_session( session,
            schedule['session_order'].to_i, meeting_date, schedule['pool_id'].to_i, schedule['pool_type'],
            schedule['begin_time'], schedule['warm_up_time'], schedule['pool_name'], schedule['pool_address'], schedule['city'], schedule['maps_uri'], schedule['day_part'], schedule['notes'] )
        end
        mss = ms.get_session(session)

        # Add event
        event = schedule['meeting_event_id'].to_i
        mss.add_event( event, schedule['event_code'],
         schedule['is_a_relay'].to_i > 0, schedule['event_order'].to_i, schedule['heat_type'], schedule['is_out_of_race'].to_i > 0, schedule['has_separate_gender'].to_i > 0, schedule['has_separate_categories'].to_i > 0, schedule['notes'] )
      end
    end
    ms
  end
  #-- --------------------------------------------------------------------------
  #++
end
