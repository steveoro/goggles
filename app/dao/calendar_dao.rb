# encoding: utf-8

=begin

= ChampionshipDAO

  - Goggles framework vers.:  4.00.570
  - author: Leega

 DAO class containing the structure for calendar rendering.

=end
class CalendarDAO
 
  class MeetingSessionDAO
    # These must be initialized on creation:
    attr_reader :order, :date, :warm_up_time, :begin_time, :events, :swimming_pool
    #-- -------------------------------------------------------------------------
    #++
  
    # Creates a new instance.
    #
    def initialize( meeting_session )
      @order         = meeting_session.session_order
      @date          = meeting_session.scheduled_date
      @warm_up_time  = meeting_session.warm_up_time
      @begin_time    = meeting_session.begin_time
      @events        = meeting_session.get_short_events
      @swimming_pool = meeting_session.swimming_pool
    end
    #-- -------------------------------------------------------------------------
    #++
  end

  # These must be initialized on creation:
  attr_reader :meeting, :meeting_sessions
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  #
  # Needs to  be sure team_scores is an instance of TeamScoreDAO
  # to perform correcto sorting
  #
  def initialize( meeting, meeting_sessions )
    unless meeting_sessions.kind_of?( Array )
      raise ArgumentError.new("Session item of CalendarDAO must be an array of MeetingSessionDAO element")
    end
    meeting_sessions.each do |meeting_session|
      if not meeting_session.instance_of?( CalendarDAO::MeetingSessionDAO )
        raise ArgumentError.new("Session item of CalendarDAO must be an array of MeetingSessionDAO element")
      end
    end

    @meeting          = meeting
    @meeting_sessions = meeting_sessions
  end
  #-- -------------------------------------------------------------------------
  #++
end
