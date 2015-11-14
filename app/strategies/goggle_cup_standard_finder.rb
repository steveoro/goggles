require 'wrappers/timing'

#
# == GoggleCupScoreCalculator
#
# Strategy Pattern implementation for Goggle Cup score calculations
#
# @author   Leega
# @version  4.00.835
#
class GoggleCupStandardFinder
  include SqlConverter

  # These can be edited later on:
  attr_accessor :goggle_cup, :swimmers 

  # Initialization
  #
  # == Params:
  # An instance of goggle_cup
  #
  def initialize( goggle_cup )
    unless goggle_cup && goggle_cup.instance_of?( GoggleCup )
      raise ArgumentError.new("Needs a valid Goggle cup")
    end
    
    @goggle_cup = goggle_cup
    @swimmers   = get_involved_swimmers
  end
  #-- --------------------------------------------------------------------------
  #++

  # Find swimmers potentially involved in Goggle Cup
  # Swimmer involved are those who has a badge in at least
  # one of the considered season according to the
  # Goggle cup definition
  # We should consider all swimmer that swam
  # at least one meeting before Goggle cup but it would be
  # not wise... 
  def get_involved_swimmers
    involved_swimmers = []
    @goggle_cup.swimmers.has_results.uniq.each do |swimmer|
      involved_swimmers << swimmer if swimmer.meeting_individual_results.for_team( @goggle_cup.team ).has_time.is_not_disqualified.count > 0 && 
       oldest_swimmer_result( swimmer ) <= @goggle_cup.end_date.prev_year
    end
    involved_swimmers
  end 

  # Get the oldest swimmer result date
  # Assumes that swimmer has at least one result
  def oldest_swimmer_result( swimmer )
    swimmer.meeting_individual_results.for_team( @goggle_cup.team ).has_time.is_not_disqualified.count > 0 ?
     swimmer.meeting_individual_results.for_team( @goggle_cup.team ).has_time.is_not_disqualified.sort_by_date('ASC').first.get_scheduled_date :
     Date.today.next_day
  end

  # Determinates the year_by_year periods to scan for
  # the given swimmer starting from the one preceding
  # the Goggle Cup backward to the one containing the
  # oldest swimmer result
  #
  # Returns an array of dates
  #
  def get_periods_to_scan( swimmer )
    goggle_years_to_scan = []
    oldest_result_date = oldest_swimmer_result( swimmer )
    if oldest_result_date < @goggle_cup.end_date.prev_year
      period_end = @goggle_cup.end_date.prev_year
      goggle_years_to_scan << period_end 
      while period_end >= oldest_result_date do
        period_end = period_end.prev_year
        goggle_years_to_scan << period_end 
      end
    end
    goggle_years_to_scan
  end

  # Scan swimmer meeting individual results to find out
  # goggle cup standard
  # Goggle cup standard is the best time swam during the past season
  # If Goggle cup will consider all result types
  # (is_limited_to_season_types_defined == false)
  # scans all results, otherwise only resluts for season types to be considered
  # according to Goggle cup definition
  # The scan has made "year per year" starting from the the
  # year preceding the Goggle cup according to the end date
  #
  # Returns an array of events => time
  #
  def find_swimmer_goggle_cup_standard( swimmer )
    swimmer_goggle_cup_standards = Hash.new

    # Check in the period and exit if result found
    EventsByPoolType.not_relays.only_for_meetings.each do |event_by_pool_type|
      get_periods_to_scan( swimmer ).each do |date|
        mir = swimmer.
         meeting_individual_results.
         for_team( @goggle_cup.team ).
         for_date_range( date.prev_year, date ).
         for_event_by_pool_type( event_by_pool_type ).
         sort_by_timing.
         first
        if mir
          swimmer_goggle_cup_standards["#{event_by_pool_type.get_key}"] = mir.get_timing_instance
          break
        end
      end
    end
    swimmer_goggle_cup_standards    
  end
  #-- --------------------------------------------------------------------------
  #++

  # Scans for all team swimmers to define Goggle cup standards
  # Scans all swimmers with results for the team if  
  # is_limited_to_season_types_defined == false
  # Otherwise consider only those who have results for meetings
  # in the season types to be considered according to Goggle cup definition
  def create_goggle_cup_standards
    sql_diff_text_log << "--\r\n"
    sql_diff_text_log << "-- Creating time standards for #{@goggle_cup.get_verbose_name}\r\n"
    sql_diff_text_log << "--\r\n"
    
    # Clear data to avoid incorrect standards
    # Necessary beacuse a time swam during the Goggle cup year should became
    # new standard time if not present, but should be not considerd
    # during time standard creation to ricreate clear situation
    delete_goggle_cup_standards

    sql_diff_text_log << "\r\n-- Found #{@swimmers.count} swimmers\r\n"
    @swimmers.each do |swimmer|
      sql_diff_text_log << "\r\n"
      create_goggle_cup_standards_for_swimmer( swimmer )
    end
    sql_diff_text_log
  end
  #-- --------------------------------------------------------------------------
  #++
  
  # Scans for all team swimmers to define Goggle cup standards
  # Scans all swimmers with results for the team if  
  # is_limited_to_season_types_defined == false
  # Otherwise consider only those who have results for meetings
  # in the season types to be considered according to Goggle cup definition
  def create_goggle_cup_standards_for_swimmer( swimmer )
    # Clear data to avoid incorrect standards
    # Necessary beacuse a time swam during the Goggle cup year should became
    # new standard time if not present, but should be not considerd
    # during time standard creation to ricreate clear situation
    delete_goggle_cup_standards_for_swimmer( swimmer ) if @goggle_cup.goggle_cup_standards.for_swimmer( swimmer ).count > 0

    sql_diff_text_log << "-- Creating time standards for #{swimmer.get_full_name}\r\n"
    find_swimmer_goggle_cup_standard( swimmer ).each_pair do |event_key, standard_time|
      event_by_pool_type = EventsByPoolType.find_by_key( event_key )
      goggle_cup_standard               = GoggleCupStandard.new()
      goggle_cup_standard.goggle_cup_id = @goggle_cup.id
      goggle_cup_standard.swimmer_id    = swimmer.id
      goggle_cup_standard.event_type_id = event_by_pool_type.event_type_id  
      goggle_cup_standard.pool_type_id  = event_by_pool_type.pool_type_id  
      goggle_cup_standard.minutes       = standard_time.minutes
      goggle_cup_standard.seconds       = standard_time.seconds
      goggle_cup_standard.hundreds      = standard_time.hundreds
      goggle_cup_standard.save
      comment = "#{event_by_pool_type.i18n_description}: #{standard_time.to_s}"
      sql_diff_text_log << to_sql_insert( goggle_cup_standard, false, "\r\n", comment )
    end
    sql_diff_text_log << "-- End swimmer #{swimmer.get_full_name}. Inserted: #{@goggle_cup.goggle_cup_standards.for_swimmer( swimmer ).count}\r\n"
    sql_diff_text_log
  end
  #-- --------------------------------------------------------------------------
  #++
  
  # Deletes entire Goggle cup standard times
  def delete_goggle_cup_standards
    sql_diff_text_log << "--\r\n"
    sql_diff_text_log << "-- Deleting time standards for #{@goggle_cup.get_verbose_name}\r\n"
    sql_diff_text_log << "--\r\n"
    @goggle_cup.goggle_cup_standards.each do |goggle_cup_standard|
      sql_diff_text_log << to_sql_delete( goggle_cup_standard, false, "\r\n" )
      goggle_cup_standard.delete
    end
    sql_diff_text_log << "-- Deletion complete. Remaining: #{@goggle_cup.goggle_cup_standards.count}\r\n"
  end
  #-- --------------------------------------------------------------------------
  #++

  # Deletes Goggle cup standard times for a given swimmer
  def delete_goggle_cup_standards_for_swimmer( swimmer )
    sql_diff_text_log << "--\r\n"
    sql_diff_text_log << "-- Deleting time standards for #{swimmer.get_full_name}\r\n"
    sql_diff_text_log << "--\r\n"
    @goggle_cup.goggle_cup_standards.for_swimmer( swimmer ).each do |goggle_cup_standard|
      sql_diff_text_log << to_sql_delete( goggle_cup_standard, false, "\r\n" )
      goggle_cup_standard.delete
    end
    sql_diff_text_log << "-- Deletion complete. Remaining: #{@goggle_cup.goggle_cup_standards.for_swimmer( swimmer ).count}\r\n"
  end
  #-- --------------------------------------------------------------------------
  #++

  # Returns the overall SQL diff/log for all the SQL operations that should
  # be carried out by for replicating the changes (already done by this instance) on
  # another instance of the same Database (for example, to apply the changes on
  # a production DB after testing them on a staging version of the same DB).
  # It is never +nil+, empty at first.
  #
  def sql_diff_text_log
    @sql_diff_text_log ||= ''
  end
  # ----------------------------------------------------------------------------
  #++
end
