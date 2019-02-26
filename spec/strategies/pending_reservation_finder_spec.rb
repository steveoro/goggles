require 'rails_helper'


describe PendingReservationFinder, type: :strategy do

  let(:new_swimmer )      { create( :swimmer ) }
  let(:leega)             { Swimmer.find( 23 ).user }

  let(:fix_date)          { Date.today() - 100 + (rand * 200).to_i }
  let(:date_1819)         { Date.new(2018, 12, 31) } 

  let(:new_meeting )      { create( :meeting, { header_date: Date.today + (rand * 20).to_i, are_results_acquired: false } ) }
  let(:acquired_meeting ) { create( :meeting, { are_results_acquired: true } ) }
  let(:past_meeting )     { create( :meeting, { header_date: Date.today - (rand * 20).to_i } ) }
  let(:closed_meeting )   { create( :meeting, { entry_deadline: Date.today - (rand * 20).to_i } ) }
  
  subject { PendingReservationFinder.new(leega) }

  describe "[a well formed instance]" do
    it_behaves_like( "(the existance of a method returning an array)", [
      :meetings_ids, 
      :team_affiliations_ids,
      :pending_reservations,
      :find_open_meetings,
      :find_manageable_affiliations,
      :get_pending_reservations
    ])
    
    it "returns empty meetings_ids on init" do
      expect( subject.meetings_ids.size ).to eq( 0 )
    end
    
    it "returns empty team_affiliations_ids on init" do
      expect( subject.team_affiliations_ids.size ).to eq( 0 )
    end
    
    it "returns empty pending_reservations on init" do
      expect( subject.pending_reservations.size ).to eq( 0 )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
  
  describe "#find_open_meetings" do
    it "finds at least one new meeting" do
      expect( new_meeting.header_date ).to be > Date.today()
      expect( new_meeting.are_results_acquired ).to eq( false )
      expect( subject.find_open_meetings.size ).to be >= 1
    end

    it "doesn't find meeting with acquired results" do
      expect( acquired_meeting.are_results_acquired ).to eq( true )
      meeting_ids = subject.find_open_meetings 
      expect( meeting_ids.include?(acquired_meeting.id) ).to eq( false )
    end

    it "doesn't find meeting with header date in the past" do
      expect( past_meeting.header_date ).to be < Date.today()
      meeting_ids = subject.find_open_meetings 
      expect( meeting_ids.include?(past_meeting.id) ).to eq( false )
    end

    it "doesn't find meeting with entry_deadline in the past" do
      expect( closed_meeting.entry_deadline ).to be < Date.today()
      meeting_ids = subject.find_open_meetings 
      expect( meeting_ids.include?(closed_meeting.id) ).to eq( false )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
  
  describe "#find_manageable_affiliations" do
    it "find at least 2 manageable team affiliations for Leega in 2018/2019" do
      expect( subject.find_manageable_affiliations(Date.new(2019, 02, 26)).count).to be >= 2
    end
    it "find no more than 3 manageable team affiliations for Leega in 2017/2018" do
      expect( subject.find_manageable_affiliations(Date.new(2018, 02, 26)).count).to be <= 3
    end
    
  end
  #-- -------------------------------------------------------------------------
  #++
  
  describe "#get_pending_reservations" do
    it "returns only reservations for searched meetings" do
      pr = subject.get_pending_reservations()
      m = subject.meetings_ids
      pr.each do |r|
        expect( m.include?( r.meeting_id )).to eq( true )
      end
    end  

    it "returns only reservations for manageable team affiliations" do
      pr = subject.get_pending_reservations()
      ta = subject.team_affiliations_ids
      pr.each do |r|
        expect( ta.include?( r.team_affiliation_id )).to eq( true )
      end
    end  
  end
  #-- -------------------------------------------------------------------------
  #++
end
