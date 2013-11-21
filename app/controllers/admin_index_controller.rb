# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'open3'                                     # Used to capture & send STDIN/STDOUT
require 'common/format'


class AdminIndexController < ApplicationController

  layout 'admin_index'

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_admin!
  # ---------------------------------------------------------------------------


  # Allows the display of the parameter :console_output, when defined and not empty
  #
  def index
    @console_output = params[:console_output]
    output_folder = File.join( File.join(Rails.root, 'public'), 'output' )
    @existing_output_files = Dir.glob( File.join(output_folder, '*'), File::FNM_PATHNAME ).sort
  end
  # ---------------------------------------------------------------------------


  # Executes a full mysqldump command.
  #
  def download_db_dump
    execute_mysqldump_with_send_file()
  end

  def download_team_dump
    execute_mysqldump_with_send_file( ['teams', 'team_affiliations', 'data_import_team_aliases', 'cities'] )
  end

  def download_swimmer_dump
    execute_mysqldump_with_send_file( ['swimmers', 'badges'] )
  end

  def download_user_dump
    execute_mysqldump_with_send_file( ['users', 'admins'] )
  end
  # ---------------------------------------------------------------------------

  def cleanup_output_dir
    output_folder = File.join( File.join(Rails.root, 'public'), 'output' )
    FileUtils.rm( Dir.glob(File.join(output_folder,'*')) )
    redirect_to goggles_admin_index_path()
  end
  # ---------------------------------------------------------------------------


  def run_rake
    execute_cmd( 'rake', params[:rake_cmd] )
  end

  def run_bundle
    execute_cmd( 'bundle', params[:bundle_cmd] )
  end

  def run_sudo_command
    execute_sudo_cmd( params[:sudo_cmd], params[:password] )
  end
  # ---------------------------------------------------------------------------


  def run_src_upgrade
    # TODO !!!
    flash[:error] = I18n.t(:req_functionality_under_development)
    redirect_to goggles_admin_index_path()
  end
  # ---------------------------------------------------------------------------


  private


  # Executes the specified command name with its parameters on the running server.
  #
  def execute_cmd( cmd_name, parameters )
    @console_output = ''
    if request.post?
      command_line = "#{cmd_name} #{parameters}"
      output = `#{command_line}`
                                                    # Log what the admin has been doing:
      logger.info( "\r\n---- run_cmd( #{cmd_name}, #{parameters} ) ----" )
      logger.info( "Logging #{current_admin.name} executing \"#{command_line}\" in '#{Dir.pwd}'...\r\n" )
      if $?.success?
        @console_output = "Executing \"#{command_line}\" in '#{Dir.pwd}'...\r\n"
        @console_output << output
      else
        @console_output << "Execution of \"#{command_line}\" (in '#{Dir.pwd}') FAILED!"
      end
    end
  end
  # ---------------------------------------------------------------------------


  # Executes the specified command_line on the running server with sudo priviledges.
  #
  def execute_sudo_cmd( command_line, password )
    @console_output = ''
    if request.post?
      output = ''
      Open3.popen2( "sudo #{command_line}" ) { |i, o, t|
        i.puts "#{password}\r\n"
        i.close
        output << o.gets
      }
                                                    # Log what the admin has been doing:
      logger.info( "\r\n---- run_sudo_cmd( #{command_line} ) ----" )
      logger.info( "Logging #{current_admin.name} executing \"sudo #{command_line}\"...\r\n" )
      logger.info( output )
      @console_output = "Executing \"sudo #{command_line}\"...\r\n"
      @console_output << output
    end
  end
  # ---------------------------------------------------------------------------


  # Executes the mysqldump command.
  #
  def execute_mysqldump_with_send_file( table_names = nil )
    rails_config  = Rails.configuration
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    zip_pipe      = ' | bzip2 -c'
    file_ext      = '.sql.bz2'
    db_version    = Version::DB + '.' + DateTime.now.strftime("%Y%m%d.%H%M")
    output_folder = File.join( File.join(Rails.root, 'public'), 'output' )
    file_name     = File.join( output_folder, "#{db_name}" )
                                                    # Prepare and execute the mysqldump command:
    command_line = "mysqldump -u #{db_user} -p#{db_pwd} --no-autocommit --single-transaction --extended-insert --triggers --routines --comments "
    if table_names.instance_of?(Array) && (table_names.size > 0)
      command_line << "--tables #{db_name} #{table_names.join(' ')}"
      file_name << "_#{table_names[0]}"
    else
      command_line << "-B #{db_name}"
    end
    file_name << "-#{db_version}#{file_ext}"
                                                    # Do the actual run and capture the output:
    output = `#{command_line} #{zip_pipe} > #{file_name}`
                                                    # Log what the admin has been doing:
    logger.info( "\r\n---- run_mysqldump_with_send_file( #{ table_names ? table_names[0] : 'FULL DUMP'} ) ----" )
    logger.info( "Logging #{current_admin.name} executing \"#{command_line}\" in '#{Dir.pwd}'...\r\n" )
    logger.info( output )
    if $?.success?
      logger.info( "Done!" )
    else
      logger.error( "Execution FAILED!" )
    end

    if File.exists?( file_name )
      send_file( file_name )
    else
      flash[:error] = I18n.t(:file_not_created_for_some_reason)
      redirect_to goggles_admin_index_path( :console_output => output )
    end
  end
  # ---------------------------------------------------------------------------
end
