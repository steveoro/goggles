# encoding: utf-8


=begin

= TaggingsController

  AJAX-only controller used to respond with updated code for the "clickable"
  meeting or swimmer names partials after a name has been tagged as "favourite".

  - version:  6.063
  - author:   Steve A.

=end
class TaggingsController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user!
  #-- -------------------------------------------------------------------------
  #++


  # Tags/Untags the specified Meeting :id as "favourite" for the current_user
  #
  # Returns the updated partial with the starred/unstarred meeting name,
  # rendered via AJAX.
  #
  # === Params:
  # - id: the Meeting.id to be tagged/untagged for the current_user.
  #
  def meeting_for_user
# DEBUG
    logger.debug( "\r\n*********** Taggings#meeting_for_user ***********" )
#    logger.debug( params.inspect )
    # === AJAX POST-only ===
    if request.xhr? && request.post? && params[:id].present?
      meeting = Meeting.find_by_id( params[:id] )
      # Meeting found?
      if meeting && current_user
        @meeting_id = meeting.id
        # Meeting already tagged?
        if meeting.tags_by_user_list.include?( "u#{ current_user.id }" )
          meeting.tags_by_user_list.remove( "u#{ current_user.id }" )
          @is_starred = false
        else
          meeting.tags_by_user_list.add( "u#{ current_user.id }" )
          @is_starred = true
        end
        logger.info("[I] - Taggings#meeting_for_user: meeting id: #{ @meeting_id }, starred: #{ @is_starred }")
        # Store save status:
        if meeting.save
          @is_saved_ok = true
          logger.info("[I] - Taggings#meeting_for_user: saved OK.")
        else
          @is_saved_ok = false
          logger.error("[E] - Taggings#meeting_for_user: ERROR during save!")
          flash[:error] = I18n.t("tags.error_during_save")
        end
      else
        logger.warn("[W] - Taggings#meeting_for_user: meeting or current_user not set!")
      end
    else
      logger.warn("[W] - Taggings#meeting_for_user: invalid request!")
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Tags/Untags the specified Meeting :id as "favourite" for the specified
  # TeamAffiliation.id as param[:t].
  #
  # Returns the updated partial with the starred/unstarred meeting name,
  # rendered via AJAX.
  #
  # === Params:
  # - id: the Meeting.id to be tagged/untagged for the current_user.
  # - t: the TeamAffiliation.id to be tagged/untagged for the current_user.
  #
  def meeting_for_team
# DEBUG
    logger.debug( "\r\n*********** Taggings#meeting_for_team ***********" )
#    logger.debug( params.inspect )
    # === AJAX POST-only ===
    if request.xhr? && request.post? && params[:id].present?
      meeting = Meeting.find_by_id( params[:id] )
      # Meeting found?
      if meeting && params[:t].present?
        @meeting_id = meeting.id
        @team_affiliation_id = params[:t]
        # Meeting already tagged?
        if meeting.tags_by_team_list.include?( "ta#{ params[:t] }" )
          meeting.tags_by_team_list.remove( "ta#{ params[:t] }" )
          @is_starred = false
        else
          meeting.tags_by_team_list.add( "ta#{ params[:t] }" )
          @is_starred = true
        end
        logger.info("[I] - Taggings#meeting_for_team: meeting id: #{ @meeting_id }, team_affiliation.id: #{ @team_affiliation_id }, starred: #{ @is_starred }")
        # Store save status:
        if meeting.save
          @is_saved_ok = true
          logger.info("[I] - Taggings#meeting_for_team: saved OK.")
        else
          @is_saved_ok = false
          logger.error("[E] - Taggings#meeting_for_team: ERROR during save!")
          flash[:error] = I18n.t("tags.error_during_save")
        end
      else
        logger.warn("[W] - Taggings#meeting_for_team: meeting or params[:t] not set!")
      end
    else
      logger.warn("[W] - Taggings#meeting_for_team: invalid request!")
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Tags/Untags the specified Swimmer :id as "favourite" for the current_user
  #
  # Returns the updated partial with the starred/unstarred Swimmer name,
  # rendered via AJAX.
  #
  # === Params:
  # - id: the Swimmer.id to be tagged/untagged for the current_user.
  #
  def swimmer_for_user
# DEBUG
    logger.debug( "\r\n*********** Taggings#swimmer_for_user ***********" )
#    logger.debug( params.inspect )
    # === AJAX POST-only ===
    if request.xhr? && request.post? && params[:id].present?
      swimmer = Swimmer.find_by_id( params[:id] )
      # Swimmer found?
      if swimmer && current_user
        @swimmer_id = swimmer.id
        # Swimmer already tagged?
        if swimmer.tags_by_user_list.include?( "u#{ current_user.id }" )
          swimmer.tags_by_user_list.remove( "u#{ current_user.id }" )
          @is_starred = false
        else
          swimmer.tags_by_user_list.add( "u#{ current_user.id }" )
          @is_starred = true
        end
        logger.info("[I] - Taggings#swimmer_for_user: swimmer id: #{ @swimmer_id }, starred: #{ @is_starred }")
        # Store save status:
        if swimmer.save
          @is_saved_ok = true
          logger.info("[I] - Taggings#swimmer_for_user: saved OK.")
        else
          @is_saved_ok = false
          logger.error("[E] - Taggings#swimmer_for_user: ERROR during save!")
          flash[:error] = I18n.t("tags.error_during_save")
        end
        @is_saved_ok = swimmer.save
      else
        logger.warn("[W] - Taggings#swimmer_for_user: swimmer or current_user not set!")
      end
    else
      logger.warn("[W] - Taggings#swimmer_for_user: invalid request!")
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Reports the still-open (not yet closed) meetings that have been starred by
  # any team member in order to create the reservations for them by the team
  # manager.
  #
  # Team manager-only action.
  #
  def starred_meetings
    unless current_user.instance_of?( User ) && ( current_user.team_managers.count > 0 )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.invalid_team_manager_or_no_swimmer')
      redirect_to( root_path() ) and return
    end

    open_season_ids = Season.is_not_ended.select(:id).map{|s| s.id }
    # Get the list of still-open, managed affiliations:
    open_team_affiliations = open_season_ids.map{ |season_id|
      # Find a possible team manager for the current open season:
      team_manager = current_user.team_managers.includes(:team_affiliation).joins(:team_affiliation)
        .select{|tm| tm.team_affiliation.season_id == season_id }.first
      team_manager ? team_manager.team_affiliation : nil
    }.compact

    # Init the list of starred meetings and possible users
    @meetings = []

    # For each affiliation, get all the (current) badges and swimmer IDs, and filter out
    # from all the gogglers the only one that belong to the list of swimmer IDs
    open_team_affiliations.each do |team_affiliation|
      user_ids = team_affiliation.badges.map{ |badge| badge.swimmer_id }
      possible_tags = User.where( "swimmer_id IN (?)", user_ids ).map{ |user| "u#{ user.id }" }
      # Extract the user-tagged, open and browsable meetings:
      @meetings += Meeting.includes( :season, :season_type, :meeting_sessions, :swimming_pools )
        .joins( :season, :season_type, :meeting_sessions, :swimming_pools )
        .where( "meetings.header_date >= ?", Date.today )
        .tagged_with( possible_tags, on: :tags_by_users, any: true )
        .order( "meetings.header_date" )
        .to_a
    end

    # Prepare the composed arrays:
    @meetings.uniq!
    @meetings.sort!{ |ma, mb| ma.header_date <=> mb.header_date }
  end
  #-- -------------------------------------------------------------------------
  #++
end
