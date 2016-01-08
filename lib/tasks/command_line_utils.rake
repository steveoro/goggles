# encoding: utf-8
require 'date'
require 'rubygems'
require 'find'
require 'fileutils'

require 'framework/version'
require 'framework/application_constants'
require 'framework/console_logger'


LOG_DIR = File.join( Dir.pwd, 'log' ) unless defined? LOG_DIR


=begin

= Command line utilities

  - Goggles framework vers.:  4.00.833.20151103
  - Author: Leega

  Things you shuold ask to db or 
  simply youryou should know but your
  buffer still refuses to contain  

  (ASSUMES TO BE rakeD inside Rails.root)

=end

namespace :ut do

  desc <<-DESC
Find meetings of a given code
Resulting log files are stored into '#{LOG_DIR}'.

Presents an header date ordered list 
of meetings with code matching to search criteria

Options: code=<meeting_code> log_dir=#{LOG_DIR}]

- 'code'     meeting code or part of meeting code to search for.
- 'log_dir'  allows to override the default log dir destination.

DESC
  task :find_meeting_by_code do |t|
    puts "*** ut:find_meeting_by_code ***"
    meeting_code    = ENV.include?("code") ? ENV["code"] : nil
    rails_config    = Rails.configuration             # Prepare & check configuration:
    db_name         = rails_config.database_configuration[Rails.env]['database']
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Verify parameters
    unless meeting_code 
      puts("This needs a code, or a part of a code to search for.")
      exit
    end

    # Display some info:
    puts "DB name:          #{db_name}"
    puts "DB user:          #{db_user}"
    puts "log_dir:          #{log_dir}"
    puts "\r\n"
    logger = ConsoleLogger.new

    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )
    
    # Search meetings
    meeting_found = 0
    logger.info( "\r\nSearch meetings with code like '%#{meeting_code}%'" )
    logger.info( "\r\n<------------------------------------------------------------>\r\n" )
    Meeting.where("code like '%#{meeting_code}%'").sort_by_date.each do |meeting|
      meeting_found += 1
      logger.info( "\r\n#{meeting.id} - #{meeting.get_meeting_date} #{meeting.get_full_name} (#{meeting.code})\r\n" )
    end
      
    # If no meetings found log warning
    logger.info( "\r\nNo meetings found with #{meeting_code}. Perhaps you mispelled it.\r\n" ) if meeting_found == 0
    logger.info( "\r\n\r\n" ) 
  end
  #-- -------------------------------------------------------------------------
  #++

  desc <<-DESC
Find team matching a given name part
Resulting log files are stored into '#{LOG_DIR}'.

Search teams and team affiliations for teams
which names contains the searc string

Options: name=<team_name_part> log_dir=#{LOG_DIR}]

- 'name'     team name or part of team name to search for.
- 'log_dir'  allows to override the default log dir destination.

DESC
  task :find_team_by_name do |t|
    puts "*** ut:find_team_by_name ***"
    team_name       = ENV.include?("name") ? ENV["name"] : nil
    rails_config    = Rails.configuration             # Prepare & check configuration:
    db_name         = rails_config.database_configuration[Rails.env]['database']
    db_user         = rails_config.database_configuration[Rails.env]['username']
    db_pwd          = rails_config.database_configuration[Rails.env]['password']
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR

    # Verify parameters
    unless team_name 
      puts("This needs a team name, or a part of a team name to search for.")
      exit
    end

    # Display some info:
    puts "DB name:          #{db_name}"
    puts "DB user:          #{db_user}"
    puts "log_dir:          #{log_dir}"
    puts "\r\n"
    logger = ConsoleLogger.new

    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )
    
    # Search meetings
    teams_found = []
    logger.info( "\r\nSearch teams with names like '%#{team_name}%'" )
    logger.info( "\r\n<------------------------------------------------------------>\r\n" )
    Team.where("name like '%#{team_name}%' or editable_name like '%#{team_name}%' or name_variations like '%#{team_name}%'").each do |team|
      teams_found << team
    end
    TeamAffiliation.where("name like '%#{team_name}%'").each do |team_affiliation|
      teams_found << team_affiliation.team unless teams_found.include?( team_affiliation.team ) 
    end

    # Log teams found and affiliations
    teams_found.sort{ |a,b| a.name <=> b.name }.each do |team|
      logger.info( "\r\n#{team.id} - #{team.get_verbose_name} (#{team.name})" )
      logger.info( "<------------------------------------------------------------>" )
      team.team_affiliations.select(:name).uniq.each do |team_affiliation|
        logger.info( " - #{team_affiliation.name}" )
      end
      logger.info( "\r\n\r\n" ) 
    end
      
    # If no meetings found log warning
    logger.info( "\r\nNo teams found with #{team_name}. Perhaps you mispelled it.\r\n" ) if teams_found.size == 0
    logger.info( "\r\n\r\n" ) 
  end
  #-- -------------------------------------------------------------------------
  #++

end
# =============================================================================

