# encoding: utf-8
require 'date'
require 'rubygems'
require 'fileutils'
require 'mechanize'

require 'framework/version'
require 'framework/application_constants'

require 'framework/console_logger'


=begin

= DB-maintenance tasks

  - Goggles framework vers.:  4.00.615
  - author: Leega, Steve A.

  (ASSUMES TO BE rakeD inside Rails.root)

=end
#-- ---------------------------------------------------------------------------
#++


namespace :db do

  desc <<-DESC
  Saves season team ranking of given seasons or season types in a permanent structure.
This will alter the DB but it can be safely re-run since it uses updates.

  Options: season_ids='season1_id[, season2_id, ...]' (takes precedence over the following)
           season_type=['MASCSI'|'MASFIN'|...]
  DESC
  task :save_season_team_ranking do
    puts "\r\n*** db:save_season_team_ranking ***"

    # Environment setup
    rails_config  = Rails.configuration             # Prepare & check configuration:
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    db_host       = rails_config.database_configuration[Rails.env]['host']
    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )

    # Verify parameters
    raise ArgumentError.new("Needs at least a 'season_ids' or a 'season_type' parameter") unless ENV.include?("season_ids") || ENV.include?("season_type")

    # Display some info:
    puts "DB host: #{db_host}"
    puts "DB name: #{db_name}"
    puts "DB user: #{db_user}"
    season_ids = []
    if ENV.include?("season_ids")
      season_ids = ENV["season_ids"].split(',')
      # Check if all seasons IDs are valid ([Steve] This is quite an useless check, since an error'd have been thrown anyway)
      season_ids.each do |id|
        raise ArgumentError.new("Season #{id} not found!") unless Season.find( id )
      end
    else
      season_ids = Season.includes(:season_type).where( 'season_types.code' => ENV["season_type"] ).map{ |s| s.id }
      puts "SeasonType code: #{ENV["season_type"]}"
    end
    puts "Season IDs to be processed: #{season_ids.inspect}"
    puts "\r\n---------------- 8< -------------------"

    season_saved = 0
    season_ids.each do |id|
      if season = Season.find( id )
        puts "\r\nSaving team ranking for season '#{season.get_full_name}'..."
        # Creates the season ranking and save teh first 3 elements
        if ChampionshipRankingCalculator.new( season ).save_computed_season_rank
          saved_data = season.computed_season_ranking
          puts "Season ranking correctly stored:"
          saved_data.each do |computed_season_rank|
            puts "#{computed_season_rank.rank}. #{computed_season_rank.team.name}: #{computed_season_rank.total_points}"
          end
          season_saved += 1
        else
          puts "\r\nError occurred during saving data process!"
          puts "\r\nTask failed!"
        end
      else
        puts "\r\nSeason #{season_id} misteriously disappers!"
        puts "Task stopped!"
        raise ArgumentError.new("Season not found")
      end
    end
    puts "\r\nSeason(s) saved: #{season_saved}"
    puts "Done"
  end
  #-- -------------------------------------------------------------------------
  #++


  desc <<-DESC
  Saves a specified text file into the Meeting.invitation column.
The text file is read integrally and saved in the column for the row
having the specified ID.

  Options: meeting_id=<meeting_id>
           file=<path_to_file>
  DESC
  task :store_meeting_invitation do
    puts "\r\n*** db:store_meeting_invitation ***"
    # Environment setup
    rails_config  = Rails.configuration             # Prepare & check configuration:
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    db_host       = rails_config.database_configuration[Rails.env]['host']
    # Verify parameters
    unless ENV.include?("meeting_id") && ENV.include?("file")
      puts("Needs at least a 'meeting_id' and a 'file' parameter")
      exit
    end
    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )

    # Display some info:
    puts "DB host: #{db_host}"
    puts "DB name: #{db_name}"
    puts "DB user: #{db_user}"
    meeting_id = ENV["meeting_id"].to_i
    full_pathname = ENV["file"]
    meeting = Meeting.find( meeting_id )
    puts "Meeeting: ID #{meeting.id}, code: #{meeting.code}, header date: #{meeting.header_date}, '#{meeting.description}'"
    puts "Full pathname: #{full_pathname}"
    text_file_contents = File.read( full_pathname )
    puts "File size: #{text_file_contents.size}"
    puts "Processing..."
    meeting.invitation = text_file_contents
    meeting.save!
    puts "Done"
  end


  desc <<-DESC
  Saves a specified text file into the Season.rules column.
