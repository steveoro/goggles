require 'spec_helper'
require 'date'

describe Meeting do
  shared_examples "shared_method_existance_examples"
  
  describe "not valid istance of meeting" do
    it_should_behave_like( "(not a valid istance without required values)", [ 
      :description,
      :code
    ])    
  end

  describe "well formed meeting" do
    #before( :each ) do
    #  @meeting1 = FactoryGirl.create( :meeting )
    #end
    subject {
      FactoryGirl.create( :meeting )
    }
  
    context "[well formed meeting istance]" do
      it "is a valid istance" do
        subject.should be_valid
      end
      
      it "it belongs to a valid session" do
        expect( subject.season ).to be_a( Season )
      end
    end
    
    context "[meeting general methods]" do
      it_should_behave_like( "(the existance of a method returning non-empty and non-? strings)", [ 
        :get_short_name,
        :get_full_name,
        :get_verbose_name
      ])
      
      it_should_behave_like( "(the existance of a method returning non-empty strings)", [ 
        :get_short_events,
        :get_complete_events
      ])
    end
    
    context "[meeting result methods]" do      
      it "has a method to determine the meeting team charts"
      
    end
  end
end
