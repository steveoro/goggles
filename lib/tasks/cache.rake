# encoding: utf-8
require 'date'
require 'rubygems'
require 'fileutils'
require 'mechanize'

require 'framework/version'
require 'framework/application_constants'

require 'framework/console_logger'


=begin

= Cache-maintenance tasks

  - Goggles framework vers.:  4.00.665
  - author: Steve A.

  (ASSUMES TO BE rakeD inside Rails.root)

=end
#-- ---------------------------------------------------------------------------
#++


namespace :cache do

  desc <<-DESC
Forces cache rebuilding by issuing several requests based on most searched pages,
current Championships, Users, their associated Swimmers and affiliated Teams.

It will be use the current environment DB. So, for this to work with an up-to-date
copy of the production database, remember include the correct environment in the
parameters ('RAILS_ENV=production') not before having issued also a:
    > rake db:rebuild_from_dump from=production to=production

  DESC
  task :rebuild do
    puts "\r\n*** cache:rebuild ***"

    # Environment setup
    rails_config  = Rails.configuration             # Prepare & check configuration:
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    db_host       = rails_config.database_configuration[Rails.env]['host']
    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )

# FIXME Log-in user:
# curl -i -H "Accept: application/json" "http://master-goggles.org/api/v1/sessions/create?user_password=<password>&user_email=<user_email>"
# - password must be URLencoded
#
# - retrieve token response( 'user_token' & 'user_name' )
# - re-use token for pages which require a login
#
# Use mechanize or rest-client gem to do the job instead of curl

