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

  - Goggles framework vers.:  4.00.669
  - author: Steve A.

  (ASSUMES TO BE rakeD inside Rails.root)

=end
#-- ---------------------------------------------------------------------------
#++


SERVER_URL    = 'master-goggles.org'
# -----------------------------------------------------------------------------


namespace :cache do

  desc <<-DESC
Forces cache rebuilding by issuing several requests based on most searched pages,
current Championships, Users, their associated Swimmers and affiliated Teams.

It will be use the current environment DB. So, for this to work with an up-to-date
copy of the production database, remember include the correct environment in the
parameters ('RAILS_ENV=production') not before having issued also a:
    > rake db:rebuild_from_dump from=production to=production

  Options: user_email=<user_email_for_login>
           user_pwd=<password_for_user_email>
           [site=#{SERVER_URL}]

  - 'dump_forms'  => when set to a positive number it will skip the search
    and dump the list of all form and field names found on the specified URL.

  - 'site' => the search engine URL to be used, on which we are assuming there's
    a search form to be invoked.

  DESC
  task :rebuild do
    puts "\r\n*** cache:rebuild ***"

    # Environment setup
    rails_config  = Rails.configuration             # Prepare & check configuration:
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    db_host       = rails_config.database_configuration[Rails.env]['host']
    server_url    = ENV.include?("site") ? ENV["site"] : SERVER_URL
    user_email    = ENV["user_email"]
    user_pwd      = ENV["user_pwd"]
                                                    # Verify parameters:
    unless ENV.include?("user_email") && ENV.include?("user_pwd")
      puts("It needs at least a 'user_email' and a 'user_pwd' parameter.")
      exit
    end
    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )

    # Display some info:
    puts "DB host...........: #{db_host}"
    puts "DB name...........: #{db_name}"
    puts "DB user...........: #{db_user}"
    puts "Server URL........: #{server_url}"
    puts "Server user e-mail: #{user_email}"
    puts "Server pwd........: #{user_pwd}"

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
      151, 141
    ]
    recent_meeting_ids = champ_season_ids.map { |id| Season.find(id).meetings.map{|meeting| meeting.id} }.flatten

    puts "\r\nTotals:"
    puts "======="
    puts "- Users: #{User.count}"
    puts "- Swimmers w/ associated users : #{swimmer_count}"
    puts "- Teams from the above swimmers: #{teams_count}"
    puts "- Teams from curr. season championship (excluding above):    #{public_teams.count}"
    puts "- Swimmers from curr. season championship (excluding above): #{public_swimmers.count}"
    puts "- Minimum possible Swimming Buddies for for the gogglers:    #{swimming_buddies.count}"
    puts "\r\nCache rebuild script start...\r\nExecution time:\r\n"

    Benchmark.bm do |exec|
      exec.report( "\r\n---[ 1/10 - Home/misc ]---\r\n" ) do
        [
          "", "/it/", "/en/",
          "/meetings/current", "/it/meetings/current", "/en/meetings/current",
          "/it/teams/index", "/it/swimmers/index",
          "/it/championships/calendar_regional_er_csi"
        ].each do |request_url|
          get_request_via_curl( server_url, request_url )
        end
      end

      response = {}
      exec.report( "\r\n---[ 2/10 - Login ]---\r\n" ) do
        response = get_login_response( server_url, user_email, user_pwd )
        puts "Response: #{response['message']}"
      end
      user_name  = response['user_name']
      user_token = response['user_token']

      exec.report( "\r\n-------------[ 3/10 - Championships (for selected CSI seasons) ]--------------\r\n" ) do
        champ_season_ids.each_with_index do |season_id, index|
          puts "Processing: season ID #{season_id}, #{index+1}/#{champ_season_ids.size}"
          [
            "/it/championships/ranking_regional_er_csi/#{season_id}",
            "/it/championships/individual_rank_regional_er_csi/#{season_id}",
            "/it/championships/event_ranking_regional_er_csi/#{season_id}",
            "/it/championships/rules_regional_er_csi/#{season_id}",
            "/it/championships/history_regional_er_csi/#{season_id}"
          ].each do |request_url|
            get_request( server_url, request_url, user_name, user_token )
          end
        end
      end

      exec.report( "\r\n-------------[ 4/10 - Swimmers (for gogglers) ]--------------\r\n" ) do
        swimmers.each_with_index do |swimmer, index|
          puts "Processing: #{swimmer.get_full_name}, #{index+1}/#{swimmer_count} (radio, medals, best_timings, full_history 1 & 2)"
          [
            "/it/swimmer/radio/#{swimmer.id}",
            "/it/swimmer/medals/#{swimmer.id}",
            "/it/swimmer/best_timings/#{swimmer.id}",
            "/it/swimmer/full_history_1/#{swimmer.id}",
            "/it/swimmer/full_history_2/#{swimmer.id}"
          ].each do |request_url|
            get_request( server_url, request_url, user_name, user_token )
          end
        end
      end

      exec.report( "\r\n-------------[ 5/10 - Swimming Buddies (for gogglers) ]--------------\r\n" ) do
        swimming_buddies.each_with_index do |swimmer, index|
          puts "Processing: #{swimmer.get_full_name}, #{index+1}/#{swimming_buddies.size}"
          get_request( server_url, "/it/swimmer/radio/#{swimmer.id}", user_name, user_token )
        end
      end

      exec.report( "\r\n-------------[ 6/10 - Teams (for gogglers) ]--------------\r\n" ) do
        teams.each_with_index do |team, index|
          puts "Processing: #{team.get_full_name}, #{index+1}/#{teams_count}"
          [
            "/it/teams/current_swimmers/#{team.id}",
            "/it/teams/best_timings/#{team.id}",
            "/it/teams/palmares/#{team.id}"
          ].each do |request_url|
            get_request( server_url, request_url, user_name, user_token )
          end
          get_request( server_url, "/it/teams/radio/#{team.id}", user_name, user_token )
        end
      end

      exec.report( "\r\n-------------[ 7/10 - Teams (public) ]--------------\r\n" ) do
        public_teams.each_with_index do |team, index|
          puts "Processing: #{team.get_full_name}, #{index+1}/#{public_teams.count}"
          get_request( server_url, "/it/teams/radio/#{team.id}", user_name, user_token )
        end
      end

      exec.report( "\r\n-------------[ 8/10 - Meetings (most recent) ]--------------\r\n" ) do
        recent_meeting_ids.each_with_index do |meeting_id, index|
          puts "Processing: meeting ID #{meeting_id}, #{index+1}/#{recent_meeting_ids.size}"
          [
            "/it/meeting/show_full/#{meeting_id}",
            "/it/meeting/show_invitation/#{meeting_id}",
            "/it/meeting/show_ranking/#{meeting_id}",
            "/it/meeting/show_stats/#{meeting_id}"
          ].each do |request_url|
            get_request( server_url, request_url, user_name, user_token )
          end
          public_teams.each_with_index do |team, team_index|
            puts "Team results for: #{team.get_full_name}, #{team_index+1}/#{public_teams.count}"
            get_request( server_url, "/it/meeting/show_team_results/{meeting_id}?team_id=#{team.id}", user_name, user_token )
          end
        end
      end

      exec.report("\r\n-------------[ 9/10 - hand-picked pages (from Analytics) ]--------------\r\n") do
        puts "- Goggle Cup:"
        get_request( server_url, "/it/teams/goggle_cup/1", user_name, user_token )
        puts "- Most searched Teams' & Swimmers radio:"
        [
          "/it/teams/radio/233",

          "/it/swimmer/radio/12",
          "/it/swimmer/radio/14",
          "/it/swimmer/radio/40",
          "/it/swimmer/radio/49",
          "/it/swimmer/radio/92",
          "/it/swimmer/radio/137",
          "/it/swimmer/radio/579",
          "/it/swimmer/radio/580",
          "/it/swimmer/radio/785",
          "/it/swimmer/radio/951",
          "/it/swimmer/radio/961",
          "/it/swimmer/radio/966",
          "/it/swimmer/radio/1030",
          "/it/swimmer/radio/1060",
          "/it/swimmer/radio/1088",
          "/it/swimmer/radio/1116",
          "/it/swimmer/radio/1135",
          "/it/swimmer/radio/1197",
          "/it/swimmer/radio/1292",
          "/it/swimmer/radio/1409",
          "/it/swimmer/radio/1461",
          "/it/swimmer/radio/1476",
          "/it/swimmer/radio/1590",
          "/it/swimmer/radio/1633",
          "/it/swimmer/radio/1710",
          "/it/swimmer/radio/1753",
          "/it/swimmer/radio/1776",
          "/it/swimmer/radio/1851",
          "/it/swimmer/radio/2546",
          "/it/swimmer/radio/4821",
          "/it/swimmer/radio/4828",
          "/it/swimmer/radio/4830",
          "/it/swimmer/radio/4831",
          "/it/swimmer/radio/4834",
          "/it/swimmer/radio/4837",
          "/it/swimmer/radio/4845",
          "/it/swimmer/radio/4850",
          "/it/swimmer/radio/4852",
          "/it/swimmer/radio/4853",
          "/it/swimmer/radio/4855",
        ].each do |request_url|
          puts "Processing: '#{request_url}'"
          get_request( server_url, request_url, user_name, user_token )
        end
      end

      exec.report( "\r\n---[ 10/10 - Logout ]---\r\n" ) do
        response = do_logout( server_url, user_token )
        puts "Response: #{response['message']}" if response.instance_of?(Hash)
      end
    end

    puts "\r\nDone."
  end
  #-- -------------------------------------------------------------------------
  #++


  # Retrieves the login response already parsed from JSON.
  #
  # == Params:
  #
  # - server_url: the server name (i.e.: "locahost:3000" or "master-goggles.org"), used as base URL for the request
  # - user_email: the user e-mail
  # - password: the user password
  #
  # == Returns:
  # The response JSON-parsed page.body
  #
  def get_login_response( server_url, user_email, password )
    a = Mechanize.new
    begin
      page = a.get("http://#{server_url}/api/v1/sessions/create?user_password=#{ CGI::escape(password) }&user_email=#{ CGI::escape(user_email) }")
      JSON.parse(page.body)
    rescue
      puts $!
    end
  end


  # Closes the login session given the user_token obtained from the login response hash (parsed from JSON).
  #
  # == Params:
  #
  # - server_url: the server name (i.e.: "locahost:3000" or "master-goggles.org"), used as base URL for the request
  # - user_token: the login token obtained from the login response Hash.
  #
  # == Returns:
  # The response JSON-parsed page.body
  #
  def do_logout( server_url, user_token )
    a = Mechanize.new
    begin
      page = a.get("http://#{server_url}/api/v1/sessions/destroy?user_token=#{ CGI::escape(user_token) }")
      JSON.parse(page.body)
    rescue
      puts $!
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Retrieves a specific page using the response from the login API.
  #
  # == Params:
  #
  # - server_url:  the server name (i.e.: "locahost:3000" or "master-goggles.org"), used as base URL for the request
  # - request_url: the page url for the actual request (for ex.: "/it/swimmer/radio/23").
  # - user_name:   the user name (obtained from the login response Hash).
  # - user_token:  the login token (obtained from the login response Hash).
  #
  # == Returns:
  # The response page
  #
  def get_request( server_url, request_url, user_name, user_token )
    a = Mechanize.new
    begin
      a.get("http://#{server_url}#{request_url}?user_name=#{ CGI::escape(user_name) }&user_token=#{ CGI::escape(user_token) }")
    rescue
      puts $!
    end
  end


  # Retrieves a specific page using a system call to curl.
  #
  # == Params:
  #
  # - server_url:  the server name (i.e.: "locahost:3000" or "master-goggles.org"), used as base URL for the request
  # - request_url: the page url for the actual request (for ex.: "/it/swimmer/radio/23").
  # - user_email:  the user e-mail
  # - user_token:  the login token (obtained from the login response Hash).
  #
  def get_request_via_curl( server_url, request_url, user_email = '', user_token = '' )
    system(
      "curl -i " <<
      "-H \"X-User-Email: #{user_email}\" -H \"X-User-Token: #{user_token}\" " <<
      "-# http://#{server_url}#{request_url} > /dev/null"
    )
  end
  #-- -------------------------------------------------------------------------
  #++
end
