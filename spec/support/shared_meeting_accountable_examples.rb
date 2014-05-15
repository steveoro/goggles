require 'spec_helper'


shared_examples_for "MeetingAccountable" do
  # FUTUREDEV: eventually refactor this with a dedicated factory that fills a whole
  #            test meeting, precomputes some values and tests the implementation results.
  before :suite do                                    # We just need to check this once
    # (Remember to run > rake db:clone_to_test before these specs)
    @meeting = Meeting.find_by_id(13105)
    @team    = Team.find_by_id(1)
    expect( @meeting ).to be_an_instance_of(Meeting)
    expect( @team ).to be_an_instance_of(Team)
    # These values are known from the verified & preloaded seed files:
    @total_male_results   = 297
    @total_female_results = 164
    @total_team1_results  = 92
  end


  # Describes the requistes of the including class
  # and the outcome of the module inclusion.
  #
  context "by including this concern" do
    it "responds to #count_results_for" do
      expect( subject ).to respond_to( :count_results_for )
    end
  end
  # ---------------------------------------------------------------------------


  describe "#count_results_for" do
    it "returns a numeric value" do
      expect( subject.count_results_for(@meeting) ).to be_a_kind_of( Integer )
    end
    it "returns the total results count with a nil parameter which uses the whole scope" do
      expect( subject.count_results_for(@meeting) ).to eq(@total_male_results + @total_female_results)
    end
    it "returns the total male results count with a scope Proc parameter" do
      expect( subject.count_results_for(@meeting, &:is_male) ).to eq(@total_male_results)
    end
    it "returns the total female results count with a scope Proc parameter" do
      expect( subject.count_results_for(@meeting, &:is_female) ).to eq(@total_female_results)
    end
    it "returns the total results count with a scope Block parameter" do
      expect(
        subject.count_results_for(@meeting) do |s|
          s.joins(:team).where( ["team_id = ?", @team.id] )
        end
      ).to eq(@total_male_results)
    end
  end
  # ---------------------------------------------------------------------------
end
