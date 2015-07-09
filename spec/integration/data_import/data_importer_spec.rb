# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
#require_relative '../../../app/data_import/v2/strategies/data_importer'
#require_relative '../../../app/data_import/v2/dao/header_fields_dao'


describe DataImporter, type: :integration do

  # Internal Commit phase.
  # This includes:
  # - Individual commit entity-by-entity for each of the intermediate rows found.
  #
  describe "#phase_3_commit" do

    context "after successful completion, w/ FORCE meeting & team creation ENABLED," do
      # before(:all) do
        # file_name = File.join(Rails.root, 'test/fixtures/samples/ris20131110bologna-sample.txt')
        # @phase_1_session = create(
          # :data_import_session,
          # file_name: file_name,
          # season: Season.find_by_id( 132 )
        # )
        # @phase_1_subject = DataImporter.new( nil, nil, @phase_1_session )
        # @phase_1_subject.set_up(
          # force_missing_meeting_creation: true,
          # force_team_or_swimmer_creation: true,
          # do_not_consume_file: true               # THIS IS MANDATORY! (Otherwise the sample file will be destroyed by the tests)
        # )
        # @phase_1_subject.phase_1_parse
        # expect( @phase_1_subject.data_import_session.phase ).to eq(10)
        # @di_team_before_count     = DataImportTeam.where( data_import_session_id: @phase_1_session.id ).count
        # @di_swimmer_before_count  = DataImportSwimmer.where( data_import_session_id: @phase_1_session.id ).count
        # @di_mir_before_count      = DataImportMeetingIndividualResult.where( data_import_session_id: @phase_1_session.id ).count
        # @di_mrr_before_count      = DataImportMeetingRelayResult.where( data_import_session_id: @phase_1_session.id ).count
        # @di_score_before_count    = DataImportMeetingTeamScore.where( data_import_session_id: @phase_1_session.id ).count
        # @result = @phase_1_subject.phase_1_2_serialize
      # end
#
      # after(:all) do
        # @phase_1_session = nil
        # @phase_1_subject.destroy_data_import_session
      # end

      # FIXME Use transactional rows (rollback after(:all))

      # TODO test commit of the created secondary entities
      # TODO test status outcome
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
