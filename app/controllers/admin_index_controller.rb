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
  # === Params:
  # - :console_output => when not nil can be a string text to be displayed,
  #   containing the captured console output from the previous command execution
  #   (that has then redirected the server here).
  #
  def index
    @console_output = params[:console_output]
    output_folder = File.join( File.join(Rails.root, 'public'), 'output' )
    @existing_output_files = Dir.glob( File.join(output_folder, '*'), File::FNM_PATHNAME ).sort
  end
  # ---------------------------------------------------------------------------


  # Allows to upload and execute a compressed SQL dump of the whole
  # database.
  #
  # === Params:
  # - :datafile => the uploaded file (mandatory on POST)
  # - :console_output => when not nil can be a string text to be displayed,
  #   containing the captured console output from the previous command execution
  #   (that has then redirected the server here).
  #
  def upload_db_dump
# DEBUG
    logger.debug "\r\n\r\n!! ------ upload_db_dump() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    @console_output = ''
    @filename_to_be_run = nil
    if request.post?
      if params[:datafile]
        tmp_file = params[:datafile].tempfile         # (This is an ActionDispatch::Http::UploadedFile object)
        filename = File.join( "public/uploads", params[:datafile].original_filename )
        FileUtils.cp tmp_file.path, filename
        ext = File.extname( filename )
        zip_pipe = nil

        case ext
        when '.bz2'
          zip_pipe = 'bzip2 -d '
        when '.tgz'
          zip_pipe = 'gzip -d '
        when '.zip'
          zip_pipe = 'unzip '
        when '.sql'
          zip_pipe = nil
        else
          flash[:notice] = I18n.t(:unsupported_file_format, {:scope=>[:admin_index]})
          redirect_to( goggles_admin_index_path() ) and return
        end

        if zip_pipe
          @filename_to_be_run = filename.split(ext)[0]
        else
          @filename_to_be_run = filename
        end
        rails_config  = Rails.configuration
        db_name       = rails_config.database_configuration[Rails.env]['database']
        db_user       = rails_config.database_configuration[Rails.env]['username']
        db_pwd        = rails_config.database_configuration[Rails.env]['password']
                                                    # Build up the mysql execution command:
        mysql_cmd     = "mysql --user=#{db_user} --password=#{db_pwd}"
        mysql_cmd << " --database=#{db_name}" unless ( params[:is_a_full_dump] == '1' )
        mysql_cmd << " --execute=\"\\. #{@filename_to_be_run}\""
                                                    # Log what the admin is been doing:
        logger.info( "\r\n---- upload_db_dump( #{@filename_to_be_run} ) ----" )
        logger.info( "#{current_admin.name} is executing \"#{mysql_cmd}\"...\r\n" )

        @console_output = "Executing \"#{mysql_cmd}\"...\r\n"
        @console_output << `#{zip_pipe} #{filename}` if zip_pipe
        @console_output << `#{mysql_cmd}`
        @console_output.gsub!(/ --password=\S+\s/, ' --password=(PWD) ')

        @console_output << "Deleting '#{@filename_to_be_run}'...\r\n"
        logger.info( "Deleting '#{@filename_to_be_run}'...\r\n" )
        FileUtils.rm( @filename_to_be_run ) if File.exists?( @filename_to_be_run )
      else
        flash[:notice] = I18n.t(:nothing_to_do_upload_something, {:scope=>[:admin_import]})
        redirect_to( goggles_admin_index_path() ) and return
      end
    end
  end


  # Allows to upload and execute a compressed SQL file containing what is
  # supposed to be new, additional, 'seed' data. The file can then either be
  # stored into our standard seed directory (db/seed) or deleted upon
  # user request.
  #
  # === Params:
  # - :datafile => the uploaded file (mandatory on POST)
  # - :console_output => when not nil can be a string text to be displayed,
  #   containing the captured console output from the previous command execution
  #   (that has then redirected the server here).
  #
  def upload_db_seed
