require 'spec_helper'


describe DataImportMeetingTeamScore, :type => :model do
  # TODO
  # describe "[a non-valid instance]" do
    # it_behaves_like( "(missing required values)", [ :number ])
  # end
  #-- -------------------------------------------------------------------------
  #++

  # This is mainly used to test the factory and its relationships:
  context "[Standard Factory]" do
    subject { create(:data_import_meeting_team_score) }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    it "has a valid team instance" do
      expect( subject.team ).to be_valid
    end
    it "has a valid season instance" do
      expect( subject.season ).to be_valid
    end
    it "has a valid meeting instance" do
      expect( subject.meeting ).to be_valid
    end

    # Validated relations:
    it_behaves_like( "(belongs_to required models)", [
      :team,
      :team_affiliation,
      :meeting,
      :season
    ])
  end


# TODO
  # context "[Factory 'with_relay_results']" do
    # subject { create(:data_import_meeting_team_score_with_relay_results) }
#
    # it "is a valid istance" do
      # expect( subject ).to be_valid
    # end
    # it "has a valid team instance" do
      # expect( subject.team ).to be_valid
    # end
    # it "has a valid season instance" do
      # expect( subject.season ).to be_valid
    # end
    # it "has a valid meeting instance" do
      # expect( subject.meeting ).to be_valid
    # end
#
    # # Validated relations:
    # it_behaves_like( "(belongs_to required models)", [
      # :team,
      # :team_affiliation,
      # :meeting,
      # :season
    # ])
  # end
  #-- -------------------------------------------------------------------------
  #++
end
