# encoding: utf-8

# == Capistrano helper tasks ==
#
# - author: Steve A.
# - vers. : 6.083
#
# This requires Capistrano v. >= 3.1
require "erb"


namespace :db do
  namespace :setup do

    # Allows creation of a custom database.yml file, specific for each deployment,
    # asking the specific MySQL password before file creation.
    #
    # Based upon an original extension recipe by Simone Carletti.
    # http://www.simonecarletti.com/blog/2009/06/capistrano-and-database-yml/
    #
    desc <<-DESC
      Creates the database.yml configuration file in shared path.

      By default, this task uses a template unless a template
      called database.yml.erb is found either inside :template_dir
      or /config/deploy folders. The default template matches
      the template for config/database.yml file shipped with Rails.

      This task is automatically invoked after a deploy:setup, unless the
      :skip_db_setup variable is set to true.

      The internal template used to build the database configuration file can be
      overridden placing a 'database.yml.erb' file inside the 'config/deploy'
      subfolder.

      The user for the db connection can be configured accordingly by editing this
      deploy recipe.
    DESC
    task :config do
      puts "      > Setup remote database.yml..."
      on roles(:app) do |host|
        default_template = <<-EOF
production:
  database: #{fetch(:application)}
  adapter: mysql2
  encoding: utf8
  host: #{fetch(:db_name_for_config)}
  port: 3306
  username: #{fetch(:db_user)}
  password: #{fetch(:db_password)}
#  pool: 5
#  timeout: 5000
#  socket: #{fetch(:socket_path)}/mysql/mysql.sock
EOF
        location = fetch(:template_dir, "config/deploy") + '/database.yml.erb'
        template = File.file?(location) ? File.read(location) : default_template
        config = ERB.new(template)
        run_locally do                              # Render the template to a temp file:
          File.open('/tmp/database.yml', 'w') do |file|
            file.puts config.result(binding)
          end
        end
                                                    # Make sure directory exists and upload the file
        within shared_path do
          execute :mkdir, "-p config"
        end
        upload! '/tmp/database.yml', "#{shared_path}/config/database.yml"

        run_locally do                              # Remove the local temp file:
          puts "      > Removing local temp file..."
          execute :rm, "/tmp/database.yml"
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  namespace :remote do

    # Remote Production DB data upload tool.
    #
    desc <<-DESC
      Executes on the Database server a specified SQL file, using the production database.

      Please note that this task will ASSUME PRODUCTION DATABASE ALREADY EXISTS! (The task
      uses the --database parameter of the mysql shell.)

      If the SQL statement has to be executed on a not-yet existent production database,
      run the migrations or "rake db:schema:load" locally first, to create the table structure.
      (This is possible on the remote app server only if the cofingured application's database
      user has enough privileges to create a whole new database from scratch.)

      If the script already contains a specific "create database" statement, use
      the task :sql_exec instead, since the latter does not specify the target database.
    DESC
    task :sql_upload do
      puts "      > Launching db:remote:sql_upload..."
      on roles(:app) do
        file_name = fetch(:ask_src_sql_file_path)
        info "Uploading file..."
        upload! file_name, '/tmp/db_upload.sql'
        within release_path do
          execute :mysql, "-h#{fetch(:db_name_for_config)} -u#{fetch(:db_user)} --password=\"#{fetch(:db_password)}\" --database=#{fetch(:application)} -e \"\\. /tmp/db_upload.sql\""
        end
        info "Removing remote temp file..."
        execute :rm, '/tmp/db_upload.sql'           # After execution remove temp file on dest host
      end
      puts "      db:remote:sql_upload done."
    end
    #-- -----------------------------------------------------------------------
    #++


    # Remote *generic* DB plain SQL execution tool.
    #
    desc <<-DESC
      Executes on the Database server the specified SQL file, assuming it contains the
      'use <database_name>' statement to specify which target DB will be addressed.

      To upload and execute a compressed dump file, use the dedicated task instead.
    DESC
    task :sql_exec do
      puts "      > Launching db:remote:sql_exec..."
      on roles(:app) do
        file_name = fetch(:ask_src_sql_file_path)

        info "Uploading file..."
        upload! file_name, "/tmp/invitation.xhtml"
        within release_path do
          execute :mysql, "-h#{fetch(:db_name_for_config)} -u#{fetch(:db_user)} --password=\"#{fetch(:db_password)}\" -e \"\\. /tmp/db_upload.sql\""
        end
        info "Removing remote temp file..."
        execute :rm, '/tmp/db_upload.sql'           # After execution remove temp file on dest host
      end
      puts "      db:remote:sql_exec done."
    end
    #-- -----------------------------------------------------------------------
    #++


    # Remote DB dump uloader & executor.
    #
    desc <<-DESC
      Uploads the local production recovery dump to the server and executes it.
      (By default, the dump is assumed to be stored as 'db/dump/production.sql.bz2')

      This will in turn:
      - upload the local, compressed production dump;
      - stop Apache
      - expand the file
      - drop the production DB
      - recreate the empty DB
      - execute the uncompressed dump file on the new, empty, production DB
      - remove the temp. unzipped file
      - start Apache
      - clear the cache (so that each cached page will receive new data)

      This remote Capistrano task may prove useful each time a production dump has
      been updated locally but a new release of the app has not been scheduled for
      a while.

      (The alternative method to upload a recovery dump is to use the other
       similar task 'db:remote:retrieve_and_rebuild_db', which WGETs the dump
       directly from its copy pushed on the 'goggles_admin' repo.)

