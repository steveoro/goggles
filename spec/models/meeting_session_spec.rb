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
    #before( :each ) do
    #  @meeting_session1 = FactoryGirl.create( :meeting_session )
    #end
    subject {
      FactoryGirl.create( :meeting_session )
    }

  
    context "[well formed meeting session instance]" do
      it "is a valid istance" do
        #@meeting_session1.should be_valid
        subject.should be_valid
      end

      it "it belongs to a valid meeting" do
        expect( subject.meeting ).to be_a( Meeting )
      end
    end
    
    context "[meeting general methods]" do
      it_should_behave_like( "(existance of method that returns non empty strings)", [ 
        :get_short_name,
        :get_full_name,
        :get_verbose_name,
        :get_short_events,
        :get_warm_up_time,
        :get_begin_time,
        :get_full_swimming_pool_description,
        :get_order_with_date,
        :get_meeting_name,
        :get_meeting_verbose_name
      ])

      it "#get_short_name should return correct short description: short day part and event list" do
        expect( subject.get_short_name ).not_to eq( '?' )
        #TODO Contains semicolon
      end
  
      it "#get_full_name should return correct full description: date full day part and event list" do
        expect( subject.get_full_name ).not_to eq( '?' )
        #TODO starts with a valid date
        #TODO Contains semicolon
      end

      it "#get_verbose_name should return correct verbose description: date full day part, timing schedule and event list" do
        expect( subject.get_verbose_name ).not_to eq( '?' )
        #TODO starts with a valid date
        #TODO Contains semicolon
        #TODO Contains parenthesis
      end

      it "#get_warm_up_time returns a time or nd"
      
      it "#get_begin_time returns a time or nd"     
      
      it "has a method to return swimming pool type short description"     
      
      it "has a method to return swimming pool lane number"     
      
      it "#get_full_swimming_pool_description returns swimming pool full description with city, lanes and type"     
      
      it "has a method to return session events start list"     
    end
  end
end
