# encoding: utf-8

=begin

= SwimmerCareerDAO

  - Goggles framework vers.:  4.00.570
  - author: Leega

 DAO class containing the list of swimmer results by pool type and meeting

=end
class SwimmerCareerDAO

  # Represents the collection of swimmer results for a meeting
  #
  class SwimmerCareerPassageDAO

    # These can be edited later on:
    attr_reader :time_swam

    # These can be edited later on:
    attr_accessor :time_swam_from_start

    # Creates a new instance.
    #
    def initialize( time_swam, time_swam_from_start = nil )
      # badges data
      @time_swam            = time_swam
      @time_swam_from_start = time_swam_from_start
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Represents the collection of swimmer results for a meeting
  #
  class SwimmerCareerResultDAO

    # These can be edited later on:
    attr_reader :event_code, :time_swam

    # These can be edited later on:
    attr_accessor :is_disqualified, :is_personal_best, :standard_points, :individual_points, :meeting_points, :passages

    # Creates a new instance.
    #
    def initialize( event_code, time_swam, is_disqualified = false, is_personal_best = false, standard_points = nil, individual_points = nil, meeting_points = nil )
      # badges data
      @event_code        = event_code
      @time_swam         = time_swam
      @is_disqualified   = is_disqualified
      @is_personal_best  = is_personal_best
      @standard_points   = standard_points
      @individual_points = individual_points
      @meeting_points    = meeting_points

      @passages = Hash.new()
    end

    def add_passage( passage_code, time_swam, time_swam_from_start = nil )
      @passages[passage_code] = SwimmerCareerPassageDAO.new( time_swam, time_swam_from_start )
      @passages.size
    end

    def get_timing
      (time_swam.minutes.to_i > 0 ? "#{time_swam.minutes.to_i}'" : '') +
        format('%02.0f"', time_swam.seconds.to_i) +
        format('%02.0f', time_swam.hundreds.to_i)
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Represents the collection of swimmer results for a meeting
  #
  class SwimmerCareerEventDAO

    # These can be edited later on:
    attr_reader :event_code

    # These can be edited later on:
    attr_accessor :count

    # Creates a new instance.
    #
    def initialize( event_code )
      # badges data
      @event_code        = event_code
      @count             = 1
    end

    def add_event_swam
      @count += 1
    end

    def get_count
      @count
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Represents the collection of swimmer results for a meeting
  #
  class SwimmerCareerMeetingDAO

    # These can be edited later on:
    attr_reader :meeting_id, :meeting_date, :meeting_name, :federation_code, :category_code

    # These can be edited later on:
    attr_accessor :results

    # Creates a new instance.
    #
    def initialize( meeting_id, meeting_date, meeting_name, federation_code, category_code )
      # badges data
      @meeting_id      = meeting_id
      @meeting_date    = meeting_date
      @meeting_name    = meeting_name
      @federation_code = federation_code
      @category_code   = category_code

      @results = Hash.new()
    end

    def add_result( event_code, time_swam, is_disqualified = false, is_personal_best = false, standard_points = nil, individual_points = nil, meeting_points = nil )
      @results[event_code] = SwimmerCareerResultDAO.new( event_code, time_swam, standard_points, individual_points, meeting_points )
      @results.size
    end

    def get_result( event_code )
      @results[event_code]
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Represents the collection the main collection separation
  # The pool type. Meetings are collected be pool type
  # the element contains also a list of categories to provide an index
  #
  class SwimmerCareerPoolDAO

    # These must be initialized on creation:
    attr_reader :pool_code

    # These can be edited later on:
    attr_accessor :meetings, :categories, :events

    # Creates a new instance.
    #
    def initialize( pool_code )
      # pools data
      @pool_code = pool_code

      @meetings   = Hash.new()
      @categories = Hash.new()
      @events     = Hash.new()
    end

    def add_meeting( meeting_id, meeting_date, meeting_name, federation_code, category_code )
      @meetings[meeting_id] = SwimmerCareerMeetingDAO.new( meeting_id, meeting_date, meeting_name, federation_code, category_code )
      @categories[category_code] = meeting_id if !@categories.has_key?( category_code )
      @meetings.size
    end

    def add_result( meeting_id, event_order, event_code, time_swam, is_disqualified = false, is_personal_best = false, standard_points = nil, individual_points = nil, meeting_points = nil )
      if !@events.has_key?( event_order )
        @events[event_order] = SwimmerCareerEventDAO.new( event_code )
      else
        @events[event_order].add_event_swam
      end
      meeting = @meetings[meeting_id]
      meeting.add_result( event_code, time_swam, is_disqualified, is_personal_best, standard_points, individual_points, meeting_points ) if meeting
    end

    def get_event( event_code  )
      @events[event_code]
    end

    def get_events
      events = []
      @events.keys.sort{ |p,n| p <=> n }.each do |order|
        events << @events[order].event_code
      end
      events
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # These must be initialized on creation:
  attr_reader :swimmer, :to_date, :from_date

  # These can be edited later on:
  attr_accessor :updated_at, :pool_types

  # Creates a new instance.
  #
  def initialize( swimmer, to_date = Date.today(), from_date = 0, updated_at = 0 )
    @swimmer    = swimmer
    @to_date    = to_date
    @from_date  = from_date
    @updated_at = updated_at

    @pool_types = Hash.new()
  end

  def add_pool( pool_code )
    @pool_types[pool_code] = SwimmerCareerDAO::SwimmerCareerPoolDAO.new( pool_code )
  end

  def get_pool( pool_code )
    @pool_types[pool_code]
  end

  def get_pool_events( pool_code )
    @pool_types[pool_code] ? @pool_types[pool_code].events : {}
  end
  #-- -------------------------------------------------------------------------
  #++
end
