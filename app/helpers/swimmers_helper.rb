module SwimmersHelper

  # Creates a toggle link between confirm/unconfirm for valid swimmers.
  #
  # Renders the "ask association confirm/unconfirm link" for a swimmer
  # associated to a user but only if if also the current user can actually
  # click on it.
  # (Otherwise nothing is rendered)
  #
  def ask_confirm_link( swimmer )                   # Swimmer correctly associated? And is a different user?
    return unless swimmer.associated_user && (swimmer.associated_user.swimmer_id == swimmer.id)
    return if ( swimmer.associated_user_id == current_user.id )

    is_confirmed_by_curr_user = ! current_user.find_any_confirmation_given_to( swimmer.associated_user ).nil?
                                                    # Can unconfirm this swimmer?
    if is_confirmed_by_curr_user
      label = I18n.t('social.menu_social_unconfirm')
      tooltip = I18n.t('social.unconfirm_request_tooltip')
      path  = social_association_unconfirm_path( id: swimmer.id )
    else                                            # Can confirm this swimmer?
      label = I18n.t('social.menu_social_confirm')
      tooltip = I18n.t('social.confirm_request_tooltip')
      path  = social_association_confirm_path( id: swimmer.id )
    end

    link_to(
      content_tag( :span, label, class:"label" ), path,
      {
        :id => "invite#{swimmer.id}", 'data-toggle' => 'tooltip',
        :title => tooltip.gsub('{USER_NAME}', swimmer.associated_user.name).gsub('{SWIMMER_NAME}', swimmer.get_full_name)
      }
    )
  end


  # Renders the "ask friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def ask_friendship_link( swimmer )                # Swimmer correctly associated? And is a different user?
    return unless swimmer.associated_user && (swimmer.associated_user.swimmer_id == swimmer.id)
    return if ( swimmer.associated_user_id == current_user.id )

    link_to(
      content_tag( :span, I18n.t('social.menu_social_invite'), class:"label label-info" ),
      social_invite_path( id: swimmer.id ),
      {
        :id => "invite#{swimmer.id}", 'data-toggle' => 'tooltip',
        :title => I18n.t('social.invite_request_tooltip').gsub('{SWIMMER_NAME}', swimmer.get_full_name)
      }
    )
  end


  # Renders the "approve friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def approve_friendship_link( swimmer )            # Swimmer correctly associated? And is a different user?
    return unless swimmer.associated_user && (swimmer.associated_user.swimmer_id == swimmer.id)
    return if ( swimmer.associated_user_id == current_user.id )

    content_tag( :span, I18n.t('social.menu_social_approve'), class:"label label-success" )
  end

  # Renders the "block friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def block_friendship_link( swimmer )              # Swimmer correctly associated? And is a different user?
    return unless swimmer.associated_user && (swimmer.associated_user.swimmer_id == swimmer.id)
    return if ( swimmer.associated_user_id == current_user.id )

    content_tag( :span, I18n.t('social.menu_social_block_unblock'), class:"label" )
  end

  # Renders the "remove friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def remove_friendship_link( swimmer )             # Swimmer correctly associated? And is a different user?
    return unless swimmer.associated_user && (swimmer.associated_user.swimmer_id == swimmer.id)
    return if ( swimmer.associated_user_id == current_user.id )

    content_tag( :span, I18n.t('social.menu_social_remove'), class:"label label-important" )
  end

  # Renders the "edit friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def edit_friendship_link( swimmer )               # Swimmer correctly associated? And is a different user?
    return unless swimmer.associated_user && (swimmer.associated_user.swimmer_id == swimmer.id)
    return if ( swimmer.associated_user_id == current_user.id )

    content_tag( :span, I18n.t('social.menu_social_edit'), class:"label label-info" )
  end
end
