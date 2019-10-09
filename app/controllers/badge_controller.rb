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


  # Creates a new Badge, given the Team ID for its creation (:team_id), plus the
  # actual Badge details:
  #   :season_id, :swimmer_id, :number,
  #   :is_out_of_goggle_cup, :has_to_pay_fees, :has_to_pay_badge, :has_to_pay_relays
  #
  def create
    # DEBUG
    logger.debug( "\r\n\r\n!! ------ #{self.class.name}/create -----" )
    logger.debug( "PARAMS => #{params.inspect}\r\n" )
    swimmer = Swimmer.find_by(id: badge_params[:swimmer_id].to_i)
    season = Season.find_by(id: badge_params[:season_id].to_i)
    # Check parameters before proceeding:
    unless @team && swimmer && season
      flash[:error] = I18n.t('badge.management.errors.invalid_swimmer_season_or_team')
      redirect_to( root_path ) and return
    end
    team_affiliation = TeamAffiliation.find_by(season_id: season.id, team_id: @team.id)
    unless team_affiliation
      flash[:error] = I18n.t('badge.management.errors.missing_team_affiliation')
      redirect_to( team_radio_path(id: @team.id) ) and return
    end
    category_type = CategoryType.get_category_from(season.id, swimmer.year_of_birth)
    unless category_type
      flash[:error] = I18n.t('badge.management.errors.missing_category_type')
      redirect_to( team_radio_path(id: @team.id) ) and return
    end

    badge = Badge.new(
     team_id: @team.id,
     season_id: season.id,
     swimmer_id: swimmer.id,
     team_affiliation_id: team_affiliation.id,
     category_type_id: category_type.id,
     entry_time_type_id: EntryTimeType::LAST_RACE_ID, # (default)
     number: badge_params[:number] || '?',
     is_out_of_goggle_cup: badge_params[:is_out_of_goggle_cup] || false,
     has_to_pay_fees: badge_params[:has_to_pay_fees] || false,
     has_to_pay_badge: badge_params[:has_to_pay_badge] || false,
     has_to_pay_relays: badge_params[:has_to_pay_relays] || false
    )
    puts("\r\n\r\n[I] - Creating a new badge!")
    puts("      Badge: #{badge.inspect}")
    puts("      valid? => #{badge.valid?}")
    if badge.save
      logger.info("      Ok!")
      flash[:info] = I18n.t('badge.management.creation_successful')
      redirect_to( team_current_swimmers_path(id: @team.id) ) and return
    else
      puts("      Save FAILED.")
      flash[:error] = I18n.t('badge.management.errors.error_during_save')
      redirect_to( root_path ) and return
    end
  end
  #-- -----------------------------------------------------------------------
  #++

  # Updates an existing Badge, given its ID (:badge_id) plus the edited details:
  #  :number, :is_out_of_goggle_cup, :has_to_pay_fees, :has_to_pay_badge, :has_to_pay_relays
  #
  def update
    # DEBUG
    logger.debug( "\r\n\r\n!! ------ #{self.class.name}/update -----" )
    logger.debug( "PARAMS => #{params.inspect}\r\n" )

    # TODO

    flash[:info] = I18n.t('badge.management.update_successful')
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
    @team = Team.find_by_id( badge_params[:team_id] ) if badge_params[:team_id].present?
    if badge_params[:badge_id].present?
      @badge = Badge.find_by_id( badge_params[:badge_id] )
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

  # Strong parameters checking for both Badge creation & update
  def badge_params
    params.permit(
      :team_id, :badge_id,
      :season_id, :swimmer_id,
      :number,
      :is_out_of_goggle_cup, :has_to_pay_fees, :has_to_pay_badge, :has_to_pay_relays
    )
  end
  #-- -------------------------------------------------------------------------
  #++
end
