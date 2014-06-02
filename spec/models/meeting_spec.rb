require 'spec_helper'
require 'date'

describe Meeting do
  describe "[a non-valid instance]" do
    it_behaves_like( "(missing required values)", [ 
      :description,
      :code
    ])    
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "[a well formed instance]" do
    subject { create( :meeting ) }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    # Validated relations:
    it_behaves_like( "(belongs_to required models)", [ 
      :season,
      :edition_type,
      :timing_type
    ])    

    context "[general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty and non-? strings)", [ 
        :get_short_name,
        :get_full_name,
        :get_verbose_name
      ])
      it_behaves_like( "(the existance of a method returning non-empty strings)", [ 
        :get_short_events,
        :get_complete_events
      ])
    end

    context "[meeting result methods]" do      
      it "has a method to determine the meeting team charts"
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
