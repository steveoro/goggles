# encoding: utf-8

=begin

= MeetingScheduleDAO

  - Goggles framework vers.:  4.00.570
  - author: Leega

 DAO class containing the schedule data of a meeting

=end
class MeetingScheduleDAO

  # Represents a swimmer individual event reservation
  #
  class MeetinSessionScheduleDAO

    # These can be edited later on:
    attr_reader :seesion_order, :scheduled_date, :pool_code

    # These can be edited later on:
    attr_accessor :begin_time, :warm_up_time, :pool_name, :pool_address, :day_part, :notes

    # Creates a new instance.
    #
    def initialize( seesion_order, scheduled_date, pool_code, begin_time = '', warm_up_time = '', pool_name = '', pool_address = '', day_part = '', notes = '' )
      @seesion_order  = seesion_order
      @scheduled_date = scheduled_date
      @pool_code      = pool_code
      @begin_time     = begin_time
      @warm_up_time   = warm_up_time
      @pool_address   = pool_address
      @day_part       = day_part
      @notes          = notes
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # These must be initialized on creation:
  attr_reader :meeting

  # These can be edited later on:
  attr_accessor :updated_at

  # Creates a new instance.
  #
  def initialize( meeting, updated_at = 0 )
    @meeting      = meeting
    @updated_at   = updated_at

    @sessions = Hash.new()
  end
  #-- -------------------------------------------------------------------------
  #++
end