# See:
# - https://github.com/rest-client/rest-client
# - http://docs.seattlerb.org/mechanize/EXAMPLES_rdoc.html
# - http://readysteadycode.com/howto-scrape-websites-with-ruby-and-mechanize
# - http://ruby.bastardsbook.com/chapters/mechanize/

    # Display some info:
    puts "DB host: #{db_host}"
    puts "DB name: #{db_name}"
    puts "DB user: #{db_user}"
    puts "\r\nTotals:"
    puts "======="
    swimmers = Swimmer.where( 'associated_user_id IS NOT NULL' )
    teams    = swimmers.map{ |swimmer| swimmer.get_badges_array.map{ |badge| badge.team } }.flatten.compact.uniq
    swimmer_count = swimmers.count
    teams_count   = teams.count
    last_season   = Season.get_last_season_by_type('MASCSI')
    public_teams  = last_season.teams.reject{ |team| teams.include?( team ) }.uniq
    public_swimmers  = public_teams.map do |team|
      team.badges.where( season_id: last_season.id ).map{ |badge| badge.swimmer }
    end.flatten.uniq.reject{ |swimmer| swimmers.include?( swimmer ) }
    # For each one of the Gogglers'teams, prepare the list of all their team mates, excluding
    # the gogglers, so that we'll request just the public radio page for them:
    swimming_buddies = teams.map do |team|
      team.badges.where( season_id: last_season.id ).map{ |badge| badge.swimmer }
    end.flatten.uniq.reject{ |swimmer| swimmers.include?( swimmer ) }

    champ_season_ids = [
      # TODO Championship history? (Seasons: 131, 121, 111, 101, 91, 14, 12, 10, 8, 6, 4, 3, 2, 1)
      141
    ]
    recent_meeting_ids = [
      14101
    ]

    puts "- Users: #{User.count}"
    puts "- Swimmers w/ associated users : #{swimmer_count}"
    puts "- Teams from the above swimmers: #{teams_count}"
    puts "- Teams from curr. season championship (excluding above):    #{public_teams.count}"
    puts "- Swimmers from curr. season championship (excluding above): #{public_swimmers.count}"
    puts "- Minimum possible Swimming Buddies for for the gogglers:    #{swimming_buddies.count}"
    puts "\r\nCache rebuild script start...\r\nExecution time:\r\n"

    Benchmark.bm do |exec|
      exec.report( "\r\n---[ 1/8 - Home/misc ]---\r\n" ) do
        [
          "curl -# http://master-goggles.org > /dev/null",
          "curl -# http://master-goggles.org/it/ > /dev/null",
          "curl -# http://master-goggles.org/en/ > /dev/null",

          "curl -# http://master-goggles.org/meetings/current > /dev/null",
          "curl -# http://master-goggles.org/it/meetings/current > /dev/null",
          "curl -# http://master-goggles.org/en/meetings/current > /dev/null",

          "curl -# http://master-goggles.org/it/teams/index > /dev/null",
          "curl -# http://master-goggles.org/it/swimmers/index > /dev/null",

          "curl -# http://master-goggles.org/it/championships/calendar_regional_er_csi > /dev/null"
        ].each do |command|
          system( "\"#{command}\"" )
        end
      end

      exec.report( "\r\n-------------[ 2/8 - Championships (for selected seasons) ]--------------\r\n" ) do
        champ_season_ids.each_with_index do |season_id, index|
          puts "Processing: season ID #{season_id}, #{index+1}/#{champ_season_ids.size}"
          system("curl -# http://master-goggles.org/it/championships/ranking_regional_er_csi/#{season_id} > /dev/null")
          system("curl -# http://master-goggles.org/it/championships/individual_rank_regional_er_csi/#{season_id} > /dev/null")
          system("curl -# http://master-goggles.org/it/championships/event_ranking_regional_er_csi/#{season_id} > /dev/null")
          system("curl -# http://master-goggles.org/it/championships/rules_regional_er_csi/#{season_id} > /dev/null")
          system("curl -# http://master-goggles.org/it/championships/history_regional_er_csi/#{season_id} > /dev/null")
        end
      end

      exec.report( "\r\n-------------[ 3/8 - Swimmers (for gogglers) ]--------------\r\n" ) do
        swimmers.each_with_index do |swimmer, index|
          puts "Processing: #{swimmer.get_full_name}, #{index+1}/#{swimmer_count} (radio, medals, best_timings, full_history 1 & 2)"
          system("curl -# http://master-goggles.org/it/swimmers/radio/#{swimmer.id} > /dev/null")
          system("curl -# http://master-goggles.org/it/swimmers/medals/#{swimmer.id} > /dev/null")
          system("curl -# http://master-goggles.org/it/swimmers/best_timings/#{swimmer.id} > /dev/null")
          system("curl -# http://master-goggles.org/it/swimmers/full_history_1/#{swimmer.id} > /dev/null")
          system("curl -# http://master-goggles.org/it/swimmers/full_history_2/#{swimmer.id} > /dev/null")
        end
      end

      exec.report( "\r\n-------------[ 4/8 - Swimming Buddies (for gogglers) ]--------------\r\n" ) do
        swimming_buddies.each_with_index do |swimmer, index|
          puts "Processing: #{swimmer.get_full_name}, #{index+1}/#{swimming_buddies.size}"
          system("curl -# http://master-goggles.org/it/swimmers/radio/#{swimmer.id} > /dev/null")
        end
      end

      exec.report( "\r\n-------------[ 5/8 - Teams (for gogglers) ]--------------\r\n" ) do
        teams.each_with_index do |team, index|
          puts "Processing: #{team.get_full_name}, #{index+1}/#{teams_count}"
          system("curl -# http://master-goggles.org/it/teams/radio/#{team.id} > /dev/null")
        end
      end

      exec.report( "\r\n-------------[ 6/8 - Teams (public) ]--------------\r\n" ) do
        public_teams.each_with_index do |team, index|
          puts "Processing: #{team.get_full_name}, #{index+1}/#{public_teams.count}"
          system("curl -# http://master-goggles.org/it/teams/radio/#{team.id} > /dev/null")
        end
      end

      exec.report( "\r\n-------------[ 7/8 - Meetings (most recent) ]--------------\r\n" ) do
        recent_meeting_ids.each_with_index do |meeting_id, index|
          puts "Processing: meeting ID #{meeting_id}, #{index+1}/#{recent_meeting_ids.size}"
          system("curl -# http://master-goggles.org/it/meeting/show_full/#{meeting_id} > /dev/null")
          system("curl -# http://master-goggles.org/it/meeting/show_invitation/#{meeting_id} > /dev/null")
          system("curl -# http://master-goggles.org/it/meeting/show_ranking/#{meeting_id} > /dev/null")
          system("curl -# http://master-goggles.org/it/meeting/show_stats/#{meeting_id} > /dev/null")
          public_teams.each_with_index do |team, team_index|
            puts "Team results for: #{team.get_full_name}, #{index+1}/#{public_teams.count}"
            system("curl -# http://master-goggles.org/it/meeting/show_team_results/{meeting_id}?team_id=#{team.id} > /dev/null")
          end
        end
      end

      exec.report("\r\n-------------[ 8/8 - hand-picked pages (from Analytics) ]--------------\r\n") do
        system( "./rebuild_remote_cache" )
      end
    end

    puts "\r\nDone."
  end
  #-- -------------------------------------------------------------------------
  #++

end
