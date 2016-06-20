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

= Meeting creation from template

  - Goggles framework vers.:  4.00.775.20150415
  - author: Leega

  DB Updater for batch meeting creation based on existing edition
  used as template

  (ASSUMES TO BE rakeD inside Rails.root)

=end

namespace :db do
  include SqlConvertable

  desc <<-DESC
Create meeting header and subelements form a different edition of same meeting.
Resulting log files are stored into '#{LOG_DIR}'.

Needs an existing meeting used as template.
Verify if target meeting doesn't already exists.
Target meeting's season should exists.

Could force creation of sessions and events

Options: meeting=<meeting_id> season=<season_id> [edition=<edition_diff> sessions=false events=false persist=false log_dir=#{LOG_DIR}]

- 'meeting'     existing meeting used as template.
- 'season'      season of target meeting.
- 'edition'     force the edition difference.
- 'sessions'    force the creation of sessions.
- 'events'      force the creation of events.
- 'persist'     force to persist the changes.
- 'log_dir'     allows to override the default log dir destination.

DESC
  task :meeting_create_from_template do |t|
    puts "*** db:meeting_create_from_template ***"
    meeting_id      = ENV.include?("meeting")     ? ENV["meeting"].to_i : nil
    season_id       = ENV.include?("season")      ? ENV["season"].to_i : nil
    edition         = ENV.include?("edition")     ? ENV["edition"].to_i : nil
    sessions        = ENV.include?("sessions")    ? ENV["sessions"] == 'true' : false
    events          = ENV.include?("events")      ? ENV["events"] == 'true' : false
    persist         = ENV.include?("persist")     ? ENV["persist"] == 'true' : false
    rails_config    = Rails.configuration             # Prepare & check configuration:
    db_name         = rails_config.database_configuration[Rails.env]['database']
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Verify parameters
    unless meeting_id && season_id
      puts("This needs both 'meeting' && 'season' parameters.")
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
    
    # Find template meeting
    meeting = Meeting.find( meeting_id ) if Meeting.exists?( id: meeting_id )
    unless meeting
      puts("This needs an existing 'meeting'.")
      exit
    end

    # Find target season
    season = Season.find( season_id ) if Season.exists?( id: season_id )
    unless season
      puts("This needs an existing 'season'.")
      exit
    end

    # Verify meeting doesn't already exist in target season
    unless season.meetings.where( code: meeting.code ).count == 0
      puts("The meeting already exists in target season")
      exit
    end

    # Find target meeting id
    new_id = meeting.id - (meeting.season_id * 100) + (season.id * 100)
    until Meeting.exists?( id: new_id ) do new_id = new_id + 1 end
    
    # Calculate (or force) edition
    new_edition = edition ? meeting.edition + edition : meeting.edition + ( ( season.id - meeting.season_id ) / 10 ).to_i 
    unless new_edition >= 0
      puts("The calculated edition " + new_edition.to_s + " is not correct")
      exit
    end
    
    logger.info( "Meeting: " + meeting.get_full_name + " will be created in season " + season.get_full_name + " with id " + new_id.to_s + " edition: " + new_edition.to_s )

    # Create diff file
    file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_meeting_create_from_template_#{new_id}.diff"
    diff_file = File.open( LOG_DIR + '/' + file_name + '.sql', 'w' )
    diff_file.puts "-- Meeting: #{meeting.get_full_name} (#{new_id})"
    diff_file.puts "\r\n-- Season:  #{season.get_full_name} (#{season.id})"
    diff_file.puts "\r\n-- Edition: #{new_edition}"
  
    ActiveRecord::Base.transaction do

      # Persist data if needed
      if not persist
        logger.info( "\r\n*** Meeting NOT persisted! ***" )
        raise ActiveRecord::Rollback 
      else
        logger.info( "\r\nMeeting persisted." )
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


