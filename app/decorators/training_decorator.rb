=begin

= TrainingDecorator

  - version:  4.00.317.20140616
  - author:   Steve A.

  Decorator for the Training model.
  Contains all presentation-logic centered methods.

=end
class TrainingDecorator < Draper::Decorator
  delegate_all

  # Retrieves the Swimmer level type full description
  # Allows to specify which label method can be used for the output, defaults to
  # the framework standard :i18n_short.
  # Returns an empty string when not available.
  #
  def get_swimmer_level_type( label_method_sym = :i18n_short )
    compose_swimmer_level_text_with( label_method_sym )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Builds up an Hash of "decorated" detail fields.
  #
  # Scans all the training rows with groups and builds up a custom hash containing
  # as keys the group_id and as value another hash having all group fields as data members,
  # plus a special :datarows array member, containing all the data rows linked to the same
  # group id.
  #
  # Only the first row found with a valid group id (>0) will be used for group definition;
  # the others will only be checked for group_id consistency. 
  #
  def build_group_list_hash
    row_with_groups = self.training_rows.with_groups
    group_list = {}                                 # Collect a custom hash and a list of data rows for each group of rows:
    row_with_groups.each{ |row|                     # If the group id is missing from the hash keys, add it:
      if (! group_list.has_key?( row.group_id ))
        group_list[ row.group_id ] = {
          id: row.group_id,
          times: row.group_times,
          start_and_rest: row.group_start_and_rest,
          pause: row.group_pause,
          datarows: [ row ]
        }
      else                                          # Else, if the group id is among the keys, simply add the datarow to the list:
        group_list[ row.group_id ][ :datarows ] << row
      end
    }
    group_list
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Returns a text description of the required/preferred swimmer level
  # type for this training using a specified display method to be invoked
  # upon the swimmer level range found.
  #
  def compose_swimmer_level_text_with( display_method_sym )
    min_level = min_swimmer_level > 0 ? SwimmerLevelType.find_by_level( min_swimmer_level ) : nil
    max_level = max_swimmer_level > 0 ? SwimmerLevelType.find_by_level( max_swimmer_level ) : nil
    if min_level && max_level
      "#{ min_level.send(display_method_sym) } .. #{ max_level.send(display_method_sym) }"
    elsif min_level && max_level.nil?
      ">= #{ min_level.send(display_method_sym) }"
    elsif min_level.nil? && max_level
      "<= #{ max_level.send(display_method_sym) }"
    else
      "?"
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
