# encoding: utf-8

require_relative '../../../data_import/v2/txt_result_defs'
require_relative '../../../data_import/v2/fin_result_defs'
require_relative '../../../data_import/v2/fin2_result_defs'
require_relative '../../../data_import/v2/fin_startlist_defs'


=begin

= ParseResultConverter

  - Goggles framework vers.:  4.00.767
  - author: Steve A.

 Strategy class. It adapts and converts any secondary or sibling format of the
 complex parse-result hash into its corresponding more common structure.

 'Secondary' formats are used when handling special parsing cases, when the source
 format of the datafile does not yield a key-field structure which is statistically
 common or equal to the most chosen one.

 For example, for FIN-result type files (type 'fin_result'), the hash structure used
 throughly all the data-import phases is the main 'FIN(1)' format -- due to the
 fact that this was historically the most common adopted one.
 Thus, 'FIN2' and any other 'children' format defined after that, must be converted
 to the FIN(1) structure to be used transparently in the rest of the (legacy)
 implementation.

 For the next refactoring iteration, it has been already planned to drop the
 hash format and introduce a new DAO dedicated to parse results.
 In the meantime, any secondary hash format used to represent special parsing
 cases requires conversions to the main format.

=== Typical usage:

    common_parse_result = ParseResultConverter.new.to_parse_result(
      secondary_format_parse_result,
      fin2_result_def_instance
    )

 @see #FinResultParser for an example structure of the +parse_result+ sub-hash.

=end
class ParseResultConverter

  # Converts the specified parse result Hash into the common FIN(1) result
  # hash structure.
  #
  # It does nothing in any other unsupported case or if the supplied source
  # parsing defs do not require any conversion.
  #
  # Beware that since no deep-copy is used the original Hash will be modified
  # and converted by this method (when the conversion is applied).
  #
  # == Params:
  # - source_parse_result_hash => the source :parse_result sub-hash in a secondary
  #   or less-common format, which is in need of conversion;
  # - source_parsing_defs => the specialized TxtResultDefs instance used to obtain
  #   the above :parse_result by parsing.
  # - season => Season instance obtained from the parsing of either the data file
  #   name or its contents; may be used internally to retrieve the correct category
  #   codes for the relays.
  #
  # == Returns:
  # - a converted +parse_result+ structure in the FIN(1) common format.
  #
  # @see #FinResultParser for an example structure of the +parse_result+ sub-hash.
  #
  def to_parse_result( source_parse_result_hash, source_parsing_defs, season )
    # (This following will create a shallow copy of the object, so even the original
    # will get any update)
    parse_result_hash = source_parse_result_hash.clone
                                                    # === From FIN2-result format: ===
    if source_parsing_defs.instance_of?( Fin2ResultDefs )
      rebuild_category_headers( parse_result_hash )
      rebuild_relay_headers( parse_result_hash, season )
      rebuild_stats_details( parse_result_hash )
                                                    # === From FIN-startlist format: ===
    elsif source_parsing_defs.instance_of?( FinStartListDefs )
      rebuild_category_headers( parse_result_hash )

    # TODO Add other cases (FIN-startlist, FIN2-startlist, ...)
    end

    parse_result_hash
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Rebuilds directly into +parse_result_hash+ all the missing :category_header
  # data pages and re-links all the detail data pages to each corresponding header.
  #
  def rebuild_category_headers( parse_result_hash )
    parse_result_hash[:category_header] = [] if parse_result_hash[ :category_header ].nil?
    parse_result_hash[:result_row].each do |result_row|
                                                    # Retrieve the original header row:
      old_header_row  = parse_result_hash[:event_individual].find({}) do |event_individual|
        event_individual[:id] == result_row[:id]
      end
      birth_year, category = extract_swimmer_year_and_category( result_row[:fields][:swimmer_year] )
                                                    # Compose the correct header row:
      new_header_row = {
        distance:       old_header_row[:fields][:distance],
        style:          old_header_row[:fields][:style],
        gender:         old_header_row[:fields][:gender],
        category_group: category,
        base_time:      nil # (not available in FIN2)
      }
      new_id_key = "#{ result_row[:id] }-#{ category }"
                                                    # Update result_row and its ID link:
      result_row[:fields][:swimmer_year] = birth_year
      result_row[:id] = new_id_key
                                                    # Check that we do not insert twice the same header row:
      parse_result_hash[:category_header] << {
        id:           new_id_key,
        fields:       new_header_row,
        import_text:  old_header_row[:import_text]
      } unless parse_result_hash[:category_header].any?{ |category_row| category_row[:id] == new_id_key }
    end
  end


  # Rebuilds directly into +parse_result_hash+ all the missing :relay_header
  # data pages and re-links all the detail data pages to each corresponding header.
  #
  def rebuild_relay_headers( parse_result_hash, season )
    parse_result_hash[:relay_header] = [] if parse_result_hash[ :relay_header ].nil?
    parse_result_hash[:relay_row].each do |relay_row|
                                                  # Retrieve the original header row:
      old_header_row  = parse_result_hash[:event_relay].find({}) do |event_relay|
        event_relay[:id] == relay_row[:id]
      end
