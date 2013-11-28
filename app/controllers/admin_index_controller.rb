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
    rows = Passage.joins(:meeting).where(['meetings.id = ?', meeting_id]).destroy_all
    deleted_pass = rows.size
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
             "Passage rows deleted: #{deleted_pass}\r\n" +
             "MeetingProgram rows deleted: #{deleted_progs}\r\n" +
             "MeetingEvent rows deleted: #{deleted_events}\r\n" +
             "+ all associated MeetingTeamScore & MeetingSession rows.\r\n" 
    redirect_to goggles_admin_index_path( :console_output => output )
  end
  # ---------------------------------------------------------------------------


  def select_teams
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.select_teams() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    @title = I18n.t('admin_index.merge_teams')
    @console_output = ''
    if request.post?
      logger.info( "\r\n\r\n!! ------ select_teams() -----" )
      src_id  = params[:merge_teams][:src_id].to_i
      dest_id = params[:merge_teams][:dest_id].to_i
      logger.info( "#{current_admin.name} has selected for merge, teams ID #{src_id} => #{dest_id}...\r\n" )
      merge_teams( src_id, dest_id )
    end
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
  # ---------------------------------------------------------------------------


  # Merge two teams, given their ID.
  #
  # This rather complex procedure tries to separate all the duplicates
  # resulting from the update from the non-duplicates. In doing so:
  #
  # - it collects all non-duplicate and duplicate rows from all
  #   the linked entities;
  # - logs what it is about to update and delete;
  # - performs the actual update on the non-duplicates;
  # - deletes all the duplicates.
  #
  # === Returns:
  # false on error.
  #
  def merge_teams( src_id, dest_id )
    if (src_id < 1 || dest_id < 1 || src_id == dest_id)
      flash[:error] = I18n.t(:wrong_parameters)
      redirect_to select_teams_path()
    end
    logger.info( "r\n!! ------ merge_teams() -----" )
    logger.info( "#{current_admin.name} is merging teams ID #{src_id} => #{dest_id}...\r\n" )
    logger.info( "\r\n--- Merging Teams: collecting data ---" )
    @console_output << "\r\n*** Merging Teams: collecting data ***\r\n"
                                                    # *** COLLECT DATA PHASE starts here ***
    src_team  = Team.find_by_id( src_id )
    dest_team = Team.find_by_id( dest_id )
    is_ok = true

    # Regarding :badge_id and :team_affiliation_id:
    # ---------------------------------------------
    # These two have to change only if they refer to a duplicate row;
    # that is, a row that will become a duplicate (and it will have to
    # be deleted) once that the update (and translation) process has been
    # completed.
    # Thus, each linked entity that has a reference to one of these
    # possibly duplicate IDs has to be updated with the new destination value
    # (of which they are the duplicate); else, the value for :badge_id and
    # :team_affiliation_id can stay untouched.

    # [Steve, 20131126] Having dest.Team id overwriting src Team id:
    # => duplicates must be identified and safely removed afterwards
    # => non-duplicates must be updated with the new values
    # - collect non-duplicates (new) TeamAffiliation
    # - collect duplicates TeamAffiliation
    #   - duplicate row must be converted to equivalent destination (the one they are the duplicate of)
    #   - destination value must be used for update
    #   - duplicate row can then be safely removed 
    # - collect non-duplicates (new) Badge
    # - collect duplicates Badge
    #   - proceed as above [...]
    # All other linked entites have similar dependencies:...

    # => foreach non-duplicate DataImportTeamAlias: update them (team_id)
    #   => delete remaining duplicates 
    # => foreach non-duplicate GoggleCup: update them (team_id)
    #   => delete remaining duplicates 

    # => process non-duplicate Badges and update them (one by one)
    #    for each new Badge, find and update its linked:
    #     => MeetingRelaySwimmer (:badge_id)
    #     => GoggleCupStandard (:badge_id)
    #     => Passage (:badge_id)
    #     => MeetingIndividualResult (:badge_id, :team_id (corrected), :team_affiliation_id(corrected))
    #    for each duplicate Badge, find and delete its linked:
    #     => MeetingRelaySwimmer (:badge_id)
    #     => GoggleCupStandard (:badge_id)
    #     => Passage (:badge_id)
    #     => MeetingIndividualResult (:badge_id, :team_id (corrected), :team_affiliation_id(corrected))

    # => process non-duplicate TeamAffiliations and update them (one by one)
    #    for each non-duplicate TeamAffiliation, find and update its linked:
    #     => MeetingRelayResult and update them (:team_id, :team_affiliation_id)
    #     => MeetingTeamScore and update them (:team_id, :team_affiliation_id)
    #    for each duplicate TeamAffiliation, find and delete its linked:
    #     => MeetingRelayResult and update them (:team_id, :team_affiliation_id)
    #     => MeetingTeamScore and update them (:team_id, :team_affiliation_id)

                                                    # --- TeamAffiliation ---
    dest_taffs = TeamAffiliation.where( :team_id => dest_id )
    dest_season_ids = dest_taffs.collect{ |row| row.season_id }
                                                    # Separate duplicates from new (updatable) rows:
    duplicates_src_taffs = TeamAffiliation.where( :team_id => src_id, :season_id => dest_season_ids )
    duplicates_src_taffs_ids = duplicates_src_taffs.collect{ |row| row.id }
    src_taffs = TeamAffiliation.where( :team_id => src_id )
    src_taffs_ids = src_taffs.collect{ |row| row.id }
    nonduplicates_src_taffs_ids = src_taffs_ids.reject{ |id| duplicates_src_taffs_ids.member?(id) }
    nonduplicates_src_taffs = src_taffs.reject{ |row| duplicates_src_taffs_ids.member?(row.id) }
                                                    # Compose a duplicate-translation hash, with the src TeamAffiliation.id as key and dest TeamAffiliation.id as value
    duplicate_taff_matrix_ids = {}                  # This will allow: src key id |=> dest value id
    duplicates_src_taffs.each do |src_taff_row|
      # ASSERT: there's only 1 TeamAffiliation for each (team_id, season_id) pair
      dest_taffs_candidate = dest_taffs.find{ |r| src_taff_row.season_id == r.season_id }
      duplicate_taff_matrix_ids[ src_taff_row.id ] = dest_taffs_candidate.id
    end
    log_row_sizes( TeamAffiliation, :name, duplicates_src_taffs, nonduplicates_src_taffs )

                                                    # --- Badge ---
    src_badges  = Badge.where( :team_id => src_id )
    dest_badges = Badge.where( :team_id => dest_id )
                                                    # Separate future non-duplicate, updatable rows from the duplicate ones:
    nonduplicates_src_badges = src_badges.reject{ |src_row|
      dest_badges.any?{ |dest_row|
        (dest_row.swimmer_id == src_row.swimmer_id) &&
        (dest_row.season_id == src_row.season_id)
      }
    }
    duplicates_src_badges = src_badges.reject{ |src_row|
      nonduplicates_src_badges.any?{ |nondup_row| nondup_row.id == src_row.id }
    }
    nonduplicates_src_badges_ids = nonduplicates_src_badges.collect{ |row| row.id }
    duplicates_src_badges_ids    = duplicates_src_badges.collect{ |row| row.id }
    src_badges_ids  = src_badges.collect{ |row| row.id }
    dest_badges_ids = dest_badges.collect{ |row| row.id }
    duplicate_badge_matrix_ids = {}                 # This will allow: src key id |=> dest value id
    duplicates_src_badges.each do |src_badge_row|
      dest_badge_candidate = dest_badges.find{ |r|
        (src_badge_row.swimmer_id == r.swimmer_id) &&
        (src_badge_row.season_id == r.season_id)
      }
      duplicate_badge_matrix_ids[ src_badge_row.id ] = dest_badge_candidate.id
    end
    log_row_sizes( Badge, :get_full_name, duplicates_src_badges, nonduplicates_src_badges )

                                                    # --- DataImportTeamAlias (:team_id) ---
    src_di_tals  = DataImportTeamAlias.where( :team_id => src_id )
    dest_di_tals = DataImportTeamAlias.where( :team_id => dest_id )
    nonduplicates_src_di_tals = src_di_tals.reject{ |src_row|
      dest_di_tals.any?{ |dest_row| dest_row.name == src_row.name }
    }
    duplicates_src_di_tals = src_di_tals.reject{ |src_row|
      nonduplicates_src_di_tals.any?{ |nondup_row| nondup_row.id == src_row.id }
    }
    log_row_sizes( DataImportTeamAlias, :name, duplicates_src_di_tals, nonduplicates_src_di_tals )

                                                    # --- GoggleCup (:team_id) ---
    src_gcups  = GoggleCup.where( :team_id => src_id )
    dest_gcups = GoggleCup.where( :team_id => dest_id )
    nonduplicates_src_gcups = src_gcups.reject{ |src_row|
      dest_gcups.any?{ |dest_row| dest_row.year == src_row.year }
    }
    duplicates_src_gcups = src_gcups.reject{ |src_row|
      nonduplicates_src_gcups.any?{ |nondup_row| nondup_row.id == src_row.id }
    }
    nonduplicates_src_gcup_ids = nonduplicates_src_gcups.collect{ |row| row.id }
    duplicates_src_gcup_ids    = duplicates_src_gcups.collect{ |row| row.id }
    src_gcups_ids  = src_gcups.collect{ |row| row.id }
    dest_gcups_ids = dest_gcups.collect{ |row| row.id }
    log_row_sizes( GoggleCup, :year, duplicates_src_gcups, nonduplicates_src_gcups )

    # [Steve, 20131128] The remaining linked entites (MeetingRelaySwimmer, MeetingIndividualResult,
    # MeetingRelayResult, ...) may contain rows that have been added separately from the creation
    # of the source/destination team. Thus, the following entites may have rows that refer to
    # a "duplicate" Team/TeamAffiliation/Badge, but that are indeed new or updatable as well.
    # The only safe way to check this, is to process them one by one, during update, and compare
    # them for possible duplicate after update; if the row will result in a duplicate, it must be
    # deleted.
                                                    # --- MeetingIndividualResult (:badge_id, :team_id, :team_affiliation_id) ---
    src_mirs  = MeetingIndividualResult.where( :team_id => src_id )
    dest_mirs = MeetingIndividualResult.where( :team_id => dest_id )
    nonduplicates_src_mirs = src_mirs.reject{ |src_row|
      dest_mirs.any?{ |dest_row|
        (dest_row.meeting_program_id == src_row.meeting_program_id) &&
        (dest_row.swimmer_id == src_row.swimmer_id)
      }
    }
    duplicates_src_mirs = src_mirs.reject{ |src_row|
      nonduplicates_src_mirs.any?{ |nondup_row| nondup_row.id == src_row.id }
    }
    log_row_sizes( MeetingIndividualResult, :get_full_name, duplicates_src_mirs, nonduplicates_src_mirs )

                                                    # --- MeetingRelayResult (:team_id, :team_affiliation_id) ---
    src_mrrs  = MeetingRelayResult.where( :team_id => src_id )
    dest_mrrs = MeetingRelayResult.where( :team_id => dest_id )
    nonduplicates_src_mrrs = src_mrrs.reject{ |src_row|
      dest_mrrs.any?{ |dest_row|
        (dest_row.meeting_program_id == src_row.meeting_program_id)
      }
    }
    duplicates_src_mrrs = src_mrrs.reject{ |src_row|
      nonduplicates_src_mirs.any?{ |nondup_row| nondup_row.id == src_row.id }
    }
    log_row_sizes( MeetingRelayResult, :get_full_name, duplicates_src_mrrs, nonduplicates_src_mrrs )

                                                    # --- MeetingTeamScore (:team_id, :team_affiliation_id) ---
    src_mtss  = MeetingTeamScore.where( :team_id => src_id )
    dest_mtss = MeetingTeamScore.where( :team_id => dest_id )
    nonduplicates_src_mtss = src_mtss.reject{ |src_row|
      dest_mtss.any?{ |dest_row|
        (dest_row.meeting_id == src_row.meeting_id)
      }
    }
    duplicates_src_mtss = src_mtss.reject{ |src_row|
      nonduplicates_src_mtss.any?{ |nondup_row| nondup_row.id == src_row.id }
    }
    log_row_sizes( MeetingTeamScore, :get_full_name, duplicates_src_mtss, nonduplicates_src_mtss )

                                                    # --- MeetingRelaySwimmer (:badge_id) ---
    src_mrss  = MeetingRelaySwimmer.includes(:badge).where( :badge_id => src_badges_ids )
    dest_mrss = MeetingRelaySwimmer.includes(:badge).where( :badge_id => dest_badges_ids )
    nonduplicates_src_mrss = src_mrss.reject{ |src_row|
      dest_mrss.any?{ |dest_row|
        (dest_row.meeting_relay_result_id == src_row.meeting_relay_result_id) &&
        (dest_row.swimmer_id == src_row.swimmer_id)
      }
    }
    duplicates_src_mrss = src_mrss.reject{ |src_row|
      nonduplicates_src_mrss.any?{ |nondup_row| nondup_row.id == src_row.id }
    }
    log_row_sizes( MeetingRelaySwimmer, :get_full_name, duplicates_src_mrss, nonduplicates_src_mrss )

                                                    # --- Passage (:badge_id) ---
    src_pass  = Passage.includes(:badge).where( :badge_id => src_badges_ids )
    dest_pass = Passage.includes(:badge).where( :badge_id => dest_badges_ids )
    nonduplicates_src_pass = src_pass.reject{ |src_row|
      dest_pass.any?{ |dest_row|
        (dest_row.meeting_program_id == src_row.meeting_program_id) &&
        (dest_row.badge.swimmer_id == src_row.badge.swimmer_id) &&
        (dest_row.badge.season_id == src_row.badge.season_id)
      }
    }
    duplicates_src_pass = src_pass.reject{ |src_row|
      nonduplicates_src_pass.any?{ |nondup_row| nondup_row.id == src_row.id }
    }
    log_row_sizes( Passage, :get_full_name, duplicates_src_pass, nonduplicates_src_pass )

                                                    # --- GoggleCupStandard (:badge_id) ---
    src_gcstds  = GoggleCupStandard.includes(:goggle_cup).where( :goggle_cup_id => src_gcups_ids )
    dest_gcstds = GoggleCupStandard.includes(:goggle_cup).where( :goggle_cup_id => dest_gcups_ids )
    nonduplicates_src_gcstds = src_gcstds.reject{ |src_row|
      dest_gcstds.any?{ |dest_row|
        (dest_row.goggle_cup.year == src_row.goggle_cup.year) &&
        (dest_row.badge_id == src_row.badge_id)
      }
    }
    duplicates_src_gcstds = src_gcstds.reject{ |src_row|
      nonduplicates_src_gcstds.any?{ |nondup_row| nondup_row.id == src_row.id }
    }
    log_row_sizes( GoggleCupStandard, :get_full_name, duplicates_src_gcstds, nonduplicates_src_gcstds )


    phase_name = ''
    begin                                           # *** UPDATE PHASE starts here ***
      phase_name = 'Badge update'
      execute_update_operation( Badge, nonduplicates_src_badges,
        # has_team, has_team_affiliation, has_badge
        true, true, false,
        dest_id, duplicate_taff_matrix_ids,
        duplicate_badge_matrix_ids
      )

      phase_name = 'DataImportTeamAlias update'
      execute_update_operation( DataImportTeamAlias, nonduplicates_src_di_tals,
        # has_team, has_team_affiliation, has_badge
        true, false, false,
        dest_id, duplicate_taff_matrix_ids,
        duplicate_badge_matrix_ids
      )

      phase_name = 'MeetingTeamScore update'
      execute_update_operation( MeetingTeamScore, nonduplicates_src_mtss,
        # has_team, has_team_affiliation, has_badge
        true, true, false,
        dest_id, duplicate_taff_matrix_ids,
        duplicate_badge_matrix_ids
      )

      phase_name = 'MeetingRelayResult update'
      execute_update_operation( MeetingRelayResult, nonduplicates_src_mrrs,
        # has_team, has_team_affiliation, has_badge
        true, true, false,
        dest_id, duplicate_taff_matrix_ids,
        duplicate_badge_matrix_ids
      )

      phase_name = 'MeetingRelaySwimmer update'
      execute_update_operation( MeetingRelaySwimmer, nonduplicates_src_mrss,
        # has_team, has_team_affiliation, has_badge
        true, false, true,
        dest_id, duplicate_taff_matrix_ids,
        duplicate_badge_matrix_ids
      )

      phase_name = 'MeetingIndividualResult update'
      execute_update_operation( MeetingIndividualResult, nonduplicates_src_mirs,
        # has_team, has_team_affiliation, has_badge
        true, true, true,
        dest_id, duplicate_taff_matrix_ids,
        duplicate_badge_matrix_ids
      )

      phase_name = 'Passage update'
      execute_update_operation( Passage, nonduplicates_src_pass,
        # has_team, has_team_affiliation, has_badge
        false, false, true,
        dest_id, duplicate_taff_matrix_ids,
        duplicate_badge_matrix_ids
      )

      phase_name = 'GoggleCup update'
      execute_update_operation( GoggleCup, nonduplicates_src_gcups,
        # has_team, has_team_affiliation, has_badge
        true, false, false,
        dest_id, duplicate_taff_matrix_ids,
        duplicate_badge_matrix_ids
      )

      phase_name = 'GoggleCupStandard update'
      execute_update_operation( GoggleCupStandard, nonduplicates_src_gcstds,
        # has_team, has_team_affiliation, has_badge
        false, false, true,
        dest_id, duplicate_taff_matrix_ids,
        duplicate_badge_matrix_ids
      )

      phase_name = 'TeamAffiliation update'
      execute_update_operation( TeamAffiliation, nonduplicates_src_taffs,
        # has_team, has_team_affiliation, has_badge
        true, false, false,
        dest_id, duplicate_taff_matrix_ids,
        duplicate_badge_matrix_ids
      )
                                                    # *** DELETE PHASE starts here ***
      phase_name = 'TeamAffiliation delete'
      execute_delete_operation( TeamAffiliation, duplicates_src_taffs )
      phase_name = 'Badge delete'
      execute_delete_operation( Badge, duplicates_src_badges )
      phase_name = 'DataImportTeamAlias delete'
      execute_delete_operation( DataImportTeamAlias, duplicates_src_di_tals )
      phase_name = 'GoggleCup delete'
      execute_delete_operation( GoggleCup, duplicates_src_gcups )
      phase_name = 'MeetingIndividualResult delete'
      execute_delete_operation( MeetingIndividualResult, duplicates_src_mirs )
      phase_name = 'MeetingRelayResult delete'
      execute_delete_operation( MeetingRelayResult, duplicates_src_mrrs )
      phase_name = 'MeetingTeamScore delete'
      execute_delete_operation( MeetingTeamScore, duplicates_src_mtss )
      phase_name = 'MeetingRelaySwimmer delete'
      execute_delete_operation( MeetingRelaySwimmer, duplicates_src_mrss )
      phase_name = 'Passage delete'
      execute_delete_operation( Passage, duplicates_src_pass )
      phase_name = 'GoggleCupStandard delete'
      execute_delete_operation( GoggleCupStandard, duplicates_src_gcstds )
                                                  # Final act: old Team destroy:
      phase_name = 'SRC Team delete'
      src_team.destroy
    rescue
      @console_output << "\r\n*** Team Merge: exception caught!\r\n"
      @console_output << "*** Phase '#{phase_name}': #{ $!.to_s }\r\n" if $!
      logger.error( "\r\n*** Team Merge: exception caught!" )
      logger.error( "*** Phase '#{phase_name}': #{ $!.to_s }\r\n" ) if $!
      flash[:error] = "#{I18n.t(:something_went_wrong)} [Phase '#{phase_name}': '#{ $!.to_s }']"
      is_ok = false
    end

    flash[:info] = I18n.t(:teams_merged) if is_ok
  end
  # ---------------------------------------------------------------------------


  # Logs what was found during the collection phase.
  #
  def log_row_sizes( activerecord_class, display_sym, duplicate_rows, nonduplicate_rows )
    @console_output << "- #{activerecord_class.name}: duplicate rows = #{duplicate_rows.size}, non-duplicate_rows rows = #{nonduplicate_rows.size}.\r\n"
    logger.error( "- #{activerecord_class.name}: duplicate rows = #{duplicate_rows.size}, non-duplicate_rows rows = #{nonduplicate_rows.size}." )
    if (duplicate_rows.size > 0)
      duplicate_rows.each { |row|
        @console_output << "    - id:#{row.id}) #{row.send( display_sym )}\r\n"
        logger.error( "    - id:#{row.id}) #{row.send( display_sym )}" )
      }
    end
  end
  # ---------------------------------------------------------------------------


  # Executes a single group of update operations for the team-merge process
  # May raise exceptions in case of error.
  #
  def execute_update_operation( activerecord_class, nonduplicates_src,
                                has_team, has_team_affiliation, has_badge,
                                dest_team_id, duplicate_taff_matrix_ids,
                                duplicate_badge_matrix_ids )
    @console_output << "Updating #{activerecord_class.name}...\r\n"
    logger.info( "Updating #{activerecord_class.name}...\r\n" )
    nonduplicates_src.each do |row|
      if has_team
        row.team_id = dest_id
      end
      if has_team_affiliation
        row.team_affiliation_id = duplicate_taff_matrix_ids.has_key?( row.team_affiliation_id ) ? duplicate_taff_matrix_ids[ row.team_affiliation_id ] : row.team_affiliation_id
      end
      if has_badge
        row.badge_id = duplicate_badge_matrix_ids.has_key?( row.badge_id ) ? duplicate_badge_matrix_ids[ row.badge_id ] : row.badge_id
      end
      row.save!
    end
  end
  # ---------------------------------------------------------------------------


  # Executes a single group of delete operations for the team-merge process
  # May raise exceptions in case of error.
  #
  def execute_delete_operation( activerecord_class, duplicates_src )
    @console_output << "Deleting #{activerecord_class.name} #{duplicates_src.size} duplicates...\r\n"
    logger.info( "Deleting #{activerecord_class.name} #{duplicates_src.size} duplicates...\r\n" )
    nonduplicates_src.each do |row|
      row.destroy
    end
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------
end
