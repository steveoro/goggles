# encoding: utf-8

class SocialsController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_entity_from_token!
  before_filter :authenticate_entity!                # Devise "standard" HTTP log-in strategy
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
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.invite() -----"
    logger.debug "PARAMS: #{params.inspect}"
    @title = I18n.t('social.invite_title')
    @swimming_buddy = User.find_by_id( params[:id] )

    if request.post?                                # === POST: ===
      shares_passages  = (params[:shares_passages].to_i > 0)
      shares_trainings = (params[:shares_trainings].to_i > 0)
      shares_calendars = (params[:shares_calendars].to_i > 0)
      if current_user.invite( @swimming_buddy, shares_passages, shares_trainings, shares_calendars )
        flash[:info] = I18n.t('social.invite_successful')
      else
        flash[:error] = I18n.t('social.invite_error')
      end
      redirect_to( socials_show_all_path() ) and return
                                                    # === GET: ===
    else
      unless ( @swimming_buddy )                    # Check swimming buddy existance
        flash[:error] = I18n.t(:invalid_action_request)
        redirect_to( socials_show_all_path() ) and return
      end
      @submit_title = I18n.t('social.send')
                                                    # Check that the friendship is a new one:
      if ( current_user.find_any_friendship_with(@swimming_buddy).nil? )
        # friendship must not exist for a new invite to be spawn:
        @friendship = Amistad.friendship_class.new( friendable_id: current_user.id, friend_id: @swimming_buddy.id )
      else
        # If friendship exists:
        flash[:warning] = I18n.t( 'social.warning_friendship_invite_already_sent_edit_options' )
          .gsub( "{SWIMMER_NAME}", @swimming_buddy.name )
        redirect_to( socials_show_all_path() ) and return
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
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.invite() -----"
    logger.debug "PARAMS: #{params.inspect}"
    @title = I18n.t('social.approve_title')
    @swimming_buddy = User.find_by_id( params[:id] )

    if request.post?                                # === POST: ===
      shares_passages  = (params[:shares_passages].to_i > 0)
      shares_trainings = (params[:shares_trainings].to_i > 0)
      shares_calendars = (params[:shares_calendars].to_i > 0)
      if current_user.approve( @swimming_buddy, shares_passages, shares_trainings, shares_calendars )
        flash[:info] = I18n.t('social.approve_successful')
      else
        flash[:error] = I18n.t('social.approve_error')
      end
      redirect_to( socials_show_all_path() ) and return
                                                    # === GET: ===
    else
      unless @swimming_buddy                        # Check swimming buddy existance
        flash[:error] = I18n.t(:invalid_action_request)
        redirect_to( socials_show_all_path() ) and return
      end
      @submit_title = I18n.t('social.approve')
      @friendship = current_user.find_any_friendship_with(@swimming_buddy)
                                                    # Check that the friendship is a valid one:
      unless @friendship && @friendship.pending? &&
             @swimming_buddy.invited?(current_user)
        flash[:warning] = I18n.t( 'social.warning_could_not_find_valid_or_pending_friendship' )
          .gsub( "{SWIMMER_NAME}", @swimming_buddy.name )
        redirect_to( socials_show_all_path() ) and return
      end
    end
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
  def remove
    # TODO
  end
  # ---------------------------------------------------------------------------


  # Edit a single friendship.
  #
  # === GET:
  #     Renderes the edit form.
  #
  # === PUT:
  #     Update the changes (news feed generated only for new sharings).
  def edit
    # TODO FUTURE DEV.
  end
  # ---------------------------------------------------------------------------

end
