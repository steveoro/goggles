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

= Season type swimemr last bes finder

  - Goggles framework vers.:  4.00.833.20151103
  - Author: Leega

  Scan swimmers involved in season of given type
  to find last best swam times 
  Last best is the best time swam 
  in the most recent closed season  

  (ASSUMES TO BE rakeD inside Rails.root)

=end

namespace :db do

  desc <<-DESC
Scan swimmers involved in season of given type
to find last best swam times 
Last best is the best time swam 
in the most recent closed season
Create a csv file with data retreived
Resulting log files are stored into '#{LOG_DIR}'.

Options: season_type=<season_type_code> [log_dir=#{LOG_DIR}]

- 'season_type' season type to scan for
- 'log_dir'     allows to override the default log dir destination.

DESC
  task :season_type_swimmer_last_best do |t|
    puts "*** db:season_type_swimmer_last_best ***"
    season_type_code = ENV.include?("season_type") ? ENV["season_type"] : nil
    rails_config     = Rails.configuration             # Prepare & check configuration:
    db_name          = rails_config.database_configuration[Rails.env]['database']
    db_user          = rails_config.database_configuration[Rails.env]['username']
    db_pwd           = rails_config.database_configuration[Rails.env]['password']
    log_dir          = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Verify parameters
    unless season_type_code && SeasonType.find_by_code( season_type_code )
      puts("This needs a valid season type to scan for.")
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
    season_type = SeasonType.find_by_code( season_type_code )
    logger.info( "Season type to scan for: " + season_type.get_full_name )

    # Define header
    headers = []
    headers << "Swimmer"
    headers << "Year"

    # Determinate events to scan for
    events_to_scan  = []
    involved_events = season_type.event_types.uniq.map{ |et| et.code }
    EventsByPoolType.not_relays.only_for_meetings.sort_by_pool.each do |event_by_pool_type|
      if involved_events.include?( event_by_pool_type.event_type.code )
        events_to_scan << event_by_pool_type.get_key
        headers << event_by_pool_type.get_key
      end
    end
    logger.info( " - Scan for: #{events_to_scan.size} event types" )
    
    # Scan involved swimmers
    csv_rows = []
    csv_rows << headers.join(';')
    involved_swimmers = 0
    season_type.swimmers.has_results.uniq.sort_by_gender_type( 'ASC' ).each do |swimmer|
      logger.info( "Swimmer #{swimmer.get_full_name}" )
      involved_swimmers = involved_swimmers + 1

      # Initialize meeting_date_changer
      swimmer_best_finder = SwimmerBestFinder.new( swimmer )
      involved_seasons    = swimmer_best_finder.get_closed_seasons_involved_into( season_type ) 
      logger.info( " - Seasons considered: #{involved_seasons.count}" )
      logger.info( "   Last season: #{involved_seasons.first.get_full_name}" )
      
      swimmer_row = swimmer.complete_name + ';'
      swimmer_row << swimmer.year_of_birth.to_s + ';'
      
      # Scan events
      logger.info( " - Event bests:" )
      events_to_scan.each do |event_key|
        best_swam = swimmer_best_finder.get_involved_season_last_best_for_key( involved_seasons, event_key )
        swimmer_row << best_swam.to_s if best_swam
        swimmer_row << ';'
        logger.info( "   #{event_key}: #{best_swam.to_s}" )
      end
      csv_rows << swimmer_row
    end
    
    # Create csv file
    file_name = "season_type_swimmer_last_best_#{season_type.code}"
    File.open( LOG_DIR + '/' + file_name + '.csv', 'w' ) { |f| f.puts csv_rows }
    logger.info( "\r\nLog file " + file_name + " created" )
  end
  #-- -------------------------------------------------------------------------
  #++
end
# =============================================================================


