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
        if meeting.tags_by_user_list.include?(  current_user.id.to_s )
          meeting.tags_by_user_list.remove( current_user.id.to_s )
          @is_starred = false
        else
          meeting.tags_by_user_list.add( current_user.id.to_s )
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
        if meeting.tags_by_team_list.include?( params[:t] )
          meeting.tags_by_team_list.remove( params[:t] )
          @is_starred = false
        else
          meeting.tags_by_team_list.add( params[:t] )
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
        if swimmer.tags_by_user_list.include?(  current_user.id.to_s )
          swimmer.tags_by_user_list.remove( current_user.id.to_s )
          @is_starred = false
        else
          swimmer.tags_by_user_list.add( current_user.id.to_s )
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
end
