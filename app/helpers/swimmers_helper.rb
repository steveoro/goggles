module SwimmersHelper

  # Renders the "ask friendship link" for a swimmer associated to a user but
  # only if also the user results linked to this swimmer instance (association
  # must exist both ways to be considered as valid).
  #
  # Note that an additional check must be performed on the current user to avoid
  # calling this decorator on himself (current_user is not reachable in this context).
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

  # Renders the "ask friendship link" for a swimmer associated to a user but
  # only if also the user results linked to this swimmer instance (association
  # must exist both ways to be considered as valid).
  #
  # Note that an additional check must be performed on the current user to avoid
  # calling this decorator on himself (current_user is not reachable in this context).
  def ask_confirm_link( swimmer )
    if swimmer.associated_user && (swimmer.associated_user.swimmer_id == swimmer.id)
      link_to(
        content_tag( :span, I18n.t('social.menu_social_confirm'), class:"label" ),
        social_invite_path( id: swimmer.id ),
        {
          :id => "invite#{swimmer.id}", 'data-toggle' => 'tooltip',
          :title => I18n.t('social.confirm_request_tooltip').gsub('{USER_NAME}', swimmer.associated_user.name).gsub('{SWIMMER_NAME}', swimmer.get_full_name)
        }
      )
    end
  end

end
