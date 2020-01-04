# encoding: utf-8

=begin

= MeetingScheduleDAO

  - Goggles framework vers.:  4.00.570
  - author: Leega

 DAO class containing the schedule data of a meeting

=end
class MeetingScheduleDAO

  # Represents an event of a meeting's session
  #
  class MeetingScheduleEventDAO

    # These can be edited later on:
    attr_reader :event_id, :event_code, :is_a_relay

    # These can be edited later on:
    attr_accessor :event_order, :heat_type, :is_out_of_race, :has_separate_gender, :has_separate_categories, :notes

    # Creates a new instance.
    #
    def initialize( event_id, event_code, is_a_relay = false, event_order = 0, heat_type = nil, is_out_of_race = false, has_separate_gender = true, has_separate_categories = false, notes = '' )
      @event_id                = event_id
      @event_code              = event_code
      @is_a_relay              = is_a_relay
      @event_order             = event_order
      @heat_type               = heat_type
      @is_out_of_race          = is_out_of_race
      @has_separate_gender     = has_separate_gender
      @has_separate_categories = has_separate_categories
      @notes                   = notes
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Represents a session of a meeting
  #
  class MeetingScheduleSessionDAO

    # These can be edited later on:
    attr_reader :session_id, :session_order, :scheduled_date, :pool_id, :pool_type

    # These can be edited later on:
    attr_accessor :lanes, :begin_time, :warm_up_time, :pool_name, :pool_address, :city, :maps_uri, :day_part, :notes,
                  :events, :individuals, :relays

    # Creates a new instance.
    #
    def initialize( session_id, session_order, scheduled_date, pool_id, pool_type, lanes = 6, begin_time = '', warm_up_time = '', pool_name = '', pool_address = '', city = '', maps_uri = nil, day_part = nil, notes = '' )
      @session_id     = session_id
      @session_order  = session_order
      @scheduled_date = scheduled_date
      @pool_id        = pool_id
      @pool_type      = pool_type
      @lanes          = lanes
      @begin_time     = begin_time
      @warm_up_time   = warm_up_time
      @pool_name      = pool_name
      @pool_address   = pool_address
      @city           = city
      @maps_uri       = maps_uri
      @day_part       = day_part
      @notes          = notes

      @events     = Hash.new()
      @individuals = 0
      @relays     = 0
    end

    # Adds a new event to events colelction
    def add_event( event_key, event_id, event_code, is_a_relay = false, event_order = 0, heat_type = nil, is_out_of_race = false, has_separate_gender = true, has_separate_categories = false, notes = '' )
      @events[event_key] = MeetingScheduleEventDAO.new( event_id, event_code, is_a_relay, event_order, heat_type, is_out_of_race, has_separate_gender, has_separate_categories, notes )
      if is_a_relay
        @relays += 1
      else
        @individuals += 1
      end
      @events.size
    end

    # Gets an event by key
    def get_event( event_key )
      @events[event_key]
    end

    # Gets ordered events keys
    def get_event_keys
      @events.keys
    end

    # Gets a string with meeting header containing id, name, date and code
    #def get_pool_header
    #  "'#{@pool_name}' (#{@lanes}x#{@pool_type}), #{@pool_address} #{@city}"
    #end
  end
  #-- -------------------------------------------------------------------------
  #++

  # These must be initialized on creation:
  attr_reader :meeting

  # These can be edited later on:
  attr_accessor :sessions, :meeting_date

  # Creates a new instance.
  #
  def initialize( meeting  )
    @meeting = meeting

    @sessions     = Hash.new()
    @meeting_date = meeting.header_date
  end

  # Adds a new session to sessions colelction
  def add_session( session_key, session_id, session_order, scheduled_date, pool_id, pool_type, lanes = 6, begin_time = '', warm_up_time = '', pool_name = '', pool_address = '', city = '', maps_uri = '', day_part = nil, notes = '' )
    @sessions[session_key] = MeetingScheduleSessionDAO.new( session_id, session_order, scheduled_date, pool_id, pool_type, lanes, begin_time, warm_up_time, pool_name, pool_address, city, maps_uri, day_part, notes )

    # Sets meeting date with session scheduled date only if session order is 1
    @meeting_date = scheduled_date if session_order == 1

    @sessions.size
  end

  # Gets a session by key
  def get_session( session_key )
    @sessions[session_key]
  end

  # Gets a string with meeting header containing id, name, date and code
  #def get_meeting_header
  #  "#{meeting.id} - #{date_to_s} #{meeting.get_full_name} (#{meeting.code})"
  #end

  # Gets ordered sessions keys
  def get_session_keys
    @sessions.keys
  end
  #-- -------------------------------------------------------------------------
  #++
end
