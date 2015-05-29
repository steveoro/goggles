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

Options: [meeting=<meeting_id>] [season=<season_id>]
         [log_dir=#{LOG_DIR}]

  - meeting => scan only this Meeting.id; when not set, all Meetings are scanned.
               (This takes precedence over the "season" parameter. It is a very narrow
               scan loop, ideal for record updates after a single meeting data-import.)

  - season => scan only this Season.id; when not set, all Seasons are scanned
              ("all seasons" implies a scan upon all season types, for all meetings,
              which effectively checks all existing MIRs & records -- may take several
              hours to complete!).

  - 'log_dir' => allows to override the default log dir destination.

DESC
  task :update_records do |t|
    puts "*** db::update_records ***"
    rails_config    = Rails.configuration             # Prepare & check configuration:
    db_name         = rails_config.database_configuration[Rails.env]['database']
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR
    meeting         = ENV.include?("meeting") ? Meeting.find_by_id(ENV["meeting"].to_i) : nil
    season          = meeting.nil? && ENV.include?("season") ? Season.find_by_id(ENV["season"].to_i) : nil
                                                    # Display some info:
    puts "DB name:        #{db_name}"
    puts "DB user:        #{db_user}"
    puts "meeting_id:     #{meeting.id} (#{meeting.get_full_name})" if meeting
    puts "season_id:      #{season.id} (#{season.get_full_name})" if season
    puts "log_dir:        #{log_dir}"
    puts "\r\n"
    logger = ConsoleLogger.new

    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )

    records_before = IndividualRecord.count
    puts Benchmark.measure {
      scan_by_model_for_records( SeasonType, :season_type, meeting, season, logger, log_dir )
      scan_by_model_for_records( Team, :team, meeting, season, logger, log_dir )
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
  # If meeting or season are not nil, they are used as filtering parameters for
  # the full scan.
  #
  def scan_by_model_for_records( model, sym, meeting, season, logger, log_dir )
    collector = nil

    # Loop on all results for the specified Meeting and update or insert the records:
    if meeting
      collector = RecordCollector.new( :meeting => meeting )
      total = collector.pool_type_code_list.count *
              collector.event_type_codes_list.count *
              collector.category_type_codes_list.count *
              collector.gender_type_codes_list.count
      logger.info( "\r\nProcessing #{sym}: 1/1 '#{meeting.get_full_name}', max inner loops tot.: #{total}" )
      collector.full_scan do |this, pool_code, event_code, category_code, gender_code|
#        logger.debug( "\r\n- current event_code: #{event_code}, category_code: #{category_code}, gender_code: #{gender_code}" )
        # First, initialize the collection by getting the existing records:
        this.collect_from_records_having(
          pool_code,
          event_code,
          category_code,
          gender_code,
          sym == :team ? 'TTB' : 'FOR'
        )
        # Then, update the collection if a better record is found from the results:
        this.collect_from_results_having(
          pool_code,
          event_code,
          category_code,
          gender_code,
          sym == :team ? 'TTB' : 'FOR'
        )
        putc '.'
      end

    # Filter using the specified Season while doing a full scan:
    elsif season
      list = model.uniq
      list.each_with_index do |instance, index|
        collector = RecordCollector.new( sym.to_sym => instance, :season => season )
        total = collector.pool_type_code_list.count *
                collector.event_type_codes_list.count *
                collector.category_type_codes_list.count *
                collector.gender_type_codes_list.count
        logger.info( "\r\nProcessing #{sym.to_s.upcase} records: #{index+1}/#{list.count} '#{instance.get_full_name}', max inner loops tot.: #{total}" )
        collector.full_scan do |this, pool_code, event_code, category_code, gender_code|
          # First, initialize the collection by getting the existing records:
          this.collect_from_records_having(
            pool_code,
            event_code,
            category_code,
            gender_code,
            sym == :team ? 'TTB' : 'FOR'
          )
          # Then, update the collection if a better record is found from the results:
          this.collect_from_results_having(
            pool_code,
            event_code,
            category_code,
            gender_code,
            sym == :team ? 'TTB' : 'FOR'
          )
          putc '.'
        end
      end

    # Loop on all Model instances and do a full scan.
    else
      list = model.uniq
      list.each_with_index do |instance, index|
        collector = RecordCollector.new( sym.to_sym => instance )
        total = collector.pool_type_code_list.count *
                collector.event_type_codes_list.count *
                collector.category_type_codes_list.count *
                collector.gender_type_codes_list.count
        logger.info( "\r\nProcessing #{sym.to_s.upcase} records: #{index+1}/#{list.count} '#{instance.get_full_name}', max inner loops tot.: #{total}" )
        collector.full_scan do |this, pool_code, event_code, category_code, gender_code|
          # First, initialize the collection by getting the existing records:
          this.collect_from_records_having(
            pool_code,
            event_code,
            category_code,
            gender_code,
            sym == :team ? 'TTB' : 'FOR'
          )
          # Then, update the collection if a better record is found from the results:
          this.collect_from_results_having(
            pool_code,
            event_code,
            category_code,
            gender_code,
            sym == :team ? 'TTB' : 'FOR'
          )
          putc '.'
        end
      end
    end

    logger.info("\r\nFull scan completed. Saving data...")
                                                    # Serialize the results
    if collector.commit()
      logger.info("Everything OK.")
    else
      logger.warn("WARNING: #{ collector.count } record(s) were not saved due to errors!")
    end

    logger.info("Storing #{sym.to_s.upcase} records update diff file in Log directory...")
    file_name = File.join(
      log_dir, "#{ DateTime.now.strftime("%Y%m%d%H%M") }prod_update_records_#{sym}.sql"
    )
    File.open( file_name, 'w' ) { |f| f.puts collector.sql_executable_log }
  end
  #-- -------------------------------------------------------------------------
  #++
end
# =============================================================================


