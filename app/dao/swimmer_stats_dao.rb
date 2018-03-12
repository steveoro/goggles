# encoding: utf-8

=begin

= SwimmerStatsDAO

  - Goggles framework vers.:  4.00.570
  - author: Leega

 DAO class containing the swimmer stats for the radio displays

=end
class SwimmerStatsDAO
 
  # Manage specific meeting data used in swimmer statistics
  # Examples are FIN best, FIN worts, First attended meeting, etc.
  #
  class SwimmerStatsMeetingDAO
    # These must be initialized on creation:
    attr_reader :meeting_type, :meeting_data 

    #-- -------------------------------------------------------------------------
    #++
  
    # Creates a new instance.
    #
    def initialize( meeting_type, mir )
      @meeting_type = meeting_type
      @meeting_data = Hash.new()
      
      @meeting_data[:id]           = mir.meeting_id
      @meeting_data[:full_name]    = Meeting.find(mir.meeting_id).get_full_name
      @meeting_data[:season_type]  = SeasonType.find_by_code(mir.season_type_code).get_full_name
      @meeting_data[:meeting_date] = mir.scheduled_date
      @meeting_data[:event_type]   = mir.event_type_code
      @meeting_data[:std_points]   = mir.standard_points
    end

    def id
      @meeting_data.has_key?( :id ) ? @meeting_data[:id] : 0 
    end

    def get_season_type
      @meeting_data.has_key?( :season_type ) ? @meeting_data[:season_type] : I18n.t('none')
    end

    def get_full_name
      @meeting_data.has_key?( :full_name ) ? @meeting_data[:full_name] : I18n.t('none')
    end

    def get_meeting_date
      @meeting_data.has_key?( :meeting_date ) ? @meeting_data[:meeting_date].to_s : I18n.t('none') 
    end

    def get_event_type
      @meeting_data.has_key?( :event_type ) ? @meeting_data[:event_type] : I18n.t('none') 
    end
    
    def get_std_points
      @meeting_data.has_key?( :std_points ) ? @meeting_data[:std_points] : 0
    end    
  
  end

  # These must be initialized on creation:
  attr_reader :swimmer
  #-- -------------------------------------------------------------------------
  #++

  # These can be edited later on:
  attr_accessor :swimmer_stats, :mirs, :fin_mirs
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  #
  def initialize( swimmer )
    
    @swimmer       = swimmer
    @mirs          = []
    @fin_mirs      = []
    @swimmer_stats = Hash.new()
        
  end
  #-- -------------------------------------------------------------------------
  #++

  # Retrieve swimmer individual results
  #
  def retrieve_individual_results
    @mirs = @swimmer
      .meeting_individual_results
      .joins( meeting_program: [ meeting_event: [ :event_type, meeting_session: [ meeting: [ season: :season_type  ]]]])
      .includes( :event_type )
      .select( :minutes, :seconds, :hundreds, :standard_points, :is_disqualified, :is_out_of_race,
               :meeting_id, :length_in_meters, :scheduled_date, :meeting_program_id, 
               :badge_id, :team_id, 'season_types.code as season_type_code', 'event_types.code as event_type_code' )
      .order( 'meeting_sessions.scheduled_date' )
      .to_a

      #.includes( :event_type, :season, :team )
      #:meeting_event_id, :meeting_session_id, :season_id, 
  end

  # Populates swimmer stats
  #
  def calculate_stats
    retrieve_individual_results if @mirs.size == 0

    @swimmer_stats[:meetings_count]           = count_meetings
    @swimmer_stats[:individual_results_count] = count_individual_results
    @swimmer_stats[:team_names]               = find_linked_team_names

    @swimmer_stats[:first] = SwimmerStatsMeetingDAO.new( :first, @mirs.first ) 
    @swimmer_stats[:last]  = SwimmerStatsMeetingDAO.new( :last, @mirs.last ) 

    # Data collected with a for each cicle on results
    # Data found should be the same obtained using single methods 
    #@swimmer_stats[:meters_swam]              = sum_meters_swam
    #@swimmer_stats[:time_swam]                = sum_time_swam
    #@swimmer_stats[:disqualifications]        = count_disqualifications
    meters_swam       = 0
    time_swam         = 0
    disqualifications = 0
    @mirs.each do |mir|
      meters_swam += mir.length_in_meters
      time_swam += mir.get_timing_instance.to_hundreds
      disqualifications += 1 if mir.is_disqualified
    end
    @swimmer_stats[:meters_swam]       = meters_swam
    @swimmer_stats[:time_swam]         = time_swam
    @swimmer_stats[:disqualifications] = disqualifications

    # FIN statistics    
    retrieve_valid_fin_results_only if @fin_mirs.size == 0
    if @fin_mirs.size > 0
      @swimmer_stats[:iron_masters] = count_iron_masters
      
      tot_fin_points = 0
      min_fin_points = 2000  # Set higher than FIN max possibile points
      max_fin_points = 0
      worst_fin_mir  = nil
      best_fin_mir   = nil
      @fin_mirs.each do |mir|
        tot_fin_points += mir.standard_points
        if min_fin_points > mir.standard_points
          min_fin_points = mir.standard_points
          worst_fin_mir  = mir
        end
        if max_fin_points < mir.standard_points
          max_fin_points = mir.standard_points
          best_fin_mir  = mir
       end
      end
      @swimmer_stats[:tot_fin_points] = tot_fin_points
      @swimmer_stats[:worst_fin]      = SwimmerStatsMeetingDAO.new( :worst_fin, worst_fin_mir ) 
      @swimmer_stats[:best_fin]       = SwimmerStatsMeetingDAO.new( :best_fin, best_fin_mir ) 
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  def retrieve_valid_fin_results_only
    @fin_mirs = @mirs.reject{ |mir| mir.season_type_code != 'MASFIN' || mir.is_disqualified || mir.is_out_of_race || mir.standard_points == 0 }
  end

  # Retrieving stats data methods
  #

  # Attended meetings count
  # The count of meetings with at least one swimmer's individual result
  #
  def count_meetings
    @mirs.collect{ |mir| mir.meeting_id }.uniq.count
  end
  
  # Meeting individual results count
  # The count of meetings individual results
  #
  def count_individual_results
    @mirs.count
  end
  
  # Swimmer meters swam
  # The sum of event distance for each individual result
  #
  def sum_meters_swam
    #@mirs.sum{ |mir| mir.length_in_meters ? mir.length_in_meters : 0 }
    @mirs.sum{ |mir| mir.length_in_meters }
  end
  
  # Swimmer total time swam
  # The sum of swam time of each individual result
  #
  def sum_time_swam
    Timing.new( @mirs.each.sum{ |mir| mir.get_timing_instance.to_hundreds } )
  end
  
  # Swimmer total disqualifications
  # The number of disqualified individual result
  #
  def count_disqualifications
    @mirs.each.count{ |mir| mir.is_disqualified }
  end
  
  # Check for completed iron masters
  # Iron master is completed if in the same MASFIN season there are valid results for 18 different event types
  #
  def count_iron_masters
    iron_masters_count = 0
    @fin_mirs.collect{ |mir| mir.badge_id }.uniq.each do |fin_badge|
      iron_masters_count += 1 if @fin_mirs.reject{ |mir| mir.badge_id != fin_badge }.collect{ |mir| mir.event_type_code }.uniq.count >= 18
    end
    iron_masters_count
  end
  
  # Swimmer linked team names
  # Collect team decorator linked name for each distinct team red from result's badges
  #
  def find_linked_team_names
    linked_list = ""
    list = []
    @mirs.collect{ |mir| mir.team_id }.uniq.each do |team_id|
      list.append( Team.find(team_id).decorate.get_linked_name )
    end
    linked_list = list.join(', ')
    linked_list
  end
  
  # Swimmer max FIN standard points
  # The maximum FIN standar points of valid individual result
  #
  def find_max_fin_points
    @fin_mirs.size > 0 ? @fin_mirs.max{ |mir| mir.standard_points } : 0
  end
  
  # Swimmer min FIN standard points
  # The minimum FIN standar points of valid individual result
  #
  def find_min_fin_points
    @fin_mirs.size > 0 ? @fin_mirs.min{ |mir| mir.standard_points } : 0
  end
  
  # Swimmer total FIN standard points
  # The total amount of FIN standar points of valid individual result
  #
  def find_tot_fin_points
    @fin_mirs.sum{ |mir| mir.standard_points }
  end
  
  # Safe getter methods to retrieve stats data
  #
  
  # Attended meetings count
  #
  def get_meetings_count
    @swimmer_stats.has_key?( :meetings_count ) ? @swimmer_stats[:meetings_count] : 0
  end
  
  # Meeting individual results count
  #
  def get_individual_results_count
    @swimmer_stats.has_key?( :individual_results_count ) ? @swimmer_stats[:individual_results_count] : 0
  end
  
  # Swimmer meters swam
  #
  def get_meters_swam
    @swimmer_stats.has_key?( :meters_swam ) ? @swimmer_stats[:meters_swam] : 0
  end
  
  # Swimmer total time swam
  #
  def get_time_swam
    @swimmer_stats.has_key?( :time_swam ) ? Timing.new( @swimmer_stats[:time_swam] ) : Timing.new( 0 )
  end
  
  # Swimmer total disqualifications
  #
  def get_disqualifications
    @swimmer_stats.has_key?( :disqualifications ) ? @swimmer_stats[:disqualifications] : 0
  end
  
  # Swimmer total time swam
  #
  def get_iron_masters_count
    @swimmer_stats.has_key?( :iron_masters ) ? @swimmer_stats[:iron_masters] : 0
  end

  # Swimmer linked team names
  #
  def get_linked_team_names
    @swimmer_stats.has_key?( :team_names ) ? @swimmer_stats[:team_names] : I18n.t('none')
  end

  # Swimmer total FIN standard points
  #
  def get_tot_fin_points
    @swimmer_stats.has_key?( :tot_fin_points ) ? @swimmer_stats[:tot_fin_points] : 0
  end

  # Swimmer first attended meeting
  #
  def get_first_meeting
    #@mirs.count > 0 ? Meeting.find(@mirs.first.meeting_id) : nil
    @swimmer_stats[:first]
  end

  # Swimmer last attended meeting
  #
  def get_last_meeting
    #@mirs.count > 0 ? Meeting.find(@mirs.last.meeting_id) : nil
    @swimmer_stats[:last]
  end

  # Swimmer best fin result
  #
  def get_best_fin
    @swimmer_stats[:best_fin]
  end

  # Swimmer best fin result
  #
  def get_worst_fin
    @swimmer_stats[:worst_fin]
  end
  #-- -------------------------------------------------------------------------
  #++

end
