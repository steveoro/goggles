=begin

= MiscHelper

  - Goggles framework vers.:  4.00.675
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
    rendered_html += "<div data-toggle=\"buttons-radio\">\r\n".html_safe
    array_of_labels_and_keys_couples.each do |label, key|
      rendered_html += button_to_function(
        label,
        "$('##{field_name}').val(#{key}); $('##{display_field_name}').val('#{label}')",
        { class: 'btn' }
      )
      rendered_html += "\r\n".html_safe
    end
    rendered_html += "</div>\r\n".html_safe
    if show_additional_display_label
      rendered_html += "<p></p>\r\n".html_safe
      rendered_html += text_field_tag( display_field_name, '', class: 'input-mini disabled', disabled: true )
    end
    rendered_html.html_safe
  end
  #-- -------------------------------------------------------------------------
  #++
end
