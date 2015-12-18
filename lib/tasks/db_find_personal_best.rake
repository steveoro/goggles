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

Could be used for a partivcular swimmer event or 
massive for all swimmers event swam

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
    event_code      = ENV.include?("event")   ? ENV["event"].to_i : nil
    pool_code       = ENV.include?("pool")    ? ENV["pool"].to_i : nil
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
      event_by_pool_type = EventsByPoolType.find_by_pool_and_event_codes(event_code, pool_code)
      if ! event_by_pool_type
        puts("Needs a valid event by pool type to do a specific scan.")
        exit
      end
    end

    ActiveRecord::Base.transaction do
      # Check if specific event
      if event_code || pool_code
        # Scan for specific event end/or pool type
        logger.info( "\r\n#{event_by_pool_type.get_full_name} scan" )
        logger.info( "\r\n<------------------------------------------------------------>\r\n" )
        best_found = swimmer_best_finder.set_personal_best( event_by_pool_type, reset = true )
        logger.info( "\r\n#{event_by_pool_type.get_full_name}: #{best_found.to_s}\r\n" )
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
      file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_personal_bets_finder_#{swimmer.id}.diff"
      File.open( LOG_DIR + '/' + file_name + '.sql', 'w' ) { |f| f.puts swimmer_best_finder.sql_diff_text_log }
      logger.info( "\r\nLog file " + file_name + " created" )

      # Save new season
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
end
# =============================================================================


