# encoding: utf-8
require 'common/format'


=begin

= BadgeController

  - version:  6.404
  - author:   Steve A.

=end
class BadgeController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user!

  # Parse team parameter:
  before_action :verify_parameters

  # Verify if valid team maneger:
  before_action :verify_team_manageability


  # Renders the new/edit Badge form partial. Suitable for:
  # - New  => :team_id required (will set @team & use Badge.new as instance)
  # - Edit => :badge_id required (will set both @team & @badge)
  #
  def edit_form
    # Quick'n'dirty list to allow pre-filtering & management based even on previous seasons: (just looks at the current year)
    @manageable_seasons_options = Season.where("INSTR(header_year, #{Date.today.year.to_s}) > 0")
                                        .order(:description)
                                        .map { |season| [season.description, season.id] } if @is_valid_team_manager
    # Destination DOM id according to Badge edit / creation:
    @dom_id = @badge && @badge.swimmer_id.present? ? "rowBadgeEditForm-#{@badge.swimmer_id}" : "rowBadgeEditForm-0"
  end


  # Creates a new Badge, given the Team ID for its creation (:team_id), plus the
  # actual Badge details:
  #   :season_id, :swimmer_id, :number,
  #   :is_out_of_goggle_cup, :has_to_pay_fees, :has_to_pay_badge, :has_to_pay_relays
  #
  def create
    # DEBUG
    # puts( "\r\n\r\n!! ------ #{self.class.name}/create -----" )
    # puts( "PARAMS => #{params.inspect}\r\n" )
    swimmer = Swimmer.find_by(id: badge_create_params[:swimmer_id].to_i)
    season = Season.find_by(id: badge_create_params[:season_id].to_i)
    # Check parameters before proceeding:
    unless swimmer && season
      flash[:error] = I18n.t('badge.management.errors.invalid_swimmer_season_or_team')
      redirect_to( team_current_swimmers_path(id: @team.id) ) and return
    end
    team_affiliation = TeamAffiliation.find_by(season_id: season.id, team_id: @team.id)
    unless team_affiliation
      flash[:error] = I18n.t('badge.management.errors.missing_team_affiliation')
      redirect_to( team_current_swimmers_path(id: @team.id) ) and return
    end
    category_type = CategoryType.get_category_from(season.id, swimmer.year_of_birth)
    unless category_type
      flash[:error] = I18n.t('badge.management.errors.missing_category_type')
      redirect_to( team_current_swimmers_path(id: @team.id) ) and return
    end

    badge = Badge.new(
     team_id:               @team.id,
     season_id:             season.id,
     swimmer_id:            swimmer.id,
     team_affiliation_id:   team_affiliation.id,
     category_type_id:      category_type.id,
     entry_time_type_id:    EntryTimeType::LAST_RACE_ID, # (default)
     number:                badge_create_params[:number] || '?',
     is_out_of_goggle_cup:  badge_create_params[:is_out_of_goggle_cup] || false,
     has_to_pay_fees:       badge_create_params[:has_to_pay_fees] || false,
     has_to_pay_badge:      badge_create_params[:has_to_pay_badge] || false,
     has_to_pay_relays:     badge_create_params[:has_to_pay_relays] || false
    )
    logger.info("\r\n\r\n[I] - Creating a new badge!")
    logger.debug(badge.inspect)
    logger.info("valid? => #{badge.valid?}")
    if badge.save
      logger.info("Ok!")
      flash[:info] = I18n.t('badge.management.creation_successful')
    else
      logger.warn("Save FAILED.")
      flash[:error] = I18n.t('badge.management.errors.error_during_save')
    end
    redirect_to( team_current_swimmers_path(id: @team.id) ) and return
  end
  #-- -----------------------------------------------------------------------
  #++

  # Updates an existing Badge, given its ID (:badge_id) plus the edited details:
  #  :number, :is_out_of_goggle_cup, :has_to_pay_fees, :has_to_pay_badge, :has_to_pay_relays
  #
  def update
    # DEBUG
    # puts( "\r\n\r\n!! ------ #{self.class.name}/update -----" )
    # puts( "PARAMS => #{params.inspect}\r\n" )
    unless @badge && @team
      flash[:error] = I18n.t('badge.management.errors.invalid_badge')
      redirect_to( root_path ) and return
    end

    logger.info("\r\n\r\n[I] - Updating existing badge:")
    logger.debug(@badge.inspect)
    logger.info("valid? => #{@badge.valid?}")
    if @badge.update(badge_update_params)
      logger.info("Ok!")
      flash[:info] = I18n.t('badge.management.update_successful')
    else
      logger.warn("Save FAILED.")
      flash[:error] = I18n.t('badge.management.errors.error_during_save')
    end

    redirect_to( team_current_swimmers_path(id: @team.id) ) and return
  end
  #-- -----------------------------------------------------------------------
  #++


  private


  # Assigns both @team @badge instances depending on params value & presence.
  #
  # === Controller Params:
  # team_id: team id to be processed (in case of a POST)
  # badge_id: badge id to be processed (in case of a PUT)
  #
  # === Sets/assigns:
  # - @team, valid Team instance; won't be set if the badge parameter is not valid
  # - @badge, valid Badge instance in case it's being edited
  #
  def set_parameters
    @team = Team.find_by_id( badge_create_params[:team_id] ) if badge_create_params[:team_id].present?
    if badge_create_params[:badge_id].present?
      @badge = Badge.find_by_id( badge_create_params[:badge_id] )
      @team = @badge.team if @badge
    end
  end

  # Verifies usable parameters and redirects accordingly in case of errors.
  #
  def verify_parameters
    set_parameters
    unless @team
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.missing_team_id')
      redirect_back( fallback_location: root_path ) and return
    end
  end

  # Verifies that the current user is the team_manager of the selected team.
  # Else, returns an invalid action request.
  #
  # === Sets/assigns:
  # - @is_valid_team_manager, either +true+ or +false+
  #
  # === Implied parameters:
  # current_user:  user must be logged-in and either be a team-manager
  # @team:  selected team
  #
  def verify_team_manageability
    @is_valid_team_manager = TeamManagerValidator.can_manage_team?( current_user, @team )
    unless ( @is_valid_team_manager )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.invalid_team_manager')
      redirect_to( team_radio_path(id: @team.id) ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Strong parameters checking for Badge creation & update
  def badge_create_params
    params.permit(
      :team_id, :badge_id,
      :season_id, :swimmer_id,
      :number,
      :is_out_of_goggle_cup, :has_to_pay_fees, :has_to_pay_badge, :has_to_pay_relays
    )
  end

  # Strong parameters checking for Badge update
  def badge_update_params
    params.permit(:number, :is_out_of_goggle_cup, :has_to_pay_fees, :has_to_pay_badge, :has_to_pay_relays)
  end
  #-- -------------------------------------------------------------------------
  #++
end
