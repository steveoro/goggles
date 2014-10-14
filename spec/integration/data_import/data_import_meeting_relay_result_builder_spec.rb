# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/data_import_entity_builder'
require_relative '../../../lib/data_import/services/data_import_meeting_relay_result_builder'
require_relative '../../../lib/data_import/services/data_import_team_builder'
require_relative '../../../lib/data_import/services/data_import_swimmer_builder'
require_relative '../../../lib/data_import/services/data_import_badge_builder'


describe DataImportMeetingRelayResultBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Non-existing (totally random) fixture params. Rebuild a plausible event & program
  # starting from the meeting session:
  # TODO

  # Existing or matching entities:
  # TODO
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with NO matching primary entity (but existing MeetingProgram)," do
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with NO matching primary entity (but existing DataImportMeetingProgram)," do
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching primary entity (and its MeetingProgram)," do
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching secondary entity (w/ DataImportMeetingProgram)," do
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++
end
