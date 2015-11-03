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

= Season duplication operatrions

  - Goggles framework vers.:  4.00.833.20151019
  - author: Leega

  Operation to be performed due to create new season from an older one

  (ASSUMES TO BE rakeD inside Rails.root)

=end

namespace :db do

  desc <<-DESC
Create new season duplicating datas from an older one.
Resulting log files are stored into '#{LOG_DIR}'.

Create a new season with updated category settings,
not confirmed set of meetings with sessions and events.

Options: persist=false old_season=<old_season_id> description=<description> [log_dir=#{LOG_DIR}]

- 'persist'     force to persist the created season.
- 'old_season'  older season to copy from.
- 'description' new season description.
- 'log_dir'     allows to override the default log dir destination.

DESC
  task :season_duplication do |t|
    puts "*** db:season_duplication ***"
    persist       = ENV.include?("persist")     ? ENV["persist"] == 'true' : false
    old_season_id = ENV.include?("old_season")  ? ENV["old_season"].to_i : nil
    description   = ENV.include?("description") ? ENV["description"] : nil
    rails_config  = Rails.configuration             # Prepare & check configuration:
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    log_dir       = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Verify parameters
    unless old_season_id
      puts("This needs old_season parameter.")
      exit
    end
    unless description
      puts("This needs a valid new season description.")
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
    older_season = Season.find( old_season_id )
    logger.info( "Older season to copy from: " + older_season.get_full_name )
    
    # Initialize season creator
    season_creator = SeasonCreator.new( older_season, description )
    unless season_creator
      puts("Something wrong with season to copy from.")
      exit
    end

    # Prepare new season
    ActiveRecord::Base.transaction do
      season_creator.prepare_new_season
      logger.info( "\r\nNew season: " + season_creator.new_season.id.to_s + ' - ' + season_creator.new_season.get_full_name )
      logger.info( "\r\nCategories (" + season_creator.categories.count.to_s + "):" )
      season_creator.categories.each do |category_type|
        logger.info( "\r\n- " + category_type.short_name + " - " + category_type.age_begin.to_s + "-" + category_type.age_end.to_s )
      end
      logger.info( "\r\nMeetings (" + season_creator.meetings.count.to_s + "):" )
      season_creator.meetings.each do |meeting|
        logger.info( "\r\n- " + meeting.description + " - " + meeting.header_date.to_s )
      end    
      logger.info( "\r\n<------------------------------------------------------------>\r\n" )
      
      # Create diff file
      file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_season_creation_#{season_creator.new_id}.diff"
      File.open( LOG_DIR + '/' + file_name + '.sql', 'w' ) { |f| f.puts season_creator.sql_diff_text_log }
      logger.info( "\r\nLog file " + file_name + " created" )

      # Save new season
      if not persist
        logger.info( "\r\n*** Data not persisted! ***" )
        raise ActiveRecord::Rollback 
      else
        logger.info( "\r\nNew season persisted." )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
# =============================================================================


