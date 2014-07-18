# encoding: utf-8
require 'date'
require 'rubygems'
require 'find'
require 'fileutils'
require 'benchmark'

require 'framework/version'
require 'framework/application_constants'
require 'framework/console_logger'


LOG_DIR = File.join( Dir.pwd, 'log' ) unless defined? LOG_DIR


=begin

= Record Update

  - Goggles framework vers.:  4.00.359.20140718
  - author: Steve A.

  DB Updater for batch collection of Team & Federation Records & Best Individual Results

  (ASSUMES TO BE rakeD inside Rails.root)

=end

namespace :db do

  desc <<-DESC
Executes the DB update process for records/best-results as a batch job.
Resulting log files are stored into '#{LOG_DIR}'.

Performs a batch, full scan of MeetingIndividualResult, while iterating on each
Federation and then on each Team.

The collected records are either "team records" (when filtered by the current
Team in the loop) or "feration records" (when filtered upon the current
FederationType in the loop).

The results are serialized after each RecordCollector#full_scan() call (upon each
iteration of one of the two loops).

Options: [log_dir=#{LOG_DIR}]

- 'log_dir'   allows to override the default log dir destination.

DESC
  task :update_records do |t|
    puts "*** db::update_records ***"
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

    records_before = IndividualRecord.count
    puts Benchmark.measure {
      scan_by_model_for_records( SeasonType, :season_type, logger )
      scan_by_model_for_records( Team, :team, logger )
      records_after = IndividualRecord.count
      logger.info( "\r\nTotal Records: #{records_before} (before) VS. #{records_after} (after) => added: #{records_after - records_before}" )
      logger.info( "Measured times:" )
      logger.info( "    user      system       total        real" )
      logger.info( "----------------------------------------------" )
    }
    logger.info( "\r\nFinished." )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Scans all the instances of a specific +model+, invoking RecordCollector#full_scan,
  # with a pre-filter created on the current instance of model, using +sym+ as a
  # parameter to define the filter name.
  #
  def scan_by_model_for_records( model, sym, logger )
    # Loop on all Model instances and do a full scan. Then serialize the results.
    list = model.uniq
    list.each_with_index do |instance, index|
      collector = RecordCollector.new( sym.to_sym => instance )
      total = collector.pool_type_code_list.count *
              collector.event_type_codes_list.count *
              collector.category_type_codes_list.count *
              collector.gender_type_codes_list.count
      logger.info( "\r\nProcessing #{sym}: #{index+1}/#{list.count} '#{instance.get_full_name}', max inner loops tot.: #{total}" )
      collector.full_scan do |this, pool_code, event_code, category_code, gender_code|
        # First, initialize the collection by getting the existing records:
        this.collect_from_records_having( pool_code, event_code, category_code, gender_code )
        # Then, update the collection if a better record is found from the results:
        this.collect_from_results_having( pool_code, event_code, category_code, gender_code )
        putc '.'
      end
      logger.info("\r\nFull scan completed. Saving data...")
      if collector.commit()
        logger.info("Everything OK.")
      else
        logger.warn("WARNING: #{ collector.count } record(s) were not saved due to errors!")
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
# =============================================================================


