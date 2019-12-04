require 'rails_helper'

describe MeetingReservationsSummary, type: :strategy do

  let(:meeting)         { Meeting.last(300).sample }
  let(:new_meeting)     { create( :meeting ) }
  let(:csi_season)      { [161, 171, 181].sample }
  let(:csi_meeting)     { Season.find(csi_season).meetings.sample }

  let(:team)            { Team.first(10).sample }
  let(:new_team)        { create( :team ) }
  let(:ober_ferrari)    { Team.find(1) }

  context "well formed instance" do
    subject { MeetingReservationsSummary.new( meeting, team ) }

    it_behaves_like( "(the existance of a method)", [
      :meeting,
      :data_retrieved
    ] )

    it "assigns attributes as given parameters" do
      expect( subject.meeting ).to eq( meeting )
    end

    it "creates empty readable attributes" do
      expect( subject.data_retrieved ).to be_nil
    end

    describe "#retrieve_data" do
      it "returns a relation and sets data_retrieved" do
        expect( subject.data_retrieved ).to be_nil
        result = subject.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( subject.data_retrieved ).to be_a_kind_of( ActiveRecord::Result )
        expect( subject.data_retrieved ).to eq( result )
      end
      it "returns a query result of elements with necessary columns" do
        columns = [
          'swimmer_id', 'complete_name', 'category_code', 'meeting_event_id',
          'has_confirmed', 'event_order', 'event_code', 'is_out_of_race',
          'minutes', 'seconds', 'hundreds',
          'session_order', 'session_date', 'begin_time', 'warm_up_time',
          'updated_at'
        ]
        result = subject.retrieve_data
        result.each do |element|
          expect( element.size ).to eq( columns.size )
          columns.each do |column|
            expect( element.has_key?(column) ).to eq(true)
          end
        end
      end
      it "returns an empty query result for a newer meeting" do
        sm = MeetingReservationsSummary.new( new_meeting, ober_ferrari )
        result = sm.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to eq( 0 )
      end
      it "returns an empty query result for a newer team" do
        sm = MeetingReservationsSummary.new( csi_meeting, new_team )
        result = sm.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to eq( 0 )
      end
      it "returns a non empty query result for a recent CSI meeting" do
        sm = MeetingReservationsSummary.new( csi_meeting, ober_ferrari )
        result = sm.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to be > 0
      end
    end

    describe "#set_meeting_reservation_summary_dao" do
      xit "returns a meeting_reservation_summary dao" do
        result = subject.retrieve_data
        expect( subject.set_meeting_reservation_summary_dao ).to be_an_instance_of( SwimmerCareerDAO )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
