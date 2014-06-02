require 'spec_helper'


describe MeetingEntry do
  it_behaves_like "SwimmerRelatable"
  it_behaves_like "TimingGettable"
  #-- -------------------------------------------------------------------------
  #++

  context "[a well formed instance]" do
    subject { create(:meeting_entry) }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    # Validated relations:
    it_behaves_like( "(belongs_to required models)", [
      :meeting_program,
      :team,
      :team_affiliation,
      :badge
    ])
    # Filtering scopes:
    it_behaves_like( "(the existance of a class method)", [
      :is_male,
      :is_female
    ])

    context "[general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty strings)", [ 
        :get_full_name,
        :get_verbose_name
      ])
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "association vs event_type" do
    it "has a method to return id"

    it "has a method to return description"
    
    it "has a method to return code"
  end  
  # ---------------------------------------------------------------------------
end
