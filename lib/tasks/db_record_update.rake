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

= Record Update

  - Goggles framework vers.:  4.00.345.20140710
  - author: Steve A.

  DB Updater for batch collection of Team & Federation Records & Best Individual Results

  (ASSUMES TO BE rakeD inside Rails.root)

=end

namespace :db do

  desc <<-DESC
Executes the DB update process for records/best-results as a batch, delayed job.
Resulting log files are stored into '#{LOG_DIR}'.

Options: [log_dir=#{LOG_DIR}] [delayed=<1>|0]

- 'log_dir'   allows to override the default log dir destination.

- 'delayed'   allows to launch the batch data-import as a delayed job;
              defaults to '1' (true).
              Delayed jobs are executed by the dedicated daemon, and started
              from the command line, using (for example):

              RAILS_ENV=production script/delayed_job -n 2 start --exit-on-complete
              
              The job queue(s) can be monitored using the DJMon web app,
              at http://<server_ip>:<server_port>/dj_mon
  DESC
  task :update_records do |t|
    puts "*** db::update_records ***"
    rails_config    = Rails.configuration             # Prepare & check configuration:
    db_name         = rails_config.database_configuration[Rails.env]['database']
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR
    delayed         = !( ENV.include?("delayed") && (ENV["delayed"].to_i < 1) )
                                                    # Display some info:
    puts "DB name:          #{db_name}"
    puts "DB user:          #{db_user}"
    puts "log_dir:          #{log_dir}"
    puts "\r\n"
    puts ">>> DELAYED job execution is ON   <<<" if delayed
    puts " "
    logger = ConsoleLogger.new
    flash = {}

    raise "**** W.I.P.!!! *****"

    updater = DataImporter.new( logger, flash, 1 ) # default admin_id=1
    updater.set_batch_parameters(
        seasonpathname, season, force_meeting, force_team,
        do_not_consume_file, log_dir
    )
    delayed ? updater.delay( queue: 'data-import' ).batch_import() : updater.batch_import()

    puts "Finished."
  end
  # ---------------------------------------------------------------------------
end
# =============================================================================


