# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/services/data_import_entity_builder'
require_relative '../../../app/data_import/v2/services/data_import_meeting_event_builder'


describe V2::DataImportMeetingEventBuilder, type: :integration do

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
      V2::DataImportMeetingEventBuilder.build_from_parameters(
        data_import_session,
        meeting_session,
        matching_event_type,
        heat_type,
        event_order,
        nil,   # begin_time, frequently unknown
        false # is_out_of_race
      )
    end

    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
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


  context "after a self.build() with a matching MeetingEvent & MeetingSession row," do
    subject do
      V2::DataImportMeetingEventBuilder.build_from_parameters(
        data_import_session,
        meeting_event.meeting_session,
        meeting_event.event_type,
        meeting_event.heat_type,
        nil,
        nil,
        false # is_out_of_race,
      )
    end

    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
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


  context "after a self.build() with a matching MeetingEvent on != MeetingSession row," do
    subject do
# DEBUG
#      puts "\r\nSEEKED meeting_event:  #{meeting_event.inspect}"
      V2::DataImportMeetingEventBuilder.build_from_parameters(
        data_import_session,
        # Default meeting session, in case the correct one on the actual event is not found
        create( :meeting_session, meeting: meeting_event.meeting_session.meeting ),
        meeting_event.event_type,
        meeting_event.heat_type,
        nil,
        nil,
        false # is_out_of_race,
      )
    end

    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
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
      # (+2 only from the factories creation in the subject)
      expect{ subject }.to change{ MeetingSession.count }.by(2)
    end
    it "does not create a new DataImportMeetingSession row" do
      expect{ subject }.not_to change{ DataImportMeetingSession.count }
    end

    describe "#result_row" do
      it "returns the entity instance found when the primary search is successful" do
        expect( subject.result_row ).to be_an_instance_of( MeetingEvent )
      end
      it "is the existing meeting_event row" do
        expect( subject.result_row.id ).to eq( meeting_event.id )
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


  let(:di_seed_session) do
    create( :data_import_session, season_id: 142 )
  end
  let(:seed_finals_heat_type)     { HeatType.find( 3 ) }

  [ # FIN Parma, 20141214, 660: Morning session, 661: Afternoon session,
    [ 660,  5, 2327 ], # 400 SL
    [ 660, 19, 2328 ], # 50 RA
    [ 660, 12, 2329 ], # 100 FA
    [ 660, 15, 2330 ], # 50 DO
    [ 660,  3, 2331 ], # 100 SL
    [ 660, 21, 2402 ], # 200 RA

    [ 661,  4, 2332 ], # 200 SL
    [ 661, 11, 2333 ], # 50 FA
    [ 661, 20, 2334 ], # 100 DO
    [ 661,  2, 2335 ], # 50 SL
    [ 661, 22, 2336 ]  # 100 MI
  ].each do |seed_meeting_session_id, event_type_id, expected_meeting_event_id|
    context "after a self.build(meeting_session_id: #{seed_meeting_session_id}, event_type_id: #{event_type_id}) with data from chosen Meeting seeds," do
      subject do
        V2::DataImportMeetingEventBuilder.build_from_parameters(
          di_seed_session,
          MeetingSession.find( seed_meeting_session_id ),
          EventType.find( event_type_id ),
          seed_finals_heat_type,
          nil,
          nil,
          false # is_out_of_race,
        )
      end

      it "returns a V2::DataImportEntityBuilder instance" do
        expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
      end
      describe "#data_import_session" do
        it "is the DataImportSession specified for the build" do
          expect( subject.data_import_session ).to eq( di_seed_session )
        end
      end
      it "does not create any primary entity row" do
        # (+1 only from the factory creation in the subject)
        expect{ subject }.not_to change{ MeetingEvent.count }
      end
      it "does not create any MeetingSession row" do
        # (+2 only from the factories creation in the subject)
        expect{ subject }.not_to change{ MeetingSession.count }
      end
      it "does not create a new DataImportMeetingSession row" do
        expect{ subject }.not_to change{ DataImportMeetingSession.count }
      end
      describe "#result_row" do
        it "returns the entity instance found when the primary search is successful" do
          expect( subject.result_row ).to be_an_instance_of( MeetingEvent )
        end
        it "is the existing meeting_event row" do
          expect( subject.result_row.id ).to eq( expected_meeting_event_id )
        end
      end
      describe "#result_id" do
        it "returns a negative ID since the primary search is successful" do
          expect( subject.result_id ).to be < 0
        end
        it "is the ID of the resulting row, with a minus sign" do
          expect( subject.result_id ).to eq( -(subject.result_row.id) )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
