=begin

= MiscHelper

  - Goggles framework vers.:  6.003
  - author: Steve A.

=end
module MiscHelper

  # Returns the HTML text for an Option group converted to a bunch of buttons, each
  # one storing the key value for the select into an hidden field having the name specified.
  #
  # An additional display-only field for visual aid of the selection can be turned
  # on or off using show_additional_display_label.
  #
  def button_option_group( field_name, default_value, array_of_labels_and_keys_couples,
                           show_additional_display_label = false )
    rendered_html = hidden_field_tag( field_name, default_value ) + "\r\n".html_safe
    display_field_name = field_name.to_s.gsub( '_id', '_label' )
                                                    # For each defined option couple:
    rendered_html += "<div class=\"btn-group btn-group-sm\" role=\"group\">\r\n".html_safe
    array_of_labels_and_keys_couples.each do |label, key|
      rendered_html += link_to(
        content_tag( :span, get_image_tag_for( field_name, key, label ) ),
        "##{field_name}",
        {
          id: "btn_#{field_name}",
          class: 'btn btn-default',
          role: 'button',
          'aria-describedby' => display_field_name,
          'onclick' => "$('##{field_name}').val(#{key}); $('##{display_field_name}').text('#{label}')",
          'data-turbolinks'=>'false',
          'data-toggle' => 'tooltip',
          title: label
        }
      )
      rendered_html += "\r\n".html_safe
    end
    rendered_html += "</div>\r\n".html_safe
    if show_additional_display_label
      default_label_text = array_of_labels_and_keys_couples.kind_of?(Array) && default_value && array_of_labels_and_keys_couples[default_value] ? array_of_labels_and_keys_couples[default_value].first : ''
      rendered_html += content_tag( :span, default_label_text, id: display_field_name, class: "help-block" )
    end
    rendered_html.html_safe
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns an image_tag (or an alternative display label when not available)
  # for a spacified field_name, key_id pair.
  #
  def get_image_tag_for( field_name, key_id, alt_display_label )
    case field_name.to_s

    when 'gender_type_id'
      case key_id
      when 1
        image_tag('user_suit.png') + "<br/>#{alt_display_label}".html_safe
      when 2
        image_tag('user_female.png') + "<br/>#{alt_display_label}".html_safe
      else
        alt_display_label.html_safe
      end

# TODO Images
    # when 'pool_type_id'
      # case key_id
      # when 1
        # image_tag('user_suit.png') + "<br/>#{alt_display_label}".html_safe
      # # ...
      # else
        # alt_display_label.html_safe
      # end

    else
      alt_display_label.html_safe
    end
  end
end