The text file is read integrally and saved in the column for the row
having the specified ID.

  Options: season_id=<season_id>
           file=<path_to_file>
  DESC
  task :store_season_rules do
    puts "\r\n*** db:store_season_rules ***"
    # Environment setup
    rails_config  = Rails.configuration             # Prepare & check configuration:
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    db_host       = rails_config.database_configuration[Rails.env]['host']
    # Verify parameters
    unless ENV.include?("season_id") && ENV.include?("file")
      puts("Needs at least a 'season_id' and a 'file' parameter")
      exit
    end
    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )

    # Display some info:
    puts "DB host: #{db_host}"
    puts "DB name: #{db_name}"
    puts "DB user: #{db_user}"
    season_id = ENV["season_id"].to_i
    full_pathname = ENV["file"]
    season = Season.find( season_id )
    puts "Season: ID #{season.id}, header year: #{season.header_year}, '#{season.description}'"
    puts "Full pathname: #{full_pathname}"
    text_file_contents = File.read( full_pathname )
    puts "File size: #{text_file_contents.size}"
    puts "Processing..."
    season.rules = text_file_contents
    season.save!
    puts "Done"
  end
  #-- -------------------------------------------------------------------------
  #++


  desc <<-DESC
  Applies all the diff-SQL files found under 'db/diff.new'.
All the successfully applied diffs will be moved under 'db/diff.applied', waiting
to be historicized locally (and then manually removed from the repository).

The diff filename is assumed to be in the format:

    <timestamp><type>_<description>.sql

The description is ignored.
If the 'type' contains the text "prod" or "dev", the diff is assumed to be applied
only to the corresponding DB dump. Any other text (such as "all") implies that the
diff file must be executed in all the databases.

The task then compiles the list of the involved databases and rebuilds them from
the corresponding available recovery dump from the repository.
(It assumes the available dump is the lastest and correct version available.)

Afterwards, for each modified database a db:dump will be invoked, to automatically
update the recovery dump if all the diff executions have been flawless.

If the development database has been modified, a db:clone_to_test will be executed
at the end to ensure that also the test DB is up-to-date.


  Options: [rebuild=<0>|1]

