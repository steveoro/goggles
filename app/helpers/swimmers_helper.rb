module SwimmersHelper

  # Renders the "ask association confirm link" for a swimmer associated to a user but
  # only if if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def ask_confirm_link( swimmer )
    # TODO convert to toggle confirm/unconfirm
    if swimmer.associated_user && (swimmer.associated_user.swimmer_id == swimmer.id)
      link_to(
        content_tag( :span, I18n.t('social.menu_social_confirm'), class:"label" ),
        social_association_confirm_path( id: swimmer.id ),
        {
          :id => "invite#{swimmer.id}", 'data-toggle' => 'tooltip',
          :title => I18n.t('social.confirm_request_tooltip').gsub('{USER_NAME}', swimmer.associated_user.name).gsub('{SWIMMER_NAME}', swimmer.get_full_name)
        }
      )
    end
  end

  # Renders the "ask friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def ask_friendship_link( swimmer )
    if swimmer.associated_user && (swimmer.associated_user.swimmer_id == swimmer.id)
      link_to(
        content_tag( :span, I18n.t('social.menu_social_invite'), class:"label label-info" ),
        social_invite_path( id: swimmer.id ),
        {
          :id => "invite#{swimmer.id}", 'data-toggle' => 'tooltip',
          :title => I18n.t('social.invite_request_tooltip').gsub('{SWIMMER_NAME}', swimmer.get_full_name)
        }
      )
    end
  end

  # Renders the "approve friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def approve_friendship_link( swimmer )
    if swimmer.associated_user && (swimmer.associated_user.swimmer_id == swimmer.id)
      content_tag( :span, I18n.t('social.menu_social_approve'), class:"label label-success" )
    end
  end

  # Renders the "block friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def block_friendship_link( swimmer )
    if swimmer.associated_user && (swimmer.associated_user.swimmer_id == swimmer.id)
      content_tag( :span, I18n.t('social.menu_social_block_unblock'), class:"label" )
    end
  end

  # Renders the "remove friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def remove_friendship_link( swimmer )
    if swimmer.associated_user && (swimmer.associated_user.swimmer_id == swimmer.id)
      content_tag( :span, I18n.t('social.menu_social_remove'), class:"label label-important" )
    end
  end

  # Renders the "edit friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def edit_friendship_link( swimmer )
    if swimmer.associated_user && (swimmer.associated_user.swimmer_id == swimmer.id)
      content_tag( :span, I18n.t('social.menu_social_edit'), class:"label label-info" )
    end
  end
end
