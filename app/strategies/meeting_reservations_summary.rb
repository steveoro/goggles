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
  attr_accessor :reservation_data_retrieved, :schedule_data_retrieved

  # Initialization
  #
  # == Params:
  # An instance of meeting
  #
  def initialize( meeting, team )
    @meeting = meeting
    @team    = team

    @reservation_data_retrieved = nil
    @schedule_data_retrieved    = nil
  end

  # Retrieve data from DB using the current meeting and team
  # Use one single query to decrease db access
  # Force team and meeting ids in the query before execute
  #
  def retrieve_reservation_data
    @reservation_data_retrieved = nil

    # Define query for data retrieve.
    # Query is defined in a way that should be easily execute in an SQL client
    # So meeting_id will be forced in a second step
    data_retrieve_query = '
    select mr.swimmer_id, s.complete_name, ct.code as category_code,
      mer.meeting_event_id, mr.has_confirmed, et.code as event_code, me.is_out_of_race,
      mer.suggested_minutes as minutes, mer.suggested_seconds as seconds, mer.suggested_hundreds as hudreds,
      mer.updated_at, et.is_a_relay
    from meeting_reservations mr
     	join badges b on b.id = mr.badge_id
      join category_types ct on ct.id = b.category_type_id
      join swimmers s on s.id = mr.swimmer_id
    	join meeting_event_reservations mer on mer.meeting_id = mr.meeting_id and mer.badge_id = mr.badge_id
      join meeting_events me on me.id = mer.meeting_event_id
      join event_types et on et.id = me.event_type_id
    where mr.meeting_id = VAR_MEETING_ID
      and mr.team_id = VAR_TEAM_ID
    	and not mr.is_not_coming
      and mer.is_doing_this
    union
    select mr2.swimmer_id, s2.complete_name, ct2.code,
  	  mrr.meeting_event_id, mr2.has_confirmed, et2.code as event_code, me2.is_out_of_race,
      0 as minutes, 0 as seconds, 0 as hudreds,
      mrr.updated_at, et2.is_a_relay
    from meeting_reservations mr2
  	  join badges b2 on b2.id = mr2.badge_id
      join category_types ct2 on ct2.id = b2.category_type_id
      join swimmers s2 on s2.id = mr2.swimmer_id
  	  join meeting_relay_reservations mrr on mrr.meeting_id = mr2.meeting_id and mrr.badge_id = mr2.badge_id
      join meeting_events me2 on me2.id = mrr.meeting_event_id
      join event_types et2 on et2.id = me2.event_type_id
    where mr2.meeting_id = VAR_MEETING_ID
      and mr2.team_id = VAR_TEAM_ID
  	  and not mr2.is_not_coming
      and mrr.is_doing_this
    order by 2, 6;
    '

    # Prepare data retrieve query with swimemr and date inteval as parameters
    data_retrieve_query.gsub!('VAR_MEETING_ID', @meeting.id.to_s)
    data_retrieve_query.gsub!('VAR_TEAM_ID', @team.id.to_s)

    # Retrieve data
    @reservation_data_retrieved = ActiveRecord::Base.connection.exec_query(data_retrieve_query)
  end

  # Gets meeting reservations summary dao populated with data retrieved
  #
  def set_meeting_reservation_summary_dao
    mrs = MeetingReservationsSummaryDAO.new( @meeting, @team )

    #retrieve_reservation_data if @reservation_data_retrieved.nil?
    if !@reservation_data_retrieved.nil?
      # Cycle between retrieved data to populate DAO
      @reservation_data_retrieved.each do |reservation|
        # if pool_type not exists create it
        swimmer_id   = reservation['swimmer_id'].to_i
        swimmer_name = reservation['complete_name']
        swimmer_key  = mrs.get_swimmer_key( swimmer_id, swimmer_name )

        # Add meeting data to pool collection if not present
        mrs.create_swimmer_reservations( swimmer_id, swimmer_name, reservation['gender_code'], reservation['has_confirmed'].to_i > 0, reservation['category_code'] ) if !mrs.reservations.has_key?( swimmer_key )
        sr = mrs.get_swimmer_reservations( swimmer_id, swimmer_name )

        # Add reservation
        if reservation['is_a_relay'].to_i > 0
          sr.add_relay_reservation( reservation['event_code'] )
        else
          sr.add_individual_reservation( reservation['event_code'], Timing.new( reservation['hundreds'].to_i, reservation['seconds'].to_i, reservation['minutes'].to_i ) )
        end

        # Sets max updated at value
        mrs.updated_at = reservation['updated_at'] if mrs.updated_at = 0 || mrs.updated_at < reservation['updated_at']
      end
    end
    mrs
  end
  #-- --------------------------------------------------------------------------
  #++
end
