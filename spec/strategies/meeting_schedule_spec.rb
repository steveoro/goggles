require 'rails_helper'

describe MeetingSchedule, type: :strategy do

  let(:meeting)         { Meeting.last(300).sample }
  let(:new_meeting)     { create( :meeting ) }
  let(:csi_season)      { [161, 171, 181].sample }
  let(:csi_meeting)     { Season.find(csi_season).meetings.where( are_results_acquired: true ).sample }

  context "well formed instance" do
    subject { MeetingSchedule.new( meeting ) }

    it_behaves_like( "(the existance of a method)", [
      :meeting,
      :schedule_data_retrieved
    ] )

    it "assigns attributes as given parameters" do
      expect( subject.meeting ).to eq( meeting )
    end

    it "creates empty readable attributes" do
      expect( subject.schedule_data_retrieved ).to be_nil
    end

    describe "#retrieve_schedule_data" do
      it "returns a relation and sets schedule_data_retrieved" do
        expect( subject.schedule_data_retrieved ).to be_nil
        result = subject.retrieve_schedule_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( subject.schedule_data_retrieved ).to be_a_kind_of( ActiveRecord::Result )
        expect( subject.schedule_data_retrieved ).to eq( result )
      end
      it "returns a query result of elements with necessary columns" do
        columns = [
          'meeting_session_id',
          'session_order', 'scheduled_date', 'begin_time', 'warm_up_time', 'session_notes',
          'swimming_pool_id', 'lanes_number', 'pool_name', 'pool_address', 'city', 'pool_type', 'maps_uri',
          'meeting_event_id', 'event_order', 'event_code', 'is_a_relay',
          'is_out_of_race', 'has_separate_gender', 'has_separate_categories', 'event_notes'
        ]
        result = subject.retrieve_schedule_data
        result.each do |element|
          expect( element.size ).to eq( columns.size )
          columns.each do |column|
            expect( element.has_key?(column) ).to eq(true)
          end
        end
      end
      it "returns an empty query result for a newer meeting without defined schedule" do
        sm = MeetingSchedule.new( new_meeting )
        expect( new_meeting.meeting_sessions.count ).to eq( 0 )
        result = sm.retrieve_schedule_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to eq( 0 )
      end
      it "returns a non empty query result for a recent CSI meeting" do
        sm = MeetingSchedule.new( csi_meeting )
        expect( csi_meeting.meeting_sessions.count ).to be > 0
        result = sm.retrieve_schedule_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to be > 0
      end
    end

    describe "#set_meeting_schedule_dao" do
      it "returns a MeetingScheduleDAO" do
        expect( subject.set_meeting_schedule_dao ).to be_an_instance_of( MeetingScheduleDAO )
      end
      it "returns an empty MeetingScheduleDAO when no data retrieved" do
        expect( subject.schedule_data_retrieved ).to be_nil
        ms = subject.set_meeting_schedule_dao
        expect( ms ).to be_an_instance_of( MeetingScheduleDAO )
        expect( ms.sessions.size ).to eq( 0 )
      end
      it "returns a non empty MeetingScheduleDAO when data retrieved with the meeting session elements" do
        subject.retrieve_schedule_data
        #puts subject.schedule_data_retrieved.inspect
        expect( subject.schedule_data_retrieved ).not_to be_nil
        ms = subject.set_meeting_schedule_dao
        expect( ms ).to be_an_instance_of( MeetingScheduleDAO )
        size = ms.sessions.size
        expect( size ).to be > 0
        expect( size ).to eq( meeting.meeting_sessions.count )
        meeting.meeting_sessions.each do |meeting_session|
          mss = ms.get_session( subject.get_key( meeting_session.session_order, meeting_session.id ))
          expect( mss ).to be_an_instance_of( MeetingScheduleDAO::MeetingScheduleSessionDAO )
          expect( mss.events.size ).to eq( meeting_session.meeting_events.count )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
