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

Options: season=<season_id> [persist=false results=10 ignore=1 log_dir=#{LOG_DIR}]

- 'persist'     force to persist the created season.
- 'season'      season to define time standards.
- 'results'     the number of results to be considered in average.
- 'ignore'      the number of best results to be ignored.
- 'log_dir'     allows to override the default log dir destination.

DESC
  task :season_time_standard_finder do |t|
    puts "*** db:season_time_standard_finder ***"
    persist       = ENV.include?("persist")     ? ENV["persist"] == 'true' : false
    season_id     = ENV.include?("season")      ? ENV["season"].to_i : nil
    results       = ENV.include?("results")     ? ENV["results"].to_i : 10
    ignore        = ENV.include?("ignore")      ? ENV["ignore"].to_i : 1
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
    logger.info( "considering #{results} best results ignoring #{ignore} top result" )

    spb = SeasonPonderatedBestsDAO.new( season, results, ignore )

    # Scan for records
    ActiveRecord::Base.transaction do
      # Find best in previous seasons and store to DB
      spb.to_db
      
      # Create diff file
      file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_season_time_standard_finder_#{season_id}.diff"
      File.open( LOG_DIR + '/' + file_name + '.sql', 'w' ) { |f| f.puts spb.sql_diff_text_log }
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


