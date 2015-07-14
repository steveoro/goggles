# encoding: utf-8

require 'common/format'
require_relative '../../../data_import/v2/services/data_import_entity_builder'


=begin

= V2::DataImportTimeStandardBuilder

  - Goggles framework vers.:  4.00.671
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 TimeStandard entity rows.

=end
class V2::DataImportTimeStandardBuilder < V2::DataImportEntityBuilder

  # Searches for an existing TimeStandard given the parameters, or it adds a new one, if not found.
  #
  def self.build_from_parameters( data_import_session, season, event_type_id, category_type_id,
                                   gender_type_id, pool_type_id, mins, secs, hds )
    self.build( data_import_session ) do
      entity              TimeStandard
                                                  # Search condition:
      search do
        primary(
          event_type_id:    event_type_id,
          category_type_id: category_type_id,
          gender_type_id:   gender_type_id,
          pool_type_id:     pool_type_id,
          minutes:          mins,
          seconds:          secs,
          hundreds:         hds
        )
        default_search
# DEBUG
#        puts "TimeStandard: primary_search_ok!" if primary_search_ok?
#        puts "TimeStandard: secondary_search_ok!" if secondary_search_ok?
      end

      # This will override what is the default secondary entity ('DataImportTimeStandard', which does not exist):
      entity_for_creation TimeStandard

      attributes_for_creation(
        season_id:        season.id,
        event_type_id:    event_type_id,
        category_type_id: category_type_id,
        gender_type_id:   gender_type_id,
        pool_type_id:     pool_type_id,
        minutes:          mins,
        seconds:          secs,
        hundreds:         hds
      )

      if_not_found do
# DEBUG
#        puts "NOT found! Adding new TimeStandard with: #{mins}'#{secs}\"#{hds}, season:#{season.id}, event type:#{event_type_id}, category:#{category_type_id}, gender:#{gender_type_id}, pool_type:#{pool_type_id}..."
        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