# DEBUG
#      puts "\r\n" << old_header_row[:fields].inspect
#      puts "\r\n" << relay_row[:fields].inspect
      category = extract_category_for_relays( relay_row[:fields][:category], season )
                                                    # Compose the correct header row:
      new_header_row = {
        type:           old_header_row[:fields][:type],
        distance:       old_header_row[:fields][:distance],
        style:          old_header_row[:fields][:style],
        gender:         old_header_row[:fields][:gender],
        category_group: category,
        base_time:      nil # (not available in FIN2)
      }
      new_id_key = "#{ relay_row[:id] }-#{ category }"
                                                    # Update result_row and its ID link:
      relay_row[:fields][:result_score] = 0         # (not available in FIN2)
      relay_row[:id] = new_id_key
                                                    # Check that we do not insert twice the same header row:
      parse_result_hash[:relay_header] << {
        id:           new_id_key,
        fields:       new_header_row,
        import_text:  old_header_row[:import_text]
      } unless parse_result_hash[:relay_header].any?{ |relay_header| relay_header[:id] == new_id_key }
    end
  end


  # Rebuilds directly into +parse_result_hash+ all the missing :stats_details
  # data pages.
  #
  def rebuild_stats_details( parse_result_hash )
    parse_result_hash[:stats_details] = [] if parse_result_hash[ :stats_details ].nil?
                                                    # Find out which stat page is used:
    old_stats_row  = parse_result_hash[:stats_details_1].first ||
                     parse_result_hash[:stats_details_2].first
    return unless old_stats_row.instance_of?(Hash)
                                                    # Do a field-by-field conversion:
    parse_result_hash[:stats_details] << {
      id:     nil,
      fields: {
        teams_tot:        old_stats_row[:fields][ :teams_tot ],
        teams_presence:   old_stats_row[:fields][ :teams_presence ],
        swimmer_tot:      old_stats_row[:fields][ :swimmer_tot ],
        swimmer_presence: old_stats_row[:fields][ :swimmer_presence ],
        entries_tot:      old_stats_row[:fields][ :entries_tot ],
        entries_presence: old_stats_row[:fields][ :entries_presence ],
        disqual_tot:      old_stats_row[:fields][ :disqual_tot ],
        withdrawals_tot:  old_stats_row[:fields][ :withdrawals_tot ]
      },
      import_text: old_stats_row[:import_text]
    }
  end
  #-- -------------------------------------------------------------------------
  #++


  # Rebuilds directly into +parse_result_hash+ all the missing :category_header
  # data pages and re-links all the detail data pages to each corresponding header.
  #
  def rebuild_category_headers_for_entries( parse_result_hash )
    parse_result_hash[:category_header] = [] if parse_result_hash[ :category_header ].nil?
    parse_result_hash[:result_row]      = [] if parse_result_hash[ :result_row ].nil?
    parse_result_hash[:entry_row].each do |entry_row|
                                                  # Retrieve the original header row:
      old_header_row  = parse_result_hash[:event_individual].find({}) do |event_individual|
        event_individual[:id] == entry_row[:id]
      end
      birth_year, category = extract_swimmer_year_and_category( entry_row[:fields][:category_group] )
                                                    # Compose the correct header row:
      new_header_row = {
        distance:       old_header_row[:fields][:distance],
        style:          old_header_row[:fields][:style],
        gender:         nil, # (not available in FIN-sta -- most of the times)
        category_group: category,
        base_time:      nil # (not available in FIN-sta)
      }
      new_id_key = "#{ entry_row[:id] }-#{ category }"
                                                    # Update entry_row and its ID link:
      entry_row[:fields][:swimmer_year] = birth_year
      entry_row[:id] = new_id_key
                                                    # Check that we do not insert twice the same header row:
      parse_result_hash[:category_header] << {
        id:           new_id_key,
        fields:       new_header_row,
        import_text:  old_header_row[:import_text]
      } unless parse_result_hash[:category_header].any?{ |category_row| category_row[:id] == new_id_key }
                                                    # Add a fake result_row so that the struct will be processed almost "normally":
      parse_result_hash[:result_row] << {
        id:           new_id_key,
        fields:       entry_row[:fields],
        import_text:  entry_row[:import_text]
      }
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Accepts a compound text of swimmer_year and/or category, as in the FIN2 datafile
  # format. (Examples: '1969 40' or 'M 40': both are possible).
  #
  # Returns a list of 2 elements: the swimmer year and the category, as strings.
  # The swimmer_year may be +nil+ when not provided.
  #
  def extract_swimmer_year_and_category( compound_year_or_category )
    parts = compound_year_or_category.to_s.split(/\s+/)
    if (parts[0] =~ /\d{4}/) && (parts[1] =~ /\d{2}/)
      [ parts[0] , "M#{parts[1]}" ]

    elsif (parts[0] =~ /\d{4}/) && (parts[1] == '0')
      [ parts[0] , 'U25' ]

    elsif parts[0] =~ /M|U/i
      [ nil, parts.join ]

    else
      [ nil, nil ]
    end
  end


  # Accepts a compound text for the category, as in the FIN2 datafile
  # format. (Examples: '119 (A)', '159 (B)', '199 (C)', '99 (U25)'...)
  #
  # Returns the category code string according to the main FIN(1) format.
  #
  def extract_category_for_relays( compound_category, season )
    category_ending = compound_category.to_s.split(/\s+/).first
    category_type = CategoryType.where( season_id: season.id, age_end: category_ending.to_i ).first
    category_type ? category_type.code : category_ending
  end
end
