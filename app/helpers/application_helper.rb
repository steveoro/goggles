module ApplicationHelper

  # Formats a long text as HTML presentation-ready, using paragraph tags and line breaks on line endings.
  def format_longtext( text_value )
    ( "<span class='long-text'>" << h( text_value ).gsub( /\[/, "<p/>[" ).gsub( /$/, "<br/>" ) << '</span>' ).html_safe
  end
  #-- -------------------------------------------------------------------------
  #++

  # Generates a small tick image for HTML display if the bool_value is true,
  # also using the supplied resource name string if not null. (Defaults to a small
  # tick image, "tick.png" if the image_name parameter is left empty)
  # No path is needed if stored under "public/images".
  #
  def show_tag( bool_value, image_name = "tick.png", false_text = '--' )
    bool_value ? image_tag(image_name, {:alt => "X"}) : false_text.html_safe
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the HTML code for displaying a total count value, sided by a number
  # of images, one for each step of the total count.
  def count_with_image( count, step, image_name, align = :right )
    if align == :right
      "#{ count } #{image_tag(image_name) * (count / step)}".html_safe
    else
      "#{image_tag(image_name) * (count / step)} #{ count }".html_safe
    end
  end

  # Works by calling #count_with_image using a 100 step value with a "small star"
  # image as defaults.
  def count_with_small_star( count, step = 100, align = :right )
    count_with_image( count, step, 'bullet_star.png', align )
  end

  # Works by calling #count_with_image using a 100 step value with an "award star"
  # image as defaults.
  def count_with_award_star( count, step = 100, align = :right )
    count_with_image( count, step, 'award_star_gold_3.png', align )
  end

  # Works by calling #count_with_image using a 10000 step value with a "star"
  # image as defaults.
  def count_with_star( count, step = 10000, align = :right )
    count_with_image( count, step, 'star.png', align )
  end

  # Works by calling #count_with_image using a 10 step value with a "red ribbon"
  # image as defaults.
  def count_with_red_ribbon( count, step = 10, align = :right )
    count_with_image( count, step, 'rosette.png', align )
  end

  # Works by calling #count_with_image using a 10 step value with a "bomb"
  # image as defaults.
  def count_with_bomb( count, step = 10, align = :right )
    count_with_image( count, step, 'bomb.png', align )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Format the specified score with 2 precision decimals and highlights it with an
  # image if it exceeds the specified bias.
  def format_score( score, bias = 800 )
    ( sprintf( "%02.2f", score ) + (score>bias ? "#{image_tag("asterisk_orange.png")} !" : '') ).html_safe
  end
  #-- -------------------------------------------------------------------------
  #++

  # Getter for a string key viable for use as a cache key for fragments involving
  # the rending of collections of models.
  #
  # Assuming the +collection+ responds to #each and has an +id+ for each member, it
  # returns a string from the concatenation of all IDs of the instances in the collection
  # (joined with '-'), plus a global time stamp obtained by invoking #max( time_stamp_method )
  # on the collection itself.
  #
  def cache_key_from_collection( collection )
    return "?" unless collection.respond_to?(:each)
    collection.map{ |row| row.id }.join('-') +
    collection.map{ |row| row.updated_at }.max.to_i.to_s
  end
  #-- -------------------------------------------------------------------------
  #++
end
