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
    attr_reader :event_code, :is_a_relay

    # These can be edited later on:
    attr_accessor :event_order, :heat_type, :is_out_of_race, :has_separate_gender, :has_separate_categories, :notes

    # Creates a new instance.
    #
    def initialize( event_code, is_a_relay = false, event_order = 0, heat_type = nil, is_out_of_race = false, has_separate_gender = true, has_separate_categories = false, notes = '' )
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
    attr_reader :session_order, :scheduled_date, :pool_code

    # These can be edited later on:
    attr_accessor :begin_time, :warm_up_time, :pool_name, :pool_address, :day_part, :notes, :events

    # Creates a new instance.
    #
    def initialize( session_order, scheduled_date, pool_code, begin_time = '', warm_up_time = '', pool_name = '', pool_address = '', day_part = nil, notes = '' )
      @session_order  = session_order
      @scheduled_date = scheduled_date
      @pool_code      = pool_code
      @begin_time     = begin_time
      @warm_up_time   = warm_up_time
      @pool_name      = pool_name
      @pool_address   = pool_address
      @day_part       = day_part
      @notes          = notes

      @events = Hash.new()
    end

    # Adds a new event to events colelction
    def add_event( event_key, event_code, is_a_relay = false, event_order = 0, heat_type = nil, is_out_of_race = false, has_separate_gender = true, has_separate_categories = false, notes = '' )
      @events[event_key] = MeetingScheduleEventDAO.new( event_code, is_a_relay, event_order, heat_type, is_out_of_race, has_separate_gender, has_separate_categories, notes )
      @events.size
    end

    # Gets an event by key
    def get_event( event_key )
      @events[event_key]
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # These must be initialized on creation:
  attr_reader :meeting

  # These can be edited later on:
  attr_accessor :is_confirmed, :sessions

  # Creates a new instance.
  #
  def initialize( meeting  )
    @meeting = meeting

    @sessions = Hash.new()
  end
  #-- -------------------------------------------------------------------------
  #++
end
