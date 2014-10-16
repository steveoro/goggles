# encoding: utf-8
require 'date'
require 'rubygems'
require 'fileutils'
require 'mechanize'

require 'framework/version'
require 'framework/application_constants'

require 'framework/console_logger'


=begin

= DB-maintenance tasks

  - Goggles framework vers.:  4.00.569
  - author: Leega, Steve A.

  (ASSUMES TO BE rakeD inside Rails.root)

=end
#-- ---------------------------------------------------------------------------
#++


namespace :db do

  desc <<-DESC
  Saves season team ranking of given seasons or season types in a permanent structure.
  This will alter the DB but it can be safely re-run since it uses updates.

  Options: season_ids='season1_id[, season2_id, ...]' (takes precedence over the following)
           season_type=['MASCSI'|'MASFIN'|...]

  DESC
  task :save_season_team_ranking do
    puts "\r\n*** db:save_season_team_ranking ***"

    # Environment setup
    rails_config  = Rails.configuration             # Prepare & check configuration:
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    db_host       = rails_config.database_configuration[Rails.env]['host']
    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )

    # Verify parameters
    raise ArgumentError.new("Needs at least a 'season_ids' or a 'season_type' parameter") unless ENV.include?("season_ids") || ENV.include?("season_type")

    #raise ArgumentError.new("Season not found") unless (season = Season.find( ENV["season_id"].to_i ) || season_ids = seasons.split(',')

    # Display some info:
    puts "DB host: #{db_host}"
    puts "DB name: #{db_name}"
    puts "DB user: #{db_user}"
    season_ids = []
    if ENV.include?("season_ids")
      season_ids = ENV["season_ids"].split(',')
      # Check if all seasons IDs are valid ([Steve] This is quite an useless check, since an error'd have been thrown anyway)
      season_ids.each do |id|
        raise ArgumentError.new("Season #{id} not found!") unless Season.find( id )
      end
    else
      season_ids = Season.includes(:season_type).where( 'season_types.code' => ENV["season_type"] ).map{ |s| s.id }
      puts "SeasonType code: #{ENV["season_type"]}"
    end
    puts "Season IDs to be processed: #{season_ids.inspect}"
    puts "\r\n---------------- 8< -------------------"

    season_saved = 0
    season_ids.each do |id|
      if season = Season.find( id )
        puts "\r\nSaving team ranking for season '#{season.get_full_name}'..."
        # Creates the season ranking and save teh first 3 elements
        if ChampionshipRankingCalculator.new( season ).save_computed_season_rank
          saved_data = season.computed_season_ranking
          puts "Season ranking correctly stored:"
          saved_data.each do |computed_season_rank|
            puts "#{computed_season_rank.rank}. #{computed_season_rank.team.name}: #{computed_season_rank.total_points}"
          end
          season_saved += 1
        else
          puts "\r\nError occurred during saving data process!"
          puts "\r\nTask failed!"
        end
      else
        puts "\r\nSeason #{season_id} misteriously disappers!"
        puts "Task stopped!"
        raise ArgumentError.new("Season not found")
      end
    end
    puts "\r\nSeason(s) saved: #{season_saved}"
    puts "Done"
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
