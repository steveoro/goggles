# encoding: utf-8
require 'common/format'


=begin

= TeamsController

  - version:  4.00.405
  - author:   Steve A.

=end
class TeamsController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user_from_token!, except: [:index, :radio]
  before_filter :authenticate_user!, except: [:index, :radio] # Devise HTTP log-in strategy
  # Parse parameters:
  before_filter :verify_parameter, except: [:index]
  #-- -------------------------------------------------------------------------
  #++


  # Index/Search action
  #
  def index
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
  end
  #-- -------------------------------------------------------------------------
  #++

  # Radiography for a specified team id: "Current Swimmers" tab rendering
  #
  # == Params:
  # id: the team id to be processed
  #
  def current_swimmers
    last_season = @team.seasons.last
    current_badges = @team.badges.where( season_id: last_season.id ) if last_season && @team.badges
    @swimmers = if current_badges.nil?
      []
    else
      current_badges.map{ |badge| badge.swimmer }.sort{ |a,b| a.get_full_name <=> b.get_full_name }
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Radiography for a specified team id: "Best timings" tab rendering
  #
  # == Params:
  # id: the team id to be processed
  #
  def best_timings
  end
  #-- -------------------------------------------------------------------------
  #++


  # Radiography for a specified team id: "Palmares" tab rendering
  #
  # == Params:
  # id: the team id to be processed
  #
  def palamares
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
    # Get current goggle cup, if any
    @goggle_cup = @team.get_current_goggle_cup_at
    if @goggle_cup
      # Prepare an hash to store goggle cup rank
      @goggle_cup_rank = []

      # Collect swimmers involved
      # A swimmer is involved if has a badge for at a least a season of goggle cup definition
      # and is ranked if has at least a result for that badge(s)
      swimmers = @team.badges
        .joins(season: :goggle_cup_definitions)
        .where(['goggle_cup_definitions.goggle_cup_id = ?', @goggle_cup.id])
        .collect{|badge| badge.swimmer }
        .uniq
      
      # Collects best results for each swimmer
      # The number of result to consider is set in the goggle cup header
      swimmers.each do |swimmer|
        points = swimmer.meeting_individual_results
          .joins(season: :goggle_cup_definitions)
          .where(['goggle_cup_definitions.goggle_cup_id = ?', @goggle_cup.id])
          .has_points(:goggle_cup_points)
          .sort_by_goggle_cup('DESC')
          .limit(@goggle_cup.max_points)
          .collect{ |meeting_individual_result| meeting_individual_result.goggle_cup_points }
        @goggle_cup_rank << {
          swimmer: swimmer, 
          total:   points.sum, 
          max:     points.max,
          min:     points.min,
          count:   points.count,
          average: (points.sum / points.count).round( 2 ) 
        } if points.count > 0
      end
      
      # Sorts the hash to create rank
      @goggle_cup_rank.sort!{ |hash_element_prev, hash_element_next| hash_element_next[:total] <=> hash_element_prev[:total] }
    end
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
end
