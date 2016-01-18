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

= Find and set personal bests

  - Goggles framework vers.:  4.00.833.20151103
  - Author: Leega

  Operation to be performed to find out swimmers persoanl bests

  (ASSUMES TO BE rakeD inside Rails.root)

=end

namespace :db do

  desc <<-DESC
Find personal best swam by swimmers in events.
Resulting log files are stored into '#{LOG_DIR}'.

Could be used for a particular swimmer event or 
massive for all swimmer events swam

Options: persist=false swimmer=<swimmer_id> [[event=<event_code> pool=<pool_code>] log_dir=#{LOG_DIR}]

- 'persist'  force to persist the personal best indicator on results found.
- 'swimmer'  swimmer to scan.
- 'event'    event code to scan for (use with pool)
- 'pool'     pool type code to scan for (use with event)
- 'log_dir'  allows to override the default log dir destination.

DESC
  task :find_personal_best do |t|
    puts "*** db:find_personal_best ***"
    persist         = ENV.include?("persist") ? ENV["persist"] == 'true' : false
    swimmer_id      = ENV.include?("swimmer") ? ENV["swimmer"].to_i : nil
    event_code      = ENV.include?("event")   ? ENV["event"] : nil
    pool_code       = ENV.include?("pool")    ? ENV["pool"] : nil
    rails_config    = Rails.configuration             # Prepare & check configuration:
    db_name         = rails_config.database_configuration[Rails.env]['database']
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Verify parameters
    unless swimmer_id && Swimmer.exists?( swimmer_id ) 
      puts("This needs a valid swimmer to scan for.")
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
    swimmer = Swimmer.find( swimmer_id )
    logger.info( "Swimmer to scan: #{swimmer.get_full_name}" )
    
    # Initialize swimmer best finder
    swimmer_best_finder = SwimmerBestFinder.new( swimmer )
    unless swimmer_best_finder
      puts("Something wrong with swimmer to scan for.")
      exit
    end

    # Check for specific event
    if event_code || pool_code
      unless event_code && pool_code
        puts("Needs both event and pool type to do a specific scan.")
        exit
      end
      event_by_pool_type = EventsByPoolType.find_by_pool_and_event_codes(pool_code, event_code)
      if ! event_by_pool_type
        puts("Needs a valid event by pool type to do a specific scan.")
        exit
      end
    end

    ActiveRecord::Base.transaction do
      # Check if specific event
      if event_code || pool_code
        # Scan for specific event end/or pool type
        logger.info( "\r\n#{event_by_pool_type.i18n_description} scan" )
        logger.info( "\r\n<------------------------------------------------------------>\r\n" )
        best_found = swimmer_best_finder.set_personal_best( event_by_pool_type, reset = true )
        logger.info( "\r\n#{event_by_pool_type.i18n_description}: #{best_found.to_s}\r\n" )
        logger.info( "\r\n<------------------------------------------------------------>\r\n" )
      else
        # Perform a complete scan for the swimmer
        logger.info( "\r\nComplete swimmer scan" )
        logger.info( "\r\n<------------------------------------------------------------>\r\n" )
        bests_found = swimmer_best_finder.scan_for_personal_bests
        logger.info( "\r\nFound #{bests_found.to_s} personal bests\r\n" )
        logger.info( "\r\n<------------------------------------------------------------>\r\n" )
      end
      
      # Create diff file
      file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_personal_best_finder_#{swimmer.id}.diff"
      File.open( LOG_DIR + '/' + file_name + '.sql', 'w' ) { |f| f.puts swimmer_best_finder.sql_diff_text_log }
      logger.info( "\r\nDiff file " + file_name + " created" )

      # Save data
      if not persist
        logger.info( "\r\n*** Personal best NOT persisted! ***" )
        raise ActiveRecord::Rollback 
      else
        logger.info( "\r\nPersonal best persisted." )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  desc <<-DESC
Scan swimmers to perform personal best scan
Resulting log files are stored into '#{LOG_DIR}'.

Always perform a full scan of events swam by swimmers

Options: persist=false start_from=first stop_after=last [split=<swimmer_number_to_split_at>]

- 'persist'    force to persist the personal best indicator on results found.
- 'start_from' swimmer id to start from
- 'stop_after' swimmer id to stop at
- 'split'      swimmer ids number to split diff files
- 'log_dir'    allows to override the default log dir destination.

DESC
  task :scan_all_swimmers_personal_bests do |t|
    puts "*** db:scan_all_swimmers_personal_bests ***"
    persist         = ENV.include?("persist")    ? ENV["persist"] == 'true' : false
    start_from      = ENV.include?("start_from") ? ENV["start_from"].to_i : 1
    split           = ENV.include?("split")      ? ENV["split"].to_i : nil
    stop_after      = ENV.include?("stop_after") ? ENV["stop_after"].to_i : Swimmer.last.id
    rails_config    = Rails.configuration             # Prepare & check configuration:
    db_name         = rails_config.database_configuration[Rails.env]['database']
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Display some info:
    puts "DB name:          #{db_name}"
    puts "DB user:          #{db_user}"
    puts "log_dir:          #{log_dir}"
    puts "\r\n"
    logger = ConsoleLogger.new

    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )
    
    logger.info( "Oh, my God! This is a complete swimmers scan to find out personal bests!" )
    logger.info( "Let's rock!!!" )
    logger.info( "\r\n<------------------------------------------------------------>\r\n" )

    # Create diff file (unique if not split or first if split
    if split
      limit = (start_from + split - 1) > stop_after ? stop_after : (start_from + split - 1)  
      file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_scan_all_swimmer_for_personal_bests_#{start_from}_#{limit}.diff"
      diff_file = File.open( LOG_DIR + '/' + file_name + '.sql', 'w' )
    else
      file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_scan_all_swimmer_for_personal_bests_#{start_from}_#{stop_after}.diff"
      diff_file = File.open( LOG_DIR + '/' + file_name + '.sql', 'w' )
    end
    logger.info( "\r\nCreates log file #{file_name}" )
    
    ActiveRecord::Base.transaction do
      Swimmer.where("id between #{start_from} and #{stop_after}").each do |current_swimmer|
        # Check if new diff file is needed
        if split && current_swimmer.id % split == 1 && start_from != current_swimmer.id
          limit = (current_swimmer.id + split - 1) > stop_after ? stop_after : (current_swimmer.id + split - 1)  
          file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_scan_all_swimmer_for_personal_bests_#{current_swimmer.id}_#{limit}.diff"
          diff_file = File.open( LOG_DIR + '/' + file_name + '.sql', 'w' )
          logger.info( "\r\n" )
          logger.info( "\r\n<------------------------------------------------------------>" )
          logger.info( "\r\nCreating diff file #{file_name}" )
          logger.info( "\r\n<------------------------------------------------------------>" )
          logger.info( "\r\n" )
        end
        
        logger.info( "\r\n- Swimmer to scan: #{current_swimmer.get_full_name} [#{current_swimmer.id}]" )

        # Initialize swimmer best finder
        swimmer_best_finder = SwimmerBestFinder.new( current_swimmer )
        if swimmer_best_finder
          # Perform a complete scan for the swimmer
          bests_found = swimmer_best_finder.scan_for_personal_bests
          logger.info( "\r\n  Found #{bests_found.to_s} personal bests" )

          # Update diff file
          diff_file.puts swimmer_best_finder.sql_diff_text_log
        else
          puts("Something wrong with swimmer #{current_swimmer.get_full_name}")
        end
      end

      # Save or roll back data
      if not persist
        logger.info( "\r\n*** Personal best NOT persisted! ***" )
        raise ActiveRecord::Rollback 
      else
        logger.info( "\r\nPersonal best persisted." )
      end
    end

    logger.info( "Full swimmer scan finished" )
  end
  #-- -------------------------------------------------------------------------
  #++

  desc <<-DESC
