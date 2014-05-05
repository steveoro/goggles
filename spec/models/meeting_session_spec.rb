require 'spec_helper'
require 'date'


shared_examples_for "(existance of method that returns non empty strings)" do |method_name_array|
  method_name_array.each do |method_name|
    it "responds to ##{method_name}" do
      expect( subject ).to respond_to( method_name )
    end
    
    it "##{method_name} returns a non empty string" do
      expect( subject.send(method_name.to_sym) ).to be_an_instance_of( String )
      expect( subject.send(method_name.to_sym) ).not_to eq( '' )
    end
  end
end

describe MeetingSession do
  
  describe "not valid istance of meeting session" do
    it "not a valid meeting without description" do
      FactoryGirl.build( :meeting_session, description: nil ).should_not be_valid
    end    

    it "not a valid meeting without session order" do
      FactoryGirl.build( :meeting_session, session_order: nil ).should_not be_valid
    end    

    it "not a valid meeting without scheduled date" do
      FactoryGirl.build( :meeting_session, scheduled_date: nil ).should_not be_valid
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
      it_should_behave_like( "(existance of method that returns non empty strings)", [ 
        :get_short_events,
        :get_order_with_date,
        :get_meeting_name,
        :get_meeting_verbose_name
      ])

      it "has a method to return short description of the meeting session" do
        expect( @meeting_session1 ).to respond_to( :get_short_name )
      end
  
      it "#get_short_name should return correct short description: short day part and event list" do
        expect( @meeting_session1.get_short_name ).to be_an_instance_of( String )
        expect( @meeting_session1.get_short_name ).not_to eq( '' )
        expect( @meeting_session1.get_short_name ).not_to eq( '?' )
        #TODO Contains semicolon
      end
  
      it "has a method to return full description of the meeting session" do
        expect( @meeting_session1 ).to respond_to( :get_full_name )
      end
  
      it "#get_full_name should return correct full description: date full day part and event list" do
        expect( @meeting_session1.get_full_name ).to be_an_instance_of( String )
        expect( @meeting_session1.get_full_name ).not_to eq( '' )
        expect( @meeting_session1.get_full_name ).not_to eq( '?' )
        #TODO starts with a valid date
        #TODO Contains semicolon
      end

      it "has a method to return verbose description of the meeting" do
        expect( @meeting_session1 ).to respond_to( :get_verbose_name )
      end
  
      it "#get_verbose_name should return correct verbose description: date full day part, timing schedule and event list" do
        expect( @meeting_session1.get_verbose_name ).to be_an_instance_of( String )
        expect( @meeting_session1.get_verbose_name ).not_to eq( '' )
        expect( @meeting_session1.get_verbose_name ).not_to eq( '?' )
        #TODO starts with a valid date
        #TODO Contains semicolon
        #TODO Contains parenthesis
      end
      
      it "has a method to return session events start list"     
    end
  end
end
