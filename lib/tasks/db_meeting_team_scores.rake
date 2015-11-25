# encoding: utf-8
require 'date'
require 'rubygems'
require 'find'
require 'fileutils'

require 'framework/version'
require 'framework/application_constants'
require 'framework/console_logger'


LOG_DIR = File.join( Dir.pwd, 'log' ) unless defined? LOG_DIR


=begin

= Meeting team scores update

  - Goggles framework vers.:  4.00.796.20150515
  - author: Leega

  DB Updater for batch calculation of Meeting team scores

  (ASSUMES TO BE rakeD inside Rails.root)

=end

namespace :db do

  desc <<-DESC
Calculate and update DB for meeting team scores scores.
Resulting log files are stored into '#{LOG_DIR}'.

Performs a batch, scan of MeetingIndividualResult for given Meeting 
and calculate team scores with balanced method.

Options: meeting=<meeting_id> [log_dir=#{LOG_DIR}]

- 'persist'     force to persist the created season.
- 'meeting'     scan only the given meeting.
- 'log_dir'     allows to override the default log dir destination.

# TODO Now use always balanced method. Should implements other types and allow to chose appropriate one

DESC
  task :meeting_team_scores do |t|
    puts "*** db:meeting_team_scores ***"
    persist         = ENV.include?("persist")     ? ENV["persist"] == 'true' : false
    meeting_id      = ENV.include?("meeting")     ? ENV["meeting"].to_i : nil
    rails_config    = Rails.configuration             # Prepare & check configuration:
    db_name         = rails_config.database_configuration[Rails.env]['database']
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Verify parameters
    unless meeting_id
      puts("This needs 'meeting' parameter.")
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

    # Verify parameters
    unless meeting
      puts("This needs a valid 'meeting'.")
      exit
    end

    logger.info( "Meeting: #{meeting.get_full_name}" )

    # TODO select appropriate calculation method through DB
    # UGLY at this momento the selection is made using season id...
    # let you try to find out a worst mode if you can...
    #
    # Select appropriate calculation method
    ActiveRecord::Base.transaction do
      case meeting.season.id
      when 141, 151
        # CSI Seasons 2014-2015 and 2015-2016
        logger.info( "Season #{meeting.season.get_full_name}" ) 
        logger.info( "Using CSI balanced meeting team scores by Leega" ) 
        sql_diff = calculate_balanced_meeting_team_scores( meeting, logger )
      else
        logger.info( "No calculation method for season #{meeting.season.get_full_name}" )
      end

      # Create diff file
      if sql_diff
        file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_meeting_team_scores_#{meeting.id}#{meeting.code}.diff"
        File.open( LOG_DIR + '/' + file_name + '.sql', 'w' ) { |f| f.puts sql_diff }
        logger.info( "\r\nLog file " + file_name + " created" )
      end
        
      # Save new season
      if not persist
        logger.info( "\r\n*** Data not persisted! ***" )
        raise ActiveRecord::Rollback 
      else
        logger.info( "\r\nTeam scores persisted." )
      end
    end

    logger.info( "\r\nFinished." )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Calculate meeting scores with balanced method
  #
  def calculate_balanced_meeting_team_scores( meeting, logger )
    # Calculate goggle cup points
    balanced_meeting_score_calculator = BalancedMeetingScoreCalculator.new( meeting )
    meeting_team_scores = balanced_meeting_score_calculator.get_meeting_team_scores
    balanced_meeting_score_calculator.save_computed_score
    logger.info( "\r\n#{meeting_team_scores.count.to_s} team scores saved" )
    balanced_meeting_score_calculator.sql_diff_text_log
  end
  #-- -------------------------------------------------------------------------
  #++
end
# =============================================================================


