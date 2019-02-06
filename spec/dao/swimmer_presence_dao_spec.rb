require 'rails_helper'


describe SwimmerPresenceDAO, type: :model do

  let(:fix_swimmer)       { Swimmer.find(23) }
  let(:fix_date)          { Date.today() - (rand * 300).to_i }
  let(:fix_year )         { fix_date.month < 10 ? fix_date.year - 1 : fix_date.year }
  let(:fix_header_year )  { "#{fix_year}/#{fix_year+1}" }
  let(:fix_meeting )      { Meeting.find( [18101, 18102, 18205, 18224].sample ) }
  let(:fin_meeting )      { Meeting.find( [18205, 18224].sample ) }
  let(:csi_meeting )      { Meeting.find( [18101, 18102].sample ) }
  let(:fix_season )       { fix_meeting.season }

  context "MeetingPresenceDAO subclass," do
    subject { SwimmerPresenceDAO::MeetingPresenceDAO.new( fix_meeting, fix_season ) }
  
    it_behaves_like( "(the existance of a method)", [
      :season_id, 
      :season_name, 
      :meeting_id, 
      :header_date, 
      :description, 
      
      :meeting_fee, 
      :event_fee, 
      :relay_fee,
      
      :was_present, 
      :events_count, 
      :relays_count,
      
      :det_reservations_count, 
      :det_entries_count, 
      :det_results_count
    ])

    it_behaves_like( "(the existance of a method returning numeric values)", [
      :get_events_fee,
      :get_relays_fee,
      :get_total_fee
    ])

    describe "[a well formed instance]" do
      it "has correct default counter values" do
        expect( subject.was_present ).to eq( false )
        expect( subject.events_count ).to eq( 0 )
        expect( subject.relays_count ).to eq( 0 )
        expect( subject.det_reservations_count ).to eq( 0 )
        expect( subject.det_entries_count ).to eq( 0 )
        expect( subject.det_results_count ).to eq( 0 )
      end
    end

    describe "#get_events_fee" do
      it "returns 0 if nil or 0 events count" do
        subject.events_count = 0
        expect( subject.get_events_fee() ).to eq( 0 )
        subject.events_count = nil
        expect( subject.get_events_fee() ).to eq( 0 )
      end
      
      it "returns 0 if nil or 0 event fee" do
        csiMP = SwimmerPresenceDAO::MeetingPresenceDAO.new( csi_meeting, fix_season )
        csiMP.events_count = (rand * 2).to_i
        expect( csiMP.get_events_fee() ).to eq( 0 )
      end
      
      it "returns > 0 if positive event fee and positive events count" do
        finMP = SwimmerPresenceDAO::MeetingPresenceDAO.new( csi_meeting, fix_season )
        finMP.events_count = ( 1 + (rand * 2).to_i )
        expect( finMP.get_events_fee() ).to be >= 0
      end

      it "returns count * fee product if positive event fee and positive events count" do
        finMP = SwimmerPresenceDAO::MeetingPresenceDAO.new( csi_meeting, fix_season )
        finMP.events_count = ( 1 + (rand * 2).to_i )
        expect( finMP.get_events_fee() ).to eq( finMP.event_fee * finMP.events_count )
      end
    end

    describe "#get_relays_fee" do
      it "returns 0 if nil or 0 relays count" do
        subject.relays_count = 0
        expect( subject.get_relays_fee() ).to eq( 0 )
        subject.relays_count = nil
        expect( subject.get_relays_fee() ).to eq( 0 )
      end
      
      it "returns 0 if nil or 0 relay fee" do
        csiMP = SwimmerPresenceDAO::MeetingPresenceDAO.new( csi_meeting, fix_season )
        csiMP.relays_count = 1
        expect( csiMP.get_relays_fee() ).to eq( 0 )
      end
      
      it "returns > 0 if positive relay fee and positive relays count" do
        finMP = SwimmerPresenceDAO::MeetingPresenceDAO.new( csi_meeting, fix_season )
        finMP.relays_count = ( 1 + (rand * 2).to_i )
        expect( finMP.get_relays_fee() ).to be >= 0
      end

      it "returns count * fee product if positive relay fee and positive relays count" do
        finMP = SwimmerPresenceDAO::MeetingPresenceDAO.new( csi_meeting, fix_season )
        finMP.relays_count = ( 1 + (rand * 2).to_i )
        expect( finMP.get_relays_fee() ).to eq( finMP.relay_fee * finMP.relays_count )
      end
    end

    describe "#get_total_fee" do
      it "returns sum of meeting_fee, events fee and relays fee" do
        subject.events_count = (rand * 2).to_i
        subject.relays_count = ( 1 + (rand * 2).to_i )
        expect( subject.get_total_fee() ).to eq( subject.meeting_fee + subject.get_events_fee + subject.get_relays_fee )
      end
    end
  end

  context "SwimmerPresenceDAO," do
    subject { SwimmerPresenceDAO.new( fix_swimmer, fix_date, fix_header_year ) }

    it "responds to to_csv" do
      expect( subject ).to respond_to( :to_csv )
    end

    it_behaves_like( "(the existance of a method)", [
      :swimmer_id,
      :complete_name, 
      :evaluation_date, 
      :header_year
    ])

    it_behaves_like( "(existance of a member array)", [
      :meetings
    ])

    describe "#add_meeting" do
      it "returns a number" do
        expect( subject.add_meeting(SwimmerPresenceDAO::MeetingPresenceDAO.new(fix_meeting, fix_season)) ).to be >= 0
      end

      it "increase #meeting count" do
        expect( subject.meetings.count ).to eq( 0 )
        expect( subject.add_meeting(SwimmerPresenceDAO::MeetingPresenceDAO.new(fix_meeting, fix_season)) ).to eq( 1 )
        expect( subject.meetings.count ).to eq( 1 )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
  
end
