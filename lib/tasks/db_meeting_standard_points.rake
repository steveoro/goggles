# encoding: utf-8
require 'date'
require 'rubygems'
require 'find'
require 'fileutils'

require 'framework/version'
require 'framework/application_constants'
require 'framework/console_logger'

require_relative '../../app/concerns/sql_convertable'


LOG_DIR = File.join( Dir.pwd, 'log' ) unless defined? LOG_DIR


=begin

= Meeting standard points score calculation

  - Goggles framework vers.:  4.00.856.20160202
  - author: Leega

  DB Updater for batch calculation of standard points

  (ASSUMES TO BE rakeD inside Rails.root)

=end

namespace :db do
  include SqlConvertable

  desc <<-DESC
Calculate and update DB for meeting standard points.
Resulting log files are stored into '#{LOG_DIR}'.

Performs a batch, scan of MeetingIndividualResult for given meeting 
and calculate standard points if missing or if present and choosen 
to be forced.

Could force recalculating or calculate only missing scores.

Options: meeting=<meeting_id> [use_category=<category_code> use_pool=<pool_code> rank=false recalculate=false persist=false clear=false log_dir=#{LOG_DIR}]

- 'meeting'        meeting to scan for.
- 'use_category'   optional category type forced for calcultaion.
- 'use_pool'       optional pool type forced for calcultaion.
- 'rank'           force ranking calculation with csv output.
- 'recalculate'    force to override the stored scores with new values.
- 'persist'        force to persist the changes.
- 'clear'          force standard points clearing (assumes recalculate=true persist=true and rank=false).
- 'log_dir'        allows to override the default log dir destination.

Examples:
- To calculate missing FIN standard points (without persisting and without creating rank)
rake meeting_standard_points meeting=15201 

- To calculate all FIN standard points (recaluculate those already presents without persisting and without creating rank)
rake meeting_standard_points meeting=15201 recalculate=true

- To calculate and persist all FIN standard points (recaluculate those already presents without creating rank)
rake meeting_standard_points meeting=15201 recalculate=true persist=true

- To calculate and persist all CSI standard points forceing M25 standards (recaluculate those already presents without creating rank)
rake meeting_standard_points meeting=15103 recalculate=true persist=true use_category=M25

- To calculate and persist all CSI standard points forceing M25 standards and calulating rank (recaluculate those already presents)
rake meeting_standard_points meeting=15103 recalculate=true persist=true use_category=M25 rank=true

- To calculate and persist all CSI standard points forceing M25 standards 25 meters pool and calulating rank (recaluculate those already presents)
rake meeting_standard_points meeting=15103 recalculate=true persist=true use_category=M25 use_pool=25 rank=true

- To clear all standard points (always persist and recalculate and never rank)
rake meeting_standard_points meeting=15103 clear=true

DESC
  task :meeting_standard_points do |t|
    puts "*** db:meeting_standard_points ***"
    meeting_id      = ENV.include?("meeting")      ? ENV["meeting"].to_i : nil
    category_code   = ENV.include?("use_category") ? ENV["use_category"] : nil
    pool_code       = ENV.include?("use_pool")     ? ENV["use_pool"] : nil
    rank            = ENV.include?("rank")         ? ENV["rank"] == 'true' : false
    persist         = ENV.include?("persist")      ? ENV["persist"] == 'true' : false
    clear           = ENV.include?("clear")        ? ENV["clear"] == 'true' : false
    recalculate     = ENV.include?("recalculate")  ? ENV["recalculate"] == 'true' : false
    rails_config    = Rails.configuration             # Prepare & check configuration:
    db_name         = rails_config.database_configuration[Rails.env]['database']
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Verify parameters
    unless meeting_id
      puts("This needs 'meeting' parameters.")
      exit
    end

    # Display some info:
    puts "DB name:          #{db_name}"
    puts "DB user:          #{db_user}"
    puts "log_dir:          #{log_dir}"
    puts "\r\n"
    logger = ConsoleLogger.new

    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )
    
    # Find target entities
    meeting = Meeting.find( meeting_id )
    unless meeting
      puts("This needs a valid 'meeting'.")
      exit
    end
    logger.info( "\r\n#{I18n.t('general.meeting')}: #{meeting.get_full_name}" )
    
    # If clear option perform a zero assign to all results
    if clear
      file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_standard_points_clear_#{meeting_id}.diff"
      diff_file = File.open( LOG_DIR + '/' + file_name + '.sql', 'w' )
      diff_file.puts "-- Meeting: #{meeting.get_full_name}"
      standard_points = 0
      meeting.meeting_individual_results.is_not_disqualified.each do |meeting_individual_result|
        meeting_individual_result.standard_points = standard_points 
        meeting_individual_result.save
        diff_file.puts to_sql_update( meeting_individual_result, false, {'standard_points' => standard_points}, "\r\n" )
      end
      logger.info( "\r\nLog file " + file_name + " created" )
      logger.info( "\r\nFinished." )
      exit
    end

    # Some frequently asked values
    season = meeting.season
    qualified_number = meeting.get_swimming_pool.lanes_number
    
    # Verify if should use forced category
    category_type =  nil
    if category_code
      category_type = CategoryType.where( season: season, code: category_code ).first
      unless category_type
        puts("Category #{category_code} not valid.")
        exit
      end
      logger.info( "- Force category: #{category_type.get_full_name}" )
    end       

    # Verify if should use forced pool_type
    pool_type =  nil
    if pool_code
      pool_type = PoolType.find_by_code( pool_code )
      unless pool_type
        puts("Pool type #{pool_code} not valid.")
        exit
      end
      logger.info( "- Force pool type: #{pool_code}" )
    end       

    # Check if season standard times are present
    unless season.time_standard.count > 0
      puts("Standard times for season #{season.get_full_name} not defined.")
      exit
    end

    # Create diff file
    file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_standard_points_calc_#{meeting_id}.diff"
    diff_file = File.open( LOG_DIR + '/' + file_name + '.sql', 'w' )
    diff_file.puts "-- Meeting: #{meeting.get_full_name}"

    # Open DB transaction for final roll back if persist is false
    ActiveRecord::Base.transaction do
      # Scan for meeting individual results (for simmers more than 20 years old) 
      meeting.meeting_individual_results.is_not_disqualified.each do |meeting_individual_result|
        if (recalculate or meeting_individual_result.standard_points == nil or meeting_individual_result.standard_points == 0) && 
         meeting_individual_result.category_type.age_end > 20 && 
         meeting_individual_result.category_type.is_undivided == false
          # Calculate standard points
          score_calculator = ScoreCalculator.new( season, meeting_individual_result.gender_type, category_type ? category_type : meeting_individual_result.category_type, pool_type ? pool_type : meeting_individual_result.pool_type, meeting_individual_result.event_type )
          if score_calculator.get_time_standard
            standard_points = score_calculator.get_fin_score( meeting_individual_result.get_timing_instance )
            meeting_individual_result.standard_points = standard_points 
            meeting_individual_result.save
            
            explanation = "#{meeting_individual_result.swimmer.get_full_name} #{meeting_individual_result.event_type.code} #{meeting_individual_result.get_timing}: #{standard_points.to_s} (#{score_calculator.get_time_standard.get_timing})"
            diff_file.puts to_sql_update( meeting_individual_result, false, {'standard_points' => standard_points}, "\r\n", explanation )
            logger.info( "#{meeting_individual_result.swimmer.get_full_name} #{meeting_individual_result.event_type.code} #{meeting_individual_result.get_timing}: #{standard_points.to_s} (#{score_calculator.get_time_standard.get_timing})" )
          end
        end
      end            

      # Calculate ranking, if needed
      if rank
        # Create csv file for ranking
        csv_file_header =  [I18n.t('qualified'), 
                            I18n.t('general.swimmer'), 
                            I18n.t('general.team'), 
                            'CAT', 
                            "#{I18n.t('event')} 1", 
                            "#{I18n.t('timing')} 1", 
                            "#{I18n.t('points')} 1", 
                            "#{I18n.t('event')} 2", 
                            "#{I18n.t('timing')} 2", 
                            "#{I18n.t('points')} 2", 
                            "#{I18n.t('points')} #{I18n.t('max')}"]
        csv_file_name   = "#{DateTime.now().strftime('%Y%m%d%H%M')}_#{meeting.code}_standard_points_calc"
        ranking_male    = []
        ranking_female  = []

        meeting.meeting_individual_results.has_points.each do |meeting_individual_result|
          if meeting_individual_result.gender_type.code == 'M'
            ranking_male = ranking_line( ranking_male, meeting_individual_result )
          else
            ranking_female = ranking_line( ranking_female, meeting_individual_result )
          end
        end

        # Add data to csv ranking for male and female
        ranking_to_csv( I18n.t('males'), ranking_male, csv_file_name + '_M.csv', csv_file_header, logger, qualified_number ) if ranking_male.size > 0
        ranking_to_csv( I18n.t('females'), ranking_female, csv_file_name + '_F.csv', csv_file_header, logger, qualified_number ) if ranking_female.size > 0
      end
      
      # Rollback if not persist
      if not persist
        logger.info( "\r\n*** Standard points NOT persisted! ***" )
        raise ActiveRecord::Rollback 
      else
        logger.info( "\r\nStandard points persisted." )
      end
    end

    logger.info( "\r\nLog file " + file_name + " created" )
    logger.info( "\r\nFinished." )
  end
  #-- -------------------------------------------------------------------------
  #++
  
  # Creates an individual row in ranking
  # each swimmer may have up to 2 results
  # to be collected and the best score should be
  # computed to estabilish ranking
  # If swimmer isn't present in ranking array
  # it will create new record
  # else it will fill second evet data and calculate
  # max score
  def ranking_line( ranking_array, meeting_individual_result )
    swimmer_name = meeting_individual_result.swimmer.get_full_name
    team_name   = meeting_individual_result.team.get_full_name
    first_event = ranking_array.index{ |e| e[1] == swimmer_name and e[2] == team_name }

    if first_event
      ranking_array[first_event][7] = meeting_individual_result.event_type.code
      ranking_array[first_event][8] = meeting_individual_result.get_timing
      ranking_array[first_event][9] = meeting_individual_result.standard_points
      ranking_array[first_event][10] = ranking_array[first_event][9] > ranking_array[first_event][6] ? ranking_array[first_event][9] : ranking_array[first_event][6]
    else
      ranking_array << [nil,
                        swimmer_name, 
                        team_name,
                        meeting_individual_result.category_type.code,
                        meeting_individual_result.event_type.code,
                        meeting_individual_result.get_timing,
                        meeting_individual_result.standard_points,
                        nil,
                        nil,
                        0,
                        meeting_individual_result.standard_points]
    end
    ranking_array
  end
  #-- -------------------------------------------------------------------------
  #++

  # Creates csv file from ranking array
  # Sorts ranking array using max score (10th element)
  # Create csv file using given header
  # Appena ranking lines
  def ranking_to_csv( description, ranking_array, csv_file_name, csv_file_header, logger, qualified_number )
    teams = []
    
    # Sort ranking by max score
    ranking_array.sort!{ |n,p| p[10] <=> n[10] }
    
    # Create csv file
    csv_file = File.open( LOG_DIR + '/' + csv_file_name, 'w' )
    csv_file.puts( csv_file_header.join(',').upcase )

    # Add ranking to csv
    logger.info( "\r\n#{description}: #{csv_file_name}")
    logger.info( "\r\n  #{I18n.t('qualifieds')}:" )
    ranking_array.each do |ranking_el|
      if teams.count < qualified_number && !teams.include?( ranking_el[2] )
        teams << ranking_el[2]
        ranking_el[0] = 'X' 
        logger.info( "  #{teams.count}. #{ranking_el[1].ljust(25)} - #{ranking_el[2]}")
      end
      ranking_el << '=SE(VAL.VUOTO(INDIRETTO(INDIRIZZO(RIF.RIGA();1)));"";INDIRETTO(INDIRIZZO(RIF.RIGA();2)))'
      ranking_el << '=SE(VAL.VUOTO(INDIRETTO(INDIRIZZO(RIF.RIGA();1)));"";INDIRETTO(INDIRIZZO(RIF.RIGA();3)))'
      csv_file.puts( ranking_el.join(',') )
    end

    logger.info( "\r\n#{I18n.t('ranked')} #{ranking_array.count} #{I18n.t('general.swimmers')} in #{csv_file_name}.")
  end
end
# =============================================================================


