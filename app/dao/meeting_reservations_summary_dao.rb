# encoding: utf-8

=begin

= MeetingReservationsSummaryDAO

  - Goggles framework vers.:  4.00.570
  - author: Leega

 DAO class containing the list of swimmer reservations for a given meeting

=end
class MeetingReservationsSummaryDAO

  # Represents a swimmer individual event reservation
  #
  class IndividualEventReservationDAO

    # These can be edited later on:
    attr_reader :event_code

    # These can be edited later on:
    attr_accessor :suggested_time

    # Creates a new instance.
    #
    def initialize( event_code, suggested_time = nil )
      @event_code     = event_code
      @suggested_time = suggested_time
    end

    # Wrapper for get_timing method
    # Could use minutes, seconds and hundreds directly instead of time_swam
    def get_timing( suggested_time = @suggested_time )
      suggested_time ?
        (suggested_time.minutes.to_i > 0 ? "#{suggested_time.minutes.to_i}'" : '') +
          format('%02.0f"', suggested_time.seconds.to_i) +
          format('%02.0f', suggested_time.hundreds.to_i)
        : '-'
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Represents a swimmer relay reservation
  #
  class RelayReservationDAO

    # These can be edited later on:
    attr_reader :event_code

    # These can be edited later on:
    attr_accessor :fraction

    # Creates a new instance.
    #
    def initialize( event_code, fraction = nil )
      @event_code = event_code
      @fraction   = fraction
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Represents the collection of swimmer reservtaions
  #
  class SwimmerReservationsDAO

    # These can be edited later on:
    attr_reader :swimmer_id, :swimmer_name, :gender_code

    # These can be edited later on:
    attr_accessor :category_code, :individual_reservations, :relay_reservations

    # Creates a new instance.
    #
    def initialize( swimmer_id, swimmer_name, gender_code, category_code = nil )
      @swimmer_id    = swimmer_id
      @swimmer_name  = swimmer_name
      @gender_code   = gender_code
      @category_code = category_code

      @individual_reservations = Hash.new()
      @relay_reservations      = Hash.new()
    end

    def add_individual_reservation( event_code, suggested_time = nil )
      @individual_reservations[event_code] = IndividualEventReservationDAO.new( event_code, suggested_time )
      @individual_reservations.size
    end

    def get_individual_reservation( event_code )
      @individual_reservations[event_code]
    end

    def add_relay_reservation( event_code, fraction = nil )
      @relay_reservations[event_code] = RelayReservationDAO.new( event_code, fraction )
      @relay_reservations.size
    end

    def get_relay_reservation( event_code )
      @relay_reservations[event_code]
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # These must be initialized on creation:
  attr_reader :meeting

  # These can be edited later on:
  attr_accessor :reservations, :updated_at

  # Creates a new instance.
  #
  def initialize( meeting, updated_at = 0 )
    @meeting      = meeting
    @updated_at   = updated_at

    @reservations = Hash.new()
  end

  def add_swimmer_reservations( swimmer_id, swimmer_name, gender_code, category_code = nil )
    @reservations[swimmer_name] = SwimmerReservationsDAO.new( swimmer_id, swimmer_name, gender_code, category_code )
    @reservations.size
  end


  #-- -------------------------------------------------------------------------
  #++
end
