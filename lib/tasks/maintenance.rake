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

  - Goggles framework vers.:  4.00.575
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
                                                    # Divide each file for destination DB:
    diff_filenames = Dir.glob( [ File.join( diff_src_path, '*.sql') ] ).sort
    prod_filenames = diff_filenames.select{ |subpathname| subpathname =~ /\d{12}prod_/ }
    dev_filenames  = diff_filenames.select{ |subpathname| subpathname =~ /\d{12}dev_/ }
    any_filenames  = diff_filenames.reject{ |subpathname| prod_filenames.include?( subpathname ) || dev_filenames.include?( subpathname ) }

    if diff_filenames.size > 0
      puts "\r\n- Found #{diff_filenames.size} files."
      list_files_to_be_processed( prod_filenames, 'PRODUCTION-only' )
      list_files_to_be_processed( dev_filenames,  'DEVELOPMENT-only' )
      list_files_to_be_processed( any_filenames,  'GENERIC' )
    end
                                                    # Force db:rebuild_from_dump for each involved DB:
    if prod_filenames.size > 0 || any_filenames.size > 0
      rebuild_from_dump( 'production', 'production', db_host, db_user, db_pwd )
    end
    if dev_filenames.size > 0 || any_filenames.size > 0
      rebuild_from_dump( 'development', 'development', db_host, db_user, db_pwd )
    end
                                                    # Apply diffs (only if existing):
    apply_diff_files_on_db( any_filenames,  db_host, db_user, db_pwd,  ['production', 'development'], 'GENERIC', diff_dest_path )
    apply_diff_files_on_db( prod_filenames, db_host, db_user, db_pwd, 'production',  'PRODUCTION-only', diff_dest_path )
    apply_diff_files_on_db( dev_filenames,  db_host, db_user, db_pwd, 'development', 'DEVELOPMENT-only', diff_dest_path )
                                                    # Force a db:dump update for each involved DB:
    db_dump( db_host, db_user, db_pwd, 'production', 'production' )   if prod_filenames.size > 0 || any_filenames.size > 0
    db_dump( db_host, db_user, db_pwd, 'development', 'development' ) if dev_filenames.size > 0 || any_filenames.size > 0
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


  # Executes the SQL diff files on the specified db_dest and stores them on
  # diff_dest_path afterwards.
  #
  # If db_dest is an Array, each file will be executed on each item found in the
  # array.
  #
  def apply_diff_files_on_db( filenames, db_host, db_user, db_pwd, db_dest, dest_verbose_name, diff_dest_path )
    if filenames.size > 0
      puts "\r\n\r\n\t** #{ dest_verbose_name } diffs: **"
      filenames.each do |filename|
        if db_dest.instance_of?( Array )            # Multi DB apply:
          db_dest.each do |db_name|
            puts "\r\nExecuting '#{filename}' on #{db_name}..."
            sh "mysql --host=#{ db_host } --user=#{ db_user } --password=#{ db_pwd } --database=#{ db_name } --execute=\"\\. #{ filename }\"" do |ok, res|
              if !ok
                puts "Error intercepted: exit status = #{res.exitstatus}"
                exit
              end
            end
          end
                                                    # Single DB apply:
        else
          puts "\r\nExecuting '#{filename}' on #{db_dest}..."
          sh "mysql --host=#{ db_host } --user=#{ db_user } --password=#{ db_pwd } --database=#{ db_dest } --execute=\"\\. #{ filename }\"" do |ok, res|
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
