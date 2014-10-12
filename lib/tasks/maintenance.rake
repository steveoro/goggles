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

  - Goggles framework vers.:  4.00.558
  - author: Leega

  (ASSUMES TO BE rakeD inside Rails.root)

=end
#-- ---------------------------------------------------------------------------
#++


namespace :db do

  desc <<-DESC
  Saves season team ranking of given season ina permanente structure

  This method alter the DB and should be repeated (performs an update).

  Options: season_id=[season_id]
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
    raise ArgumentError.new("Needs the ID of the season to save") unless ENV.include?("season_id")
    raise ArgumentError.new("Season not found") unless season = Season.find( ENV["season_id"].to_i )

    # Display some info:
    puts "DB host: #{db_host}"
    puts "DB name: #{db_name}"
    puts "DB user: #{db_user}"
    puts "\r\nSaving team ranking for season '#{season.get_full_name}'..."
    puts "\r\n---------------- 8< -------------------"

    # Creates the season ranking and save teh first 3 elements    
    if ChampionshipRankingCalculator.new( season ).save_computed_season_rank
      saved_data = season.computed_season_ranking
      puts "\r\nSeason ranking correctly stored:"
      saved_data.each do |computed_season_rank|
        puts "#{computed_season_rank.rank}. #{computed_season_rank.team.name}: #{computed_season_rank.total_points}"
      end      
      puts "\r\nDone."
    else
      puts "\r\nError occurred during saving data process!"
      puts "\r\nTask failed!"
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
