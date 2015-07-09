# encoding: utf-8
require 'date'
require 'rubygems'
require 'find'
require 'fileutils'

require 'framework/version'
require 'framework/application_constants'

require 'framework/console_logger'

require_relative '../../app/data_import/v2/strategies/data_importer'


=begin

= Data-Import Helper tasks

  - Goggles framework vers.:  4.00.801
  - author: Steve A.

  Data-Import rake tasks.

  (ASSUMES TO BE rakeD inside Rails.root)

=end
UPLOADS_DIR = File.join( Dir.pwd, 'public/uploads' ) unless defined? UPLOADS_DIR
LOG_DIR     = File.join( Dir.pwd, 'log' ) unless defined? LOG_DIR
# -----------------------------------------------------------------------------


namespace :dataimport do

    desc <<-DESC
Generates the article for the news log update, post data-import in a single SQL
diff file, together with some cleaning statements (sessions, articles and maintenance
mode OFF).

Options: [custom_msg="any string text to be added to the list of news"]
         [meeting_ids=<id_1>[,<id_2>,...] ]

  - 'custom_msg'  => a text that will be inserted in a <li> element as an
                   additional custom message for the news log. HTML is supported
                   and it won't be escaped.

  - 'meeting_ids'  => a comma-separated list of Meeting IDs, for which the data
                   (either result or starting-list) has been updated.

DESC
    task :news_log do |t|
      puts "\r\n*** dataimport:news_log ***\r\n"
      puts "Requiring Rails environment to allow usage of any Model..."
      require 'rails/all'
      require File.join( Rails.root.to_s, 'config/environment' )

      meeting_ids   = ENV.include?("meeting_ids") ? ENV["meeting_ids"].to_s.split(',') : nil
      meeting_ids   = meeting_ids.map{ |id| id.to_i } if meeting_ids
      meeting_array = Meeting.where( id: meeting_ids ).uniq
      if meeting_array.size < 1
        puts "No meetings found!"
        exit
      end
      custom_msg    = ENV.include?("custom_msg") ? ENV["custom_msg"].to_s : nil
      article_html  = "<p>L'applicazione è stata portata alla versione <b>#{Version::MAJOR}.#{Version::MINOR}</b>.</p>\r\n" <<
                      "<u><b>Novità:</b></u>\r\n" <<
                      "<ul>\r\n"
      # Force locale for NewsFeed generation to 'it-IT'
      I18n.locale = :it

      meeting_array.each do |meeting|
        article_html << "<li>Aggiunti i risultati per il meeting " <<
                        "<a href=\"/it/meeting/show_full/#{meeting.id}\">" <<
                        "#{meeting.get_full_name} (#{meeting.swimming_pools.first.city.name})</a></li>\r\n"
      end
      if custom_msg
        article_html << "<li>#{custom_msg}</li>\r\n"
      end
      article_html << "</ul>\r\n"

      puts "\r\n---8<--- Resulting HTML:"
      puts article_html
      puts "---8<---"

      con = meeting_array.first.connection
      sql_text = "-- Post Data-import clean-up & news log update for meetings: #{meeting_ids.inspect}\r\n" <<
                 "UPDATE app_parameters SET a_bool='0', a_name='#{Version::FULL}', updated_at=NOW() WHERE id = 1;\r\n" <<
                 "TRUNCATE sessions;\r\n" <<
                 "DELETE FROM articles;\r\n" <<
                 "INSERT INTO articles (title, body, is_sticky, user_id, created_at, updated_at)\r\n" <<
                 " VALUES (\"Aggiornamento dati!\", \"#{ con.quote_string(article_html) }\", '0', '1', NOW(), NOW());\r\n"

      puts "\r\n---8<--- Resulting SQL:"
      puts sql_text
      puts "---8<---"

      file_name = File.join(
        LOG_DIR, "#{ DateTime.now.strftime("%Y%m%d%H%M") }prod_dataimport_newslog.sql"
      )
      File.open( file_name, 'w' ) { |f| f.puts sql_text }
      puts "\r\nSQL diff-file saved in #{LOG_DIR}.\r\nDone."
    end
    #-- -----------------------------------------------------------------------
    #++

  # Executes the DataImporter
  def launch_data_importer( pathname, season, force_meeting, force_team,
                            do_not_consume_file, log_dir, logger, flash,
                            delayed )
    data_importer = DataImporter.new( logger, flash )
    data_importer.set_up(
        full_pathname:                  pathname,
        season:                         season,
        force_missing_meeting_creation: force_meeting,
        force_team_or_swimmer_creation:    force_team,
        do_not_consume_file:            do_not_consume_file,
        log_dir:                        log_dir
    )
    delayed ? data_importer.delay( queue: 'data-import' ).perform() :
              data_importer.perform()
  end
  # ----------------------------------------------------------------------------
  #++


  desc <<-DESC
  Executes the data-import process as a batch, delayed job.
