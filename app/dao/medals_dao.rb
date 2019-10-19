# encoding: utf-8

=begin

= MedalsDAO

  - Goggles framework vers.:  4.00.570
  - author: Leega

 DAO class containing the medals collection to be shown by indvidual and relays, event types, season types and pool types

=end
class MedalsDAO

  # Represents a collection of medal types for a specific kind of grioup
  # such as an event or a summary
  # Consist of an hash with medal_code => medals_count elements
  #
  class MedalsCollectorDAO
    # Creates a new instance.
    #
    def initialize()
      @medals = Hash.new()
    end

    def set_medals( medal_code, medals_count )
       @medals[medal_code] = medals_count
    end

    def add_medals( medal_code, medals_count )
       @medals.has_key?( medal_code ) ? @medals[medal_code] += medals_count : @medals[medal_code] = medals_count
    end

    def get_medals( medal_code )
      @medals.has_key?( medal_code ) ? @medals[medal_code] : 0
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Represents a collection of medal types for a specific kind of grioup
  # such as an event or a summary
  # Consist of an hash with medal_code => medals_count elements
  #
  class MedalsGroupDAO
    # These can be edited later on:
    attr_accessor :detail, :summary

    # Creates a new instance.
    #
    def initialize
      @detail  = Hash.new()
      @summary = MedalsCollectorDAO.new()
    end

    # Sets the medal count of specific type (season - pool - event)
    # Creates each type hash if needed
    # Returns medals count set
    #
    def set_medals( season_code, pool_code, event_code, medal_code, medals_count )
      # If not already exists create season hash
      @detail[season_code] = Hash.new() if !exists_season?( season_code )

      # If not already exists create pool hash
      @detail[season_code][pool_code] = Hash.new() if !exists_pool?( season_code, pool_code )

      #if not already exists create event hash
      @detail[season_code][pool_code][event_code] = MedalsCollectorDAO.new() if !exists_event?( season_code, pool_code, event_code )

      # Set medal number
      @detail[season_code][pool_code][event_code].set_medals( medal_code, medals_count )

      # Collect summarized data
      @summary.add_medals( medal_code, medals_count )

      # Return medals count set for verifing purposes
      @detail[season_code][pool_code][event_code].get_medals( medal_code )
    end

    # Return medal count or zero if any
    def get_medals( season_code, pool_code, event_code, medal_code )
      # Return medals count set for verifing purposes
      exists_event?( season_code, pool_code, event_code ) ?  @detail[season_code][pool_code][event_code].get_medals( medal_code ) : 0
    end

    def exists_season?( season_code )
      @detail.has_key?( season_code )
    end

    def exists_pool?( season_code, pool_code )
      exists_season?( season_code ) && @detail[season_code].has_key?( pool_code )
    end

    def exists_event?( season_code, pool_code, event_code )
      exists_season?( season_code ) && exists_pool?( season_code, pool_code ) && @detail[season_code][pool_code].has_key?( event_code )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # These must be initialized on creation:
  #attr_reader
  #-- -------------------------------------------------------------------------
  #++

  # These can be edited later on:
  attr_accessor :medals, :summary
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  #
  def initialize()
    # Define basic structure
    @medals               = Hash.new()
    @medals[:individuals] = MedalsGroupDAO.new()
    @medals[:relays]      = MedalsGroupDAO.new()
    @summary              = MedalsCollectorDAO.new()
  end
  #-- -------------------------------------------------------------------------
  #++

  # Sets the medal count of general types (individual or relay)
  # Returns medals count set
  #
  def set_medals( is_a_relay, season_code, pool_code, event_code, medal_code, medals_count )
    # Collect summarized data
    @summary.add_medals( medal_code, medals_count )

    if is_a_relay
      @medals[:relays].set_medals( season_code, pool_code, event_code, medal_code, medals_count )
    else
      @medals[:individuals].set_medals( season_code, pool_code, event_code, medal_code, medals_count )
    end
  end

  # Return medal count or zero if any
  def get_medals( is_a_relay, season_code, pool_code, event_code, medal_code )
    mgd = is_a_relay ? get_relays : get_individuals
    mgd.get_medals( season_code, pool_code, event_code, medal_code )
  end

  # Getters generals
  def get_individuals
    @medals[:individuals]
  end
  def get_relays
    @medals[:relays]
  end

  def get_summary( medal_code )
    @summary.get_medals( medal_code )
  end
  #-- -------------------------------------------------------------------------
  #++
end
