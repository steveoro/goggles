require 'spec_helper'
require 'date'


describe MeetingSession do
  shared_examples "shared_method_existance_examples"
  shared_examples "shared_meeting_accountable_examples"

# FIXME
#  it_behaves_like "MeetingAccountable"


  describe "not valid istance of meeting session" do
    it_behaves_like( "(not a valid istance without required values)", [ 
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
      it_behaves_like( "(the existance of a method returning non-empty strings)", [ 
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

      it_behaves_like( "(the existance of a method returning numeric values)", [ 
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

      it "#get_scheduled_date returns a date or 'To be defined...'"
      
      it "#get_warm_up_time returns a time or 'nd'"
      
      it "#get_begin_time returns a time or 'nd'"     
      
      it "has a method to return session events start list"     
    end
  end
end
