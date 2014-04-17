# == Capistrano helper tasks ==
#
# - author: Steve A.
# - vers. : 4.00.223.20140415
#
# This requires Capistrano v. >= 3.1
require "erb"


namespace :db do
  namespace :remote do

    # Allows creation of a custom database.yml file, specific for each deployment,
    # asking the specific MySQL password before file creation.
    #
    # Based upon an original extension recipe by Simone Carletti.
    # http://www.simonecarletti.com/blog/2009/06/capistrano-and-database-yml/
    #
    desc <<-DESC
      Creates the database.yml configuration file in shared path.

      By default, this task uses a template unless a template \
      called database.yml.erb is found either inside :template_dir \
      or /config/deploy folders. The default template matches \
      the template for config/database.yml file shipped with Rails.

      This task is automatically invoked after a deploy:setup, unless the
      :skip_db_setup variable is set to true.

      The internal template used to build the database configuration file can be
      overridden placing a 'database.yml.erb' file inside the 'config/deploy' subfolder.

      The user for the db connection can be configured accordingly by editing this deploy recipe.
    DESC
    task :setup do
      on roles(:app) do |host|
        pwd_prompt = "Enter MySQL database password for '#{mysql_user}': "
        default_template = <<-EOF
base: &base
  adapter: mysql2
  encoding: utf8
  host: #{production_db_name}
  port: 3306
  username: #{mysql_user}
  password: #{ask(pwd_prompt)}
#  pool: 5
#  timeout: 5000
#  socket: #{socket_path}/mysql/mysql.sock

development:
  database: #{application}_development
  <<: *base

test:
  database: #{application}_test
  <<: *base

production:
  database: #{application}
<<: *base
EOF

        location = fetch(:template_dir, "config/deploy") + '/database.yml.erb'
        template = File.file?(location) ? File.read(location) : default_template
        config = ERB.new(template)
        execute :mkdir, "-p #{shared_path}/db"
        execute :mkdir, "-p #{shared_path}/config"
        put config.result(binding), "#{shared_path}/config/database.yml"
      end
    end
    # --------------------------------------------------------------------------


    desc "Recreates the symlink for database.yml file to the just deployed release."
    task :create_symlink do
      on roles(:app) do
        execute :ln, "-nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
      end
    end
    # --------------------------------------------------------------------------


    desc "Invokes rake db:schema:load into the remote app server."
    task :schema_load do
      on roles(:app) do
        within release_path do
          rake "db:schema:load"
        end
      end
    end
    # --------------------------------------------------------------------------


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

      If the script already contains a specific "create database" statement, use the task :sql_exec
      instead, since the latter does not specify the target database.
    DESC
    task :sql_upload do
      pwd_prompt = "Enter MySQL database password for '#{user}': "
      local_file_path = ask("Enter the local path to the SQL file to be executed remotely: ")
      put File.read(local_file_path), "/tmp/db_upload.sql"
      on roles(:app) do
        within release_path do
          execute :mysql, "--database=#{application} --user=#{user} -p#{ask(pwd_prompt)} -e \"\\. /tmp/db_upload.sql\""
        end
      end
    end
    # --------------------------------------------------------------------------


    # Remote *generic* DB SQL execution tool.
    #
    desc <<-DESC
      Executes on the Database server a specified SQL file, assuming it contains the 'use <database_name>'
      statement to specify which target DB will be addressed.

      This is actually useful to re-create from scratch any database using a previously
      prepared SQL dump that will be executed with this task on the Database server.
    DESC
    task :sql_exec do
      pwd_prompt = "Enter MySQL database password for '#{user}': "
      local_file_path = ask("Enter the local path to the SQL file to be executed remotely: ")
      put File.read(local_file_path), "/tmp/db_upload.sql"
      on roles(:app) do
        within release_path do
          execute :mysql, "--user=#{user} -p#{ask(pwd_prompt)} -e \"\\. /tmp/db_upload.sql\""
        end
      end
    end
    # --------------------------------------------------------------------------


    # Remote DB dump & retrieval tool.
    #
    desc <<-DESC
      Retrieves a full dump of the remote production Database.

      The dump is executed remotely, archived temporarely as a bzipped SQL file,
      retrieved and saved locally in a prompted directory.
    DESC
    task :sql_dump do
      pwd_prompt = "Enter MySQL database password for '#{user}': "
      zip_pipe = ' | bzip2 -c'
      file_name = "#{application}-SQL_dump.sql.bz2"
      local_file_path = Capistrano::CLI.ui.ask("Enter the destination path (no filename) for the SQL dump file: ") || "."

      puts "Executing the SQL dump..."
      run "mysqldump -u #{user} -p#{Capistrano::CLI.ui.ask(pwd_prompt)} --add-drop-database --add-drop-table --triggers --routines --comments -c -i --no-autocommit --single-transaction -B #{application} #{zip_pipe} > /tmp/#{file_name}"

      puts "Retrieving the file..."
      get "/tmp/#{file_name}", File.join(local_file_path, file_name)

      puts "Removing remote temp file..."
      run "#{try_sudo} rm /tmp/#{file_name}"
      puts "Done."
    end
    # --------------------------------------------------------------------------
  end
  # ---------------------------------------------------------------------------
end
