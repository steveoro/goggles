#
# == SwimmersHelper
#
# Assorted helpers for badge-like clickable links rendering.
#
# @author   Steve A.
# @version  4.00.458
#
module SwimmersHelper

  # Returns a default (local) image URL for a non-associated swimmer or
  # a goggler without a Gravatar image.
  #
  # Returns the Gravatar image link for an associated swimmer (a Goggler) with
  # a valid Gravatar account and a custom image.
  #
  def avatar_url( swimmer )
    default_url = 'img_radiography.jpg'
    if swimmer.associated_user
      gravatar_id = Digest::MD5::hexdigest( swimmer.associated_user.email ).downcase
      "http://gravatar.com/avatar/#{ gravatar_id }.png?s=48&d=#{ CGI.escape(default_url) }"
    else
      default_url
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates a toggle link for #confirm/#unconfirm actions for valid swimmers.
  #
  # Renders the "ask association confirm/unconfirm link" for a swimmer
  # associated to a user but only if if also the current user can actually
  # click on it.
  # (Otherwise nothing is rendered)
  #
  def social_confirm_badge( swimmer )
    decorated_swimmer = assure_swimmer_is_decorated( swimmer )
    label_txt = decorated_swimmer.get_confirm_label_text_for( current_user )
    tooltip   = decorated_swimmer.get_confirm_tooltip_text_for( current_user )
    path      = decorated_swimmer.get_confirm_path_for( current_user )
    build_link_result( "confirm#{swimmer.id}", label_txt, "label", tooltip, path, :post ) if path
  end


  # Renders the "invite/pending friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def social_invite_badge( swimmer )
    decorated_swimmer = assure_swimmer_is_decorated( swimmer )
    label_txt = decorated_swimmer.get_invite_label_text_for( current_user )
    tooltip   = decorated_swimmer.get_invite_tooltip_text_for( current_user )
    path      = decorated_swimmer.get_invite_path_for( current_user )
    if path
      build_link_result( "invite#{swimmer.id}", label_txt, "label label-info", tooltip, path )
    elsif label_txt
      content_tag( :span, label_txt, class:"label" )
    end
  end


  # Renders the "block/unblock friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def social_block_badge( swimmer )
    decorated_swimmer = assure_swimmer_is_decorated( swimmer )
    label_txt = decorated_swimmer.get_block_label_text_for( current_user )
    tooltip   = decorated_swimmer.get_block_tooltip_text_for( current_user )
    path      = decorated_swimmer.get_block_path_for( current_user )
    build_link_result( "block#{swimmer.id}", label_txt, "label label-info", tooltip, path ) if path
  end


  # Renders the "remove friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def social_remove_badge( swimmer )
    decorated_swimmer = assure_swimmer_is_decorated( swimmer )
    label_txt = decorated_swimmer.get_remove_label_text_for( current_user )
    tooltip   = decorated_swimmer.get_remove_tooltip_text_for( current_user )
    path      = decorated_swimmer.get_remove_path_for( current_user )
    build_link_result( "remove#{swimmer.id}", label_txt, "label label-important", tooltip, path ) if path
  end


  # Renders the "edit friendship link" for a swimmer associated to a user but
  # only if also the current user can actually click on it.
  # (Otherwise nothing is rendered)
  #
  def social_edit_badge( swimmer )
    decorated_swimmer = assure_swimmer_is_decorated( swimmer )
    label_txt = decorated_swimmer.get_edit_label_text_for( current_user )
    tooltip   = decorated_swimmer.get_edit_tooltip_text_for( current_user )
    path      = decorated_swimmer.get_edit_path_for( current_user )
    build_link_result( "edit#{swimmer.id}", label_txt, "label label-info", tooltip, path ) if path
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Returns an instance of SwimmerDecorator if the specified swimmer is not decorated yet.
  def assure_swimmer_is_decorated( swimmer )
    swimmer.instance_of?(SwimmerDecorator) ? swimmer : SwimmerDecorator.decorate(swimmer)
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
