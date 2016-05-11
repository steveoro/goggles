# encoding: utf-8
require 'common/format'


=begin

= TeamsController

  - version:  4.00.475
  - author:   Steve A.

=end
class TeamsController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user_from_token!, except: [:index, :radio]
  before_filter :authenticate_user!, except: [:index, :radio] # Devise HTTP log-in strategy
  # Parse parameters:
  before_filter :verify_parameter, except: [:index, :closed_goggle_cup]
  #-- -------------------------------------------------------------------------
  #++


  # Index/Search action
  #
  def index
    # Leega
    # TODO Verify order by name:
    # Team CITTA' DEI RAGAZZI (alias NUOTO AZZURRO) doesn't result correctly ordered
    @title = I18n.t('team.search_title')
    @teams_grid = initialize_grid(
      Team,
      order: 'name',
      order_direction: 'asc',
      per_page: 20
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Radiography for a specified team id: main ID card "Radiography" tab rendering.
  #
  # == Params:
  # id: the team id to be processed
  #
  def radio
    @tab_title = I18n.t('radiography.radio_tab')
  end
  #-- -------------------------------------------------------------------------
  #++

  # Radiography for a specified team id: "Current Swimmers" tab rendering
  #
  # == Params:
  # id: the team id to be processed
  #
  def current_swimmers
    @tab_title = I18n.t('radiography.team_current_swimmers_tab')
    @last_seasons = Season.is_not_ended.map{ |season| season.id }
    @affiliations = @team.team_affiliations.where( ['season_id in (?)', @last_seasons] )
    current_badges = @team.badges.where( ['season_id in (?)', @last_seasons] ) if @last_seasons && @team.badges
    @swimmers = if current_badges.nil?
      []
    else
      current_badges.map{ |badge| badge.swimmer }.uniq.sort{ |a,b| a.get_full_name <=> b.get_full_name }
    end
    @max_updated_at = find_last_updated_mir
  end
  #-- -------------------------------------------------------------------------
  #++

  # Radiography for a specified team id: "Best timings" tab rendering
  #
  # == Params:
  # id: the team id to be processed
  #
  def best_timings
    @tab_title = I18n.t('radiography.best_timings_tab')
    
    if @team.meeting_individual_results.count > 0
      @team_best_finder = TeamBestFinder.new( @team )
      @team_bests = @team_best_finder.split_categories( @team_best_finder.scan_for_distinct_bests )
      @max_updated_at = find_last_updated_mir
      @highlight_swimmer_id = find_swimmer_to_highlight
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Radiography for a specified team id: "Palmares" tab rendering
  #
  # == Params:
  # id: the team id to be processed
  #
  def palmares
    @tab_title = I18n.t('radiography.palmares_tab')
  end
  #-- -------------------------------------------------------------------------
  #++


  # Radiography for a specified team id: "Goggle cup" tab rendering
  # Collects and represents the Goggle cup ranking
  #
  # == Params:
  # id: the team id to be processed
  #
  def goggle_cup
    @tab_title = @team.get_current_goggle_cup_name_at

    # Gets current goggle cup, if any
    @goggle_cup = @team.get_current_goggle_cup_at

    # Gets goggle cup ranks
    @goggle_cup_rank = @goggle_cup ? @goggle_cup.calculate_goggle_cup_rank : []
  end
  #-- -------------------------------------------------------------------------
  #++


  # Radiography for a specified team id: "Goggle cup all of fame" tab rendering
  # Shows the first three swuimmer of closed edition of Goggle cup
  #
  # == Params:
  # id: the team id to be processed
  #
  def goggle_cup_all_of_fame
    @tab_title = I18n.t('radiography.goggle_cup_all_of_fame_tab')

    # Prepares an hash to store closed goggle cup rank
    @closed_goggle_cup = []

    # Gets closed, valid goggle cup, if any
    @team.goggle_cups.each do |goggle_cup|
      if goggle_cup.is_closed_at?
        # Collects first three positions of that closed goggle cup
        goggle_cup_rank = goggle_cup.calculate_goggle_cup_rank

        # Adds goggle cup data to the hash
        @closed_goggle_cup << {
          goggle_cup:    goggle_cup,
          year:          goggle_cup.season_year,
          first:         goggle_cup_rank[0] ? goggle_cup_rank[0][:swimmer] : nil,
          first_points:  goggle_cup_rank[0] ? goggle_cup_rank[0][:total]   : 0,
          second:        goggle_cup_rank[1] ? goggle_cup_rank[1][:swimmer] : nil,
          second_points: goggle_cup_rank[1] ? goggle_cup_rank[1][:total]   : 0,
          third:         goggle_cup_rank[2] ? goggle_cup_rank[2][:swimmer] : nil,
          third_points:  goggle_cup_rank[2] ? goggle_cup_rank[2][:total]   : 0
        } if goggle_cup_rank.size > 0
      end

      # Sorts the array  by the year
      @closed_goggle_cup.sort!{ |hash_element_prev, hash_element_next| hash_element_next[:year] <=> hash_element_prev[:year] }
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Radiography for a specified team id: "Goggle cup" tab rendering
  # Collects and represents the Goggle cup ranking
  #
  # == Params:
  # id: the team id to be processed
  #
  # TODO Verify if better using the same view for current and closed
  def closed_goggle_cup
    unless ( params[:id] ) && GoggleCup.exists?( params[:id].to_i )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to(:back) and return
    end

    # Gets closed goggle cup
    @closed_goggle_cup = GoggleCup.find( params[:id].to_i )
    @team = @closed_goggle_cup.team.decorate if @closed_goggle_cup


    @tab_title = @closed_goggle_cup.get_full_name

    # Gets goggle cup ranks
    @closed_goggle_cup_rank = @closed_goggle_cup ? @closed_goggle_cup.calculate_goggle_cup_rank : []
  end
  #-- -------------------------------------------------------------------------
  #++


  # Return the number of meetings attended by a Team instance
  # Usage: count_meetings_team_path( id: team_id_to_be_searched )
  #
  # === Params:
  # - id: the Team.id
  #
  def count_meetings
    # TODO respond with xml, only if valid session, otherwise return nil
    team = Team.find_by_id( params[:id] )
    if team
      render json: team.meetings.collect{|row| row.id}.uniq.size
    else
      render json: 0
    end
  end

  # Return the number of individual + relay results obtained by a Team instance
  # Usage: count_results_team_path( id: team_id_to_be_searched )
  #
  # === Params:
  # - id: the Team.id
  #
  def count_results
    # TODO respond with xml, only if valid session, otherwise return nil
    team = Team.find_by_id( params[:id] )
    if team
      render json: ( team.meeting_individual_results.count + team.meeting_relay_results.count )
    else
      render json: 0
    end
  end


  # Combines both methods above to return a composed string
  # Usage: count_details_team_path( id: team_id_to_be_searched )
  #
  # === Params:
  # - id: the Team.id
  #
  def count_details
    # TODO respond with xml, only if valid session, otherwise return nil
    team = Team.find_by_id( params[:id] )
    if team
      render json: "#{I18n.t('meeting.total_attended_meetings')}: " +
                      team.meetings.collect{|row| row.id}.uniq.size.to_s +
                      ", #{I18n.t('meeting.total_results_short')}: " +
                      ( team.meeting_individual_results.count + team.meeting_relay_results.count ).to_s
    else
      render json: ''
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Find out the last update of meeting_individual result
  #
  def find_last_updated_mir
    @team.meeting_individual_results.count > 0 ? @team.meeting_individual_results.sort_by_updated_at('DESC').first.updated_at : 0
  end

  # Find out the last update of meeting_individual result
  #
  def find_swimmer_to_highlight
    if current_user.swimmer && Badge.for_team(@team).for_swimmer(current_user.swimmer).count > 0
      current_user.swimmer.id
    else
      0
    end
  end


  private

  # Verifies that a team id is provided as parameter; otherwise
  # redirects to the home page.
  # Assigns the @team instance when successful.
  #
  # == Params:
  # id: the team id to be processed by most of the methods (see before filter above)
  #
  def verify_parameter
    set_team
    unless ( @team )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to(:back) and return
    end
  end

  # Verifies that a team id is provided as a parameter to this controller.
  # Assigns the @team instance when successful.
  #
  # == Controller Params:
  # id: the team id to be processed by most of the methods (see before filter above)
  #
  def set_team
    @team = Team.find_by_id( params[:id].to_i )
    @team = @team.decorate if @team
  end
  #-- -------------------------------------------------------------------------
  #++
  #-- -------------------------------------------------------------------------
  #++
end
