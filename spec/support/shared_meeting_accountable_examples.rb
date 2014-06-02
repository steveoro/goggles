require 'spec_helper'


shared_examples_for "MeetingAccountable" do
  before :each do
    # ASSERT: This relies on the existance of the preloaded seeds!
    # (Remember to run > rake db:clone_to_test before these specs)
    @meeting = Meeting.find_by_id(13105)
    @team    = Team.find_by_id(1)
    expect( @meeting ).to be_an_instance_of(Meeting)
    expect( @team ).to be_an_instance_of(Team)
    # These values are known from the verified & preloaded seed files:
    @total_male_results   = 297
    @total_female_results = 164
    @total_team1_results  = 92
    # FIXME (At the present day, there are NO meetings in the seed file with any MeetingEntry at all)
    @total_male_entries   = 0
    @total_female_entries = 0
    @total_team1_entries  = 0
  end

  # Describes the requistes of the including class
  # and the outcome of the module inclusion.
  #
  context "by including this concern" do
    it_behaves_like( "(the existance of a method with parameters, returning numeric values)",
      [
        :count_results_for,
        :count_entries_for
      ],
      @meeting
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#count_results_for" do
    it "returns the total results count with a nil parameter which uses the whole scope" do
      expect( subject.count_results_for(@meeting) ).to eq(@total_male_results + @total_female_results)
    end
    it "returns the total male results count with a scope Proc parameter" do
      expect( subject.count_results_for(@meeting, &:is_male) ).to eq(@total_male_results)
    end
    it "returns the total female results count with a scope Proc parameter" do
      expect( subject.count_results_for(@meeting, &:is_female) ).to eq(@total_female_results)
    end
    it "returns a filtered result count with a scope block parameter" do
      expect(                                       # Filter a single team:
        subject.count_results_for(@meeting) { |rel| rel.where(team_id: @team.id) }
      ).to eq(@total_team1_results)
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#count_entries_for" do
    it "returns the total entries count with a nil parameter which uses the whole scope" do
      expect( subject.count_entries_for(@meeting) ).to eq(@total_male_entries + @total_female_entries)
    end
    it "returns the total male entries count with a scope Proc parameter" do
      expect( subject.count_entries_for(@meeting, &:is_male) ).to eq(@total_male_entries)
    end
    it "returns the total female entries count with a scope Proc parameter" do
      expect( subject.count_entries_for(@meeting, &:is_female) ).to eq(@total_female_entries)
    end
    it "returns a filtered entries count with a scope block parameter" do
      expect(                                       # Filter a single team:
        subject.count_entries_for(@meeting) { |rel| rel.where(team_id: @team.id) }
      ).to eq(@total_team1_entries)
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
