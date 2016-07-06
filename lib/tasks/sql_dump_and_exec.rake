=begin

= DB SQL dump & exec maintenance tasks

  - Goggles framework vers.:  5.00
  - author: Steve A.

  (ASSUMES TO BE rakeD inside Rails.root)

=end
#-- ---------------------------------------------------------------------------
#++


namespace :sql do

  desc <<-DESC
  Creates a bzipped MySQL dump of the whole DB or just of a few tables, rotating the backups.

Options: [db_version=<db_struct_version>] [bzip2=<1>|0]
         [output_dir=#{DB_BACKUP_DIR}] [max_backup_kept=#{MAX_BACKUP_KEPT}] [Rails.env=#{Rails.env}]
  DESC
  task( dump: [:check_needed_dirs] ) do
    puts "*** Task: SQL DB dump ***"
                                                    # Prepare & check configuration:
    rails_config  = Rails.configuration
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    db_host       = rails_config.database_configuration[Rails.env]['host']

# TODO [FUTUREDEV] get current version from app_parameter table
    db_version    = ENV.include?("db_version") ? ENV['db_version'] + '.' + DateTime.now.strftime("%Y%m%d.%H%M") : 'backup' + '.' + DateTime.now.strftime("%Y%m%d.%H%M%S")
    max_backups   = ENV.include?("max_backup_kept") ? ENV["max_backup_kept"].to_i : MAX_BACKUP_KEPT
    backup_folder = ENV.include?("output_dir") ? ENV["output_dir"] : DB_BACKUP_DIR
                                                    # Compress output? (Default = yes)
    unless ( ENV.include?("bzip2") && (ENV["bzip2"].to_i < 1) )
      zip_pipe = ' | bzip2 -c'
      file_ext = '.sql.bz2'
    else
      zip_pipe = ''
      file_ext = '.sql'
    end
                                                    # Display some info:
    puts "DB name:          #{db_name}"
    puts "version code:     #{db_version}"
    puts "DB user:          #{db_user}"
    puts "extracted tables: " + ( ENV.include?("tables") ? tables : "(entire DB)" )
    file_name = File.join( backup_folder, ( ENV.include?("tables") ? "#{db_name}-update-tables#{file_ext}" : "#{db_name}-#{db_version}#{file_ext}" ) )
    puts "Creating #{file_name} ...\r\n"
    sh "mysqldump --host=#{db_host} -u #{db_user} --password=\"#{db_pwd}\" --add-drop-database --add-drop-table --extended-insert --triggers --routines --comments -c -i --no-autocommit --single-transaction -B #{db_name} #{zip_pipe} > #{file_name}"

                                                    # Rotate the backups leaving only the newest ones:
    rotate_backups( backup_folder, max_backups )
    puts "Dump done.\r\n\r\n"
  end
  #-- -------------------------------------------------------------------------
  #++


  desc <<-DESC
  Executes all the SQL scripts ('*.sql') found in a special directory (usually for data seed).
Allows also to clear the executed files afterwards.

Options: [exec_dir=#{DB_SEED_DIR}] [delete=1|<0>]

- 'exec_dir' is the path where the files are found
- 'delete' allows to kill the executed file after completion; defaults to '0' (false)

  DESC
  task( exec: [:check_needed_dirs] ) do
    puts "*** Task: SQL script execute ***"
                                                    # Prepare & check configuration:
    rails_config  = Rails.configuration
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    db_host       = rails_config.database_configuration[Rails.env]['host']
    exec_folder = ENV.include?("exec_dir") ? ENV["exec_dir"] : DB_SEED_DIR
                                                    # Display some info:
    puts "DB name:      #{db_name}"
    puts "DB user:      #{db_user}"

    if File.directory?( exec_folder )               # If directory exists, scan it and execute each SQL file found:
      puts "\r\n- Processing directory: '#{exec_folder}'..."
                                                    # For each file match in pathname recursively do "process file":
      Dir.glob( File.join(exec_folder, '*.sql'), File::FNM_PATHNAME ).sort.each do |subpathname|
        puts "executing '#{subpathname}'..."
        sh "mysql --host=#{db_host} --user=#{db_user} --password=\"#{db_pwd}\" --database=#{db_name} --execute=\"\\. #{subpathname}\""
        # TODO Eventually, capture output to a log file somewhere
                                                    # Kill the file if asked to do so:
        if ( ENV.include?("delete") && ENV.include?("delete") == '1' )
          puts "deleting '#{subpathname}'."
          FileUtils.rm( subpathname )
        end
      end
    else
      puts "Can't find directory '#{exec_folder}'! Nothing to do..."
    end

    puts "SQL script execute done.\r\n\r\n"
  end
  #-- -------------------------------------------------------------------------
  #++
end
