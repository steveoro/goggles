# encoding: utf-8
require 'date'
require 'rubygems'
require 'fileutils'
require 'mechanize'

require 'framework/version'
require 'framework/application_constants'

require 'common/validation_error_tools'

require_relative '../../app/data_import/v2/services/team_merger'


=begin

= DB-utility tasks

  - Goggles framework vers.:  4.00.729
  - author: Steve A.

  (ASSUMES TO BE rakeD inside Rails.root)

=end
#-- ---------------------------------------------------------------------------
#++


LOG_DIR     = File.join( Dir.pwd, 'log' ) unless defined? LOG_DIR


namespace :db do

desc <<-DESC
  Launches the merge process for a source/slave Team instance, against a master/
destination Team instance.

The source Team will simply become a name alias for the destination Team and
all its linked entities and sub-enties rows will then refer to the actual
'master'(destination) Team ID.
The process does nothing if the Team's IDs are equal.

Keep in mind also that this will alter directly the database and it will work
indipendently from season or affiliation: when two teams are processed to be
merged, ALL THEIR LINKED entities will be scanned and altered, in a way or
another.

This task creates an SQL diff file and a process log at the end.

  Options: src_team=<source_team_id> dest_team=<destination_team_id>
           [log_dir=#{LOG_DIR}]

  - 'src_team'  => slave/source Team.id
  - 'dest_team' => master/destination Team.id
  - 'log_dir'   => allows to override the default log dir destination.
  DESC
  task :merge_teams do |t|
    puts "\r\n*** db:merge_teams ***"
    src_team_id   = ENV.include?("src_team") ? ENV["src_team"].to_i : nil
    dest_team_id  = ENV.include?("dest_team") ? ENV["dest_team"].to_i : nil
    rails_config  = Rails.configuration             # Prepare & check configuration:
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    db_host       = rails_config.database_configuration[Rails.env]['host']
    log_dir       = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR
    # Verify parameters
    unless src_team_id && dest_team_id
      puts("This needs both 'src_team' && 'dest_team' parameters.")
      exit
    end
    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )
                                                    # Display some info:
    puts "DB host: #{db_host}"
    puts "DB name: #{db_name}"
    puts "DB user: #{db_user}"
    slave_team  = Team.find( src_team_id )
    master_team = Team.find( dest_team_id )
    puts "\r\nMerging '#{slave_team.name}' (id: #{slave_team.id}) => '#{master_team.name}' (id: #{master_team.id})..."
    puts "\r\nThe process, once started cannot be stopped. Please verify the above info or press CTRL-C to abort.\r\n==> Press Enter to continue <=="
    dummy = STDIN.gets

    merger = V2::TeamMerger.new( slave_team, master_team )
    merger.process
    puts merger.process_text_log

    file_name = File.join(
      log_dir, "#{ DateTime.now.strftime("%Y%m%d%H%M") }prod_team_merge_#{src_team_id}-#{dest_team_id}"
    )
    File.open( file_name + '.sql', 'w' ) { |f| f.puts merger.sql_diff_text_log }
    File.open( file_name + '.log', 'w' ) { |f| f.puts merger.process_text_log }
    puts "Repair done. SQL diff & process log files created: #{file_name} (.sql, .log)."

    puts "\r\nDone."
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
