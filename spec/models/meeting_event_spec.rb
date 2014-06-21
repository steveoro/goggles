require 'spec_helper'
require 'date'


describe MeetingEvent do

  context "[a non-valid instance]" do
    it_behaves_like( "(missing required values)", [ 
      :event_order
    ])    
  end
  #-- -------------------------------------------------------------------------
  #++

  # This section is separated from the context below because really it's
  # more of a functional test instead of normal unit test.
  context "[a valid, pre-existing seeded domain]" do
    # TODO It uses a just a single predetermined seed to verify the values => Use a factory, forcing how many detail rows will be created instead, and move to the section below.
    subject { Meeting.find_by_id(13105).meeting_events.last }

    it_behaves_like( "MeetingAccountable",
      # These values were hand-verified for Meeting #13105, event #1018:
      1,    # team_id
      117,  # tot_male_results
      62,   # tot_female_results
      40,   # tot_team_results
      27,   # tot_male_entries
      14,   # tot_female_entries
      41    # tot_team_entries
    )
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
