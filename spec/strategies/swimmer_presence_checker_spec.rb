require 'rails_helper'


describe SwimmerPresenceChecker, type: :strategy do

  let(:fix_swimmer)       { Swimmer.find( [23, 51, 142, 149].sample ) }  # Leega, Attolini, Steve, Ganga
  let(:new_swimmer )      { create( :swimmer ) }
  let(:leega)             { Swimmer.find( 23 ) }
  let(:ganga)             { Swimmer.find( 149 ) }

  let(:fix_date)          { Date.today() - 100 + (rand * 200).to_i }
  let(:date_1819)         { Date.new(2018, 12, 31) } 

  let(:fix_meeting )    { Meeting.find( [18101,18205,18102,17224,18224,17205].sample ) }
  let(:new_meeting )    { create( :meeting ) }
  let(:carpi )          { Meeting.find( 18101 ) }
  let(:parma )          { Meeting.find( 18102 ) }

  let(:fix_season )     { Season.find( 181 ) }

  subject { SwimmerPresenceChecker.new(fix_swimmer, fix_date) }

  describe "[a well formed instance]" do
    it_behaves_like( "(the existance of a method returning non-empty strings)", [
      :header_year,
      :get_date_header_year
    ])
    
    it_behaves_like( "(the existance of a method with parameters, returning boolean values)", [
      :has_swimmer_attended_meeting,
      :has_swimmer_swam_relay
    ], Meeting.find(18224))

    it_behaves_like( "(the existance of a method with parameters, returning numeric values)", [
      :count_swimmer_relays,
      :count_swimmer_mirs,
      :count_swimmer_entries,
      :count_swimmer_reservations,
      :count_swimmer_events
    ], Meeting.find(18224))
  end
  #-- -------------------------------------------------------------------------
  #++
  
  describe "#get_date_header_year" do
    it "returns a string containing the current year if no date given" do
      expect( subject.get_date_header_year ).to include( Date.today().year.to_s )
    end
    it "returns a string containing the year of the given date" do
      expect( subject.get_date_header_year(fix_date) ).to include( fix_date.year.to_s )
    end
    it "returns a string containing / separator" do
      expect( subject.get_date_header_year ).to include( '/' )
    end
    it "returns a string 9 cars long" do
      expect( subject.get_date_header_year.length ).to eq( 9 )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#get_swimmer_current_badges" do
    it "returns a collection of badges" do
      badges = subject.get_swimmer_current_badges()
      expect( badges ).to all(be_an_instance_of( Badge ))
    end

    it "returns 1 for swimmer has only CSI badge" do
      spc = SwimmerPresenceChecker.new(ganga, date_1819)
      expect( spc.get_swimmer_current_badges().count ).to eq( 1 )
    end

    it "returns more than 1 for swimmer has at least CSI and FIN badges" do
      spc = SwimmerPresenceChecker.new(leega, date_1819)
      expect( spc.get_swimmer_current_badges().count ).to be > 1
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#get_swimmer_current_seasons" do
    it "returns a collection of seasons" do
      seasons = subject.get_swimmer_current_seasons()
      expect( seasons ).to all(be_an_instance_of( Season ))
    end

    it "returns 1 for swimmer has only CSI badge" do
      spc = SwimmerPresenceChecker.new(ganga, date_1819)
      expect( spc.get_swimmer_current_seasons().count ).to eq( 1 )
    end

    it "returns more than 1 for swimmer has at least CSI and FIN badges" do
      spc = SwimmerPresenceChecker.new(leega, date_1819)
      expect( spc.get_swimmer_current_seasons().count ).to be > 1
    end

    it "returns the same number as current badges" do
      expect( subject.get_swimmer_current_seasons().count ).to eq( subject.get_swimmer_current_badges().count )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
  
  describe "#has_swimmer_attended_meeting" do
    it "returns false for a new meeting" do
      expect( subject.has_swimmer_attended_meeting(new_meeting) ).to eq(false)
    end
    
    it "returns false for a new swimmer" do
      spc = SwimmerPresenceChecker.new( new_swimmer, fix_date)
      expect( spc.has_swimmer_attended_meeting(fix_meeting) ).to eq(false)
    end
    
    it "return true for a swimmer with entries and w/o results" do
      # Federico Attolini has only entries for csiprova1 2018 (Carpi)
      attolini = Swimmer.find(51)
      spc = SwimmerPresenceChecker.new(attolini, date_1819)
      expect( spc.has_swimmer_attended_meeting(carpi) ).to eq(true)
    end

    it "return true for a swimmer with results and w/o entries" do
      # Leega has only results for Riccione 2018
      riccione = Meeting.find(18224)
      spc = SwimmerPresenceChecker.new(leega, date_1819)
      expect( spc.has_swimmer_attended_meeting(riccione) ).to eq(true)
    end

    it "return true for a swimmer with only reservations" do
      # Leega has only reservations for Ravenna 2018
      ravenna = Meeting.find(18243)
      spc = SwimmerPresenceChecker.new(leega, date_1819)
      expect( spc.has_swimmer_attended_meeting(ravenna) ).to eq(true)
    end

    it "return false for a swimmer w/o results and w/o entries" do
      # Leega hasn't entry or results for Viareggio 2018
      viareggio = Meeting.find(18205)
      spc = SwimmerPresenceChecker.new(leega, date_1819)
      expect( spc.has_swimmer_attended_meeting(viareggio) ).to eq(false)
    end
  end
  #-- -------------------------------------------------------------------------
  #++
  
  describe "#has_swimmer_swam_relay" do
    it "returns false for a new meeting" do
      expect( subject.has_swimmer_swam_relay( new_meeting ) ).to eq(false)
    end

    it "returns false for a new swimmer" do
      spc = SwimmerPresenceChecker.new( new_swimmer, fix_date)
      expect( spc.has_swimmer_swam_relay(fix_meeting) ).to eq(false)
    end

    it "return false for a swimmer that didn't swam on a relay" do
      # Federico Attolini didn't swam at csiprova1 2018 (Carpi) and FIN meetings
      attolini = Swimmer.find(51)
      no_relays = Meeting.find( [18101, 18224, 18205, 18243].sample )
      spc = SwimmerPresenceChecker.new(attolini, date_1819)
      expect( spc.has_swimmer_swam_relay(no_relays) ).to eq(false)
    end

    it "return true for a swimmer who swam relay" do
      # Leega swam CSI relays
      yes_relays = Meeting.find( [18101, 18102, 18234].sample )
      spc = SwimmerPresenceChecker.new(leega, date_1819)
      expect( spc.has_swimmer_swam_relay(yes_relays) ).to eq(true)
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#count_swimmer_relays" do
    it "returns 0 for a new meeting" do
      expect( subject.count_swimmer_relays( new_meeting ) ).to eq(0)
    end

    it "returns 0 for a new swimmer" do
      spc = SwimmerPresenceChecker.new( new_swimmer, fix_date)
      expect( spc.count_swimmer_relays(fix_meeting) ).to eq(0)
    end

    it "return 0 for a swimmer that didn't swam on a relay" do
      # Federico Attolini didn't swam at csiprova1 2018 (Carpi) and FIN meetings
      attolini = Swimmer.find(51)
      no_relays = Meeting.find( [18101, 18224, 18205, 18243].sample )
      spc = SwimmerPresenceChecker.new(attolini, date_1819)
      expect( spc.count_swimmer_relays(no_relays) ).to eq(0)
    end

    it "return > 0 for a swimmer who swam relay" do
      # Leega swam CSI relays
      yes_relays = Meeting.find( [18101, 18102, 18234].sample )
      spc = SwimmerPresenceChecker.new(leega, date_1819)
      expect( spc.count_swimmer_relays(yes_relays) ).to be > 0
    end

    it "return 1 for a swimmer who swam only one relay (CSI)" do
      # Leega swam CSI relays
      yes_relays = Meeting.find( [18101, 18102].sample )
      spc = SwimmerPresenceChecker.new(leega, date_1819)
      expect( spc.count_swimmer_relays(yes_relays) ).to eq(1)
    end

    it "return 2 for a swimmer who swam two relays (Parma)" do
      # Leega swam CSI relays
      yes_relays = Meeting.find( 18234 )
      spc = SwimmerPresenceChecker.new(leega, date_1819)
      expect( spc.count_swimmer_relays(yes_relays) ).to eq(2)
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#count_swimmer_events" do
    it "returns 0 for a new meeting" do
      expect( subject.count_swimmer_events( new_meeting ) ).to eq(0)
    end

    it "returns 0 for a new swimmer" do
      spc = SwimmerPresenceChecker.new( new_swimmer, fix_date)
      expect( spc.count_swimmer_events(fix_meeting) ).to eq(0)
    end

    it "return 1 for a swimmer who swam only one event" do
      # Ganga swam only 1 event in csi prova 2 (Parma)
      spc = SwimmerPresenceChecker.new(ganga, date_1819)
      expect( spc.count_swimmer_reservations( parma ) ).to eq(1)
      expect( spc.count_swimmer_entries( parma ) ).to eq(1)
      expect( spc.count_swimmer_mirs( parma ) ).to eq(1)
      expect( spc.count_swimmer_events( parma ) ).to eq(1)
    end

    it "return 2 for a swimmer who swam only one event but reserverd two" do
      # Ganga swam only 1 event but reserved 2 in csi prova 1 (Carpi)
      spc = SwimmerPresenceChecker.new(ganga, date_1819)
      expect( spc.count_swimmer_reservations( carpi ) ).to eq(2)
      expect( spc.count_swimmer_entries( carpi ) ).to eq(2)
      expect( spc.count_swimmer_mirs( carpi ) ).to eq(1)
      expect( spc.count_swimmer_events( carpi ) ).to eq(2)
    end

    it "return 2 for a swimmer who swam two events" do
      # Leega swam CSI relays
      spc = SwimmerPresenceChecker.new(leega, date_1819)
      two_events = Meeting.find( [18101, 18102, 18224, 18234].sample )
      expect( spc.count_swimmer_events(two_events) ).to eq(2)
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#scan_season" do
    it "returns a number" do
      expect( subject.scan_season( fix_season ) ).to be >= 0
    end

    it "returns no more than season total meetings" do
      expect( subject.scan_season( fix_season ) ).to be <= fix_season.meetings.has_results.count
    end

    it "returns at least 2 meetings for Leega/attolini/Steve/Ganga in 2018/2019 CSI" do
      expect( subject.scan_season( fix_season ) ).to be >= 2
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
