# encoding: utf-8

# == Capistrano helper tasks ==
#
# - author: Steve A.
# - vers. : 6.099
#
# This requires Capistrano v. >= 3.1


namespace :remote do


  # Remote DB:Diff_apply task
  #
  desc <<-DESC
  This performs a custom "db:diff_apply" of all the DB-Diff files stored under
  'goggles_admin/db/diff.new', staging first the changes locally then applying them
  remotely only in case of no-errors.


  === WHAT IT DOES ===

- Runs *locally* the core rake task db:diff_apply.

- In case of errors, this task exits and the error log (stored on file) is shown.

- If no errors are detected, for each DB-Diff file:
  - [LOCAL -> REMOTE] The file is copied to the destination server (typically, under '/tmp')
  - [REMOTE] the file is applied (executed) and tested for errors (again)
  - [REMOTE] (On success) The file is then removed from the remote server

- At the end, on success:
  - [LOCAL]  All DB-diff files are also moved to 'goggles_admin/db/diff.applied'
  - [LOCAL]  The DEV DB dump is updated
  - [REMOTE] A new PROD DB dump is downloaded, ALWAYS (even if the local prod DB
             has not been modified by any of the diff files)


If the web app is in need of a restart after all of this, use a 'deploy:restart'.

All the successfully applied diffs are moved under 'goggles_admin/db/diff.applied'
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

    [skip_download=<0>|1]

When 'rebuild' is set to '1' the rake task 'db:rebuild_from_dump' is lanched at the
beginning for any DB that has to be modified.
The default is to skip this phase, assuming local DBs are currently ready for the
execution of the task.

When 'skip_download' is set to '1' the whole process will skip the remote DB dump
download phase to lighten the bandwidth occupancy. (The remote DB dump is several
MBs in size, so it can take a bit and it can be quite demanding for on a non-LAN
remote connection.)
The default is obviously NOT to skip this phase.

