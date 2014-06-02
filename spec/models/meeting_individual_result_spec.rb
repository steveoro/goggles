require 'spec_helper'


describe MeetingIndividualResult do
  it_behaves_like "SwimmerRelatable"
  it_behaves_like "TimingGettable"
  #-- -------------------------------------------------------------------------
  #++

  context "[a well formed instance]" do
    subject { create(:meeting_individual_result) }
  
    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    # Validated relations:
    it_behaves_like( "(belongs_to required models)", [
      :meeting_program,
      :team,
      :team_affiliation,
      :badge,
      :disqualification_code_type
    ])
    # Filtering scopes:
    it_behaves_like( "(the existance of a class method)", [
      :is_valid,
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
end
