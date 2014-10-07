# encoding: utf-8

require 'common/format'
require 'data_import/services/data_import_entity_builder'


=begin

= DataImportMeetingBuilder

  - Goggles framework vers.:  4.00.549
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 Meeting entity rows.

=end
class DataImportMeetingBuilder < DataImportEntityBuilder

  # Searches for an existing Meeting given the parameters, or it adds a new one, if not found.
  #
  def self.build_from_parameters( data_import_session, season,
                                  meeting_header_row, meeting_dates_text,
                                  header_fields_dao, force_missing_meeting_creation )
# DEBUG
#    puts "\r\nbuild_from_parameters: #{header_fields_dao.inspect}"
    self.build( data_import_session ) do
      entity      Meeting

      set_up do                                   # Set the fields:
        if ( meeting_header_row )
          @title        = meeting_header_row[:fields][:title]
          @organization = meeting_header_row[:fields][:organization]
          @notes        = (meeting_dates_text ? "#{meeting_dates_text}\r\n" : '') +
                          (@organization ? "#{@organization}" : '')
        end
        @description = ( @title ? @title : "#{header_fields_dao.code_name } (#{Format.a_date(header_fields_dao.header_date)})" )
      end
                                                  # Search conditions:
      search do
        primary    [
          "(header_date = ?) AND (season_id = ?) AND (code = ?)",
          header_fields_dao.header_date, season.id, header_fields_dao.code_name
        ]
        secondary  [
          "(data_import_session_id = ?) AND (header_date = ?) AND (season_id = ?) AND (description = ?)",
          data_import_session.id, header_fields_dao.header_date, season.id, @description
        ]
        default_search
      end

      attributes_for_creation(
        data_import_session_id: data_import_session.id,
        import_text:            meeting_header_row.instance_of?(Hash) ? meeting_header_row[:import_text] : '-',
        description:            @description,
        # [Steve, 20131025] No default value for this one:
#       entry_deadline:         header_fields_dao.header_date - 14, # (This is just a guess)
        are_results_acquired:   true,
        is_under_25_admitted:   true, # (This is just a guess)
        configuration_file:     header_fields_dao.full_pathname,
        header_date:            header_fields_dao.header_date,
        code:                   header_fields_dao.code_name,
        header_year:            header_fields_dao.header_year,
        edition:                header_fields_dao.edition, # (This is just a guess)
        edition_type_id:        header_fields_dao.edition_type_id,
        timing_type_id:         header_fields_dao.timing_type_id,
        # TODO/FUTURE DEV:
#       individual_score_computation_type_id: 0,
#       relay_score_computation_type_id: 0,
#       team_score_computation_type_id: 0,
        notes:                  @notes,
        season_id:              season.id,
        user_id:                1 # (don't care)
      )

      if_not_found do
        if force_missing_meeting_creation
          add_new
        else
          raise "Matching Meeting NOT found but meeting creation is disabled!"
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
