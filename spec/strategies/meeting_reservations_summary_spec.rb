require 'rails_helper'

describe MeetingReservationsSummary, type: :strategy do

  let(:meeting)         { Meeting.last(300).sample }
  let(:new_meeting)     { create( :meeting ) }
  let(:csi_season)      { [161, 171, 181].sample }
  let(:csi_meeting)     { Season.find(csi_season).meetings.where( are_results_acquired: true ).sample }

  let(:team)            { Team.first(10).sample }
  let(:new_team)        { create( :team ) }
  let(:ober_ferrari)    { Team.find(1) }

  let(:leega)           { Swimmer.find(23) }

  context "well formed instance" do
    subject { MeetingReservationsSummary.new( meeting, team ) }

    it_behaves_like( "(the existance of a method)", [
      :meeting, :team,
      :reservation_data_retrieved, :schedule_data_retrieved
    ] )

    it "assigns attributes as given parameters" do
      expect( subject.meeting ).to eq( meeting )
    end

    it "creates empty readable attributes" do
      expect( subject.reservation_data_retrieved ).to be_nil
      expect( subject.schedule_data_retrieved ).to be_nil
    end

    describe "#retrieve_reservation_data" do
      it "returns a relation and sets reservation_data_retrieved" do
        expect( subject.reservation_data_retrieved ).to be_nil
        result = subject.retrieve_reservation_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( subject.reservation_data_retrieved ).to be_a_kind_of( ActiveRecord::Result )
        expect( subject.reservation_data_retrieved ).to eq( result )
      end
      it "returns a query result of elements with necessary columns" do
        columns = [
          'swimmer_id', 'complete_name', 'category_code',
          'meeting_event_id', 'has_confirmed', 'event_code', 'is_out_of_race',
          'minutes', 'seconds', 'hundreds',
          'updated_at', 'is_a_relay'
        ]
        result = subject.retrieve_reservation_data
        result.each do |element|
          expect( element.size ).to eq( columns.size )
          columns.each do |column|
            expect( element.has_key?(column) ).to eq(true)
          end
        end
      end
      it "returns an empty query result for a newer meeting" do
        sm = MeetingReservationsSummary.new( new_meeting, ober_ferrari )
        result = sm.retrieve_reservation_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to eq( 0 )
      end
      it "returns an empty query result for a newer team" do
        sm = MeetingReservationsSummary.new( csi_meeting, new_team )
        result = sm.retrieve_reservation_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to eq( 0 )
      end
      it "returns a non empty query result for a recent CSI meeting" do
        sm = MeetingReservationsSummary.new( csi_meeting, ober_ferrari )
        result = sm.retrieve_reservation_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to be > 0
      end
    end

    describe "#set_meeting_reservation_summary_dao" do
      it "returns a meeting_reservation_summary dao without any new swimmer" do
        subject.retrieve_reservation_data
        result = subject.set_meeting_reservation_summary_dao
        expect( result ).to be_an_instance_of( MeetingReservationsSummaryDAO )
        new_swimmer = create( :swimmer )
        expect( result.get_swimmer_reservations( new_swimmer.id, new_swimmer.complete_name )).to be_nil
      end
      it "returns a meeting_reservation_summary dao with almost two Leega reservations for every CSI meetings" do
        sm = MeetingReservationsSummary.new( csi_meeting, ober_ferrari )
        sm.retrieve_reservation_data
        result = sm.set_meeting_reservation_summary_dao
        expect( result ).to be_an_instance_of( MeetingReservationsSummaryDAO )
        expect( result.reservations.size ).to be > 10
        #puts result.inspect
        leega_res = result.get_swimmer_reservations( leega.id, leega.complete_name )
        expect( leega_res.individual_reservations.size ).to be >= 2
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
