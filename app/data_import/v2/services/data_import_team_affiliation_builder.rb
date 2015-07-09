# encoding: utf-8

require 'common/format'
require_relative '../../../data_import/v2/services/data_import_entity_builder'


=begin

= DataImportTeamAffiliationBuilder

  - Goggles framework vers.:  4.00.689
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 TeamAffiliation entity rows.

=end
class DataImportTeamAffiliationBuilder < DataImportEntityBuilder

  # Searches for an existing TeamAffiliation given the parameters, or it adds a new one,
  # if not found.
  #
  # This entity builder class does *not* rebuild any missing link in the meeting-data
  # hierachy tree.
  #
  # Note that both <tt>team</tt> and <tt>season</tt> must refer to actual primary entities
  # (Team and Season) and not to secondary ones (DataImportTeam and DataImportSeason, since
  # there are no links to those inside TeamAffiliation).
  #
  # == Returns
  #   #result_id as:
  #     - positive when freshly added into TeamAffiliation;
  #     - negative IDs only for already existing/commited rows in TeamAffiliation;
  #     - 0 only on error/unable to process.
  #
  # === Basic Chain of existance:
  #
  #   +-> Season
  #   +-> Team
  #   \-----> TeamAffiliation
  #
  def self.build_from_parameters( data_import_session, team, season )
# DEBUG
#    puts "\r\nTeamAffiliationBuilder -- build_from_parameters:\r\n- team: #{team.inspect}\r\n- season: #{season.inspect}"
    self.build( data_import_session ) do
      if team.instance_of?(Team) && season.instance_of?(Season)
        entity TeamAffiliation
                                                    # Search conditions:
        search do
          primary( team_id: team.id, season_id: season.id )
          default_search
        end

        # This will override what is the default secondary entity ('DataImportTeamAffiliation', which does not exist):
        entity_for_creation TeamAffiliation

        attributes_for_creation(
          name:                       team.editable_name,
          team_id:                    team.id,
          season_id:                  season.id,
          is_autofilled:              true,         # signal that we have guessed some of the values
          must_calculate_goggle_cup:  false,
          user_id:                    1
          # FIXME Unable to guess team affiliation number (not filled-in, to be added by hand)
        )

        if_not_found do
# DEBUG
#          puts "NOT found! Creating a new TeamAffiliation..."
          add_new
        end
      else
        set_result( nil )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