Check if some of meeting's results are swimmer
personal bests.
Resulting log files are stored into '#{LOG_DIR}'.

Intended for new meeting results.

Options: persist=false meeting=meeting_id

- 'persist'    force to persist the personal best indicator on results found.
- 'meeting'    meeting id to scan results
- 'force'      force to reset and recalculate meeting results
- 'log_dir'    allows to override the default log dir destination.

DESC
  task :scan_meeting_for_personal_bests do |t|
    puts "*** db:scan_meeting_for_personal_bests ***"
    persist         = ENV.include?("persist") ? ENV["persist"] == 'true' : false
    meeting_id      = ENV.include?("meeting") ? ENV["meeting"].to_i : nil
    force           = ENV.include?("force") ?   ENV["force"] == 'true' : false
    rails_config    = Rails.configuration             # Prepare & check configuration:
    db_name         = rails_config.database_configuration[Rails.env]['database']
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Display some info:
    puts "DB name:          #{db_name}"
    puts "DB user:          #{db_user}"
    puts "log_dir:          #{log_dir}"
    puts "\r\n"
    logger = ConsoleLogger.new

    # Verify parameters
    unless meeting_id && Meeting.exists?( meeting_id ) 
      puts("This needs a valid meeting to scan for.")
      exit
    end

    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )
    
    # Find target entities
    meeting = Meeting.find( meeting_id )
    logger.info( "Meeting to scan: #{meeting.get_full_name}" )

    # Create diff file
    file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_meeting_personal_best_finder_#{meeting.id}.diff"
    diff_file  = File.open( LOG_DIR + '/' + file_name + '.sql', 'w' )
    diff_file.puts '--'
    diff_file.puts "-- Swimmer personal bests updates for Meeting #{meeting.get_full_name} (#{meeting.id})"
    diff_file.puts "-- #{DateTime.now().strftime('%d-%m-%Y %H:%M')}"
    diff_file.puts '--'
    personal_bests_found = 0
    results_scanned      = 0

    ActiveRecord::Base.transaction do
      meeting.meeting_individual_results.is_not_disqualified.sort_by_team.each do |meeting_individual_result|
        # Check only if not already the personal best
        if force || !meeting_individual_result.is_personal_best
          # Initialize swimmer best finder
          swimmer = meeting_individual_result.swimmer
          swimmer_best_finder = SwimmerBestFinder.new( swimmer )
          unless swimmer_best_finder
            puts("Something wrong with swimmer #{swimmer.get_full_name} to scan for (#{meeting_individual_result.get_team_name}).")
            exit
          end
  
          # Check if result is a new personal best for swimmer
          if swimmer_best_finder.is_personal_best( meeting_individual_result )
            event_by_pool_type = meeting_individual_result.get_event_by_pool_type
            swimmer_best_finder.set_personal_best( event_by_pool_type, true, meeting_individual_result.id )
            personal_bests_found += 1
  
            logger.info( "#{meeting_individual_result.get_team_name} - Found #{swimmer.get_full_name} new personal best for #{event_by_pool_type.get_full_name}: #{meeting_individual_result.get_timing}" )
            diff_file.puts swimmer_best_finder.sql_diff_text_log
          end
        end
        results_scanned += 1
      end

      # If no personal bests found delete log file
      if personal_bests_found > 0
        diff_file.puts "-- Found #{personal_bests_found} new personal bests"
        diff_file.puts "-- Personal bests update for meeting #{meeting.id} terminated."
      else
        File.delete( LOG_DIR + '/' + file_name + '.sql' )
      end
  
      logger.info( "\r\n<------------------------------------------------------------>" )
      logger.info( "\r\nScanned #{results_scanned} results" )
      logger.info( "\r\nFound #{personal_bests_found} new personal bests" )
      logger.info( "\r\nDiff file #{file_name} created" ) if personal_bests_found > 0 
      logger.info( "\r\nNo diff file created" ) if personal_bests_found == 0 
      logger.info( "\r\n<------------------------------------------------------------>" )

      # Save or roll back data
      if not persist
        logger.info( "\r\n*** Personal bests NOT persisted! ***" )
        raise ActiveRecord::Rollback 
      else
        logger.info( "\r\nPersonal bests persisted." )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
# =============================================================================


