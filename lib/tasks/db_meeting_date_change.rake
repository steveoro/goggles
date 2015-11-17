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

= Meeting date change

  - Goggles framework vers.:  4.00.833.20151103
  - Author: Leega

  Operation to be performed to change meeting and meeting sessions dates

  (ASSUMES TO BE rakeD inside Rails.root)

=end

namespace :db do

  desc <<-DESC
Change meeting header date and meeting sessions scheduled dates.
Resulting log files are stored into '#{LOG_DIR}'.

Meeting sessions scheduling maintains orignal
disposition related to meeting header date.

Options: persist=false meeting=<meeting_id> days=<days_to_move_on> [log_dir=#{LOG_DIR}]

- 'persist'  force to persist the changes.
- 'meeting'  meeting to move.
- 'days'     amount of days to move the meeting on.
- 'log_dir'  allows to override the default log dir destination.

DESC
  task :meeting_date_change do |t|
    puts "*** db:meeting_date_changer ***"
    persist         = ENV.include?("persist") ? ENV["persist"] == 'true' : false
    meeting_id      = ENV.include?("meeting") ? ENV["meeting"].to_i : nil
    days_to_move_on = ENV.include?("days")    ? ENV["days"].to_i : nil
    rails_config    = Rails.configuration             # Prepare & check configuration:
    db_name         = rails_config.database_configuration[Rails.env]['database']
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Verify parameters
    unless meeting_id
      puts("This needs the meeting to move.")
      exit
    end
    unless days_to_move_on
      puts("This needs the amount of days to move on.")
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
    logger.info( "Meeting to move: " + meeting.get_full_name )
    
    # Initialize meeting_date_changer
    meeting_date_changer = MeetingDateChanger.new( meeting, days_to_move_on )
    unless meeting_date_changer
      puts("Something wrong with meeting to move.")
      exit
    end

    # Move meeting
    ActiveRecord::Base.transaction do
      meeting_date_changer.change_dates
      logger.info( "\r\n- " + meeting_date_changer.meeting.description + " - " + meeting_date_changer.meeting.header_date.to_s )
      logger.info( "\r\n<------------------------------------------------------------>\r\n" )
      
      # Create diff file
      file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_meeting_date_changer_#{meeting_date_changer.meeting.code}.diff"
      File.open( LOG_DIR + '/' + file_name + '.sql', 'w' ) { |f| f.puts meeting_date_changer.sql_diff_text_log }
      logger.info( "\r\nLog file " + file_name + " created" )

      # Save new season
      if not persist
        logger.info( "\r\n*** Date change NOT persisted! ***" )
        raise ActiveRecord::Rollback 
      else
        logger.info( "\r\nDate change persisted." )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
# =============================================================================


