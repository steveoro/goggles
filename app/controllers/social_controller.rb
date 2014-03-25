# encoding: utf-8

class SocialController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user!
  # ---------------------------------------------------------------------------


  # Invite friends action.
  #
  # === GET:
  #     Renderes the landing page with the invite form.
  #
  # === POST:
  #     Creates the friendship row with pending status (pending invites will be
  #     automatically shown to a user on its personalized news-feed).
  def invite
    @title = I18n.t('social.invite_title')
    if request.post?
    else
      @swimming_buddy = User.find_by_id( params[:id] )
      unless ( @swimming_buddy )                    # Check swimming buddy existance
        flash[:error] = I18n.t(:invalid_action_request)
        redirect_to( root_path() ) and return
      end
                                                    # Check that the friendship is a new one:
      if ( current_user.find_any_friendship_with(@swimming_buddy).nil? )
        # TODO friendship must not exist for invite
        @friendship = Amistad.friendship_class.new( friendable_id: current_user.id, friend_id: @swimming_buddy.id )
      else
        # TODO if friendship exists, go to edit invite / accept options?
        # TODO if friendship exists, go to edit invite / accept options?
        flash[:warning] = I18n.t('social.warning_friendship_invite_already_sent_edit_options')
        redirect_to( accept_social_path() ) and return
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
  def accept
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
  def block
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

end
