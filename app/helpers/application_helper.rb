module ApplicationHelper

  # Formats a long text as HTML presentation-ready, using paragraph tags and line breaks on line endings.
  def format_longtext( text_value )
    "<span class='long-text'>" << h( text_value ).gsub( /\[/, "<p/>[" ).gsub( /$/, "<br/>" ) << '</span>'
  end
  #-- -------------------------------------------------------------------------
  #++

  # Generates a small tick image for HTML display if the bool_value is true,
  # also using the supplied resource name string if not null. (Defaults to a small
  # tick image, "tick.png" if the image_name parameter is left empty)
  # No path is needed if stored under "public/images".
  #
  def show_tag( bool_value, image_name = "tick.png", false_text = '--' )
    bool_value ? image_tag(image_name, {:alt => "X"}) : false_text
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the HTML code for displaying a total count value, sided by a number
  # of images, one for each step of the total count.
  def count_with_image( count, step, image_name )
    "#{ count } " + image_tag( image_name ) * ( count / step )
  end

  # Works by calling #count_with_image using a 100 step value with a "small star"
  # image as defaults.
  def count_with_small_star( count, step = 100 )
    count_with_image( count, step, 'bullet_star.png' )
  end

  # Works by calling #count_with_image using a 100 step value with an "award star"
  # image as defaults.
  def count_with_award_star( count, step = 100 )
    count_with_image( count, step, 'award_star_gold_3.png' )
  end

  # Works by calling #count_with_image using a 10000 step value with a "star"
  # image as defaults.
  def count_with_star( count, step = 10000 )
    count_with_image( count, step, 'star.png' )
  end

  # Works by calling #count_with_image using a 10 step value with a "red ribbon"
  # image as defaults.
  def count_with_red_ribbon( count, step = 10 )
    count_with_image( count, step, 'rosette.png' )
  end

  # Works by calling #count_with_image using a 10 step value with a "bomb"
  # image as defaults.
  def count_with_bomb( count, step = 10 )
    count_with_image( count, step, 'bomb.png' )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Format the specified score with 2 precision decimals and highlights it with an
  # image if it exceeds the specified bias.
  def format_score( score, bias = 800 )
    sprintf( "%02.2f", score ) + ( score>bias ? "#{image_tag("asterisk_orange.png")} !" : '' )
  end
  #-- -------------------------------------------------------------------------
  #++
end