# DEBUG
    logger.debug "\r\n\r\n!! ------ upload_db_seed() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    @console_output = ''
    @filename_to_be_run = nil
    if request.post?
      if params[:datafile]
        tmp_file = params[:datafile].tempfile         # (This is an ActionDispatch::Http::UploadedFile object)
        filename = File.join( "public/uploads", params[:datafile].original_filename )
        FileUtils.cp tmp_file.path, filename
        ext = File.extname( filename )
        zip_pipe = nil

        case ext
        when '.bz2'
          zip_pipe = 'bzip2 -d '
        when '.tgz'
          zip_pipe = 'gzip -d '
        when '.zip'
          zip_pipe = 'unzip '
        when '.sql'
          zip_pipe = nil
        else
          flash[:notice] = I18n.t(:unsupported_file_format, {:scope=>[:admin_index]})
          redirect_to( goggles_admin_index_path() ) and return
        end

        if zip_pipe
          @filename_to_be_run = filename.split(ext)[0]
        else
          @filename_to_be_run = filename
        end
        rails_config  = Rails.configuration
        db_name       = rails_config.database_configuration[Rails.env]['database']
        db_user       = rails_config.database_configuration[Rails.env]['username']
        db_pwd        = rails_config.database_configuration[Rails.env]['password']
                                                    # Build up the mysql execution command:
        mysql_cmd     = "mysql --user=#{db_user} --password=#{db_pwd} --database=#{db_name} --execute=\"\\. #{@filename_to_be_run}\""
                                                    # Log what the admin is been doing:
        logger.info( "\r\n---- upload_db_dump( #{@filename_to_be_run} ) ----" )
        logger.info( "#{current_admin.name} is executing \"#{mysql_cmd}\"...\r\n" )

        @console_output = "Executing \"#{mysql_cmd}\"...\r\n"
        @console_output << `#{zip_pipe} #{filename}` if zip_pipe
        @console_output << `#{mysql_cmd}`
        @console_output.gsub!(/ --password=\S+\s/, ' --password=(PWD) ')

        if ( params[:store_to_seed_dir] == '1' )
          dest_filename = File.join( "db/seed", File.basename(@filename_to_be_run) )
          @console_output << "Storing file '#{dest_filename}'...\r\n"
          logger.info( "Storing file '#{dest_filename}'...\r\n" )
          FileUtils.mv( @filename_to_be_run, dest_filename ) if File.exists?( @filename_to_be_run )
        else
          @console_output << "Deleting '#{@filename_to_be_run}'...\r\n"
          logger.info( "Deleting '#{@filename_to_be_run}'...\r\n" )
          FileUtils.rm( @filename_to_be_run ) if File.exists?( @filename_to_be_run )
        end
      else
        flash[:notice] = I18n.t(:nothing_to_do_upload_something, {:scope=>[:admin_import]})
        redirect_to( goggles_admin_index_path() ) and return
      end
    end
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
  # ---------------------------------------------------------------------------


  # Displays :console_output as index does, but shows also several buttons
  # to execute pre-build rake tasks.
  #
  # === Params:
  # - :console_output => when not nil can be a string text to be displayed,
  #   containing the captured console output from the previous command execution
  #   (that has then redirected the server here).
  #
  def db_structure
# DEBUG
    logger.debug "\r\n\r\n!! ------ db_structure() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    @console_output = params[:console_output]
  end


  def db_reset
    @console_output = ''
    if request.post?
      logger.info( "\r\n\r\n!! ------ db_reset() -----" )
      logger.info( "#{current_admin.name} is executing DROP + CREATE DATABASE + Migrations + SEED...\r\n" )
      output = "Executing DROP + CREATE DATABASE + Migrations + SEED...\r\n"
      rails_config  = Rails.configuration             # Prepare & check configuration:
      db_name       = rails_config.database_configuration[Rails.env]['database']
      db_user       = rails_config.database_configuration[Rails.env]['username']
      db_pwd        = rails_config.database_configuration[Rails.env]['password']
      output << `mysql --user=#{db_user} --password=#{db_pwd} --execute=\"drop database if exists #{db_name}\"`
      output << `mysql --user=#{db_user} --password=#{db_pwd} --execute=\"create database #{db_name}\"`
      execute_cmd( 'rake', 'db:migrate' )
                                                    # Remove DB password from the output
      output.gsub!(/ --password=\S+\s/, ' --password=(PWD) ')

      if $?.success?
        output << "\r\nExecution of 'rake db:migrate' OK.\r\n"
      else
        output << "\r\nExecution of 'rake db:migrate' FAILED!\r\n"
      end
      execute_cmd( 'rake', 'sql:exec' )
      if $?.success?
        output << "\r\nExecution of 'rake sql:exec' OK.\r\n"
      else
        output << "\r\nExecution of 'rake sql:exec' FAILED!\r\n"
      end
      @console_output = output                      # Cannot use full console output because it's too big!
    end
    redirect_to db_structure_path( :console_output => @console_output )
  end


  def run_db_migrations
    @console_output = ''
    if request.post?
      logger.info( "\r\n---- run_db_migrations() ----" )
      logger.info( "#{current_admin.name} is executing 'rake db:migrate'...\r\n" )
      output = "Executing 'rake db:migrate'...\r\n"
      execute_cmd( 'rake', 'db:migrate' )
      if $?.success?
        output << "\r\nExecution of 'rake db:migrate' OK.\r\n"
      else
        output << "\r\nExecution of 'rake db:migrate' FAILED!\r\n"
      end
      @console_output = output                      # Cannot use full console output because it's too big!
    end
    redirect_to db_structure_path( :console_output => @console_output )
  end


  def run_sql_exec
    @console_output = ''
    if request.post?
      logger.info( "\r\n\r\n!! ------ run_sql_exec() -----" )
      logger.info( "#{current_admin.name} is executing all DB seeds in db/seeds...\r\n" )
      execute_cmd( 'rake', 'sql:exec' )
    end
    redirect_to db_structure_path( :console_output => @console_output )
  end
  # ---------------------------------------------------------------------------


  def run_rake
    @console_output = ''
    execute_cmd( 'rake', params[:rake_cmd] ) if request.post?
  end

  def run_bundle
    @console_output = ''
    execute_cmd( 'bundle', params[:bundle_cmd] ) if request.post?
  end

  def run_sudo_command