All files found in the designated directory will be enqued, processed
and consumed. Resulting log files are stored into '#{LOG_DIR}'.

Options: [exec_path=#{UPLOADS_DIR}] [delete=1|<0>]
         [force_meeting=1|<0>] [force_team=1|<0>]
         [force_season_id=<season_id>]
         [log_dir=#{LOG_DIR}] [delayed=<1>|0]

- 'exec_path' is either the path where the files are found or the full
              pathname of the file to be executed.
              If the path is a directory and it contains any folder named
              'season.ID', where 'ID' is the integer ID of an existing
              Season row, each folder will be scanned recursively in search
              of other data-import text files to be processed; each
              file found will be set forcibly to belong to the specified
              season.id.

- 'force_meeting' allows to forcibly create any non-existing meeting for
              the processed files (defaults to '0', false).

- 'force_team' allows to forcibly create any non-existing team row for
              the processed files (defaults to '0', false).

- 'force_season_id' allows to specify the season.id which must be assumed
              for each data-import files processed, except for the ones
              stored inside any folder named 'season.ID', as explained
              above (directory naming takes precedence over this parameter,
              which applies to 'all the other files found').

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
    force_team      = ENV.include?("force_team") && (ENV["force_team"].to_i > 0)
    delayed         = !( ENV.include?("delayed") && (ENV["delayed"].to_i < 1) )
                                                    # Display some info:
    puts "DB name:          #{db_name}"
    puts "DB user:          #{db_user}"
    puts "force_season_id:  #{force_season_id > 0 ? force_season_id : '(autodetect)'}\r\n"
    puts "log_dir:          #{log_dir}"
    puts "\r\n"
    puts ">>> DELETE files on success is ON <<<" if can_kill_file
    puts ">>> FORCE Meeting CREATION is ON  <<<" if force_meeting
    puts ">>> FORCE Team CREATION is ON     <<<" if force_team
    puts ">>> DELAYED job execution is ON   <<<" if delayed
    puts " "
    logger = ConsoleLogger.new
    flash = {}

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
            launch_data_importer(
                seasonpathname, season, force_meeting, force_team,
                !can_kill_file, log_dir,
                logger, flash, delayed
            )
          end
        else                                        # Result from Dir is a plain text (data) file? Process it: (no other nested loops are necessary)
          puts "Processing '#{subpathname}'..."
          season = force_season_id > 0 ? Season.find_by_id( force_season_id ) : nil
          launch_data_importer(
              subpathname, season, force_meeting, force_team,
              !can_kill_file, log_dir,
              logger, flash, delayed
          )
        end
      end
                                                    # Suggested exec_path is a filename? (This could contain wildcards, so process each file found:
    else
      Dir.glob( exec_path, File::FNM_PATHNAME ).sort.each do |subpathname|
        puts "Processing '#{subpathname}'..."
        season = force_season_id > 0 ? Season.find_by_id( force_season_id ) : nil
        launch_data_importer(
            subpathname, season, force_meeting, force_team,
            !can_kill_file, log_dir,
            logger, flash, delayed
        )
      end
    end

    puts "Finished."
  end
  # ---------------------------------------------------------------------------
end
# =============================================================================


