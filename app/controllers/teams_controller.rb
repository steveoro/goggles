# encoding: utf-8
require 'common/format'


=begin

= TeamsController

  - version:  6.341
  - author:   Steve A.

=end
class TeamsController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user!, except: [:index, :radio] # Devise HTTP log-in strategy
  # Parse parameters:
  before_action :verify_parameter, except: [:index, :closed_goggle_cup, :printout_goggle_cup]
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
  # header_year: typically nil, it's a current date override for when checking
  #      for @swimmer badges in current season (mainly used only inside specs
  #      to test a couple of edge conditions)
  #
  def current_swimmers
    params.permit! # (No unsafe params are possible)
    @tab_title = I18n.t('radiography.team_current_swimmers_tab')
    #***************************************************************************
    # FIXME TEMP HACK to have swimmers even if all the seasons are ended:
    # @last_seasons = get_searched_seasons # <= CORRECT
    @last_seasons = Season.where("INSTR(header_year, #{Date.today.year.to_s}) > 0")
                    # ^^^ TEMP HACK
    #***************************************************************************
    @affiliations = @team.team_affiliations.includes(season: :federation_type).where(season_id: @last_seasons)
    current_badges = @team.badges.where(season_id: @last_seasons).includes(:swimmer)
    @team.badges.where(season_id: @last_seasons).includes( :swimmer ) if @last_seasons && @team.badges.exists?
    @swimmers = if current_badges.nil?
      []
    else
      current_badges.map{ |badge| badge.swimmer }.uniq.sort{ |a,b| a.get_full_name <=> b.get_full_name }
    end
    @max_updated_at = find_last_updated_mir
    # Badge management entry point, only for Team Managers:
    @is_valid_team_manager = TeamManagerValidator.can_manage_team?( current_user, @team )
    # Quick'n'dirty list to allow pre-filtering & management based even on previous seasons: (just looks at the current year)
    @manageable_seasons_options = Season.where("INSTR(header_year, #{Date.today.year.to_s}) > 0")
                                        .order(:description)
                                        .map { |season| [season.description, season.id] } if @is_valid_team_manager
  end
  #-- -------------------------------------------------------------------------
  #++


  # Team Radiography - Pre-computed "Best timings" (RecordType: TTB)
  #
  # == Params:
  # id: the team id to be processed
  #
  def best_timings
    # Bail out in case there are no results to process:
    unless @team.meeting_individual_results.exists?
      flash[:error] = I18n.t('radiography.team.no_data_to_process_for_this_team')
      redirect_to( team_radio_path(id: @team.id) ) and return
    end
    # Bail out in case there are no best-timings to process:
    unless IndividualRecord.for_team( @team.id ).exists?
      flash[:error] = I18n.t('radiography.team.no_record_found_for_this_team')
      redirect_to( team_radio_path(id: @team.id) ) and return
      # TODO / FUTURE DEV [Steve, 20170413] Eventually, it could be possibile to fall-back
      # to a real-time computation of the team's best timings, using the same
      # (OLD) implementation from the above action:
      #
      #  @team_bests = @team_best_finder.split_categories( @team_best_finder.scan_for_distinct_bests )
    end
    @tab_title = I18n.t('radiography.precalc_best_timings_tab')

    # Setup the record collection and get the pre-calc records MIRs:
    team_distinct_best_dao = RecordX4dDAO.new( @team, RecordType.find_by_code( 'TTB' ) )

    # Scan the pre-computed records and fill the collection DAO with each records'MIR row found:
    IndividualRecord.joins(:record_type).where( 'record_types.code' => 'TTB' ).for_team( @team.id ).includes(:meeting_individual_result)
      .joins(:meeting_individual_result).each do |record|
        team_distinct_best_dao.add_record( record.meeting_individual_result )
    end

    @team_best_finder = TeamBestFinder.new( @team )
    @team_bests = @team_best_finder.split_categories( team_distinct_best_dao )
    @max_updated_at = find_last_updated_mir
    @highlight_swimmer_id = find_swimmer_to_highlight
  end


  # [Steve, 20170413] (Following code, kept temporarily only for reference)
  #
  # Team Radiography - Real-time "Best timings" computation (RecordType: TTB)
  #
  # == Params:
  # id: the team id to be processed
  #
  # @deprecated
  #
