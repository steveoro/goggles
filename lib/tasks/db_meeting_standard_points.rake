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

Options: meeting=<meeting_id> [use_category=<category_code> use_pool=<pool_code> rank=false recalculate=false persist=false log_dir=#{LOG_DIR}]

- 'meeting'        meeting to scan for.
- 'use_category'   optional category type forced for calcultaion.
- 'use_pool'       optional pool type forced for calcultaion.
- 'rank'           force ranking calculation with csv output.
- 'recalculate'    force to override the stored scores with new values.
- 'persist'        force to persist the changes.
- 'log_dir'        allows to override the default log dir destination.

DESC
  task :meeting_standard_points do |t|
    puts "*** db:meeting_standard_points ***"
    meeting_id      = ENV.include?("meeting")      ? ENV["meeting"].to_i : nil
    category_code   = ENV.include?("use_category") ? ENV["use_category"] : nil
    pool_code       = ENV.include?("use_pool")     ? ENV["use_pool"] : nil
    rank            = ENV.include?("rank")         ? ENV["rank"] == 'true' : false
    persist         = ENV.include?("persist")      ? ENV["persist"] == 'true' : false
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

    logger.info( "Meeting: " + meeting.get_full_name )
    season = meeting.season
    
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

    # if meeting passed force the scan
    ActiveRecord::Base.transaction do
      # Scan for meeting individual results 
      meeting.meeting_individual_results.is_not_disqualified.each do |meeting_individual_result|
        if (recalculate or !meeting_individual_result.standard_points or meeting_individual_result.standard_points == 0)
          # Calculate standard points
          score_calculator = ScoreCalculator.new( season, meeting_individual_result.gender_type, category_type ? category_type : meeting_individual_result.category_type, pool_type ? pool_type : meeting_individual_result.pool_type, meeting_individual_result.event_type )
          if score_calculator.get_time_standard
            standard_points = score_calculator.get_fin_score( meeting_individual_result.get_timing_instance )
            meeting_individual_result.standard_points = standard_points 
            meeting_individual_result.save
            explanation = "#{meeting_individual_result.swimmer.get_full_name} #{meeting_individual_result.event_type.code} #{meeting_individual_result.get_timing}: #{standard_points.to_s} (#{score_calculator.get_time_standard.get_timing})"
            diff_file.puts to_sql_update( meeting_individual_result, false, {'standard_points' => standard_points}, "\r\n", explanation )

            logger.info( "\r\n#{meeting_individual_result.swimmer.get_full_name} #{meeting_individual_result.event_type.code} #{meeting_individual_result.get_timing}: #{standard_points.to_s} (#{score_calculator.get_time_standard.get_timing})" )
          end
        end
      end            

      # Calculate ranking, if needed
      if rank
        # Create csv file for ranking
        ranking_male    = []
        ranking_female  = []
        csv_file_hedaer =  ['NUOTATORE','SQUADRA','SPEC','TEMPO','PUNTI']
        csv_file_name   = "#{DateTime.now().strftime('%Y%m%d%H%M')}_#{meeting.code}_standard_points_calc"
        csv_file_male   = File.open( LOG_DIR + '/' + csv_file_name + '_M.csv', 'w' )
        csv_file_female = File.open( LOG_DIR + '/' + csv_file_name + '_F.csv', 'w' )

        meeting.meeting_individual_results.is_not_disqualified.each do |meeting_individual_result|
          if meeting_individual_result.gender_type.code == 'M'
            ranking_male.reject!{ |e| e[0] == meeting_individual_result.swimmer.get_full_name and e[1] == meeting_individual_result.team.get_full_name and e[4] <= meeting_individual_result.standard_points }
            ranking_male << [meeting_individual_result.swimmer.get_full_name, 
                             meeting_individual_result.team.get_full_name,
                             meeting_individual_result.event_type.code,
                             meeting_individual_result.get_timing,
                             meeting_individual_result.standard_points]
          else
            ranking_female.reject!{ |e| e[0] == meeting_individual_result.swimmer.get_full_name and e[1] == meeting_individual_result.team.get_full_name and e[4] <= meeting_individual_result.standard_points }
            ranking_female << [meeting_individual_result.swimmer.get_full_name,
                               meeting_individual_result.team.get_full_name,
                               meeting_individual_result.event_type.code,
                               meeting_individual_result.get_timing,
                               meeting_individual_result.standard_points]
          end
        end

        # Add data to csv ranking for male
        if ranking_male.size > 0
          csv_file_male << csv_file_hedaer.join(',') 
          
          # Sort male ranking
          ranking_male.sort!{ |n,p| p[4] <=> n[4] }
          
          # Add male ranking to csv
          ranking_male.each do |ranking_el|
            csv_file_male << "\r\n#{ranking_el.join(',')}"
          end
        end
          
        # Add data to csv ranking for female
        if ranking_female.size > 0
          csv_file_female << csv_file_hedaer.join(',') 
          
          # Sort female ranking
          ranking_female.sort!{ |n,p| p[4] <=> n[4] }
  
          # Add female ranking to csv
          ranking_female.each do |ranking_el|
            csv_file_female << "\r\n#{ranking_el.join(',')}"
          end
        end
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
end
# =============================================================================


