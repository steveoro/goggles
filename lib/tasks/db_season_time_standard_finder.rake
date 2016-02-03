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
Find season time standards scanning all previous
season of same season type.
Resulting log files are stored into '#{LOG_DIR}'.

Create time standards based on best results found
for gender, category and event types.

Options:  recalculate=false season=<season_id> persist=false [gender=<gender_code> category=<category_code> event=<event_code> log_dir=#{LOG_DIR}]

- 'persist'     force to persist the created season.
- 'season'      season to define time standards.
- 'recalculate' force to override the stored scores with new values.
- 'gender'      optional gender code to limit scan.
- 'category'    optional category code to limit scan.
- 'event'       optional event code to limit scan.
- 'log_dir'     allows to override the default log dir destination.

DESC
  task :season_time_standard_finder do |t|
    puts "*** db:season_time_standard_finder ***"
    persist       = ENV.include?("persist")     ? ENV["persist"] == 'true' : false
    season_id     = ENV.include?("season")      ? ENV["season"].to_i : nil
    recalculate   = ENV.include?("recalculate") ? ENV["recalculate"] == 'true' : false
    gender_code   = ENV.include?("gender")      ? ENV["gender"] : nil
    category_code = ENV.include?("category")    ? ENV["category"] : nil
    event_code    = ENV.include?("event")       ? ENV["event"] : nil
    rails_config  = Rails.configuration             # Prepare & check configuration:
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    log_dir       = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Verify parameters
    unless season_id
      puts("This needs season parameter.")
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
    season = Season.find( season_id )
    logger.info( "Season to scan for: #{season.get_full_name}" )
    genders    = []
    categories = []
    events     = []
    if gender_code
      genders << GenderType.find_by_code( gender_code )
      unless genders.size > 0
        puts("Gender #{gender_code} not valid.")
        exit
      end
      logger.info( "- Gender: #{gender_code}" )
    else
      genders = GenderType.individual_only
    end
    if category_code
      categories << CategoryType.where( season: season, code: category_code )
      unless categories.size > 0
        puts("Category #{category_code} not valid.")
        exit
      end
      logger.info( "- Category: #{category_code}" )
    else
      categories = season.category_types.are_not_relays.sort_by_age
    end
    if event_code
      events << EventType.find_by_code( event_code )
      unless events.size > 0
        puts("Event #{event_code} not valid.")
        exit
      end
      logger.info( "- Event: #{event_code}" )
    else
      events = EventType.are_not_relays.for_fin_calculation
    end
    
    # Scan for records
    ActiveRecord::Base.transaction do
      PoolType.only_for_meetings.each do |pool_type|
        genedrs.each do |gender_type|
          categories.each do |category_type|
            events.each do |event_type|
              # TODO Find best in previous seasons
              
            end
          end
        end
      end
      
      # Create diff file
      file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_season_time_standard_finder_#{season_id}.diff"
      File.open( LOG_DIR + '/' + file_name + '.sql', 'w' ) { |f| f.puts season_creator.sql_diff_text_log }
      logger.info( "\r\nLog file " + file_name + " created" )

      # Save data or rollback in persist is false
      if not persist
        logger.info( "\r\n*** Data not persisted! ***" )
        raise ActiveRecord::Rollback 
      else
        logger.info( "\r\nData persisted." )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
# =============================================================================


