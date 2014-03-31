# encoding: utf-8

class SocialController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user!
  # ---------------------------------------------------------------------------


  # Show all friendships action.
  def show_all
    @title = I18n.t('social.invite_title')
    @friendships = current_user.friendships
    @pending_invited = current_user.pending_invited
    @invited = current_user.invited
    @blocked_friendships = current_user.blocked_friendships
  end
  # ---------------------------------------------------------------------------


  # Invite friends action.
  #
  # === GET:
  #     Renderes the landing page with the invite form.
  # ==== Params:
  #     :id => the id of the swimming buddy to be invited by the current user
  #
  # === POST:
  #     Creates the friendship row with pending status (pending invites will be
  #     automatically shown to a user on its personalized news-feed).
  # ==== Params:
  #     :id => the id of the swimming buddy to be invited by the current user
  #     :shares_passages  => set to '1' to enable, anything else to disable
  #     :shares_trainings => set to '1' to enable, anything else to disable
  #     :shares_calendars => set to '1' to enable, anything else to disable
  #
  def invite
    @title = I18n.t('social.invite_title')

    if request.post?                                # === POST: ===
      @swimming_buddy = User.find_by_id( params[:id] )
      shares_passages  = (params[:shares_passages].to_i > 0)
      shares_trainings = (params[:shares_trainings].to_i > 0)
      shares_calendars = (params[:shares_calendars].to_i > 0)
      if current_user.invite( @swimming_buddy, shares_passages, shares_trainings, shares_calendars )
        flash[:info] = I18n.t('social.invite_successful')
      else
        flash[:error] = I18n.t('social.invite_error')
      end
      redirect_to( show_all_social_path() ) and return
                                                    # === GET: ===
    else
      @swimming_buddy = User.find_by_id( params[:id] )
      unless ( @swimming_buddy )                    # Check swimming buddy existance
        flash[:error] = I18n.t(:invalid_action_request)
        redirect_to( show_all_social_path() ) and return
      end
                                                    # Check that the friendship is a new one:
      if ( current_user.find_any_friendship_with(@swimming_buddy).nil? )
        # friendship must not exist for a new invite to be spawn:
        @friendship = Amistad.friendship_class.new( friendable_id: current_user.id, friend_id: @swimming_buddy.id )
      else
        # If friendship exists:
        flash[:warning] = I18n.t('social.warning_friendship_invite_already_sent_edit_options')
        redirect_to( show_all_social_path() ) and return
      end
    end
  end
  # ---------------------------------------------------------------------------


  # Accept/edit friends action.
  #
  # === GET:
  #     Renderes the landing page with the accept form for editing friendship
  #     parameters.
  #
  # === PUT:
  #     Updates friendship row with the accepted status (creates also a personalized
  #     news feed article).
  def approve
    # TODO
  end
  # ---------------------------------------------------------------------------


  # Block friends action.
  #
  # === GET:
  #     Renderes the landing page with the confirmation form.
  #
  # === PUT:
  #     Updates friendship row with the blocked status (w/o news feed article).
  def block
    # TODO
  end
  # ---------------------------------------------------------------------------


  # Un-block friends action.
  #
  # === GET:
  #     Renderes the landing page with the confirmation form.
  #
  # === PUT:
  #     Updates friendship row clearing the blocked status (w/o news feed article).
  def unblock
    # TODO
  end
  # ---------------------------------------------------------------------------


  # Remove friendship action.
  #
  # === GET:
  #     Renderes the landing page with the confirmation form.
  #
  # === DELETE:
  #     Removes the friendship row (adding also a news feed article TODO?).
  def remove_friendship
    # TODO
  end
  # ---------------------------------------------------------------------------


  # Edit friendship action.
  #
  # === GET:
  #     Renderes the edit form.
  #
  # === UPDATE:
  #     Update the changes (news feed generated only for new sharings).
  def edit
    # TODO
  end
  # ---------------------------------------------------------------------------

end
