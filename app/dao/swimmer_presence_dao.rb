# encoding: utf-8

=begin

= SwimmerPresenceDAO

  - Goggles framework vers.:  6.111
  - author: Leega

 DAO class containing the structure for managing the swimmer presence to
 the meetings, considering entries, indovidual results and relays

=end
class SwimmerPresenceDAO
 
  class MeetingPresenceDAO
   
    # These must be initialized on creation:
    attr_reader :meeting
  
    # These can be edited later on:
    attr_accessor :was_present, 
                  :events_count, :relays_count, 
                  :det_reservations_count, :det_entries_count, :det_results_count,
                  :total_fee,
                  :meeting_fee, :events_fee, :relays_fee 
    #-- -------------------------------------------------------------------------
    #++
  
    # Creates a new instance
    #
    def initialize( meeting )    
      @meeting = meeting
    end
    #-- -------------------------------------------------------------------------
    #++
  end
    
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

  # Adds a meeting presence element
  # Returns meeting total
  #
  def add_meeting( meeting_presence )    
    @meetings << meeting_presence
    @meetings.count
  end
  #-- -------------------------------------------------------------------------
  #++

  # Create a CSV file (; delimited) with swimmer presence data
  #
  def to_csv( csv_file_name = 'SwimmerPresence_' + @swimmer.id.to_s )
    rows = []

    File.open( csv_file_name + '.csv', 'w' ) do |f|
      file_titles = ['season_type', 'meeting_date', 'meeting_name', 'events_count', 'relays_count', 'meeting_fee', 'events_fee', 'relays_fee', 'total_fee']
      rows << file_titles.join(';')
      
      @meetings.each do |meeting| 
        file_row = []
        file_row << meeting.meeting.season.season_type.code
        file_row << meeting.meeting.header_date
        file_row << meeting.meeting.description
        file_row << meeting.events_count
        file_row << meeting.relays_count
        file_row << meeting.meeting_fee
        file_row << meeting.events_fee
        file_row << meeting.relays_fee
        file_row << meeting.total_fee
        rows << file_row.join(';')
      end

      f.puts rows.map{ |row| row }
    end
  end
  #-- -------------------------------------------------------------------------
  #++

end
