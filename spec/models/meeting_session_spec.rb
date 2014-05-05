require 'spec_helper'
require 'date'

describe MeetingSession do
  
  describe "not valid istance of meeting session" do
    it "not a valid meeting without description" do
      FactoryGirl.build( :meeting_session, description: nil ).should_not be_valid
    end    

    it "not a valid meeting without session order" do
      FactoryGirl.build( :meeting_sesion, session_order: nil ).should_not be_valid
    end    

    it "not a valid meeting without scheduled date" do
      FactoryGirl.build( :meeting_sesion, scheduled_date: nil ).should_not be_valid
    end    
  end

  describe "well formed meeting session" do
    before( :each ) do
      @meeting_session1 = FactoryGirl.create( :meeting_session )
    end
  
    context "[well formed meeting session instance]" do
      it "is a valid istance" do
        @meeting_session1.should be_valid
      end

      it "it belongs to a valid meeting" do
        expect( @meeting_session1.meeting ).to be_a( Meeting )
      end
    end
    
    context "[meeting general methods]" do
      it "has a method to return short description of the meeting session" do
        expect( @meeting_session1 ).to respond_to( :get_short_name )
      end
  
      it "#get_short_name should return correct short description: date short day part" do
        expect( @meeting_session1.get_short_name ).to be_an_instance_of( String )
        expect( @meeting_session1.get_short_name ).not_to eq( '' )
        expect( @meeting_session1.get_short_name ).not_to eq( '?' )
        #TODO starts with a valid  date
      end
  
      it "has a method to return full description of the meeting session" do
        expect( @meeting__session1 ).to respond_to( :get_full_name )
      end
  
      it "#get_full_name should return correct full description: order. date full day part" do
        expect( @meeting_session1.get_full_name ).to be_an_instance_of( String )
        expect( @meeting_session1.get_full_name ).not_to eq( '' )
        expect( @meeting_session1.get_full_name ).not_to eq( '?' )
        #TODO starts with a number
        #TODO Contains a valid date
      end

      it "has a method to return verbose description of the meeting" do
        expect( @meeting_session1 ).to respond_to( :get_verbose_name )
      end
  
      it "#get_verbose_name should return correct verbose description: meeting, order. date full day part" do
        expect( @meeting_session1.get_verbose_name ).to be_an_instance_of( String )
        expect( @meeting_session1.get_verbose_name ).not_to eq( '' )
        expect( @meeting_session1.get_verbose_name ).not_to eq( '?' )
        #TODO Contains a valid date
      end

      it "has a method to return short list of meeting session events" do
        expect( @meeting_session1 ).to respond_to( :get_short_events )
      end

      it "#get_short_events should return correct short meeting session event list" do
        expect( @meeting_session1.get_short_events ).to be_an_instance_of( String )
        expect( @meeting_session1.get_short_events ).not_to eq( '' )
      end     

      it "has a method to return full list of meeting session events" do
        expect( @meeting_session1 ).to respond_to( :get_full_events )
      end

      it "#get_full_events should return correct full meeting session event list with session details" do
        expect( @meeting_session1.get_full_events ).to be_an_instance_of( String )
        expect( @meeting_session1.get_full_events ).not_to eq( '' )
        #TODO Contains a valid date
      end
      
      it "has a method to retunr session events start list"     
    end
  end
end
