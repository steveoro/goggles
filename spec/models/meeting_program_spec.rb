require 'spec_helper'
require 'date'


describe MeetingProgram, :type => :model do

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
    subject { Meeting.find_by_id(13105).meeting_programs.first }

    it_behaves_like( "MeetingAccountable",
      # These values were hand-verified for Meeting #13105, program #3742:
      14,   # team_id
      3,    # tot_male_results
      0,    # tot_female_results
      2,    # tot_team_results
      1,   # tot_male_entries
      0,   # tot_female_entries
      0    # tot_team_entries
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "[a well formed instance]" do
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