#  def best_timings_OLD_VERSION_WITH_REAL_TIME_COMPUTATION
#    @tab_title = I18n.t('radiography.best_timings_tab')
#    if @team.meeting_individual_results.exists?
#      @team_best_finder = TeamBestFinder.new( @team )
#      @team_bests = @team_best_finder.split_categories( @team_best_finder.scan_for_distinct_bests )
#      @max_updated_at = find_last_updated_mir
#      @highlight_swimmer_id = find_swimmer_to_highlight
#    end
#  end


  # Prepares the PDF print-out for the event and relay reservations for the current
  # meeting.
  #
  # == Params:
  # id: the meeting id to be processed
  #
  # == Implied parameters:
  # current_user:  user must be logged-in and either be a team-manager or have an
  #                associated swimmer (must be a "goggler").
  #                (when also a team-manager, the whole matrix of rows should be editable)
  #
  def printout_best_timings
    # Bail out in case there are no results to process:
    unless @team.meeting_individual_results.exists?
      flash[:error] = I18n.t('radiography.team.no_data_to_process_for_this_team')
      redirect_to( team_radio_path(id: @team.id) ) and return
    end
    # Bail out in case there are no best-timings to process:
    unless IndividualRecord.for_team( @team.id ).exists?
      flash[:error] = I18n.t('radiography.team.no_record_found_for_this_team')
      redirect_to( team_radio_path(id: @team.id) ) and return
      # TODO / FUTURE DEV [Steve, 20170413] Eventually, it could be possibile to fall-back
      # to a real-time computation of the team's best timings, using the same
      # (OLD) implementation from the above action:
      #
      #  @team_bests = @team_best_finder.split_categories( @team_best_finder.scan_for_distinct_bests )
    end

    # Setup the record collection and get the pre-calc records MIRs:
    team_distinct_best_dao = RecordX4dDAO.new( @team, RecordType.find_by_code( 'TTB' ) )

    # Scan the pre-computed records and fill the collection DAO with each records'MIR row found:
    IndividualRecord.for_team( @team.id ).includes(:meeting_individual_result)
      .joins(:meeting_individual_result).each do |record|
        team_distinct_best_dao.add_record( record.meeting_individual_result )
    end

    @team_best_finder = TeamBestFinder.new( @team )
    @team_bests = @team_best_finder.split_categories( team_distinct_best_dao )
                                                    # == OPTIONS setup + RENDERING phase ==
    base_filename = "#{ I18n.t('radiography.team.ttb_records_basefilename') }_#{ @team.id }"
    filename = create_unique_filename( base_filename ) + '.pdf'
    options = {
      report_title:         I18n.t('radiography.team.ttb_records_title'),
      meta_info_subject:    'team best-timings records printout',
      meta_info_keywords:   "Goggles, #{base_filename}'",
      team:                 @team,
      team_best_finder:     @team_best_finder,
      team_bests:           @team_bests
    }
    send_data(                                      # == Render layout & send data:
        TeamBestTimingsLayout.render( options ),
        type: 'application/pdf',
        filename: filename
    )
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
    @goggle_cup_name = @goggle_cup ? @goggle_cup.get_full_name : I18n.t('goggle_cup.default_name')
    @goggle_cup_max_points = @goggle_cup ? @goggle_cup.max_points.to_s : I18n.t('goggle_cup.default_max_points')
    @goggle_cup_max_performance = @goggle_cup ? @goggle_cup.max_performance.to_s : I18n.t('goggle_cup.default_max_performance')

    # Prepare goggle cup rankings
    @goggle_cup_rank = @goggle_cup ? @goggle_cup.calculate_goggle_cup_rank : []
  end
  #-- -------------------------------------------------------------------------
  #++


  # Radiography for a specified team id: "Goggle cup" tab rendering
  # Collects and represents the Goggle cup ranking
  #
  # == Params:
  # id: the GoggleCup id to be processed
  #
  def printout_goggle_cup
    # Gets current goggle cup, if any
    goggle_cup = GoggleCup.find_by_id( params[:id] )
    goggle_cup_name = goggle_cup ? goggle_cup.get_full_name : I18n.t('goggle_cup.default_name')

    # Prepare goggle cup rankings
    @goggle_cup_rank = goggle_cup ? goggle_cup.calculate_goggle_cup_rank : []

    # == OPTIONS setup + RENDERING phase ==
    base_filename = I18n.t('goggle_cup.default_name').underscore
    filename = create_unique_filename( base_filename ) + '.pdf'
    options = {
      report_title:         goggle_cup_name,
      meta_info_subject:    'GoggleCup rankings printout',
      meta_info_keywords:   "Goggles, #{ base_filename }'",
      view_context:         view_context,
      ranking:              @goggle_cup_rank
    }
    send_data(                                      # == Render layout & send data:
        GoggleCupRankingLayout.render( options ),
        type: 'application/pdf',
        filename: filename
    )
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
  # TODO Verify if is better using the same view for current and closed
  def closed_goggle_cup
    unless ( params[:id] ) && GoggleCup.exists?( params[:id].to_i )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_back( fallback_location: root_path ) and return
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
    @team.meeting_individual_results.exists? ? @team.meeting_individual_results.sort_by_updated_at('DESC').first.updated_at : 0
  end

  # Find out the last update of meeting_individual result
  #
  def find_swimmer_to_highlight
    if current_user.swimmer && Badge.for_team(@team).for_swimmer(current_user.swimmer).exists?
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
      redirect_back( fallback_location: root_path ) and return
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


  # Get current seasons
  # If parameters contains an header year, searched seasons are those with header year containing given one
  # otherwise searched seasons are those not ended
  def get_searched_seasons
    current_seasons = if params['header_year'].present?
      Season.where( "header_year LIKE '%#{ params['header_year'] }%'" )
    else
      Season.is_not_ended
    end
    current_seasons.map{ |season| season.id }
  end
  #-- -------------------------------------------------------------------------
  #++
end