No migrations are run.
It's up to you to have local and remote DB structures up-to-date.

  DESC
  task :db_diff_apply do
    # Environment setup
    db_config       = YAML.load_file( File.join(Dir.pwd, 'config', 'database.yml') )
    diff_src_path   = DB_DIFFS_NEW_PATH
    diff_dest_path  = DB_DIFFS_APPLIED_PATH
    # XXX ASSUMING development configuration for localhost has same access credentials as production (@localhost)
    db_user         = db_config['development']['username']
    db_pwd          = db_config['development']['password']
    db_host         = db_config['development']['host']
                                                    # Get which files are for which destination DB:
    diff_filenames = Dir.glob( [ File.join( diff_src_path, '*.sql') ] ).sort
    prod_filenames = diff_filenames.select{ |subpathname| subpathname =~ /\d{12}prod_/ }
    dev_filenames  = diff_filenames.select{ |subpathname| subpathname =~ /\d{12}dev_/ }
    any_filenames  = diff_filenames.reject{ |subpathname| prod_filenames.include?( subpathname ) || dev_filenames.include?( subpathname ) }
    rebuild        = ENV.include?("rebuild") && (ENV["rebuild"].to_i > 0)
    skip_download  = ENV.include?("skip_download") && (ENV["skip_download"].to_i > 0)

    run_locally do
      puts "\r\n*** remote:db_diff_apply ***"
      puts "\r\nLOCAL staging preparation. If everything we'll be successful, 'prod' files will be also applied remotely."
      # Display some info:
      puts "DB host (@localhost).....: #{ db_host }"
      puts "DB user (@localhost).....: #{ db_user }"
      puts "DB Dump Download phase...: #{ skip_download ? '(skipped)' : 'ENABLED' }"
      puts "Rebuild phase............: #{ rebuild ? 'ENABLED' : '(skipped)' }"
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

      # === On-demand Rebuild phase: ===
                                                    # Force db:rebuild_from_dump for each involved DB:
      if rebuild && (dev_filenames.size > 0 || any_filenames.size > 0)
        local_rebuild_from_dump( DB_DUMP_LOCAL_PATH, 'development', db_config['development']['database'], db_host, db_user, db_pwd )
      end
      if rebuild && (prod_filenames.size > 0 || any_filenames.size > 0)
        # XXX Using dev env allows us to skip lots of config variables needed to
        # launch a working, running prod env locally. Besides, it doesn't matter
        # for the 'db:rebuild_from_dump' rake task.
        local_rebuild_from_dump( DB_DUMP_LOCAL_PATH, 'production', db_config['production']['database'], db_host, db_user, db_pwd )
      end

      # === LOCAL DB-Diff Apply phase: ===

      diff_filenames.each do |filename|             # Apply diffs, respecting order of execution:
        if filename =~ /\d{12}prod_/
          apply_locally_diff_files_on_db( [filename], db_host, db_user, db_pwd, db_config['production']['database'], 'PRODUCTION-only' )
        elsif filename =~ /\d{12}dev_/
          apply_locally_diff_files_on_db( [filename],  db_host, db_user, db_pwd, db_config['development']['database'], 'DEVELOPMENT-only' )
        else
          apply_locally_diff_files_on_db( [filename],  db_host, db_user, db_pwd, [ db_config['production']['database'], db_config['development']['database'] ], 'GENERIC' )
        end
      end
      puts "\r\nLOCAL db:diff_apply phase ended."
    end

    # === REMOTE DB-Diff Apply phase: ===

    # Get all the production-related DB-Diffs:
    all_prod_filenames = diff_filenames.reject{ |subpathname| dev_filenames.include?( subpathname ) }
    stderr_file_name   = '/tmp/std_err_log.txt'

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
          # Upload the SQL DB-Diff file:
          upload! filename, '/tmp/db_diff_upload.sql'
          # Apply the DB-diff on the remote server:
          within release_path do
            execute :mysql, "-h#{ fetch(:db_name_for_config) } -u#{ fetch(:db_user) } --password=\"#{ fetch(:db_password) }\" --database=#{ fetch(:application) } -e \"\\. /tmp/db_diff_upload.sql\" 2> #{ stderr_file_name }"
            # Intercept errors or warnings on the std_err output:
            if test("[ -s #{ stderr_file_name } ]")
              file_lines = capture( :cat, stderr_file_name ).split("\n")
              errors   = file_lines.select{ |line| line =~ /ERROR/i }
              warnings = file_lines.select{ |line| line =~ /Warning/i }
              if errors.size > 0
                puts "\r\nError(s) intercepted!"
                puts "---------8<----------"
                errors.each{ |e| puts e }
                puts "---------8<----------"
                puts "\r\nAborting..."
                exit(1)
              end
              if warnings.size > 0
                puts "\r\nWarning(s) intercepted:"
                puts "---------8<----------"
                warnings.each{ |w| puts w }
                puts "---------8<----------"
                puts "\r\nIgnoring..."
              end
            end
          end
          # After execution remove temp files on dest host:
          info "Removing remote temp files..."
          execute :rm, stderr_file_name
          execute :rm, '/tmp/db_diff_upload.sql'
        end
      end
      puts "\r\nREMOTE diff_apply phase ended."
    end

    # === DB-Diff archival phase: ===

    # At the end of everything, when we can be quite sure there have been no errors, move ALL the new but tested and applied diff files:
    if diff_filenames.size > 0
      puts "\r\nAssuming everything's good. Proceeding with MOVING phase..."
      puts "Moving all #{diff_filenames.size} DB-diff files in destination path '#{ diff_dest_path }'..."
      diff_filenames.each{ |filename| FileUtils.mv( filename, diff_dest_path ) }
    end

    # === DB dump update phase: ===
                                                    # Force a db:dump update for each involved DB:
    if dev_filenames.size > 0 || any_filenames.size > 0
      # Update local dev DB dump:
      local_db_dump( DB_DUMP_LOCAL_PATH, db_host, db_user, db_pwd, db_config['development']['database'], 'development' )
      # Update local test DB dump by cloning dev DB on test DB:
      local_rebuild_from_dump( DB_DUMP_LOCAL_PATH, 'development', db_config['test']['database'], db_host, db_user, db_pwd )
    end

    unless skip_download
      puts "\r\nAlmost done: getting an updated remote PRODUCTION dump...\r\n"
      invoke "db:remote:sql_dump"
    else
      puts "\r\nRemote PRODUCTION dump download skipped by request.\r\nDone.\r\n"
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Dumps each filename string in a verbose format for display purposes.
  #
  def show_all_files_to_be_processed( filenames, dest_name )
    if filenames.size > 0
      puts "\r\n  - #{ dest_name } diffs to be processed:"
      filenames.each { |filename| puts "    #{filename}" }
    end
  end


  # Executes the SQL diff files on the specified db_dest_names.
  #
  # If db_dest_names is an Array, each file will be executed on each item found in the
  # array.
  #
  def apply_locally_diff_files_on_db( filenames, db_host, db_user, db_pwd, db_dest_names, dest_verbose_name )
    if filenames.size > 0
      puts "\r\n\r\n\t** LOCAL Staging DB-DIFF APPLY: #{ dest_verbose_name } **"
      filenames.each do |filename|
        if db_dest_names.instance_of?( Array )      # Multi DB apply:
          db_dest_names.each do |db_name|
            execute_file_or_exit( filename, db_host, db_user, db_pwd, db_name )
          end
                                                    # Single DB apply:
        else
          execute_file_or_exit( filename, db_host, db_user, db_pwd, db_dest_names )
        end
      end
    end
  end


  # Execute the specified SQL file given the parameters and create an error log
  # in order to check at the end the standard error output for any result.
  #
  def execute_file_or_exit( filename, db_host, db_user, db_pwd, db_name )
    puts "\r\nExecuting '#{filename}' on DB #{db_name}..."
    stderr_file_name  = File.join(DB_DIFFS_NEW_PATH, 'std_err_log.txt')
    run_locally do
      # Execute the file, creating an error log:
      execute :mysql, "--host=#{ db_host } --user=#{ db_user } --password=\"#{db_pwd}\" --database=#{ db_name } --execute=\"\\. #{ filename }\" 2> #{ stderr_file_name }"
    end
    test_locally_error_log_file_for_size_and_abort( stderr_file_name )
  end


  # Tests locally the file size of stderr_file_name. Halts in case of non-zero error log file.
  #
  def test_locally_error_log_file_for_size_and_abort( stderr_file_name )
    run_locally do
      # If file size of stderr_file_name > 0, extract actual errors and warnings,
      # display them, remove the files and abort the procedure in case of errors:
      if File.size?( stderr_file_name )
        puts "\r\nStderr not clear, checking output..."
        file_lines = File.open( stderr_file_name ).read.split("\n")
        errors   = file_lines.select{ |line| line =~ /ERROR/i }
        warnings = file_lines.select{ |line| line =~ /Warning/i }
        if errors.size > 0
          puts "\r\nError(s) intercepted!"
          puts "---------8<----------"
          errors.each{ |e| puts e }
          puts "---------8<----------"
          puts "\r\nAborting..."
          # Before exit, remove the created temp log file:
          FileUtils.rm( stderr_file_name )
          exit(1)
        end
        if warnings.size > 0
          puts "\r\nWarning(s) intercepted:"
          puts "---------8<----------"
          warnings.each{ |w| puts w }
          puts "---------8<----------"
          puts "\r\nIgnoring..."
        end
      end
      # At the end, remove the created temp log file:
      FileUtils.rm( stderr_file_name )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Performs the actual operations required for a DB dump update given the specified
  # parameters but only LOCALLY, in the context of Capistrano.
  #
  # Note that the dump takes the name of the Environment configuration section.
  #
  def local_db_dump( db_dump_dir, db_host, db_user, db_pwd, db_name, dump_basename )
    puts "\r\nUpdating recovery dump '#{ dump_basename }' (from #{db_name} DB)..."
    zip_pipe = ' | bzip2 -c'
    file_ext = '.sql.bz2'                           # Display some info:
    puts "DB name: #{ db_name }"
    puts "DB user: #{ db_user }"
    file_name = File.join( db_dump_dir, "#{ dump_basename }#{ file_ext }" )
    puts "\r\nProcessing #{ db_name } => #{ file_name } ...\r\n"
    # To disable extended inserts, add this option: --skip-extended-insert
    # (The Resulting SQL file will be much longer, though -- but the bzipped
    #  version can result more compressed due to the replicated strings, and it is
    #  indeed much more readable and editable...)
    run_locally do
      execute :mysqldump, "--host=#{ db_host } -u #{ db_user } --password=\"#{db_pwd}\" -l --triggers --routines -i --skip-extended-insert --no-autocommit --single-transaction #{ db_name } #{ zip_pipe } > #{ file_name }"
    end
    puts "\r\nRecovery dump created.\r\n\r\n"
  end
  #-- -------------------------------------------------------------------------
  #++


  # Performs the actual sequence of operations required by a single db:rebuild_from_dump
  # task, given the specified parameters but only LOCALLY, in the context of Capistrano.
  #
  # The source_basename comes from the name of the file dump.
  # Note that the dump takes the name of the Environment configuration section.
  #
  def local_rebuild_from_dump( db_dump_dir, source_basename, output_db, db_host, db_user, db_pwd, file_ext = '.sql.bz2' )
    puts "\r\nRebuilding..."
    puts "DB name: #{ source_basename } (dump) => #{ output_db } (DEST)"
    puts "DB user: #{ db_user }"

    file_name = File.join( db_dump_dir, "#{ source_basename }#{ file_ext }" )
    sql_file_name = File.join( 'tmp', "#{ source_basename }.sql" )

    run_locally do
      puts "\r\nUncompressing dump file '#{ file_name }' => '#{ sql_file_name }'..."
      execute :bunzip2, "-ck #{ file_name } > #{ sql_file_name }"

      puts "\r\nDropping destination DB '#{ output_db }'..."
      execute :mysql, "--host=#{ db_host } --user=#{ db_user } --password=\"#{db_pwd}\" --execute=\"drop database if exists #{ output_db }\""
      puts "\r\nRecreating destination DB..."
      execute :mysql, "--host=#{ db_host } --user=#{ db_user } --password=\"#{db_pwd}\" --execute=\"create database #{ output_db }\""

      puts "\r\nExecuting '#{ file_name }' on #{ output_db }..."
      execute :mysql, "--host=#{ db_host } --user=#{ db_user } --password=\"#{db_pwd}\" --database=#{ output_db } --execute=\"\\. #{ sql_file_name }\""
      puts "Deleting uncompressed file '#{ sql_file_name }'..."
      FileUtils.rm( sql_file_name )
    end

    puts "Rebuild from dump for '#{ source_basename }', done.\r\n\r\n"
  end
  #-- -------------------------------------------------------------------------
  #++
end
