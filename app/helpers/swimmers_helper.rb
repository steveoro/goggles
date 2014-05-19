module SwimmersHelper

  # Creates a toggle link between confirm/unconfirm for valid swimmers.
  #
  # Renders the "ask association confirm/unconfirm link" for a swimmer
  # associated to a user but only if if also the current user can actually
  # click on it.
  # (Otherwise nothing is rendered)
  #
  def ask_confirm_link( swimmer )
    return unless is_swimmer_associated_to_a_different_user?( swimmer )
    is_confirmed_by_curr_user = ! current_user.find_any_confirmation_given_to( swimmer.associated_user ).nil?
                                                    # Can unconfirm this swimmer?
    if is_confirmed_by_curr_user
      label_txt = I18n.t('social.menu_social_unconfirm')
      tooltip   = I18n.t('social.unconfirm_request_tooltip').gsub('{USER_NAME}', swimmer.associated_user.name).gsub('{SWIMMER_NAME}', swimmer.get_full_name)
      path      = social_association_unconfirm_path( id: swimmer.associated_user_id )
    else                                            # Can confirm this swimmer?
      label_txt = I18n.t('social.menu_social_confirm')
      tooltip   = I18n.t('social.confirm_request_tooltip').gsub('{USER_NAME}', swimmer.associated_user.name).gsub('{SWIMMER_NAME}', swimmer.get_full_name)
      path      = social_association_confirm_path( id: swimmer.associated_user_id )
    end
    build_link_result( "confirm#{swimmer.id}", label_txt, "label", tooltip, path, :post )
  end


  # Renders the "invite/pending friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def ask_friendship_link( swimmer )
    return unless is_swimmer_associated_to_a_different_user?( swimmer )
    existing_friendship = swimmer.associated_user.find_any_friendship_with( current_user )

    if existing_friendship && existing_friendship.pending? && (existing_friendship.friendable_id == current_user.id)
      content_tag( :span, I18n.t('social.pending_invite'), class:"label" )
    elsif existing_friendship.nil?
      label_txt = I18n.t('social.menu_social_invite')
      tooltip   = I18n.t('social.invite_request_tooltip').gsub('{SWIMMER_NAME}', swimmer.get_full_name)
      path      = social_invite_path( id: swimmer.associated_user_id )
      build_link_result( "invite#{swimmer.id}", label_txt, "label label-info", tooltip, path )
    end
  end


  # Renders the "approve friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def approve_friendship_link( swimmer )
    return unless is_swimmer_associated_to_a_different_user?( swimmer )
    existing_friendship = swimmer.associated_user.find_any_friendship_with( current_user )

    # Show the approve tag only if the current_user was invited (an not the friendable who sent the invite):
    if existing_friendship && existing_friendship.pending? && (existing_friendship.friend_id == current_user.id)  
      label_txt = I18n.t('social.menu_social_approve')
      tooltip   = I18n.t('social.approve_request_tooltip').gsub('{SWIMMER_NAME}', swimmer.get_full_name)
      path      = social_approve_path( id: swimmer.associated_user_id )
      build_link_result( "approve#{swimmer.id}", label_txt, "label label-success", tooltip, path )
    end
  end


  # Renders the "block/unblock friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def block_friendship_link( swimmer )
    return unless is_swimmer_associated_to_a_different_user?( swimmer )
    existing_friendship = swimmer.associated_user.find_any_friendship_with( current_user )

    if existing_friendship
      if existing_friendship.approved? && existing_friendship.blocked?
        label_txt = I18n.t('social.menu_social_unblock')
        tooltip   = I18n.t('social.unblock_request_tooltip').gsub('{SWIMMER_NAME}', swimmer.get_full_name)
        path      = social_unblock_path( id: swimmer.associated_user_id )
      elsif existing_friendship.approved?
        label_txt = I18n.t('social.menu_social_block')
        tooltip   = I18n.t('social.block_request_tooltip').gsub('{SWIMMER_NAME}', swimmer.get_full_name)
        path      = social_block_path( id: swimmer.associated_user_id )
      end
      build_link_result( "block#{swimmer.id}", label_txt, "label label-info", tooltip, path )
    end
  end


  # Renders the "remove friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def remove_friendship_link( swimmer )
    return unless is_swimmer_associated_to_a_different_user?( swimmer )
    existing_friendship = swimmer.associated_user.find_any_friendship_with( current_user )

    if existing_friendship
      label_txt = I18n.t('social.menu_social_remove')
      tooltip   = I18n.t('social.remove_request_tooltip').gsub('{SWIMMER_NAME}', swimmer.get_full_name)
      path      = social_remove_path( id: swimmer.associated_user_id )
      build_link_result( "invite#{swimmer.id}", label_txt, "label label-important", tooltip, path )
    end
  end


  # Renders the "edit friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def edit_friendship_link( swimmer )
    return unless is_swimmer_associated_to_a_different_user?( swimmer )
    existing_friendship = swimmer.associated_user.find_any_friendship_with( current_user )

    if existing_friendship
      label_txt = I18n.t('social.menu_social_edit')
      tooltip   = I18n.t('social.edit_request_tooltip').gsub('{SWIMMER_NAME}', swimmer.get_full_name)
      path      = social_edit_path( id: swimmer.associated_user_id )
      build_link_result( "invite#{swimmer.id}", label_txt, "label label-info", tooltip, path )
    end
  end
  # ---------------------------------------------------------------------------


  private


  # User logged-in? Swimmer correctly associated to a user?
  # And is a different user from the current one?
  def is_swimmer_associated_to_a_different_user?( swimmer )
    (
      current_user && 
      swimmer.associated_user && (swimmer.associated_user.swimmer_id == swimmer.id) &&
      ( swimmer.associated_user_id != current_user.id )
    )
  end


  # Builds a custom link_to HTML text.
  def build_link_result( span_id, label_text, label_css_class, tooltip_text,
                         path_to_destination, http_method = :get )
    link_to(
      content_tag( :span, label_text, class: label_css_class ),
      path_to_destination,
      {
        method: http_method,
        id: span_id,
        'data-toggle' => 'tooltip',
        title: tooltip_text
      }
    )
  end
end
