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
  # Swimmers involved are those who swam at least on meeting
  # for the Goggle Cup team before the start of the given Goggle Cup
  # If Goggle cup will not consider all result types
  # (is_limited_to_season_types_defined == false)
  # will considered only involved seasn types according
  # to Goggle Cup definition
  def get_involved_swimmers
    involved_swimmers = []
    @goggle_cup.team.swimmers.each do |swimmer|
      involved_swimmers << swimmer if swimmer.meeting_individual_results.has_time.is_not_disqualified.count > 0 && 
       oldest_swimmer_result( swimmer ) <= @goggle_cup.end_date.prev_year
    end
    involved_swimmers
  end 

  # Get the oldest swimmer result date
  # Assumes that swimmer has at least one result
  def oldest_swimmer_result( swimmer )
    swimmer.meeting_individual_results.has_time.is_not_disqualified.sort_by_date('ASC').first.get_scheduled_date
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
    period_end = @goggle_cup.end_date.prev_year
    goggle_years_to_scan << period_end 
    while period_end >= oldest_result_date do
      period_end = period_end.prev_year
      goggle_years_to_scan << period_end 
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

    # Check the period and exit if result found
    EventsByPoolType.not_relays.only_for_meetings.each do |event_by_pool_type|
      get_periods_to_scan( swimmer ).each do |date|
        mir = swimmer.meeting_individual_results.for_date_range( date.prev_year, date ).for_event_by_pool_type( event_by_pool_type ).sort_by_timing.first
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

    # TODO
    # Persists data found
    @swimmers.each do |swimmer|
      sql_diff_text_log << "-- Begin swimmer #{swimmer.get_full_name}\r\n"
      find_swimmer_goggle_cup_standard( swimmer ).each do |swimmer_goggle_cup_standard|
        event_by_pool_type = EventsByPoolType.find_by_key( swimmer_goggle_cup_standard.key )
        goggle_cup_standard            = GoggleCupStandard.new()
        goggle_cup_standard.goggle_cup = @goggle_cup.id
        goggle_cup_standard.swimmer_id = swimmer.id
        goggle_cup_standard.event_type = event_by_pool_type.event_type.id  
        goggle_cup_standard.pool_type  = event_by_pool_type.pool_type.id  
        goggle_cup_standard.minutes    = swimmer_goggle_cup_standard.value.get_timing_instanmce.minutes
        goggle_cup_standard.seconds    = swimmer_goggle_cup_standard.value.get_timing_instanmce.seconds
        goggle_cup_standard.hundreds   = swimmer_goggle_cup_standard.value.get_timing_instanmce.hundreds
        goggle_cup_standard.save
        sql_diff_text_log << to_sql_insert( goggle_cup_standard, false ) # no additional comment
      end
      sql_diff_text_log << "-- End swimmer #{swimmer.get_full_name}\r\n"
    end
  end
  #-- --------------------------------------------------------------------------
  #++
  
  # Deletes entire Goggle cup standard times
  def delete_goggle_cup_standards
    sql_diff_text_log << "--\r\n"
    sql_diff_text_log << "-- Deleting time standards for #{@goggle_cup.get_verbose_name}\r\n"
    sql_diff_text_log << "--\r\n"
    @goggle_cup.time_standards.each do |standard_time|
      sql_diff_text_log << to_sql_delete( standard_time, false )
      standard_time.delete
    end
    sql_diff_text_log << "-- Deletion complete. Remaining: #{@goggle_cup.time_standards.count}\r\n"
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
