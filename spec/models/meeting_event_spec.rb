require 'spec_helper'
require 'date'


describe MeetingEvent do
  it_behaves_like "MeetingAccountable"

  describe "[a non-valid instance]" do
    it_behaves_like( "(missing required values)", [ 
      :event_order
    ])    
  end
  #-- -------------------------------------------------------------------------
  #++

  context "[a well formed instance]" do
    subject { create(:meeting_event) }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    # Validated relations:
    it_behaves_like( "(belongs_to required models)", [ 
      :meeting_session,
      :event_type,
      :heat_type
    ])

    context "[general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty strings)", [ 
        :get_full_name,
        :get_verbose_name,
        :get_meeting_session_name,
        :get_meeting_session_verbose_name
      ])
      it_behaves_like( "(the existance of a method returning a date)", [ 
        :get_scheduled_date
      ])
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
