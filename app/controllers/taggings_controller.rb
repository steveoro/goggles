# encoding: utf-8


=begin

= TaggingsController

  AJAX-only controller used to respond with updated code for the "clickable"
  meeting or swimmer names partials after a name has been tagged as "favourite".

  - version:  6.062
  - author:   Steve A.

=end
class TaggingsController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user!

  # Parse parameters:
#  before_action :verify_parameter
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
        # Store save status:
        @is_saved_ok = meeting.save
      end
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
    # === AJAX POST-only ===
    if request.xhr? && request.post? && params[:id].present?
      meeting = Meeting.find_by_id( params[:id] )
      # Meeting found?
      if meeting && params[:t].present?
        @meeting_id = meeting.id
        # Meeting already tagged?
        if meeting.tags_by_team_list.include?( params[:t] )
          meeting.tags_by_team_list.remove( params[:t] )
          @is_starred = false
        else
          meeting.tags_by_team_list.add( params[:t] )
          @is_starred = true
        end
        # Store save status:
        @is_saved_ok = meeting.save
      end
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
        # Store save status:
        @is_saved_ok = swimmer.save
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