When rebuild is set to '1' the rebuild phase for the DBs is executed at the beginning
of the task. The default is to skip it, assuming both DBs are currently ready for the
execution of the task.

  DESC
  task :diff_apply do
    puts "\r\n*** db:diff_apply ***"

    # Environment setup
    rails_config    = Rails.configuration           # Prepare & check configuration:
    diff_src_path   = "db/diff.new"
    diff_dest_path  = "db/diff.applied"
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    db_host         = rails_config.database_configuration[Rails.env]['host']

    # Display some info:
    puts "DB host: #{db_host}"
    puts "DB user: #{db_user}"
                                                    # Get which files are for which destination DB:
    diff_filenames = Dir.glob( [ File.join( diff_src_path, '*.sql') ] ).sort
    prod_filenames = diff_filenames.select{ |subpathname| subpathname =~ /\d{12}prod_/ }
    dev_filenames  = diff_filenames.select{ |subpathname| subpathname =~ /\d{12}dev_/ }
    any_filenames  = diff_filenames.reject{ |subpathname| prod_filenames.include?( subpathname ) || dev_filenames.include?( subpathname ) }
    rebuild        = ENV.include?("rebuild") && (ENV["rebuild"].to_i > 0)
    puts "Rebuild phase: #{rebuild ? 'ENABLED' : '(skipped)'}"
    # Note that these arrays of names are used just to detect which destination
    # DBs are involved in the update. The original sorted list of files must be
    # used instead, if we want to honour the file order based on the timestamp
    # in the name.

    if diff_filenames.size > 0
      puts "\r\n- Found #{diff_filenames.size} files (they will be executed in order, though)."
      list_files_to_be_processed( prod_filenames, 'PRODUCTION-only' )
      list_files_to_be_processed( dev_filenames,  'DEVELOPMENT-only' )
      list_files_to_be_processed( any_filenames,  'GENERIC' )
    end
    puts "\r\nThe process, once started cannot be stopped. Please verify the above info or press CTRL-C to abort.\r\n==> Press Enter to continue <=="
    dummy = STDIN.gets
                                                    # Force db:rebuild_from_dump for each involved DB:
    if rebuild && (prod_filenames.size > 0 || any_filenames.size > 0)
      db_name = rails_config.database_configuration[ 'production' ]['database']
      rebuild_from_dump( 'production', db_name, db_host, db_user, db_pwd )
    end
    if rebuild && (dev_filenames.size > 0 || any_filenames.size > 0)
      db_name = rails_config.database_configuration[ 'development' ]['database']
      rebuild_from_dump( 'development', db_name, db_host, db_user, db_pwd )
    end
                                                    # Apply diffs, respecting order of execution:
    diff_filenames.each do |filename|
      if filename =~ /\d{12}prod_/
        apply_diff_files_on_db( [filename], db_host, db_user, db_pwd, 'production',  'PRODUCTION-only', diff_dest_path )
      elsif filename =~ /\d{12}dev_/
        apply_diff_files_on_db( [filename],  db_host, db_user, db_pwd, 'development', 'DEVELOPMENT-only', diff_dest_path )
      else
        apply_diff_files_on_db( [filename],  db_host, db_user, db_pwd,  ['production', 'development'], 'GENERIC', diff_dest_path )
      end
    end
                                                    # Force a db:dump update for each involved DB:
    if prod_filenames.size > 0 || any_filenames.size > 0
      db_dump( db_host, db_user, db_pwd, rails_config.database_configuration[ 'production' ]['database'], 'production' )
    end
    if dev_filenames.size > 0 || any_filenames.size > 0
      db_dump( db_host, db_user, db_pwd, rails_config.database_configuration[ 'development' ]['database'], 'development' )
    end
                                                    # Force db:clone_to_test at the end when Dev DB is modified:
    # ( Assuming current RAILS_ENV == development )
    Rake::Task['db:clone_to_test'].invoke if dev_filenames.size > 0 || any_filenames.size > 0
    puts "\r\nDone."
  end


  # Dumps each filename string in a verbose format for display purposes.
  #
  def list_files_to_be_processed( filenames, dest_name )
    if filenames.size > 0
      puts "\r\n  - #{ dest_name } diffs to be processed:"
      filenames.each { |filename| puts "    #{filename}" }
    end
  end


  # Executes the SQL diff files on the specified db_dest (config name, not actual DB name)
  # and stores them on diff_dest_path afterwards.
  #
  # If db_dest is an Array, each file will be executed on each item found in the
  # array.
  #
  def apply_diff_files_on_db( filenames, db_host, db_user, db_pwd, db_dest, dest_verbose_name, diff_dest_path )
    if filenames.size > 0
      puts "\r\n\r\n\t** #{ dest_verbose_name } diffs: **"
      filenames.each do |filename|
        if db_dest.instance_of?( Array )            # Multi DB apply:
          db_dest.each do |config_name|
            db_name = Rails.configuration.database_configuration[ config_name ]['database']
            puts "\r\nExecuting '#{filename}' on #{config_name} DB (#{db_name})..."
            sh "mysql --host=#{ db_host } --user=#{ db_user } --password=#{ db_pwd } --database=#{ db_name } --execute=\"\\. #{ filename }\"" do |ok, res|
              if !ok
                puts "Error intercepted: exit status = #{res.exitstatus}"
                exit
              end
            end
          end
                                                    # Single DB apply:
        else
          db_name = Rails.configuration.database_configuration[ config_name ]['database']
          puts "\r\nExecuting '#{filename}' on #{db_dest} DB (#{db_name})..."
          sh "mysql --host=#{ db_host } --user=#{ db_user } --password=#{ db_pwd } --database=#{ db_name } --execute=\"\\. #{ filename }\"" do |ok, res|
            if !ok
              puts "Error intercepted: exit status = #{res.exitstatus}"
              exit
            end
          end
        end
        puts "\r\nMoving '#{filename}' to '#{diff_dest_path}'."
        FileUtils.mv( filename, diff_dest_path )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
