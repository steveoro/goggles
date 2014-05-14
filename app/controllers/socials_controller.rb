# encoding: utf-8

class SocialsController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_entity_from_token!
  before_filter :authenticate_entity!                # Devise "standard" HTTP log-in strategy
  # Parse parameters:
  before_filter :verify_parameter, except: [:show_all]
  before_filter :verify_parameter, except: [:show_all]
  # ---------------------------------------------------------------------------


  # Show all friendships action.
  def show_all
    @title = I18n.t('social.invite_title')
    @friends = current_user.friends
    @pending_invited = current_user.pending_invited
    @pending_invited_by = current_user.pending_invited_by
    @invited = current_user.invited
    @blocked_friendships = current_user.blocked_friendships
  end
  # ---------------------------------------------------------------------------


  # Endorse/confirm user association with a goggler (POST only).
  # === Params:
  # - the :id of the associated *user* of the swimmer (see :verify_parameter)
  #
  def association_confirm
    toggle_confirmation( true )
    redirect_to( socials_show_all_path() ) and return
  end

  # Remove endorsement/unconfirm user association with a goggler (POST only).
  # === Params:
  # - the :id of the associated *user* of the swimmer (see :verify_parameter)
  #
  def association_unconfirm
    toggle_confirmation( false )
    redirect_to( socials_show_all_path() ) and return
  end
  # ---------------------------------------------------------------------------


  # Invite friends action.
  #
  # === GET:
  #     Renderes the landing page with the invite form.
  # ==== Params:
  #     :id => the id of the swimming buddy (user) to be invited by the current user
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
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.invite() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    @title = I18n.t('social.invite_title')
    if request.post?                                # === POST: ===
      shares_passages  = (params[:shares_passages].to_i > 0)
      shares_trainings = (params[:shares_trainings].to_i > 0)
      shares_calendars = (params[:shares_calendars].to_i > 0)
      if current_user.invite_with_notify( @swimming_buddy, shares_passages, shares_trainings, shares_calendars )
        flash[:info] = I18n.t('social.invite_successful')
      else
        flash[:error] = I18n.t('social.invite_error')
      end
      redirect_to( socials_show_all_path() ) and return
                                                    # === GET: ===
    else
      @submit_title = I18n.t('social.send')         # Check that the friendship is a new one:
      if ( current_user.find_any_friendship_with(@swimming_buddy).nil? )
        # friendship must not exist for a new invite to be spawn:
        @friendship   = Amistad.friendship_class.new( friendable_id: current_user.id, friend_id: @swimming_buddy.id )
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
  # ==== Params:
  #     :id => the id of the swimming buddy (user) to be accepted by the current user
  #
  # === PUT:
  #     Updates friendship row with the accepted status (creates also a personalized
  #     news feed article).
  # ==== Params:
  #     :id => the id of the swimming buddy to be accepted by the current user
  #     :shares_passages  => set to '1' to enable, anything else to disable
  #     :shares_trainings => set to '1' to enable, anything else to disable
  #     :shares_calendars => set to '1' to enable, anything else to disable
  #
  def approve
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.approve() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    @title = I18n.t('social.approve_title')
    @swimming_buddy = User.find_by_id( params[:id] )

    if request.post?                                # === POST: ===
      shares_passages  = (params[:shares_passages].to_i > 0)
      shares_trainings = (params[:shares_trainings].to_i > 0)
      shares_calendars = (params[:shares_calendars].to_i > 0)
      if current_user.approve_with_notify( @swimming_buddy, shares_passages, shares_trainings, shares_calendars )
        flash[:info] = I18n.t('social.approve_successful')
      else
        flash[:error] = I18n.t('social.approve_error')
      end
      redirect_to( socials_show_all_path() ) and return
                                                    # === GET: ===
    else
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
  # === Params:
  #     :id => the id of the swimming buddy (user) to be blocked by the current user
  #
  # === GET:
  #     Renderes the landing page with the confirmation form.
  #
  # === PUT:
  #     Updates friendship row with the blocked status (w/o news feed article).
  def block
    @title = I18n.t('social.block_title')
    @swimming_buddy = User.find_by_id( params[:id] )

    if request.post?                                # === POST: ===
      if current_user.block( @swimming_buddy )
        flash[:info] = I18n.t('social.block_successful')
      else
        flash[:error] = I18n.t('social.block_error')
      end
      redirect_to( socials_show_all_path() ) and return
                                                    # === GET: ===
    else
      @submit_title = I18n.t('social.block_label').gsub( "{SWIMMER_NAME}", @swimming_buddy.name )
      @friendship = current_user.find_any_friendship_with(@swimming_buddy)
      @destination_path = social_block_path( id: @swimming_buddy.id )
                                                    # Check that the friendship is a valid one:
      unless @friendship && @friendship.approved?
        flash[:warning] = I18n.t( 'social.warning_generic_not_a_valid_friendship' )
          .gsub( "{SWIMMER_NAME}", @swimming_buddy.name )
        redirect_to( socials_show_all_path() ) and return
      end
      render :ask_confirmation
    end
  end
  # ---------------------------------------------------------------------------


  # Un-block friends action.
  #
  # === Params:
  #     :id => the id of the swimming buddy (user) to be unblocked by the current user
  #
  # === GET:
  #     Renderes the landing page with the confirmation form.
  #
  # === PUT:
  #     Updates friendship row clearing the blocked status (w/o news feed article).
  def unblock
    @title = I18n.t('social.unblock_title')
    @swimming_buddy = User.find_by_id( params[:id] )

    if request.post?                                # === POST: ===
      if current_user.unblock( @swimming_buddy )
        flash[:info] = I18n.t('social.unblock_successful')
      else
        flash[:error] = I18n.t('social.unblock_error')
      end
      redirect_to( socials_show_all_path() ) and return
                                                    # === GET: ===
    else
      @submit_title = I18n.t('social.unblock_label').gsub( "{SWIMMER_NAME}", @swimming_buddy.name )
      @friendship = current_user.find_any_friendship_with(@swimming_buddy)
      @destination_path = social_unblock_path( id: @swimming_buddy.id )
                                                    # Check that the friendship is a valid one:
      unless @friendship && @friendship.blocked?
        flash[:warning] = I18n.t( 'social.warning_generic_not_a_valid_friendship' )
          .gsub( "{SWIMMER_NAME}", @swimming_buddy.name )
        redirect_to( socials_show_all_path() ) and return
      end
      render :ask_confirmation
    end
  end
  # ---------------------------------------------------------------------------


  # Remove friendship action.
  #
  # === Params:
  #     :id => the id of the swimming buddy (user) to be removed from the friends of the current user
  #
  # === GET:
  #     Renderes the landing page with the confirmation form.
  #
  # === DELETE:
  #     Removes the friendship row (adding also a news feed article TODO?).
  def remove
    @title = I18n.t('social.remove_friendship')
    @swimming_buddy = User.find_by_id( params[:id] )

    if request.post?                                # === POST: ===
      if current_user.remove_with_notify( @swimming_buddy )
        flash[:info] = I18n.t('social.remove_successful')
      else
        flash[:error] = I18n.t('social.remove_error')
      end
      redirect_to( socials_show_all_path() ) and return
                                                    # === GET: ===
    else
      @submit_title = I18n.t('social.remove_label').gsub( "{SWIMMER_NAME}", @swimming_buddy.name )
      @friendship = current_user.find_any_friendship_with(@swimming_buddy)
      @destination_path = social_remove_path( id: @swimming_buddy.id )
                                                    # Check that the friendship is a valid one:
      unless @friendship
        flash[:warning] = I18n.t( 'social.warning_generic_not_a_valid_friendship' )
          .gsub( "{SWIMMER_NAME}", @swimming_buddy.name )
        redirect_to( socials_show_all_path() ) and return
      end
      render :ask_confirmation
    end
  end
  # ---------------------------------------------------------------------------


  # Edit a single friendship.
  #
  # === Params:
  #     :id => the id of the swimming buddy (user) to be edited.
  #
  # === GET:
  #     Renderes the edit form.
  #
  # === POST:
  #     Update the changes (news feed generated only for new sharings).
  #
  #     Changing an already "agreed" share (setting to true something that
  #     was already set as false) will re-set to ON the pending status of
  #     the friendship.
  def edit
    @title = I18n.t('social.edit_title')
    @swimming_buddy = User.find_by_id( params[:id] )
    @friendship = current_user.find_any_friendship_with(@swimming_buddy)
    if @friendship.nil?                             # Check that the friendship exists:
      flash[:warning] = I18n.t( 'social.warning_could_not_find_valid_or_pending_friendship' )
        .gsub( "{SWIMMER_NAME}", @swimming_buddy.name )
      redirect_to( socials_show_all_path() ) and return
    end

    if request.post?                                # === POST: ===
      shares_passages  = (params[:shares_passages].to_i > 0)
      shares_trainings = (params[:shares_trainings].to_i > 0)
      shares_calendars = (params[:shares_calendars].to_i > 0)
      # If the friendable changes to true some share that is currently set to false for
      # the friendship, this will issue a new approval request for the friend (by setting the
      # friendship pending status back to true)
      #
      # In other words, this friendship will be pending only if the "friendable" is actually
      # the one making the edit request. If it is the friend who received the original invite
      # (thus the one accepting it), it won't matter and the editing will be "plain & simple":
      must_reset_pending_status = (@friendship.friendable_id == current_user.id) && (
                                    (!@friendship.shares_passages  && shares_passages) ||
                                    (!@friendship.shares_trainings && shares_trainings) ||
                                    (!@friendship.shares_calendars && shares_calendars)
                                  )
      @friendship.shares_passages  = shares_passages
      @friendship.shares_trainings = shares_trainings
      @friendship.shares_calendars = shares_calendars
      @friendship.pending = true if must_reset_pending_status
      if @friendship.save
        flash[:info] = I18n.t('social.changes_saved')
      else
        flash[:error] = I18n.t('social.edit_error')
      end
      redirect_to( socials_show_all_path() ) and return
                                                    # === GET: ===
    else
      @submit_title = I18n.t('social.ok')
    end
  end
  # ---------------------------------------------------------------------------


  private


  # Verifies that a user id is provided as parameter; otherwise
  # redirects to the home page.
  # Assigns the @swimming_buddy instance when successful.
  #
  # == Params:
  # :id => the user id to be processed by most of the methods (see before filter above)
  #
  def verify_parameter
    user_id = params[:id].to_i
    @swimming_buddy = ( user_id > 0 ) ? User.find_by_id( user_id ) : nil
    unless ( @swimming_buddy )                      # Check swimming buddy existance
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( socials_show_all_path() ) and return
#      redirect_to(:back) and return
    end
  end
  # ---------------------------------------------------------------------------


  # Implementation of the confirm / unconfirm action.
  def toggle_confirmation( is_confirming )
    if request.post?                                # === POST: ===
      if is_confirming
        result = UserSwimmerConfirmation.confirm_for( @swimming_buddy, @swimming_buddy.swimmer, current_user )
      else
        result = UserSwimmerConfirmation.unconfirm_for( @swimming_buddy, @swimming_buddy.swimmer, current_user )
      end
      if result
        flash[:info] = I18n.t( is_confirming ? 'social.confirm_successful' : 'social.unconfirm_successful' )
      else
        flash[:error] = I18n.t('home_controller.something_went_wrong_try_later')
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
    end
  end
  # ---------------------------------------------------------------------------
end
