require 'spec_helper'
require 'date'


describe MeetingEvent do
  shared_examples "shared_method_existance_examples"

  describe "not valid istance of meeting event" do
    it_should_behave_like( "(not a valid istance without required values)", [ 
      :event_order
    ])    
  end

  describe "well formed meeting event" do
    subject {
      FactoryGirl.create( :meeting_event )
    }
  
    context "[well formed meeting event instance]" do
      it "is a valid istance" do
        subject.should be_valid
      end

      it_should_behave_like( "(valid istance if belongs to required classes)", [ 
        :meeting_session,
        :event_type,
        :heat_type
      ])    
    end

    context "[meeting event general methods]" do
      it_should_behave_like( "(the existance of a method returning non-empty strings)", [ 
        :get_full_name,
        :get_verbose_name,
        :get_scheduled_date,
        :get_meeting_session_name,
        :get_meeting_session_verbose_name
      ])

      it_should_behave_like( "(the existance of a method returning numeric values)", [ 
        :get_entries_count,
        :get_results_count
      ])
    end
  end
end
