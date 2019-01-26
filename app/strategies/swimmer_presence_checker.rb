require 'wrappers/timing'

#
# == SwimmerPresenceChecker
#
# Pattern to calcolate swimmer presence to meetings
# A presence to a meeting is defined by an entry, an individuale result or a relay result
#
# @author   Leega
# @version  6.093
#
class SwimmerPresenceChecker

  # These must be initialized on creation:
  attr_reader :swimmer, :evaluation_date

  # These can be edited later on:
  attr_accessor :header_year, :swimmer_presence_dao

  # Initialization
  #
  # == Params:
  # The swimmer to check for
  # The evaluation date to chek for (default today)
  # The evaluation date determines the seasons to consider
  #
  def initialize( swimmer, evaluation_date = Date.today() )
    @swimmer         = swimmer
    @evaluation_date = evaluation_date
    @header_year     = get_current_header_year()


    @swimmer_presence_dao = SwimmerPresenceDAO.new( @swimmer, @header_year )
  end
  #-- --------------------------------------------------------------------------
  #++

  # Get the current header year using given date
  # Use current date if no date given
  #
  def get_current_header_year()
    year = @evaluation_date.month < 10 ? @evaluation_date.year - 1 : @evaluation_date.year
    "#{year}/#{year+1}"   
  end
  #-- -------------------------------------------------------------------------
  #++

  # Get the swimmer badges for the given header year seasons 
  #
  def get_swimmer_current_badges()
    @swimmer.badges.joins( :season ).where( ['header_year = ?', @header_year] )  
  end
  #-- -------------------------------------------------------------------------
  #++

  # Get the seasons for the given header year where swimmer has badge
  #
  def get_swimmer_current_seasons()
    Season.where( header_year: get_current_header_year() ).where( ['exists (select 1 from badges where swimmer_id=?)', @swimmer.id] )  
  end
  #-- -------------------------------------------------------------------------
  #++
    
  
  
end