# DEBUG
    logger.debug "\r\n\r\n!! ------ run_sudo_command() -----"
    logger.debug "PARAMS: #{params.inspect}"
    @console_output = ''
    execute_sudo_cmd( params[:sudo_cmd], params[:password] ) if request.post?
  end
  # ---------------------------------------------------------------------------


  def restart_apache
# DEBUG
    logger.debug "\r\n\r\n!! ------ restart_apache() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    @console_output = ''
    execute_sudo_cmd( "nohup /etc/init.d/apache2 restart", params[:password] ) if request.post?
  end
  # ---------------------------------------------------------------------------


  def select_meeting
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.select_meeting() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    @title = I18n.t('admin_index.select_meeting_to_be_deleted')
    @meetings_grid = initialize_grid(
      Meeting,
      :include => [:season, :season_type],
      :order => 'meetings.header_date',
      :order_direction => 'asc',
      :per_page => 20
    )
  end


  def delete_meeting
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.delete_meeting() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    meeting_id = params[:commit].to_i
    unless ( request.post? && meeting_id > 0 )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to goggles_admin_index_path()
    end

    rows = MeetingIndividualResult.joins(:meeting).where(['meetings.id = ?', meeting_id]).destroy_all
    deleted_ind_res = rows.size
    rows = MeetingRelayResult.joins(:meeting).where(['meetings.id = ?', meeting_id]).destroy_all
    deleted_rel_res = rows.size
    rows = MeetingRelaySwimmer.joins(:meeting).where(['meetings.id = ?', meeting_id]).destroy_all
    deleted_rel_swi = rows.size
    MeetingTeamScore.delete_all( :meeting_id => meeting_id )
    rows = MeetingProgram.joins(:meeting).where(['meetings.id = ?', meeting_id]).destroy_all
    deleted_progs = rows.size
    rows = MeetingEvent.joins(:meeting).where(['meetings.id = ?', meeting_id]).destroy_all
    deleted_events = rows.size
    MeetingSession.delete_all( :meeting_id => meeting_id )
    Meeting.delete_all( :id => meeting_id )

    output = "Full Meeting delete, ID #{meeting_id}:" +
             "MeetingIndividualResult rows deleted: #{deleted_ind_res}\r\n" +
             "MeetingRelayResult rows deleted: #{deleted_rel_res}\r\n" +
             "MeetingRelaySwimmer rows deleted: #{deleted_rel_swi}\r\n" +
             "MeetingProgram rows deleted: #{deleted_progs}\r\n" +
             "MeetingEvent rows deleted: #{deleted_events}\r\n" +
             "+ all associated MeetingTeamScore & MeetingSession rows.\r\n" 
    redirect_to goggles_admin_index_path( :console_output => output )
  end
  # ---------------------------------------------------------------------------


  def select_teams
    # TODO !!!
    flash[:error] = I18n.t(:req_functionality_under_development)
    redirect_to goggles_admin_index_path()
  end


  def merge_teams
    # TODO !!!
    flash[:error] = I18n.t(:req_functionality_under_development)
    redirect_to goggles_admin_index_path()
  end
  # ---------------------------------------------------------------------------


  # Creates a backup of the current running app and invokes a git pull update
  # on the sources.
  #
  # === Params:
  # - :backup_folder => pathname used to backup the running version of the application
  #
  def run_src_upgrade
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.run_src_upgrade() -----"
    logger.debug "PARAMS: #{params.inspect}"
    dest_filename = "#{Version::COMPACT}#{DateTime.now.strftime("%Y%m%d%H%M%S")}.tar.bz2"
    @default_backup_folder = "#{Rails.root}.sav"
    @console_output = ''

    if request.post?                                # Create a backup copy of the current version:
      logger.info( "\r\n\r\n!! ------ run_src_upgrade() -----" )
      logger.info( "#{current_admin.name} is executing run_src_upgrade()...\r\n" )
      dest_folder = params[:backup_folder] || @default_backup_folder
      logger.info( "Dest. folder: #{dest_folder}\r\n" )
      @console_output << "Making sure folder '#{dest_folder}' exists...\r\n"
      FileUtils.makedirs( dest_folder )
      @console_output << "Creating #{dest_filename} under #{dest_folder}...\r\n"
      Dir.chdir( dest_folder )
      src_folder = Rails.root.to_s
      src_folder = src_folder.chop if src_folder[src_folder.size-1] == '/'
      @console_output << `tar --bzip2 -cf #{dest_filename} #{src_folder}`
      Dir.chdir( Rails.root.to_s )
      execute_cmd( 'rake', 'log:clear' )

      if $?.success?
        @console_output <<  "\r\nBackup done."
        execute_cmd( 'git', 'pull' )
      else
        @console_output <<  "\r\nBackup FAILED!"
        flash[:error] = I18n.t(:something_went_wrong)
      end
    end
  end
  # ---------------------------------------------------------------------------


  private


  # Executes the specified command name with its parameters on the running server.
  #
  def execute_cmd( cmd_name, parameters )
    command_line = "#{cmd_name} #{parameters}"
    output = `#{command_line}`

    output.gsub!(/ --password=\S+\s/, ' --password=(PWD) ')
    command_line.gsub!(/ --password=\S+\s/, ' --password=(PWD) ')
                                                  # Log what the admin has been doing:
    logger.info( "\r\n---- execute_cmd( #{cmd_name}, #{parameters} ) ----" )
    logger.info( "#{current_admin.name} is executing \"#{command_line}\" in '#{Dir.pwd}'...\r\n" )
    if $?.success?
      @console_output << "\r\nExecuting \"#{command_line}\" in '#{Dir.pwd}'...\r\n"
      @console_output << output
    else
      @console_output << "Execution of \"#{command_line}\" (in '#{Dir.pwd}') FAILED!"
    end
  end
  # ---------------------------------------------------------------------------


  # Executes the specified command_line on the running server with sudo priviledges.
  #
  def execute_sudo_cmd( command_line, password )
    output = ''
    Open3.popen2( "sudo #{command_line}" ) { |i, o, t|
      i.puts "#{password}\r\n\r\n\r\n"
      i.close
      output << o.readlines.join("")
    }
    output.gsub!(/ --password=\S+\s/, ' --password=(PWD) ')
    command_line.gsub!(/ --password=\S+\s/, ' --password=(PWD) ')
                                                  # Log what the admin has been doing:
    logger.info( "\r\n---- execute_sudo_cmd( #{command_line} ) ----" )
    logger.info( "#{current_admin.name} is executing \"sudo #{command_line}\"...\r\n" )
    logger.info( output )
    @console_output = "Executing \"sudo #{command_line}\"...\r\n"
    @console_output << output
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
    output.gsub!(/ --password=\S+\s/, ' --password=(PWD) ')
    command_line.gsub!(/ --password=\S+\s/, ' --password=(PWD) ')
                                                    # Log what the admin has been doing:
    logger.info( "\r\n---- run_mysqldump_with_send_file( #{ table_names ? table_names[0] : 'FULL DUMP'} ) ----" )
    logger.info( "#{current_admin.name} is executing \"#{command_line}\" in '#{Dir.pwd}'...\r\n" )
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
