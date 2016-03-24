require 'spec_helper'

shared_examples_for "(existance of a member array)" do |member_name_array|
  member_name_array.each do |member_name|
    it "responds to ##{member_name}" do
      expect( subject ).to respond_to( member_name )
    end

    it "has a ##{member_name} array" do
      expect( subject.send(member_name.to_sym) ).to be_a_kind_of( Array )
    end
  end
end


describe SwimmerMatchDAO, :type => :model do

  context "SwimmerMatchProgramDAO subclass," do
    
    let( :description )        { "This is the match number #{(rand * 100).to_i}" }
    let( :fix_event )          { EventType.are_not_relays[ ( rand * EventType.are_not_relays.count ).to_i ] }

    subject { SwimmerMatchDAO::SwimmerMatchProgramDAO.new }
  
    describe "[a well formed instance]" do
      it "hasn't description if not given" do
        expect( subject.description ).to be nil
      end
      it "description is the one used in costruction" do
        with_desc = SwimmerMatchDAO::SwimmerMatchProgramDAO.new( nil, nil, description )
        expect( with_desc.description ).to eq( description )
      end
      it "locale_result is the one used in costruction" do
        mir = create( :meeting_individual_result )
        with_loc_res = SwimmerMatchDAO::SwimmerMatchProgramDAO.new( mir, nil )
        expect( with_loc_res.locale_result ).to eq( mir )
        expect( with_loc_res.visitor_result ).to be nil
      end
      it "visitor_result is the one used in costruction" do
        mir = create( :meeting_individual_result )
        with_loc_res = SwimmerMatchDAO::SwimmerMatchProgramDAO.new( nil, mir )
        expect( with_loc_res.locale_result ).to be nil
        expect( with_loc_res.visitor_result ).to eq( mir )
      end
      it "stored values are the one used in costruction" do
        mir_loc = create( :meeting_individual_result )
        mir_vis = create( :meeting_individual_result )
        full = SwimmerMatchDAO::SwimmerMatchProgramDAO.new( mir_loc, mir_vis, description )
        expect( full.locale_result ).to eq( mir_loc )
        expect( full.visitor_result ).to eq( mir_vis )
        expect( full.description ).to eq( description )
      end

      it "responds to locale_result" do
        expect( subject ).to respond_to( :locale_result )
      end

      it "responds to visitor_result" do
        expect( subject ).to respond_to( :visitor_result )
      end
      
      describe "#get_description" do
        it "responds to #get_description" do
          expect( subject ).to respond_to( :get_description )
        end
        it "returns a string" do
          expect( subject.get_description ).to be_an_instance_of( String )
        end
        it "returns a '?' if no data set" do
          no_desc = SwimmerMatchDAO::SwimmerMatchProgramDAO.new()
          expect( no_desc.description ).to be nil
          expect( no_desc.locale_result ).to be nil
          expect( no_desc.get_description ).to eq( '?' )
        end
        it "returns the description attribute if set" do
          with_desc = SwimmerMatchDAO::SwimmerMatchProgramDAO.new( nil, nil, description )
          expect( with_desc.description ).not_to be nil
          expect( with_desc.get_description ).to eq( with_desc.description )
        end
        it "returns the locale result description if result present and no description attribute set" do
          mir = create( :meeting_individual_result )
          expect( subject.description ).to be nil
          subject.locale_result = mir
          expect( subject.get_description ).to include( mir.get_full_name )
        end
      end

      describe "#get_meeting" do
        it "responds to #get_meeting" do
          expect( subject ).to respond_to( :get_meeting )
        end
        it "returns the meeting used in costruction" do
          meeting = create( :meeting )
          with_meeting = SwimmerMatchDAO::SwimmerMatchProgramDAO.new( nil, nil, nil, meeting )
          expect( with_meeting.get_meeting ).to eq( meeting )
        end
        it "returns ? if not set" do
          expect( subject.get_meeting ).to eq( '?' )
        end
        it "returns teh locale result meeting if set" do
          mir = create( :meeting_individual_result )
          with_loc_res = SwimmerMatchDAO::SwimmerMatchProgramDAO.new( mir )
          meeting = with_loc_res.get_meeting 
          expect( meeting ).to be_an_instance_of( Meeting )
          expect( meeting ).to eq( mir.meeting )
        end
      end

      describe "#get_event_type" do
        it "responds to #get_event_type" do
          expect( subject ).to respond_to( :get_event_type )
        end
        it "returns the event_type used in costruction" do
          with_event = SwimmerMatchDAO::SwimmerMatchProgramDAO.new( nil, nil, nil, nil, fix_event )
          expect( with_event.get_event_type ).to eq( fix_event )
        end
        it "returns ? if not set" do
          expect( subject.get_event_type ).to eq( '?' )
        end
        it "returns teh locale result event_type if set" do
          mir = create( :meeting_individual_result )
          with_loc_res = SwimmerMatchDAO::SwimmerMatchProgramDAO.new( mir )
          event_type = with_loc_res.get_event_type 
          expect( event_type ).to be_an_instance_of( EventType )
          expect( event_type ).to eq( mir.event_type )
        end
      end

      describe "#get_locale_timing" do
        it "responds to #get_locale_timing" do
          expect( subject ).to respond_to( :get_locale_timing )
        end
        it "returns the locale result timing if set" do
          mir = create( :meeting_individual_result )
          with_loc_res = SwimmerMatchDAO::SwimmerMatchProgramDAO.new( mir )
          timing = with_loc_res.get_locale_timing 
          expect( timing ).to be_a_kind_of( String )
          expect( timing ).to eq( mir.get_timing )
          expect( with_loc_res.get_visitor_timing ).to be nil
        end
        it "returns nil if locale result not set" do
          expect( subject.get_locale_timing ).to be nil
        end
      end

      describe "#get_visitor_timing" do
        it "responds to #get_visitor_timing" do
          expect( subject ).to respond_to( :get_visitor_timing )
        end
        it "returns the visitor result timing if set" do
          mir = create( :meeting_individual_result )
          with_loc_res = SwimmerMatchDAO::SwimmerMatchProgramDAO.new( nil, mir )
          timing = with_loc_res.get_visitor_timing 
          expect( timing ).to be_a_kind_of( String )
          expect( timing ).to eq( mir.get_timing )
          expect( with_loc_res.get_locale_timing ).to be nil
        end
        it "returns nil if locale result not set" do
          expect( subject.get_visitor_timing ).to be nil
        end
      end
    end
    #-- -------------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++
  
  subject { SwimmerMatchDAO.new() }

  describe "[a well formed instance]" do
    let( :valid_swimmer )  { create( :swimmer ) }
    let( :valid_mir )      { create( :meeting_individual_result, swimmer: valid_swimmer, minutes: 0 ) }
    let( :worst_mir )      { create( :meeting_individual_result, swimmer: valid_swimmer, minutes: 1 ) }

    it "responds to get_locale" do
      expect( subject ).to respond_to( :get_locale )
    end

    it "responds to get_visitor" do
      expect( subject ).to respond_to( :get_visitor )
    end

    it_behaves_like( "(existance of a member array)", [
      :wons,
      :losses,
      :neutrals
    ])

    it_behaves_like( "(the existance of a method returning numeric values)", [
      :get_wons_count, 
      :get_losses_count, 
      :get_neutrals_count, 
      :get_matches_count 
    ])

    describe "#set_locale" do
      it "responds to #set_locale" do
        expect( subject ).to respond_to( :set_locale )
      end
      it "sets the locale swimmer if a valid swimmer given" do
        expect( subject.get_locale ).to be nil
        subject.set_locale( valid_swimmer )
        expect( subject.get_locale ).to eq( valid_swimmer )
      end
      it "doesn't set locale swimmer if wrong swimmer parameter" do
        expect( subject.get_locale ).to be nil
        subject.set_locale( 'wrong_parameter' )
        expect( subject.get_locale ).to be nil
      end   
    end
    #-- -------------------------------------------------------------------------

    describe "#set_visitor" do
      it "responds to #set_visitor" do
        expect( subject ).to respond_to( :set_visitor )
      end
      it "sets the visitor swimmer if a valid swimmer given" do
        expect( subject.get_visitor ).to be nil
        subject.set_visitor( valid_swimmer )
        expect( subject.get_visitor ).to eq( valid_swimmer )
      end
      it "doesn't set visitor swimmer if wrong swimmer parameter" do
        expect( subject.get_visitor ).to be nil
        subject.set_visitor( 'wrong_parameter' )
        expect( subject.get_visitor ).to be nil
      end   
    end
    #-- -------------------------------------------------------------------------

    describe "#add_match" do
      it "responds to #add_match" do
        expect( subject ).to respond_to( :add_match )
      end
      it "returns -1 if wrong parameters" do
        expect( subject.add_match( valid_mir, 'wrong_parameter' ) ).to eq( -1 )
        expect( subject.add_match( valid_mir, valid_mir ) ).to eq( -1 )
      end
      it "returns a number >= 0 if correct parameters" do
        subject.set_locale( valid_swimmer )
        subject.set_visitor( valid_swimmer )
        expect( subject.add_match( valid_mir, valid_mir ) ).to be >= 0
      end
      it "adds a match to the neutrals collection if same timing" do
        subject.set_locale( valid_swimmer )
        subject.set_visitor( valid_swimmer )
        expect( subject.get_neutrals_count ).to eq( 0 )
        expect( subject.add_match( valid_mir, valid_mir ) ).to be >= 0
        expect( subject.get_neutrals_count ).to eq( 1 )
      end
      it "adds a match to the wons collection if better timing" do
        subject.set_locale( valid_swimmer )
        subject.set_visitor( valid_swimmer )
        expect( subject.get_wons_count ).to eq( 0 )
        expect( subject.add_match( valid_mir, worst_mir ) ).to be >= 0
        expect( subject.get_wons_count ).to eq( 1 )
      end
      it "adds a match to the losses collection if worst timing" do
        subject.set_locale( valid_swimmer )
        subject.set_visitor( valid_swimmer )
        expect( subject.get_losses_count ).to eq( 0 )
        expect( subject.add_match( worst_mir, valid_mir ) ).to be >= 0
        expect( subject.get_losses_count ).to eq( 1 )
      end
      it "doesn't add twice the same match" do
        subject.set_locale( valid_swimmer )
        subject.set_visitor( valid_swimmer )
        matches = subject.add_match( valid_mir, valid_mir )
        expect( subject.add_match( valid_mir, valid_mir ) ).to eq( 0 )
        expect( subject.get_matches_count ).to eq( matches )
        matches = subject.add_match( valid_mir, worst_mir )
        expect( subject.add_match( valid_mir, worst_mir ) ).to eq( 0 )
        expect( subject.get_matches_count ).to eq( matches )
        matches = subject.add_match( worst_mir, valid_mir )
        expect( subject.add_match( worst_mir, valid_mir ) ).to eq( 0 )
        expect( subject.get_matches_count ).to eq( matches )
      end
    end
    #-- -------------------------------------------------------------------------

    describe "#get_matches_count" do
      it "returns 0 far a new instance" do
        expect( subject.get_matches_count ).to eq( 0 )
      end
      it "returns a number > 0 far a populated instance" do
        subject.set_locale( valid_swimmer )
        subject.set_visitor( valid_swimmer )
        expect( subject.add_match( valid_mir, valid_mir ) ).to be >= 0
        expect( subject.get_matches_count ).to be > 0
      end
    end
    #-- -------------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++
end
