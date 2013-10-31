# encoding: utf-8
require 'date'
require 'rubygems'
require 'find'
require 'fileutils'

require 'rails/all'
require File.join( Rails.root.to_s, 'config/environment' )

require 'framework/console_logger'
require 'parsers/data_importer'


=begin

= Data-Import Helper tasks

  - Goggles framework vers.:  4.00.79.20131031
  - author: Steve A.

  Data-Import rake tasks. 

=end
UPLOADS_DIR = File.join( Rails.root, 'public/uploads' ) unless defined? UPLOADS_DIR
LOG_DIR     = File.join( Rails.root, 'log' ) unless defined? LOG_DIR


namespace :dataimport do

  desc <<-DESC
  Executes the data-import process as a batch, delayed job.
All files found in the designated directory will be enqued, processed
and consumed. Resulting log files are stored into '#{LOG_DIR}'.

Options: [exec_path=#{UPLOADS_DIR}] [delete=1|<0>]
         [force_meeting=1|<0>] [force_season_id=<season_id>]
         [log_dir=#{LOG_DIR}] [delayed=<1>|0]

- 'exec_path' is either the path where the files are found or the full
              pathname of the file to be executed.
              If the path is a directory and it contains any folder named
              'season.ID', where 'ID' is the integer ID of an existing
              Season row, each folder will be scanned recursively in search
              of other data-import text files to be processed; each
              file found will be set forcibly to belong to the specified
              season.id.

- 'force_season_id' allows to specify the season.id which must be assumed
              for each data-import files processed, except for the ones
              stored inside any folder named 'season.ID', as explained
              above (directory naming takes precedence over this parameter,
              which applies to 'all the other files found').

- 'force_meeting' allows to forcibly create any non-existing meeting for
              the processed files.

- 'delete'    allows to kill the executed file after completion;
              defaults to '0' (false). Deletion applies only to successful
              data-imports.

- 'log_dir'   allows to override the default log dir destination.

- 'delayed'   allows to launch the batch data-import as a delayed job;
              defaults to '1' (true).
              Delayed jobs are executed by the dedicated daemon, and started
              from the command line, using (for example):

              RAILS_ENV=production script/delayed_job -n 2 start --exit-on-complete
              
              The job queue(s) can be monitored using the DJMon web app,
              at http://<server_ip>:<server_port>/dj_mon

  DESC
  task :batch do |t|
    puts "*** Data-Import batch execution ***"
    rails_config    = Rails.configuration             # Prepare & check configuration:
    db_name         = rails_config.database_configuration[Rails.env]['database']
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    exec_path       = ENV.include?("exec_path") ? ENV["exec_path"] : UPLOADS_DIR
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR
    force_season_id = ENV.include?("force_season_id") ? ENV["force_season_id"].to_i : 0
    can_kill_file   = ENV.include?("delete") && (ENV["delete"].to_i > 0)
    force_meeting   = ENV.include?("force_meeting") && (ENV["force_meeting"].to_i > 0)
    delayed         = !( ENV.include?("delayed") && (ENV["delayed"].to_i < 1) )
                                                    # Display some info:
    puts "DB name:          #{db_name}"
    puts "DB user:          #{db_user}"
    puts "force_season_id:  #{force_season_id > 0 ? force_season_id : '(autodetect)'}\r\n"
    puts "log_dir:          #{log_dir}"
    puts "\r\n"
    puts ">>> DELETE files on success is ON <<<" if can_kill_file
    puts ">>> FORCE Meeting CREATION is ON  <<<" if force_meeting
    puts ">>> DELAYED job execution is ON   <<<" if delayed
    puts " "
    logger = ConsoleLogger.new
    flash = {}

# TODO Refactor this mess:
    if File.directory?( exec_path )                 # If directory exists, scan it and execute each SQL file found:
      puts "\r\n- Processing directory: '#{exec_path}'..."
                                                    # For each file match in pathname recursively do "process file":
      Dir.glob([
        File.join(exec_path, '*.txt'),
        File.join(exec_path, '**/season.*')
      ]).sort.each do |subpathname|                 # Recurse just 1 time into any 'special' directory found
        if File.directory?( subpathname )           # Season subdir path found? Process each other file:
          season_id = File.extname( subpathname ).delete('.').to_i
          puts "\r\n- Processing directory: '#{subpathname}' => season ID:#{season_id}..."
          Dir.glob( File.join(subpathname, '*.txt'), File::FNM_PATHNAME ).sort.each do |seasonpathname|
            puts "Processing '#{seasonpathname}' (using season ID:#{season_id})..."
            season = force_season_id > 0 ? Season.find_by_id( season_id ) : nil
            data_importer = DataImporter.new( logger, flash, 1 ) # default admin_id=1
            data_importer.set_batch_parameters( seasonpathname, season, force_meeting, !can_kill_file, log_dir )
            delayed ? data_importer.delay(:queue=>'data-import').batch_import() :
                      data_importer.batch_import()
          end
        else                                        # Result from Dir is a plain text (data) file? Process it: (no other nested loops are necessary)
          puts "Processing '#{subpathname}'..."
          season = force_season_id > 0 ? Season.find_by_id( force_season_id ) : nil
          data_importer = DataImporter.new( logger, flash, 1 ) # default admin_id=1
          data_importer.set_batch_parameters( subpathname, season, force_meeting, !can_kill_file, log_dir )
          delayed ? data_importer.delay(:queue=>'data-import').batch_import() :
                    data_importer.batch_import()
        end
      end
                                                    # Suggested exec_path is a filename? (This could contain wildcards, so process each file found:
    else
      Dir.glob( exec_path, File::FNM_PATHNAME ).sort.each do |subpathname|
        puts "Processing '#{subpathname}'..."
        season = force_season_id > 0 ? Season.find_by_id( force_season_id ) : nil
        data_importer = DataImporter.new( logger, flash, 1 ) # default admin_id=1
        data_importer.set_batch_parameters( subpathname, season, force_meeting, !can_kill_file, log_dir )
        delayed ? data_importer.delay(:queue=>'data-import').batch_import() :
                  data_importer.batch_import()
      end
    end

    puts "Finished."
  end
  # ---------------------------------------------------------------------------
end
# =============================================================================


