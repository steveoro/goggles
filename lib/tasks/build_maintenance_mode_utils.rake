# encoding: utf-8

require 'date'
require 'rubygems'
require 'find'
require 'fileutils'

require 'framework/version'
require 'common/format'


=begin

= Local Deployment helper tasks

  - (p) FASAR Software 2007-2015
  - Goggles framework vers.:  4.00.785
  - author: Steve A.

  (ASSUMES TO BE rakeD inside Rails.root)

=end


namespace :build do

  desc <<-DESC
Sets or resets maintenance mode for the whole app by setting a proper DB flag.

If the end_date is not parsable or not provided, the default is the current time
plus 2 hours.

    Options: [mode=<1>|0] [end_date=<restore_date_in_parsable_format>]
             [Rails.env=#{Rails.env}]
DESC
  task( maintenance: [:environment] ) do
    end_date   = ENV.include?("end_date") ? ENV['end_date'] : nil
    versioning = AppParameter.find_by_code( AppParameter::PARAM_VERSIONING_CODE )

    if ( ENV.include?("mode") && ENV['mode'].to_i < 1 )
      puts "Toggling OFF maintenance mode..."
      versioning.a_bool = false
      versioning.a_date = nil
    else
      puts "Toggling ON maintenance mode (until '#{end_date}')..."
      versioning.a_bool = true
      begin
        versioning.a_date = DateTime.parse( end_date )
      rescue
        versioning.a_date = DateTime.now + 4.hours
      end
    end
    puts "Setting flag: #{ versioning.a_bool }, ending date: #{ Format.a_short_datetime( versioning.a_date ) }..."
    versioning.save!
    puts "Maintenance mode toggle: end."
  end
  #-- -------------------------------------------------------------------------
  #++


desc <<-DESC
Creates a tar(bz2) dump file for the whole subtree of the application.

    Options: [app_version=#{ GogglesCore::Version::COMPACT }] [output_dir=#{DB_BACKUP_DIR}]
DESC
  task( tar: [:log_rotate] ) do
    puts "*** Task: Tar BZip2 Application Backup ***"
                                                    # Prepare & check configuration:
    backup_folder = ENV.include?("output_dir") ? ENV["output_dir"] : DB_BACKUP_DIR
    app_version   = ENV.include?("app_version") ?
                    "#{ ENV['app_version'] }.#{ Date.today.strftime("%Y%m%d") }" :
                    "#{ GogglesCore::Version::COMPACT }.#{ DateTime.now.strftime("%Y%m%d.%H%M") }"
    file_name     = "#{ GogglesCore::AppConstants::WEB_APP }-#{ app_version }.tar.bz2"
    FileUtils.makedirs(backup_folder) if ENV.include?("output_dir") # make sure overridden output folder exists, creating the subtree under app's root

# TODO [FUTUREDEV] parametrize sessions cleanup
    Rake::Task['db:sessions:clear'].invoke
# TODO [FUTUREDEV] parametrize temp dir cleanup
    Rake::Task['tmp:clear'].invoke

    puts "Creating #{file_name} under #{backup_folder}."
    Dir.chdir( backup_folder )
    sh "tar --bzip2 -cf #{file_name} #{Dir.pwd}"
    Dir.chdir( Dir.pwd.to_s )

    puts "Done.\r\n"
  end
  #-- -------------------------------------------------------------------------
  #++


desc <<-DESC
Updates the current versioning numbers inside DB table app_parameters.

    Options: [app_version=#{ GogglesCore::Version::COMPACT }] [db_version=<db_struct_version>]
             [Rails.env=#{Rails.env}]
DESC
  task( version: [:environment] ) do
    puts "Updating current version number..."
                                                    # Prepare & check configuration:
    time_signature = Date.today.strftime("%Y%m%d")
    db_version    = ENV.include?("db_version") ? ENV['db_version'] + '.' + time_signature : nil
    app_version   = ENV.include?("app_version") ?
                    "#{ ENV['app_version'] }.#{ time_signature }" :
                    GogglesCore::Version::COMPACT
                                                    # Update DB struct versioning number inside table app_parameter:
    ap = AppParameter.find(:first, :conditions => "code=1")
    unless ap.nil? || ap == []
      ap.update_attribute( :a_string, db_version ) unless db_version.nil?
      ap.update_attribute( :a_name, app_version )
    else
      raise "\r\nError: AppParameter row with code==1 is missing from the DB!"
    end
    puts "Base Versioning update: done."
  end
  #-- -------------------------------------------------------------------------
  #++

desc <<-DESC
Updates the News log table with an entry stating that the application has been updated.

    Options: [app_version=#{ GogglesCore::Version::COMPACT }] [db_version=<db_struct_version>]
             [Rails.env=#{Rails.env}]
DESC
  task( news_log: ['build:version'] ) do
                                                    # Prepare & check configuration:
    time_signature = Date.today.strftime("%Y%m%d")
    db_version    = ENV.include?("db_version") ?
                    "#{ ENV['db_version'] }.#{ time_signature }" : nil
    app_version   = ENV.include?("app_version") ?
                    "#{ ENV['app_version'] }.#{ time_signature }" :
                    GogglesCore::Version::COMPACT

    puts "Logging the update into the news blog..."
    Article.create({
      title: "Aggiornamento dell'applicazione",
# TODO [FUTUREDEV] Localize this
      body:  "L'applicazione e' stata aggiornata e portata alla versione " + app_version +
             (db_version.nil? ? "" : ". La struttura del DB e' stata portata alla versione " + db_version) + ".",
      user_id: 1 # default user id (must be not null)
    })
    puts "NewsLog update: done."
  end
  #-- -------------------------------------------------------------------------
  #++


desc <<-DESC
Creates a local build (with release info, backup and current DB dump).

This complex task updates the internal versioning number for the DB and the
application framework, then saves the log files, updates and dumps the DB (in
case of a new version) and, finally, stores the local build inside a backup
tar file.

    Options: app_version=<application_version> [db_version=<db_struct_version>]
             [Rails.env=#{Rails.env}]
DESC
  task( local: ['build:news_log','build:tar','sql:dump'] ) do
    puts "BUILD: LOCAL: done."
  end
  #-- -------------------------------------------------------------------------
  #++
end
# ==============================================================================
