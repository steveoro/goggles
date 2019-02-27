require 'rails_helper'


describe PendingReservationFinder, type: :strategy do

  let(:leega)             { Swimmer.find( 23 ).user }

  let(:acquired_meeting ) { create( :meeting, { are_results_acquired: true } ) }
  let(:past_meeting )     { create( :meeting, { header_date: Date.today - (rand * 20).to_i } ) }
  let(:closed_meeting )   { create( :meeting, { entry_deadline: Date.today - (rand * 20).to_i } ) }
  
  subject { PendingReservationFinder.new(leega) }

  describe "[a well formed instance]" do
    it_behaves_like( "(the existance of a method returning an array)", [
      :meetings_ids, 
      :seasons_ids,
      :pending_reservations,
      :find_open_meetings,
      :find_manageable_seasons,
      :get_pending_reservations
    ])

    it_behaves_like( "(the existance of a method returning a boolean value)", [
      :seasons_found, 
      :meetings_found
    ])
    
    it "returns empty meetings_ids on init" do
      expect( subject.meetings_ids.size ).to eq( 0 )
    end
    
    it "returns empty seasons_ids on init" do
      expect( subject.seasons_ids.size ).to eq( 0 )
    end
    
    it "returns empty pending_reservations on init" do
      expect( subject.pending_reservations.size ).to eq( 0 )
    end
    
    it "returns a false seasons found tracer" do
      expect( subject.seasons_found ).to eq( false )
    end
    
    it "returns a false meetings found tracer" do
      expect( subject.meetings_found ).to eq( false )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
  
  describe "#find_open_meetings" do
    it "sets true found meetingsand seasons tracer" do
      expect( subject.seasons_found ).to eq( false )
      expect( subject.meetings_found ).to eq( false )
      subject.find_open_meetings()
      expect( subject.seasons_found ).to eq( true )
      expect( subject.meetings_found ).to eq( true )
    end
    
    it "finds at least one new meeting" do
      ms = subject.find_manageable_seasons(Date.new(2019, 02, 26))
      new_meeting = create( :meeting, { header_date: Date.today + (rand * 20).to_i, are_results_acquired: false , entry_deadline: Date.today + (rand * 20).to_i, season_id: ms.sample }) 
 
      expect( new_meeting.header_date ).to be > Date.today()
      expect( new_meeting.are_results_acquired ).to eq( false )
      expect( ms.include?( new_meeting.season_id )).to eq( true )
      expect( subject.find_open_meetings(Date.new(2019, 02, 26)).size ).to be >= 1
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
  
  describe "#set_searched_meetings" do
    it "returns an array" do
      expect( subject.set_searched_meeting((rand * 20000).to_i)).to be_a_kind_of(Array)
    end

    it "populates meetings_ids" do
      expect( subject.meetings_found ).to eq( false )
      expect( subject.meetings_ids.size ).to eq( 0 )
      subject.set_searched_meeting((rand * 20000).to_i)
      expect( subject.meetings_found ).to eq( true )
      expect( subject.meetings_ids.size ).to eq( 1 )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
  
  describe "#find_manageable_seasons" do
    it "sets true found seasons tracer" do
      expect( subject.seasons_found ).to eq( false )
      subject.find_manageable_seasons()
      expect( subject.seasons_found ).to eq( true )
    end
    
    it "find at least 2 manageable seasons for Leega in 2018/2019" do
      expect( subject.find_manageable_seasons(Date.new(2019, 02, 26)).count).to be >= 2
    end
    
    it "find no more than 3 manageable seasons for Leega in 2017/2018" do
      expect( subject.find_manageable_seasons(Date.new(2018, 02, 26)).count).to be <= 3
    end
  end
  #-- -------------------------------------------------------------------------
  #++
  
  describe "#get_pending_reservations" do
    it "returns an hash responding to needed methods" do
      pr = subject.get_pending_reservations()
      pr.each do |r|
        expect( r.id ).to be > 0
        expect( r.meeting_id ).to be > 0
        expect( r.season_id ).to be > 0
        expect( r.swimmer_id ).to be > 0
      end
    end
    
    it "returns only reservations for searched meetings" do
      pr = subject.get_pending_reservations()
      m = subject.meetings_ids
      pr.each do |r|
        expect( m.include?( r.meeting_id )).to eq( true )
      end
    end  

    it "returns only reservations for manageable team affiliations" do
      pr = subject.get_pending_reservations()
      s = subject.seasons_ids
      pr.each do |r|
        expect( s.include?( r.season_id )).to eq( true )
      end
    end  
  end
  #-- -------------------------------------------------------------------------
  #++
end
