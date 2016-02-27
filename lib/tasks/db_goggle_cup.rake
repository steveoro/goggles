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

= GoggleCup score update

  - Goggles framework vers.:  4.00.775.20150415
  - author: Leega

  DB Updater for batch calculation of Goggle Cup scores

  (ASSUMES TO BE rakeD inside Rails.root)

=end

namespace :db do
  include SqlConvertable

  desc <<-DESC
Calculate and update DB for Goggle Cup scores.
Resulting log files are stored into '#{LOG_DIR}'.

Performs a batch, scan of MeetingIndividualResult for given Goggle Cup 
and calculate goggle cup points if missing or if present and choosen 
to be forced. Should be limitated to a specific meeting.

Could force recalculating or calculate only missing scores.

Options: persist=false recalculate=false goggle_cup=<goggle_cup_id> [meeting=<meeting_id> log_dir=#{LOG_DIR}]

- 'persist'     force to persist the changes.
- 'recalculate' force to override the stored scores with new values.
- 'goggle_cup'  goggle cup to calculate for.
- 'meeting'     scan only the given meeting.
- 'log_dir'     allows to override the default log dir destination.

DESC
  task :goggle_cup do |t|
    puts "*** db:goggle_cup ***"
    persist         = ENV.include?("persist")     ? ENV["persist"] == 'true' : false
    recalculate     = ENV.include?("recalculate") ? ENV["recalculate"] == 'true' : false
    goggle_cup_id   = ENV.include?("goggle_cup")  ? ENV["goggle_cup"].to_i : nil
    meeting_id      = ENV.include?("meeting")     ? ENV["meeting"].to_i : nil
    rails_config    = Rails.configuration             # Prepare & check configuration:
    db_name         = rails_config.database_configuration[Rails.env]['database']
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Verify parameters
    unless goggle_cup_id
      puts("This needs both 'recalculate' && 'goggle_cup' parameters.")
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
    goggle_cup = GoggleCup.find( goggle_cup_id )

    # Verify parameters
    unless goggle_cup
      puts("This needs a valid 'goggle_cup'.")
      exit
    end

    logger.info( "GoggleCup: " + goggle_cup.get_full_name )

    # Create diff file
    file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_goggle_cup_calc_#{goggle_cup_id}.diff"
    diff_file = File.open( LOG_DIR + '/' + file_name + '.sql', 'w' )
    diff_file.puts "-- GoggleCup: #{goggle_cup.get_full_name}"

    # if meeting passed force the scan
    ActiveRecord::Base.transaction do
      meeting = Meeting.find( meeting_id ) if meeting_id
      if meeting
        # Scan for meeting individual results of goggle cup for give meeting 
        logger.info( "\r\nMeeting  : " + meeting.get_full_name )
        diff_file.puts "\r\n-- Meeting  : #{meeting.get_full_name}"

        goggle_cup.meeting_individual_results.includes(:meeting).where(['meetings.id = ?', meeting_id]).where(["meeting_individual_results.team_id = ?", goggle_cup.team_id]).each do |meeting_individual_result|
          calculate_goggle_cup_for_mir( goggle_cup, meeting_individual_result, recalculate, logger, diff_file )
        end            
      else
        goggle_cup.meetings.each do |current_meeting|
          if current_meeting.meeting_individual_results.count > 0
            # Scan for meeting individual results of goggle cup for give meeting 
            logger.info( "\r\nMeeting  : " + current_meeting.get_full_name )
            diff_file.puts "\r\n--\r\n-- Meeting  : #{current_meeting.get_full_name}\r\n--"
            goggle_cup.meeting_individual_results.includes(:meeting).where(['meetings.id = ?', current_meeting.id]).where(["meeting_individual_results.team_id = ?", goggle_cup.team_id]).each do |meeting_individual_result|
              calculate_goggle_cup_for_mir( goggle_cup, meeting_individual_result, recalculate, logger, diff_file )
            end
            logger.info( "\r\n<------------------------------------------------------------>\r\n" )
          end
        end
      end

      # Persist data if needed
      if not persist
        logger.info( "\r\n*** Goggle cup points NOT persisted! ***" )
        raise ActiveRecord::Rollback 
      else
        logger.info( "\r\nGoggle cup points persisted." )
      end
    end

    logger.info( "\r\nLog file " + file_name + " created" )
    logger.info( "\r\nFinished." )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Calculate goggle cup for given meeting individual result
  # Verify if goggle cup score already exist and calculate if request
  #
  def calculate_goggle_cup_for_mir( goggle_cup, meeting_individual_result, recalculate, logger, diff_file )
    # Check if calculation is needed
    if not meeting_individual_result.is_disqualified and (recalculate or meeting_individual_result.goggle_cup_points == 0)
      # Calculate goggle cup points
      score_calculator = GoggleCupScoreCalculator.new( goggle_cup, meeting_individual_result.swimmer, meeting_individual_result.pool_type, meeting_individual_result.event_type )
      goggle_cup_points = score_calculator.get_goggle_cup_score( meeting_individual_result.get_timing_instance )
      
      # Save goggle cup score
      meeting_individual_result.goggle_cup_points = goggle_cup_points 
      meeting_individual_result.save
      explanation = "#{meeting_individual_result.swimmer.get_full_name} #{meeting_individual_result.event_type.code} #{meeting_individual_result.get_timing}: #{goggle_cup_points.to_s} (#{score_calculator.get_goggle_cup_standard.get_timing})"
      diff_file.puts to_sql_update( meeting_individual_result, false, {'goggle_cup_points' => goggle_cup_points}, "\r\n", explanation ) 
      
      logger.info( "\r\n#{meeting_individual_result.swimmer.get_full_name} #{meeting_individual_result.event_type.code} #{meeting_individual_result.get_timing}: #{goggle_cup_points.to_s} (#{score_calculator.get_goggle_cup_standard.get_timing})" )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
# =============================================================================


