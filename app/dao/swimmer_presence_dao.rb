# encoding: utf-8

=begin

= SwimmerPresenceDAO

  - Goggles framework vers.:  6.111
  - author: Leega

 DAO class containing the structure for managing the swimmer presence to
 the meetings, considering entries, indovidual results and relays

=end
class SwimmerPresenceDAO
 
  # These must be initialized on creation:
  attr_reader :swimmer, :header_year

  # These can be edited later on:
  attr_accessor :seasons, :meetings
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance
  # swimmer is the swimmer to inspect
  # header_year is the season header year of the seasons to inspect. If nil 
  # takes the current seasons 
  #
  def initialize( swimmer, header_year )    
    @swimmer     = swimmer
    @header_year = header_year 
    @seasons     = []
    @meetings    = []
  end
  #-- -------------------------------------------------------------------------
  #++

  # Create a CSV file (; delimited) with swimemr presence data
  #
  def to_csv( csv_file_name = 'SwimmerPresence_' + @swimmer.id.to_s + '_' + @header_year )
    rows = []

    File.open( csv_file_name + '.csv', 'w' ) do |f|
      file_titles = ['name',  'meeting_date', 'meeting_name', 'season_type', 'events_count', 'relays_count', 'events_fee', 'relays_fee', 'total_fee']
      rows << file_titles.join(';')
      
      @meetings.each do |meeting| 
        file_row = ''
        rows << file_row.join(';')
      end

      f.puts rows.map{ |row| row }
    end
  end
  #-- -------------------------------------------------------------------------
  #++

end
