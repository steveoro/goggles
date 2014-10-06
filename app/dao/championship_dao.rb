# encoding: utf-8

=begin

= ChampionshipDAO

  - Goggles framework vers.:  4.00.546
  - author: Leega

 DAO class containing the structure for chapionship ranking rendering.

=end
class ChampionshipDAO

  # These must be initialized on creation:
  attr_reader :columns, :meetings, :teams

  # These can be edited later on:
  #attr_accessor :edition
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  #
  def initialize( columns, meetings, teams )
    @columns    = columns
    @meetings   = meetings
    @teams      = teams
    #@edition    = 0
  end
  #-- -------------------------------------------------------------------------
  #++
end
