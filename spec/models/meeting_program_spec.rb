require 'spec_helper'
require 'date'


describe MeetingProgram do
  it_behaves_like "MeetingAccountable"

  describe "[a non-valid instance]" do
    it_behaves_like( "(missing required values)", [ 
      :event_order
    ])    
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "[a well formed instance]" do
    subject { create(:meeting_program) }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    # Validated relations:
    it_behaves_like( "(belongs_to required models)", [ 
      :meeting_event,
      :gender_type,
      :category_type
    ])    
    # Filtering scopes:
    it_behaves_like( "(the existance of a class method)", [
      :only_relays,
      :are_not_relays
    ])

    context "[general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty strings)", [ 
        :get_short_name,
        :get_full_name,
        :get_verbose_name,
        :get_event_name,
        :get_verbose_event_name,
        :get_category_and_gender_short
      ])
      # Leega. TODO
      # More methods to check and classify

      it_behaves_like( "(the existance of a method returning a date)", [ 
        :get_scheduled_date
      ])
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
