# encoding: utf-8

=begin

= TeamCurrentSwimmersDAO

  - Goggles framework vers.:  4.00.570
  - author: Leega

 DAO class containing the list of teams corret swimemrs with detail data

=end
class TeamCurrentSwimmersDAO

  # Represents the collection of swimmer badge data
  #
  class CurrentSwimmerBadgeDAO

    # These can be edited later on:
    attr_accessor :badge_number, :category_code, :meetings_count

    # Creates a new instance.
    #
    def initialize( badge_number = 'ND', category_code = 'ND', meetings_count = 0 )
      # Individual results
      @badge_number   = badge_number
      @category_code  = category_code
      @meetings_count = meetings_count
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Represents the single swimmer data colelction
  #
  class CurrentSwimmerDAO

    # These must be initialized on creation:
    attr_reader :swimmer_id, :swimmer_name, :swimmer_year, :meetings_total, :badges

    # Creates a new instance.
    #
    def initialize( swimmer_id, swimmer_name, swimmer_year, meetings_total = 0 )
      # Individual results
      @swimmer_id     = swimmer_id
      @swimmer_name   = swimmer_name
      @swimmer_year   = swimmer_year
      @meetings_total = meetings_total
      @badges         = Hash.new()
    end

    def add_badge( federation_code, badge_number = 'ND', category_code = 'ND', meetings_count = 0 )
      @badges[federation_code] = CurrentSwimmerBadgeDAO.new( badge_number, category_code, meetings_count )
      @badges.size
    end

    def get_badge( federation_code )
      @badges[federation_code]
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # These must be initialized on creation:
  attr_reader :team, :evaluation_date

  # These can be edited later on:
  attr_accessor :updated_at, :affiliations, :swimmers

  # Creates a new instance.
  #
  def initialize( team, evaluation_date = Date.today(), updated_at = 0 )
    @team            = team
    @evaluation_date = evaluation_date
    @updated_at      = updated_at

    @affiliations    = Hash.new()
    @swimmers        = Hash.new()
  end

  def add_affiliation( federation_code, affiliation_number = 'ND' )
    @affiliations[federation_code] = affiliation_number
    @affiliations.size
  end

  def get_affiliation( federation_code )
    @affiliations[federation_code]
  end

  def add_swimmer( swimmer_id, swimmer_name, swimmer_year, meetings_total = 0 )
    @swimmers[swimmer_id] = CurrentSwimmerDAO.new( swimmer_id, swimmer_name, swimmer_year, meetings_total )
    @swimmers.size
  end

  def get_swimmer( swimmer_id )
    @swimmers[swimmer_id]
  end
  #-- -------------------------------------------------------------------------
  #++
end