Options:
      [from=any_full_path_to_sql_bz2_file|<'(Rails.root)/db/dump/production.sql.bz2'>]

    DESC
    task :dump_upload do
      source_file = ENV.include?("from") ? ENV["from"] : File.join( Dir.pwd, 'db', 'dump', 'production.sql.bz2' )
      # [Steve, 20161031] Not needed anymore:
#      ssh_keys = fetch(:ssh_keys)
#      use_pem_certificate = (ssh_keys.first =~ /\.pem$/)

      on roles(:app) do
        info "Uploading file '#{ source_file }'..."
        upload! source_file, '/tmp/production.sql.bz2'

        info "Shutting down Apache during the rebuild..."
        execute '/etc/init.d/apache2 stop'

        # [Steve, 20160203] This is the same as invoking "cap remote:tmp_clear"
        within release_path do
          with rails_env: :production do
            rake "tmp:clear"
          end
        end

        info "Unzipping remote temp file..."
        execute :bunzip2, '-c /tmp/production.sql.bz2 > /tmp/production.sql'
        info "Removing remote compressed file..."
        execute :rm, '/tmp/production.sql.bz2'

        info "Dropping production DB..."
        execute :mysql, "-h#{fetch(:db_name_for_config)} -u#{fetch(:db_user)} --password=\"#{fetch(:db_password)}\" --execute=\"drop database if exists #{ fetch(:application) }\""
        info "Recreating production DB..."
        execute :mysql, "-h#{fetch(:db_name_for_config)} -u#{fetch(:db_user)} --password=\"#{fetch(:db_password)}\" --execute=\"create database #{ fetch(:application) }\""
        info "Executing remote extracted file..."
        execute :mysql, "-h#{fetch(:db_name_for_config)} -u#{fetch(:db_user)} --password=\"#{fetch(:db_password)}\" --database=#{ fetch(:application) } -e \"\\. /tmp/production.sql\""

        info "Removing remote temp dump file..."
        execute :rm, '/tmp/production.sql'          # After execution remove temp file on dest host

        info "Restarting Apache..."
        execute '/etc/init.d/apache2 start'
      end
      puts "\r\nDone."
    end
    #-- -----------------------------------------------------------------------
    #++


    # Remote DB dump uloader & executor.
    #
    desc <<-DESC
      Similarly to 'db:remote:sql_dump', this will execute a 'db:rebuild_from_dump'
      retrieving the dump directly from the 'goggles_admin' repo instead of a local
      directory.
    DESC
    task :retrieve_and_rebuild_db do
      on roles(:app) do
        as( user: :root ) do
          info "Clearing existing dumps (otherwise WGET may create additional copies)..."
          within File.join(release_path, "db", "dump") do
            execute :rm, 'production*'
          end

          info "Retrieving the dump from the repo..."
          within File.join(release_path, "db", "dump") do
            execute :wget, "-q https://raw.githubusercontent.com/steveoro/goggles_admin/master/db/dump/production.sql.bz2"
            info "DB dump retrieved."
          end
          info "Shutting down Apache during the rebuild..."
          execute 'service apache2 stop'

          info "Clearing tmp dir with cache..."
          # [Steve, 20160203] This is the same as invoking "cap remote:tmp_clear"
          within release_path do
            with rails_env: :production do
              rake "tmp:clear"
            end
          end

          info "Running rebuild from dump..."
          within release_path do
            with rails_env: :production do
              rake "db:rebuild_from_dump from=production to=production"
            end
          end

          info "Restarting Web server..."
          execute fetch(:cmd_web_restart)
        end
      end
      puts "\r\nDone."
    end
    #-- -----------------------------------------------------------------------
    #++


    # Remote DB dump & retrieval tool.
    #
    desc <<-DESC
      Retrieves a full dump of the remote production Database.

      The dump is executed remotely, archived temporarely as a bzipped SQL file,
      retrieved and saved locally in a prompted directory.
    DESC
    task :sql_dump do
      puts "      > Launching db:remote:sql_dump..."
      zip_pipe = ' | bzip2 -c'
      file_name = "#{fetch(:application)}-#{release_timestamp}.sql.bz2"
      dest_path = fetch(:ask_dest_sql_path)

      run_locally do
        if test("[ -d #{dest_path} ]")
          puts "      > Directory #{dest_path} found."
        else
          puts "      > Directory #{dest_path} is missing locally."
          puts "      > Safely (re)creating directory before downloading dump file..."
          execute :mkdir, "-p #{dest_path}"
        end
      end
      on roles(:app) do
        puts "      > Executing the SQL dump..."
        # To disable extended inserts, add this option: --skip-extended-insert
        # (The Resulting SQL file will be much longer, though -- but the bzipped
        #  version can result more compressed due to the replicated strings, and it is
        #  indeed much more readable and editable...)
        execute :mysqldump, "-h#{fetch(:db_name_for_config)} -u#{fetch(:db_user)} --password=\"#{fetch(:db_password)}\" -l -f --triggers --routines -i --skip-extended-insert --no-autocommit --single-transaction #{fetch(:application)} #{zip_pipe} > /tmp/#{file_name}"
        info "Retrieving the file..."
        download! "/tmp/#{file_name}", File.join(dest_path, file_name)
        info "Removing remote temp file..."
        execute :rm, "/tmp/#{file_name}"
      end
      # Copy the downloaded db dump into its rightful destination:
      run_locally do
        info "Copying the downloaded dump also into dump dir (ready to be committed & pushed to the repo)..."
        execute :cp, "#{ File.join(dest_path, file_name) } #{ File.join(DB_DUMP_LOCAL_PATH, 'production.sql.bz2') }"
      end
      puts "      db:remote:sql_dump done."
    end
    #-- -----------------------------------------------------------------------
    #++


    # Remote DB DIFF-dump w/ retrieval tool.
    #
    desc <<-DESC
      Retrieves a DIFF SQL-dump of the remote production Database.
      Copies all user-content generated data, logged on "logs/ugc_*.log", plus
      executes a full table dump of the 'friendships' table, which is not loggable.

      The dump is executed remotely, archived temporarely as a bzipped SQL file,
      retrieved and saved locally in the prompted, local destination directory.
    DESC
    task :sql_diff_dump do
      puts "      > Launching db:remote:sql_diff_dump..."
      zip_pipe = ' | bzip2 -c'
      file_name = "#{fetch(:application)}-#{release_timestamp}-friendships.sql.bz2"
      dest_path = fetch(:ask_dest_sql_path)

      run_locally do
        if test("[ -d #{dest_path} ]")
          puts "      > Directory #{dest_path} found."
        else
          puts "      > Directory #{dest_path} is missing locally."
          puts "      > Safely (re)creating directory before downloading the files..."
          execute :mkdir, "-p #{dest_path}"
        end
      end
      on roles(:app) do |host|
        puts "      > Executing the SQL dump for 'friendships', 'news_feeds' and 'articles' tables..."
        # To disable extended inserts, add this option: --skip-extended-insert
        # (The Resulting SQL file will be much longer, though -- but the bzipped
        #  version can result more compressed due to the replicated strings, and it is
        #  indeed much more readable and editable...)
        execute :mysqldump, "-h#{fetch(:db_name_for_config)} -u#{fetch(:db_user)} --password=\"#{fetch(:db_password)}\" -l -f --triggers --routines -i --skip-extended-insert --no-autocommit --tables --single-transaction #{fetch(:application)} articles friendships news_feeds admins #{zip_pipe} > /tmp/#{file_name}"
        info "Retrieving the file..."
        download! "/tmp/#{file_name}", File.join(dest_path, file_name)
        info "Removing remote temp file..."
        execute :rm, "/tmp/#{file_name}"

        ugc_log_files = File.join( shared_path, 'log/ugc_*.log' )
        ssh_keys = fetch(:ssh_keys)
        use_pem_certificate = (ssh_keys.first =~ /\.pem$/)
        info "Searching for User-Generated-Content log files as #{ugc_log_files}..."

        if test("[ ! -z \"$(ls -1 #{ugc_log_files})\" ]")
          info "UGC log files found!"
          run_locally do
            puts "      > Copying remote UGC log files..."
            if use_pem_certificate
              execute :scp, "-i #{ssh_keys.first} -Cp root@#{host}:#{ugc_log_files} #{dest_path}"
            else
              execute :scp, "-Cp root@#{host}:#{ugc_log_files} #{dest_path}"
            end
          end
        else
          info "NO UGC log files found on #{host}: nothing to do."
        end

      end
      puts "      > db:remote:sql_diff_dump done."
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end


# Custom hooks:
before 'deploy:check:linked_files', 'db:setup:config'
