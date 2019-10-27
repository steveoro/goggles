# encoding: utf-8

=begin

= TeamStatsDAO

  - Goggles framework vers.:  4.00.570
  - author: Leega

 DAO class containing the team stats for the radio displays

=end
class TeamStatsDAO

  # Represents a collection of federation stats for a team
  # Consist of an hash with stats items
  #
  class MeetingTeamStatsDAO

    # These must be initialized on creation:
    attr_reader :meeting_date, :meeting_id, :meeting_description, :federation_code

    # Creates a new instance.
    #
    def initialize( meeting_date, meeting_id, meeting_description, federation_code )
      # Individual results
      @meeting_date        = meeting_date
      @meeting_id          = meeting_id
      @meeting_description = meeting_description
      @federation_code     = federation_code
    end
  end

  # Represents a collection of federation stats for a team
  # Consist of an hash with stats items
  #
  class DetailTeamStatsDAO

    # These can be edited later on:
    attr_accessor :meters_swam, :time_swam, :disqualifications

    # Creates a new instance.
    #
    def initialize( meters_swam = 0, time_swam = 0, disqualifications = 0 )
      # Individual results
      @meters_swam       = meters_swam
      @time_swam         = time_swam
      @disqualifications = disqualifications
    end
  end

  # Represents a collection of federation stats for a team
  # Consist of an hash with stats items
  #
  class DataTeamStatsDAO

    # These can be edited later on:
    attr_accessor :affiliations_count, :meetings_count, :first_meeting_dao, :last_meeting_dao, :individuals, :relays, :max_updated_at
    #-- -------------------------------------------------------------------------
    #++

    # Creates a new instance.
    #
    def initialize( affiliations_count = 0, meeting_count = 0, first_meeting_dao = nil, last_meeting_dao = nil, individuals = DetailTeamStatsDAO.new(), relays = DetailTeamStatsDAO.new(), max_updated_at = 0 )
      @affiliations_count = affiliations_count
      @meetings_count     = meeting_count
      @first_meeting_dao  = first_meeting_dao
      @last_meeting_dao   = last_meeting_dao
      @individuals        = individuals
      @relays             = relays
      @max_updated_at     = max_updated_at
    end
  end

  # These must be initialized on creation:
  #attr_reader
  #-- -------------------------------------------------------------------------
  #++

  # These can be edited later on:
  attr_accessor :team, :federations, :summary
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  #
  def initialize( team )
    @team        = team
    @federations = Hash.new()
    @summary     = DataTeamStatsDAO.new()
  end
  #-- -------------------------------------------------------------------------
  #++

  # Add federation data to team stats with total items sync
  def add_federation_data( name, federation_data )
    # Sets federation data detail
    @federations[name]  = federation_data

    @summary.affiliations_count += federation_data.affiliations_count
    @summary.meetings_count     += federation_data.meetings_count
    @summary.first_meeting_dao  = federation_data.first_meeting_dao if @summary.first_meeting_dao.nil? || federation_data.first_meeting_dao.meeting_date < @summary.first_meeting_dao.meeting_date
    @summary.last_meeting_dao   = federation_data.last_meeting_dao if @summary.last_meeting_dao.nil? || federation_data.last_meeting_dao.meeting_date > @summary.last_meeting_dao.meeting_date
    @summary.max_updated_at     = federation_data.max_updated_at if @summary.max_updated_at == 0 || federation_data.max_updated_at > @summary.max_updated_at

    # Individual results
    @summary.individuals.meters_swam       += federation_data.individuals.meters_swam
    @summary.individuals.time_swam         += federation_data.individuals.time_swam
    @summary.individuals.disqualifications += federation_data.individuals.disqualifications

    # Relay results
    @summary.relays.meters_swam       += federation_data.relays.meters_swam
    @summary.relays.time_swam         += federation_data.relays.time_swam
    @summary.relays.disqualifications += federation_data.relays.disqualifications

  end

  # Safe getter methods to retrieve stats data
  #

  # Affiliations count
  #
  def get_affiliations_count
    @summary.affiliations_count
  end

  # Attended meetings count
  #
  def get_meetings_count
    @summary.meetings_count
  end

  # Team meters swam
  #
  def get_meters_swam
    @summary.individuals.meters_swam
  end

  # Team relay meters swam
  #
  def get_relay_meters_swam
    @summary.relays.meters_swam
  end

  # Team total time swam
  #
  def get_time_swam
    Timing.new( @summary.individuals.time_swam )
  end

  # Team relay time swam
  #
  def get_relay_time_swam
    Timing.new( @summary.relays.time_swam )
  end

  # Team total disqualifications
  #
  def get_disqualifications
    @summary.individuals.disqualifications
  end

  # Team relay disqualifications
  #
  def get_relay_disqualifications
    @summary.relays.disqualifications
  end
  #-- -------------------------------------------------------------------------
  #++

  # Team first attended meeting
  #
  def get_first_meeting_dao
    @summary.first_meeting_dao
  end

  # Team last attended meeting
  #
  def get_last_meeting_dao
    @summary.last_meeting_dao
  end

  # Team max updated at result
  #
  def get_max_updated_at
    @summary.max_updated_at
  end
  #-- -------------------------------------------------------------------------
  #++
end
