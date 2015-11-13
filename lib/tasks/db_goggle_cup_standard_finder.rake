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

= Goggle cup standard finder

  - Goggles framework vers.:  4.00.833.20151103
  - Author: Leega

  Scan given goggle cup involved swimmers
  to find swam times to use as goggle cup
  standards in goggle cup computation  

  (ASSUMES TO BE rakeD inside Rails.root)

=end

namespace :db do

  desc <<-DESC
Scan given goggle cup involved swimmers
to find swam times to use as goggle cup
standards in goggle cup computation.
Resulting log files are stored into '#{LOG_DIR}'.

Clears previously stored standards.

Options: persist=false goggle_cup=<goggle_cup_id> [log_dir=#{LOG_DIR}]

- 'persist'    force to persist the changes.
- 'goggle_cup' goggle cup to scan for.
- 'log_dir'    allows to override the default log dir destination.

DESC
  task :goggle_cup_standard_finder do |t|
    puts "*** db:goggle_cup_standard_finder ***"
    persist         = ENV.include?("persist")    ? ENV["persist"] == 'true' : false
    goggle_cup_id   = ENV.include?("goggle_cup") ? ENV["goggle_cup"].to_i   : nil
    rails_config    = Rails.configuration             # Prepare & check configuration:
    db_name         = rails_config.database_configuration[Rails.env]['database']
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Verify parameters
    unless goggle_cup_id && GoggleCup.exists?( goggle_cup_id )
      puts("This needs a valid goggle cup to scan for.")
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
    goggle_cup = GoggleCup.find( goggle_cup_id )
    logger.info( "Goggle cup to scan for: " + goggle_cup.get_full_name )
    
    # Initialize meeting_date_changer
    goggle_cup_standard_finder = GoggleCupStandardFinder.new( goggle_cup )
    unless goggle_cup_standard_finder
      puts("Something wrong with google cup to scan for.")
      exit
    end
    logger.info( "Found #{goggle_cup_standard_finder.swimmers.count} swimmers to scan" )

    # Scan
    ActiveRecord::Base.transaction do
      goggle_cup_standard_finder.create_goggle_cup_standards
      
      # Create diff file
      file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}#{persist ? 'prod' : 'all'}_goggle_cup_standard_finder_#{goggle_cup.id}.diff"
      File.open( LOG_DIR + '/' + file_name + '.sql', 'w' ) { |f| f.puts goggle_cup_standard_finder.sql_diff_text_log }
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


