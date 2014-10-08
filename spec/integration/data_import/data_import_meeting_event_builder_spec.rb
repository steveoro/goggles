# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/data_import_entity_builder'
require_relative '../../../lib/data_import/services/data_import_meeting_event_builder'


describe DataImportMeetingEventBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Non-existing (totally random) fixture params:
  let(:meeting_session)       { create( :meeting_session ) }
  let(:matching_event_type) do
    EventsByPoolType.only_for_meetings.not_relays
      .for_pool_type_code( meeting_session.swimming_pool.pool_type.code )
      .sort{ rand - 0.5 }[0].event_type
  end
  let(:event_type)            { EventType.all.sort{ rand - 0.5 }[0] }
  let(:heat_type)             { HeatType.all.sort{ rand - 0.5 }[0] }
  let(:event_order)           { ((rand * 100) % 15).to_i + 1 }

  # Existing or matching fixture params:
  let(:meeting_event)         { create( :meeting_event ) }
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with NO matching MeetingEvent (but existing MeetingSession)," do
    subject do
      DataImportMeetingEventBuilder.build_from_parameters(
        data_import_session,
        meeting_session,
        matching_event_type,
        heat_type,
        event_order,
        nil,   # begin_time, frequently unknown
        false # is_out_of_race
      )
    end

    it "returns a DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    # (There's no secondary entity for MeetingEvents)
    it "creates a new primary entity row" do
      expect{ subject }.to change{ MeetingEvent.count }.by(1)
    end
    describe "#result_row" do
      it "returns a primary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( MeetingEvent )
      end
    end
    describe "#result_id" do
      it "returns a positive ID when since the resulting row is was created" do
        expect( subject.result_id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_id ).to eq( subject.result_row.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching MeetingEvent row," do
    subject do
      DataImportMeetingEventBuilder.build_from_parameters(
        data_import_session,
        meeting_event.meeting_session,
        meeting_event.event_type,
        meeting_event.heat_type,
        nil,
        nil,
        false # is_out_of_race,
      )
    end

    it "returns a DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    it "does not create any additional primary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ MeetingEvent.count }.by(1)
    end
    it "does not create any additional MeetingSession row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ MeetingSession.count }.by(1)
    end
    it "does not create a new DataImportMeetingSession row" do
      expect{ subject }.not_to change{ DataImportMeetingSession.count }
    end

    describe "#result_row" do
      it "returns the entity instance found when the primary search is successful" do
        expect( subject.result_row ).to be_an_instance_of( MeetingEvent )
      end
    end
    describe "#result_id" do
      it "returns a negative ID when the primary search is successful" do
        expect( subject.result_id ).to be < 0
      end
      it "is the ID of the resulting row, with a minus sign" do
        expect( subject.result_id ).to eq( -(subject.result_row.id) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
