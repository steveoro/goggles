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

  - Goggles framework vers.:  4.00.803
  - author: Steve A.

  DB Updater for batch collection of Team & Federation Records & Best Individual Results

  (ASSUMES TO BE rakeD inside Rails.root)

=end

namespace :db do

  desc <<-DESC

***********************************************************************
*** WARNING: MAY TAKE SEVERAL HOURS TO COMPLETE, EVEN ON A FAST PC! ***
***********************************************************************

Executes the DB update process for records/best-results as a batch job.
Resulting log files are stored into '#{LOG_DIR}'.

Performs a batch, full scan of MeetingIndividualResult, while iterating on each
Federation and then on each Team.

The collected records are either "team records" (when filtered by the current
Team in the loop) or "federation records" (when filtered upon the current
SeasonType in the loop).

The results are serialized after each RecordCollector#full_scan() call (upon each
iteration of one of the two loops).

Options: [meeting=<meeting_id>] [season_types_only=<0>|1]
         [start_from_index=<team_ordinal_index>]
         [log_dir=#{LOG_DIR}]

  - season_types_only => set this to 1 to perform a season_type-only loop
              scan: no team scans will be performed.

  - start_from_index => execute only a Team-record scan, starting from the
              specified index (ordinal number) specified. This is useful if the
              previous loop was interrupted for any reason at a certain index.
              Use this parameter with 0 to perform a team-only update loop.

  - meeting => scan only this Meeting.id; when not set, all Meetings are scanned.
              (Use this for a very narrow scan loop, ideal for record updates
              after a single meeting data-import.)

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
    start_from_index = ENV.include?("start_from_index") ? ENV["start_from_index"].to_i : nil
    season_types_only = ENV.include?("season_types_only") ? ENV["season_types_only"].to_i > 0 : false
                                                    # Display some info:
    puts "DB name:            #{db_name}"
    puts "DB user:            #{db_user}"
    puts "meeting_id:         #{meeting.id} (#{meeting.get_full_name})" if meeting
    puts "season_types_only:  #{season_types_only}" if season_types_only
    puts "start_from_index:   #{start_from_index}" if start_from_index
    puts "log_dir:            #{log_dir}"
    puts "\r\n"
    logger = ConsoleLogger.new

    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )

    records_before = IndividualRecord.count
    puts Benchmark.measure {
      scan_by_model_for_records(
        SeasonType, :season_type, meeting, nil, logger, log_dir
      ) if start_from_index.nil?

      scan_by_model_for_records(
        Team, :team, meeting, start_from_index, logger, log_dir
      ) unless season_types_only

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
  # If meeting is not nil, it's used as a filtering parameter for the full scan.
  #
  def scan_by_model_for_records( model, sym, meeting, start_from_index, logger, log_dir )
    collector = nil
    file_name = File.join(
      log_dir, "#{ DateTime.now.strftime("%Y%m%d%H%M") }prod_update_records_#{sym}"
    )
    if meeting && sym == :team
      list = meeting.teams.uniq
    else
      list = model.uniq
    end
    if start_from_index
      list = list.to_a[ start_from_index .. list.size ]
    end

    list.each_with_index do |instance, index|
      collector = meeting ?
                  RecordCollector.new( :meeting => meeting, sym.to_sym => instance ) :
                  RecordCollector.new( sym.to_sym => instance )
      total = log_loop_quantities( collector, logger )
      logger.info( "\r\nProcessing #{sym.to_s.upcase} #{meeting ? '('+meeting.get_full_name+')' : ''} records: #{index+1}/#{list.count} '#{instance.get_full_name}', worst case inner loops max: #{total}" )
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
      # After each completed Full-scans,, we need to serialize the results:
      logger.info("\r\nFull scan completed only for meeting #{meeting.id}. Saving data...") if meeting
      logger.info( "\r\nCommitting updates for #{sym} index #{index}..." )
      commit_updates( collector, file_name + "#{ meeting ? '-meeting'+meeting.id.to_s : '' }-#{index}.sql", logger )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Outputs on the logger the esteemed number of queries to be performed by the
  # full scan.
  # Returns the computed total.
  #
  def log_loop_quantities( collector, logger )
    tot_pool_types = collector.pool_type_code_list.count
    tot_event_types = collector.event_type_codes_list.count
    tot_category_types = collector.category_type_codes_list.count
    tot_gender_types = collector.gender_type_codes_list.count
    total = tot_pool_types * tot_event_types * tot_category_types * tot_gender_types
    logger.info( "\r\nTot. pool types.......: #{tot_pool_types}" )
    logger.info( "Tot. event types......: #{tot_event_types}" )
    logger.info( "Tot. category types...: #{tot_category_types}" )
    logger.info( "Tot. gender types.....: #{tot_gender_types}" )
    logger.info( "=======================" )
    logger.info( "Grand total...........: #{total}" )
    total
  end


  # Performs the commit phase for the record collector, storing the SQL diff contents
  # on a log file.
  #
  def commit_updates( collector, file_name, logger )
    if collector.commit()
      logger.info("Everything OK.")
    else
      logger.warn("WARNING: #{ collector.count } record(s) were not saved due to errors!")
    end
    File.open( file_name, 'w' ) { |f| f.puts collector.sql_executable_log }
  end
  #-- -------------------------------------------------------------------------
  #++
end
# =============================================================================


