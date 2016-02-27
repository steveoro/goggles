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
  include SqlConvertable

  desc <<-DESC
Scan swimmers involved in season of given season type
to find last best swam times 
Last best is the best time swam 
in the most recent closed season
Create a csv file with data retreived
Resulting log files are stored into '#{LOG_DIR}'.

Options: season=<season_id> [log_dir=#{LOG_DIR}]

- 'season'      season type to scan for
- 'log_dir'     allows to override the default log dir destination.

DESC
  task :season_swimmer_last_best do |t|
    puts "*** db:season_swimmer_last_best ***"
    season_id        = ENV.include?("season") ? ENV["season"] : nil
    rails_config     = Rails.configuration             # Prepare & check configuration:
    db_name          = rails_config.database_configuration[Rails.env]['database']
    db_user          = rails_config.database_configuration[Rails.env]['username']
    db_pwd           = rails_config.database_configuration[Rails.env]['password']
    log_dir          = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Verify parameters
    unless season_id && Season.exists?( season_id )
      puts("This needs a valid season to scan for.")
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
    season_type = Season.season_type
    logger.info( "Season to scan for: " + season.get_full_name )

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

      # Initialize best finder
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

  desc <<-DESC
Scan swimmers involved in meeting to find
last best swam times in closed seasons of same type
considering the best time swam 
in the most recent closed season
Resulting log files are stored into '#{LOG_DIR}'.

Options: meeting=<meeting_id> [persist=false recalculate=false log_dir=#{LOG_DIR}]

- 'meeting'     meeting to scan for swimmers
- 'persist'     force to persist the created season.
- 'recalculate' force to override the stored scores with new values.
- 'log_dir'     allows to override the default log dir destination.

DESC
  task :meeting_swimmer_last_best do |t|
    puts "*** db:meeting_swimmer_last_best ***"
    meeting_id    = ENV.include?("meeting") ? ENV["meeting"] : nil
    persist       = ENV.include?("persist") ? ENV["persist"] == 'true' : false
    recalculate   = ENV.include?("recalculate") ? ENV["recalculate"] == 'true' : false
    rails_config  = Rails.configuration             # Prepare & check configuration:
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    log_dir       = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Verify parameters
    unless meeting_id && Meeting.has_results.exists?( meeting_id )
      puts("This needs a valid meeting with results to scan for.")
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
    logger.info( "Meeting to scan for swimmers: " + meeting.get_full_name )

    # Define header
    headers = []
    headers << "Swimmer"
    headers << "Year"

    # Determinate events to scan for
    events_to_scan  = []
    events_to_scan = meeting.get_events_by_pool_types.map{ |e| e.get_key }
    logger.info( " - Scan for: #{events_to_scan.size} event types" )
    
    # Scan involved swimmers
    season_personal_standards = []
    csv_rows = []
    csv_rows << headers.join(';')
    involved_swimmers = 0
    meeting.swimmers.has_results.uniq.sort_by_gender_type( 'ASC' ).each do |swimmer|
      logger.info( "Swimmer #{swimmer.get_full_name}" )
      involved_swimmers = involved_swimmers + 1

      # Initialize best finder
      swimmer_best_finder = SwimmerBestFinder.new( swimmer )
      involved_seasons    = swimmer_best_finder.get_closed_seasons_involved_into( meeting.season_type ) 
      logger.info( " - Seasons considered: #{involved_seasons.count}" )
      swimmer_row = swimmer.complete_name + ';'
      swimmer_row << swimmer.year_of_birth.to_s + ';'

      # If swimmer present in at least one closed season scan for bests
      if involved_seasons.count > 0
        # Scan events
        logger.info( " - Last season: #{involved_seasons.first.get_full_name}" )
        logger.info( " - Event bests:" )
        events_to_scan.each do |event_key|
          event_by_pool_type = EventsByPoolType.find_by_key( event_key )
          best_swam = swimmer_best_finder.get_involved_season_last_best_for_key( involved_seasons, event_key )
          if best_swam
            swimmer_row << best_swam.to_s
            
            # Prepare data for DB storage
            season_personal_standard               = SeasonPersonalStandard.new()
            season_personal_standard.season_id     = meeting.season_id
            season_personal_standard.swimmer_id    = swimmer.id
            season_personal_standard.event_type_id = event_by_pool_type.event_type.id 
            season_personal_standard.pool_type_id  = event_by_pool_type.pool_type.id
            season_personal_standard.minutes       = best_swam.minutes 
            season_personal_standard.seconds       = best_swam.seconds 
            season_personal_standard.hundreds      = best_swam.hundreds 
            season_personal_standards << season_personal_standard 
          end
          swimmer_row << ';'
          logger.info( "   #{event_key}: #{best_swam.to_s}" )
        end
      end
      csv_rows << swimmer_row
    end
    
    # Create csv file
    file_name = "meeting_swimmer_last_best_#{meeting.id}"
    File.open( LOG_DIR + '/' + file_name + '.csv', 'w' ) { |f| f.puts csv_rows }
    logger.info( "\r\nLog file " + file_name + " created" )

    # Store data n DB and prepare diff file    
    diff_file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_#{file_name}.diff"
    ActiveRecord::Base.transaction do
      season_personal_standards_to_db( meeting, season_personal_standards, recalculate )

      # Create diff file
      File.open( LOG_DIR + '/' + diff_file_name + '.sql', 'w' ) { |f| f.puts sql_diff_text_log }
      logger.info( "\r\nDiff file " + diff_file_name + " created" )
      
      # Persist data if needed
      if not persist
        logger.info( "\r\n*** Personal standards NOT persisted! ***" )
        raise ActiveRecord::Rollback 
      else
        logger.info( "\r\nPersonal standards persisted." )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  def season_personal_standards_to_db( meeting, season_personal_standards, recalculate )
    # Split inserts and updates
    to_insert = []
    to_update = []
    season_personal_standards.each do |season_personal_standard|
      # Check if personal standard already exists
      if SeasonPersonalStandard.exists?( :season => season_personal_standard.season, :swimmer => season_personal_standard.swimmer, :pool_type => season_personal_standard.pool_type, :event_type => season_personal_standard.event_type )
        # Exists. Assumes that no update needed if not recalculate forced
        to_update << season_personal_standard if recalculate
      else
        # Doesn't exist. Needs insert
        to_insert << season_personal_standard
      end
    end

    create_sql_diff_header( "Season personal standards for meeting #{meeting.get_full_name}" )

    # Store collected data into time_standard structure for event not already presents
    to_insert.each do |season_personal_standard|
      season_personal_standard.save
      season_personal_standard.reload
      comment = "#{season_personal_standard.swimmer.get_full_name} #{season_personal_standard.pool_type.code} #{season_personal_standard.event_type.code}: #{season_personal_standard.get_timing}"
      sql_diff_text_log << to_sql_insert( season_personal_standard, false, "\r\n", comment )
    end
    
    # Store collected data into time_standard structure for event already presents
    sql_fields = {}
    to_update.each do |season_personal_standard|
      season_personal_standard.save
      sql_fields['minutes']  = season_personal_standard.minutes
      sql_fields['seconds']  = season_personal_standard.seconds
      sql_fields['hundreds'] = season_personal_standard.hundreds
      comment = "#{season_personal_standard.swimmer.get_full_name} #{season_personal_standard.pool_type.code} #{season_personal_standard.event_type.code}: #{season_personal_standard.get_timing}"
      sql_diff_text_log << to_sql_update( season_personal_standard, false, sql_fields, "\r\n", comment )
    end
    
    create_sql_diff_footer( "Season personal standards for meeting #{meeting.get_full_name} collected" )
  end
end
# =============================================================================


