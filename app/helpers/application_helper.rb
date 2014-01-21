module ApplicationHelper

  # Formats a long text as HTML presentation-ready, using paragraph tags and line breaks on line endings.
  def format_longtext( text_value )
    "<span class='long-text'>" << h( text_value ).gsub( /\[/, "<p/>[" ).gsub( /$/, "<br/>" ) << "</span>"
  end
  # ----------------------------------------------------------------------------
  #++


  # Generates a readonly HTML checkbox control for display purposes only
  #
  def show_chkbox( is_checked )
    "<input type=""checkbox"" disabled=""disabled"" " << (is_checked ? "checked=""checked""" : "") << ">"
  end

  # Generates a small tick image for HTML display if the bool_value is true,
  # also using the supplied resource name string if not null. (Defaults to a small
  # tick image, "tick.png" if the image_name parameter is left empty)
  # No path is needed if stored under "public/images".
  #
  def show_tag( bool_value, image_name = "tick.png", false_text = '--' )
    bool_value ? image_tag(image_name, {:alt => "X"}) : false_text
  end
  # ----------------------------------------------------------------------------
end
