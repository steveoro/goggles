require 'spec_helper'
require 'date'


shared_examples_for "(not a valid istance of meeting session without values)" do |attribute_name_array|
  attribute_name_array.each do |attribute_name|
    it "not a valid instance without ##{attribute_name}" do
      FactoryGirl.build( :meeting_session, attribute_name.to_sym=>nil ).should_not be_valid
    end    
  end
end
# -----------------------------------------------------------------------------


describe MeetingSession do
  shared_examples "shared_method_existance_examples"

  describe "not valid istance of meeting session" do
    it_should_behave_like( "(not a valid istance of meeting session without values)", [ 
      :description,
      :session_order,
      :scheduled_date
    ])    
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

    context "[meeting session general methods]" do
      it_should_behave_like( "(the existance of a method returning non-empty strings)", [ 
        :get_short_name,
        :get_full_name,
        :get_verbose_name,
        :get_short_events,
        :get_scheduled_date,
        :get_warm_up_time,
        :get_begin_time,
        :get_pool_attributes,
        :get_pool_full_description,
        :get_order_with_date,
        :get_meeting_name,
        :get_meeting_verbose_name
      ])

      it_should_behave_like( "(the existance of a method returning numeric values)", [ 
        :get_pool_length_in_meters,
        :get_pool_lanes_number
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

      it "#get_pool_length_in_meters returns a number between 0 and 50" do
        expect( subject.get_pool_length_in_meters ).to be >= 0
        expect( subject.get_pool_length_in_meters ).to be <= 50                
      end    
      
      it "#get_pool_lanes_number returns a number between 0 and 10" do
        expect( subject.get_pool_lanes_number ).to be >= 0
        expect( subject.get_pool_lanes_number ).to be <= 10        
      end     
      
      it "#get_scheduled_date returns a date or 'To be defined...'"
      
      it "#get_warm_up_time returns a time or 'nd'"
      
      it "#get_begin_time returns a time or 'nd'"     
      
      it "has a method to return session events start list"     
    end
  end
end
