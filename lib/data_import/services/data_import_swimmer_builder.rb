# encoding: utf-8

require 'data_import/services/data_import_entity_builder'


=begin

= DataImportSwimmerBuilder

  - Goggles framework vers.:  4.00.583
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 Swimmer entity rows.

=end
class DataImportSwimmerBuilder < DataImportEntityBuilder

  # Searches for an existing Swimmer given the parameters, or it adds a new one,
  # if no matches are found.
  #
  # == Returns
  # +nil+ in case of invalid parameters
  # #result_id as:
  #     - positive (#id) for a freshly added row into DataImportBadge;
  #     - negative (- #id) for a matching existing or commited row in Badge;
  #     - 0 on error/unable to process.
  #
  def self.build_from_parameters( data_import_session, swimmer_name, swimmer_year, gender_type )
# DEBUG
#    puts "\r\nSwimmer -- build_from_parameters: data_import_session ID: #{data_import_session.id}, swimmer_name: #{swimmer_name}, swimmer_year: #{swimmer_year}"
    self.build( data_import_session ) do
      entity      Swimmer

      set_up do
        set_result( nil ) and return if swimmer_name.nil? || swimmer_name.size < 2
        @complete_name = swimmer_name.gsub(/\s+/, ' ')
        # We must find a "separator length" that at least results in a last_name + first_name
        # array.
        splitted_name = swimmer_name.gsub(/\s{3,}/, '  ').split('  ') # Normalize multi-space separator between last_name and first_name
        splitted_name = (splitted_name[0]).split(' ') if splitted_name.size < 2
        if splitted_name.size == 2                      # Use last & first name only when the splitting is certain
          @last_name  = splitted_name[0]
          @first_name = splitted_name.reject{ |s| s == @last_name }.join(' ')
        end
      end

      search do
        primary   [
          "(year_of_birth = ?) AND (complete_name LIKE ?)",
          swimmer_year, @complete_name+'%'
        ]
        secondary [
          "(data_import_session_id = ?) AND (year_of_birth = ?) AND (complete_name LIKE ?)",
          data_import_session.id, swimmer_year, @complete_name+'%'
        ]
        default_search
# DEBUG
#        puts "primary_search_ok!"   if primary_search_ok?
#        puts "secondary_search_ok!" if secondary_search_ok?
      end

      if_not_found do
# DEBUG
#        puts "Search failed: preparing add_new..."
        attributes_for_creation(
          data_import_session_id: data_import_session.id,
          import_text:            "#{swimmer_name}, #{swimmer_year}",
          last_name:              @last_name,
          first_name:             @first_name,
          complete_name:          @complete_name,
          year_of_birth:          swimmer_year,
          gender_type_id:         gender_type ? gender_type.id : nil,
          user_id:                1 # (don't care)
        )
        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
