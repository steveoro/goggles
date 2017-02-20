# encoding: utf-8

# == Capistrano helper tasks ==
#
# - author: Steve A.
# - vers. : 6.083
#
# This requires Capistrano v. >= 3.1


namespace :remote do
  GOGGLES_ADMIN_PATH = File.absolute_path( File.join(Dir.pwd, File.join('..', 'goggles_admin')) ) unless defined? GOGGLES_ADMIN_PATH
  DB_DIFFS_NEW_PATH  = File.join( GOGGLES_ADMIN_PATH, 'db', 'diff.new' ) unless defined? DB_DIFFS_NEW_PATH
  DB_DIFFS_APPLIED_PATH = File.join( GOGGLES_ADMIN_PATH, 'db', 'diff.applied' ) unless defined? DB_DIFFS_APPLIED_PATH
  #-- -------------------------------------------------------------------------
  #++


  set(
    :ask_src_dbdiff_file_path,
    ask(
      "\r\nEnter the local (source) directory to the SQL DB-Diff files to be uploaded and executed remotely: ",
      DB_DIFFS_NEW_PATH
    )
  )
  #-- -------------------------------------------------------------------------
  #++


  # Remote DB:Diff_apply task
  #
  desc <<-DESC
  This performs a remote "db:diff_apply" of all the DB-Diff files stored under
  'goggles_admin/db/diff.new', staging first the changes locally then applying them
  remotely only in case of no-errors.


  === WHAT IT DOES ===

- Runs *locally* the core rake task db:diff_apply.

- In case of errors, this task exits and the error log (stored on file) is shown.

- If no errors are detected, for each DB-Diff file:
  - [LOCAL -> REMOTE] The file is copied to the destination server (typically, under '/tmp')
  - [REMOTE] the file is applied (executed) and tested for errors (again)
  - [REMOTE] (On success) The file is then removed from the remote server
  - [LOCAL] (On success) The file is also moved to 'goggles_admin/db/diff.applied'


All the successfully applied diffs will be moved under 'goggles_admin/db/diff.applied',
waiting to be historicized locally (and then manually removed from the repository).

Each DB-Diff filename is assumed to be in the format:

    <timestamp><type>_<description>.sql

The description is ignored.

If 'type' contains either the text "prod" or "dev", the diff is assumed to be applied
only to the corresponding DB dump ('production' or 'development').
Any other text (such as "all") implies that the diff file must be executed upon all
the databases.

The task then compiles the list of the involved databases and rebuilds them from
the corresponding available recovery dump from the repository.
(It assumes the available dump is the lastest and correct version available.)

Afterwards, for each modified database a db:dump will be invoked, to automatically
update the recovery dump if all the diff executions have been flawless.

If the development database has been modified, a db:clone_to_test will be executed
at the end to ensure that also the test DB is up-to-date.


  === OPTIONS ===

    [rebuild=<0>|1]

When rebuild is set to '1' the rebuild phase for the DBs is executed at the beginning
of the task. The default is to skip it, assuming both DBs are currently ready for the
execution of the task.

  DESC
  task :db_diff_apply do
    run_locally do
      require 'rails'
      # Environment setup
      rails_config    = Rails.configuration           # Prepare & check configuration:
      diff_src_path   = DB_DIFFS_NEW_PATH
      diff_dest_path  = DB_DIFFS_APPLIED_PATH
      db_user         = rails_config.database_configuration[Rails.env]['username']
      db_pwd          = rails_config.database_configuration[Rails.env]['password']
      db_host         = rails_config.database_configuration[Rails.env]['host']
                                                    # Get which files are for which destination DB:
      diff_filenames = Dir.glob( [ File.join( diff_src_path, '*.sql') ] ).sort
      prod_filenames = diff_filenames.select{ |subpathname| subpathname =~ /\d{12}prod_/ }
      dev_filenames  = diff_filenames.select{ |subpathname| subpathname =~ /\d{12}dev_/ }
      any_filenames  = diff_filenames.reject{ |subpathname| prod_filenames.include?( subpathname ) || dev_filenames.include?( subpathname ) }
      rebuild        = ENV.include?("rebuild") && (ENV["rebuild"].to_i > 0)

      puts "\r\n*** remote:db_diff_apply ***"
      puts "\r\nLOCAL staging preparation. If everything we'll be successful, 'prod' files will be also applied remotely."
      # Display some info:
      puts "DB host: #{db_host}"
      puts "DB user: #{db_user}"
      puts "Rebuild phase: #{rebuild ? 'ENABLED' : '(skipped)'}"
      # Note that these arrays of names are used just to detect which destination
      # DBs are involved in the update. The original sorted list of files must be
      # used instead, if we want to honour the file order based on the timestamp
      # in the name.

      if diff_filenames.size > 0
        puts "\r\n- Found #{diff_filenames.size} files (they will be executed in order, though)."
        show_all_files_to_be_processed( prod_filenames, 'PRODUCTION-only' )
        show_all_files_to_be_processed( dev_filenames,  'DEVELOPMENT-only' )
        show_all_files_to_be_processed( any_filenames,  'GENERIC' )
      end
      puts "\r\nThe process, once started cannot be easily stopped. Please verify the above info or press CTRL-C to abort.\r\n==> Press Enter to continue <=="
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
          apply_locally_diff_files_on_db( [filename], db_host, db_user, db_pwd, 'production',  'PRODUCTION-only', diff_dest_path )
        elsif filename =~ /\d{12}dev_/
          apply_locally_diff_files_on_db( [filename],  db_host, db_user, db_pwd, 'development', 'DEVELOPMENT-only', diff_dest_path )
        else
          apply_locally_diff_files_on_db( [filename],  db_host, db_user, db_pwd,  ['production', 'development'], 'GENERIC', diff_dest_path )
        end
      end
      puts "\r\nLOCAL db:diff_apply phase ended."
    end

    # Get all the production-related DB-Diffs:
    all_prod_filenames  = diff_filenames.reject{ |subpathname| dev_filenames.include?( subpathname ) }
    error_file_name = '/tmp/errors.txt'

    # For each production-related DB-diff...
    if all_prod_filenames.size > 0
      puts "\r\nAssuming everything's good. Proceeding with REMOTE phase..."
      puts "There are #{all_prod_filenames.size} files to be processed."
      show_all_files_to_be_processed( all_prod_filenames, '(remote PRODUCTION)' )

      # PROCESS each diff file remotely
      puts "      > Processing each DB-Diff file remotely..."
      on roles(:app) do
        all_prod_filenames.each_with_index do |filename, index|
          info "\r\nUploading file #{ index + 1 }/#{ all_prod_filenames.size }: #{ filename } ..."
          upload! filename, '/tmp/db_diff_upload.sql'
          within release_path do
            execute :mysql, "-h#{ fetch(:db_name_for_config) } -u#{ fetch(:db_user) } --password=\"#{ fetch(:db_password) }\" --database=#{ fetch(:application) } -e \"\\. /tmp/db_diff_upload.sql\" 2> #{ error_file_name }"
            if test("[ -s #{ error_file_name } ]")
              puts "\r\nError(s) intercepted! Aborting..."
              puts "---------8<----------"
              execute :cat, error_file_name
              puts "---------8<----------"
              execute :rm, error_file_name
              exit(1)
            end
          end
          info "Removing remote temp file..."
          execute :rm, '/tmp/db_diff_upload.sql'  # After execution remove temp file on dest host
        end
      end
      puts "\r\nREMOTE diff_apply phase ended."
    end

    # At the end of everything, when we can be quite sure there have been no errors, move ALL the new but tested and applied diff files:
    if diff_filenames.size > 0
      puts "\r\nAssuming everything's good. Proceeding with MOVING phase..."
      puts "Moving all #{diff_filenames.size} DB-diff files in destination path '#{ diff_dest_path }'..."
      diff_filenames.each{ |filename| FileUtils.mv( filename, diff_dest_path ) }
    end

                                                    # Force a db:dump update for each involved DB:
