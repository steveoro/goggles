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
    attr_reader :season_id, :season_name, :meeting_id, :header_date, :description, :meeting_fee, :event_fee, :relay_fee
  
    # These can be edited later on:
    attr_accessor :was_present, 
                  :events_count, :relays_count, 
                  :det_reservations_count, :det_entries_count, :det_results_count
    #-- -------------------------------------------------------------------------
    #++
  
    # Creates a new instance
    #
    def initialize( meeting, season )    
      @season_id   = season.id
      @season_name = season.description
      @meeting_id  = meeting.id
      @header_date = meeting.header_date
      @description = meeting.description

      @meeting_fee = meeting.meeting_fee ? meeting.meeting_fee : 0
      @event_fee   = meeting.event_fee ? meeting.event_fee : 0
      @relay_fee   = meeting.relay_fee ? meeting.relay_fee : 0

      # Defaults
      @was_present = false
      @events_count = 0
      @relays_count = 0 
      @det_reservations_count = 0
      @det_entries_count = 0
      @det_results_count = 0
    end
    #-- -------------------------------------------------------------------------
    #++

    # Calculate events fee
    # Returns 0 if no data
    #
    def get_events_fee
      @event_fee * ( @events_count ? @events_count : 0) 
    end
    
    # Calculate relays fee
    # Returns 0 if no data
    #
    def get_relays_fee
      @relay_fee * ( @relays_count ? @relays_count : 0) 
    end
    
    # Calculate total fee
    # Returns 0 if no data
    #
    def get_total_fee
      @meeting_fee + get_events_fee + get_relays_fee
    end
  end
    
  # These must be initialized on creation:
  attr_reader :swimmer_id, :complete_name, :evaluation_date, :header_year

  # These can be edited later on:
  attr_accessor :meetings
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance
  # swimmer is the swimmer to inspect
  # header_year is the season header year of the seasons to inspect. If nil 
  # takes the current seasons 
  #
  def initialize( swimmer, evaluation_date, header_year )    
    @swimmer_id      = swimmer.id
    @complete_name   = swimmer.complete_name
    @evaluation_date = evaluation_date 
    @header_year     = header_year 
    @meetings        = []
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
  def to_csv( csv_file_name = 'SwimmerPresence_' + @swimmer_id.to_s )
    # Check if at least one meeting present
    done = false
    if @meetings.size > 0
      rows = []
      
      File.open( csv_file_name + '.csv', 'w' ) do |f|
        # Define file column headers
        file_titles = []
        file_titles << 'complete_name'
        file_titles << 'season_type'
        file_titles << 'meeting_date'
        file_titles << 'meeting_name'
        file_titles << 'events_count'
        file_titles << 'relays_count'
        file_titles << 'meeting_fee'
        file_titles << 'events_fee'
        file_titles << 'relays_fee'
        file_titles << 'total_fee'
        rows << file_titles.join(';')
        
        @meetings.each do |mpDAO| 
          file_row = []
          file_row << mpDAO.complete_name
          file_row << mpDAO.season_name
          file_row << mpDAO.header_date
          file_row << mpDAO.description
          file_row << mpDAO.events_count
          file_row << mpDAO.relays_count
          file_row << mpDAO.meeting_fee
          file_row << mpDAO.events_fee
          file_row << mpDAO.relays_fee
          file_row << mpDAO.total_fee
          rows << file_row.join(';')
        end
  
        f.puts rows.map{ |row| row }
      end
      done = true
    end
    done
  end
  #-- -------------------------------------------------------------------------
  #++

end
