# encoding: utf-8

=begin

= SwimmerMedalsDAO

  - Goggles framework vers.:  4.00.570
  - author: Leega

 DAO class containing the swimmer medals to be shown by indvidual and relays event types, season types and pool types

=end
class SwimmerMedalsDAO

  # Manage specific meeting data used in swimmer statistics
  # Examples are FIN best, FIN worts, First attended meeting, etc.
  #
  class SwimmerMedalsEventsDAO
    # These must be initialized on creation:
    attr_reader :event_code

    #-- -------------------------------------------------------------------------
    #++

    # Creates a new instance.
    #
    def initialize( event_code, golds, silvers, bronzes, woodens )
      @event_code = event_code
      @medals     = Hash.new()

      @medals[:golds]   = golds
      @medals[:silvers] = silvers
      @medals[:bronzes] = bronzes
      @medals[:woodens] = wooodens
    end

    def get_goldes
      @meeting_data.has_key?( :golds ) ? @medals[:golds] : 0
    end

    def get_silvers
      @meeting_data.has_key?( :silvers ) ? @medals[:silvers] : 0
    end

    def get_bronzes
      @meeting_data.has_key?( :bronzes ) ? @medals[:bronzes] : 0
    end

    def get_woodens
      @meeting_data.has_key?( :woodens ) ? @medals[:woodens] : 0
    end
  end

  # These must be initialized on creation:
  attr_reader :swimmer
  #-- -------------------------------------------------------------------------
  #++

  # These can be edited later on:
  attr_accessor :individuals, :relays
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  #
  def initialize( swimmer )
    @swimmer               = swimmer
    @individuals           = Hash.new()
    @individuals[:seasons] = Hash.new()
    @relays                = Hash.new()
    @relay[:seasons]       = Hash.new()
  end

  def add_individual_event( pool_code, event_code, golds, silvers, bronzes, woodens, season_code )
    # If not already exists create pool_type structure
    @individuals[pool_code] = [] if !@individuals.has_key?( pool_code )
    @individuals[pool_code] << SwimmerMedalsEventsDAO.new( event_code, golds, silvers, bronzes, woodens )
    @individuals[:seasons][season_code] = [] if !@individuals[:seasons].has_key?( season_code )
  end

  def add_relay_event( pool_code, event_code, golds, silvers, bronzes, woodens, season_code )
    # If not already exists create pool_type structure
    @relays[pool_code] = [] if !@relays.has_key?( pool_code )
    @relays[pool_code] << SwimmerMedalsEventsDAO.new( event_code, golds, silvers, bronzes, woodens )
    @relays[:seasons][season_code] = [] if !@relays[:seasons].has_key?( season_code )
  end
  #-- -------------------------------------------------------------------------
  #++
end