#    if prod_filenames.size > 0 || any_filenames.size > 0
#      db_dump( db_host, db_user, db_pwd, rails_config.database_configuration[ 'production' ]['database'], 'production' )
#    end
#    if dev_filenames.size > 0 || any_filenames.size > 0
#      db_dump( db_host, db_user, db_pwd, rails_config.database_configuration[ 'development' ]['database'], 'development' )
#    end
                                                    # Force db:clone_to_test at the end when Dev DB is modified:
    # ( Assuming current RAILS_ENV == development )
#    Rake::Task['db:clone_to_test'].invoke if dev_filenames.size > 0 || any_filenames.size > 0

    puts "\r\nDone."
  end


  # Dumps each filename string in a verbose format for display purposes.
  #
  def show_all_files_to_be_processed( filenames, dest_name )
    if filenames.size > 0
      puts "\r\n  - #{ dest_name } diffs to be processed:"
      filenames.each { |filename| puts "    #{filename}" }
    end
  end


  # Executes the SQL diff files on the specified db_config_dest.
  #
  # If db_config_dest is an Array, each file will be executed on each item found in the
  # array.
  #
  def apply_locally_diff_files_on_db( filenames, db_host, db_user, db_pwd, db_config_dest, dest_verbose_name )
    if filenames.size > 0
      puts "\r\n\r\n\t** #{ dest_verbose_name } diffs: **"
      error_file_name = File.join(DB_DIFFS_NEW_PATH, 'errors.txt')
      filenames.each do |filename|
        if db_config_dest.instance_of?( Array )            # Multi DB apply:
          db_config_dest.each do |config_name|
            db_name = Rails.configuration.database_configuration[ config_name ]['database']
            execute_file_or_exit( filename, config_name, db_host, db_user, db_pwd, db_name, error_file_name )
          end
                                                    # Single DB apply:
        else
          db_name = Rails.configuration.database_configuration[ db_config_dest ]['database']
          execute_file_or_exit( filename, db_config_dest, db_host, db_user, db_pwd, db_name, error_file_name )
        end
      end
    end
  end


  # Execute the specified SQL file given the parameters and create an error log using
  # error_file_name to check standard error for any result.
  #
  def execute_file_or_exit( filename, config_name, db_host, db_user, db_pwd, db_name, error_file_name )
    puts "\r\nExecuting '#{filename}' on #{config_name} DB (#{db_name})..."
    # Execute the file, creating an error log:
    sh "mysql --host=#{ db_host } --user=#{ db_user } --password=\"#{db_pwd}\" --database=#{ db_name } --execute=\"\\. #{ filename }\" 2> #{ error_file_name }"
    test_locally_error_log_file_for_size_and_abort( error_file_name )
  end


  # Tests locally the file size of error_file_name. Halts in case of non-zero error log file.
  #
  def test_locally_error_log_file_for_size_and_abort( error_file_name )
    # If file size of "errors.txt" > 0, display it, remove it and the abort procedure
    if File.size?( error_file_name )
      puts "\r\nError(s) intercepted! Aborting..."
      puts "---------8<----------"
      sh "cat #{ error_file_name }"
      puts "---------8<----------"
      FileUtils.rm( error_file_name )
      exit(1)
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
