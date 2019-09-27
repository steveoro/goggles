require 'wrappers/timing'

#
# == HeaderYearPicker
#
# Pattern to pick handled header yers
# Header years are intended to manage groups of seasons referred to the
# same period. EG For the same year there are more than one seasons owned by different federations
#
# @author   Leega
#
class HeaderYearPicker

  # These must be initialized on creation:
  attr_reader :season_list

  # These can be edited later on:
  #attr_accessor :season

  # Initialization
  #
  # == Params:
  # An instance of season
  #
  def initialize()
    @season_list = []
  end
  #-- --------------------------------------------------------------------------
  #++

  # Pick handled header years
  #
  def find(starting_from = 2000, ending_at = Date.today.month <= 9 ? Date.today.year - 1 : Date.today.year)
    @season_list = manually(starting_from, ending_at)
  end

  # Pick handled header years
  #
  def manually(starting_from = 2000, ending_at = Date.today.month <= 9 ? Date.today.year - 1 : Date.today.year)
    # TODO Find out managed seasons
    #@season_list << '2016-2017' if starting_from <= '2016-2017'
    #@season_list << '2017-2018'
    #@season_list << '2018-2019'
    #@season_list << '2019-2020' if Date.today() >= Date.parse('20191001')
    #@season_list << '2020-2021' if Date.today() >= Date.parse('20201001')
    season_list = []
    if starting_from <= ending_at
      (starting_from..ending_at).to_a.each do |year|
        header_year = year.to_s + '-' + (year + 1).to_s
        season_list << header_year
      end
    end
    season_list
  end

  # Pick handled header years reading from DB
  #
  def from_db(starting_from = 2000, ending_at = Date.today.month <= 9 ? Date.today.year - 1 : Date.today.year)
    season_list = []
    season_list
  end
  #-- --------------------------------------------------------------------------
  #++
end
