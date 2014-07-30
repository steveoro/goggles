require 'spec_helper'
require 'date'

describe Meeting, :type => :model do

  context "[a non-valid instance]" do
    it_behaves_like( "(missing required values)", [ 
      :description,
      :code
    ])    
  end
  #-- -------------------------------------------------------------------------
  #++

  # This section is separated from the context below because really it's
  # more of a functional test instead of normal unit test.
  context "[a valid, pre-existing seeded domain]" do
    # TODO It uses a just a single predetermined seed to verify the values => Use a factory, forcing how many detail rows will be created instead, and move to the section below.
    subject { Meeting.find_by_id(13105) }

    it_behaves_like( "MeetingAccountable",
      # These values were hand-verified for Meeting #13105:
      1,    # team_id
      299,  # tot_male_results
      172,  # tot_female_results
      92,   # tot_team_results
      64,   # tot_male_entries
      34,   # tot_female_entries
      98    # tot_team_entries
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "[a well formed instance]" do
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
