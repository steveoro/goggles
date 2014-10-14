require 'spec_helper'


describe MeetingRelayResult, :type => :model do
  it_behaves_like "TimingGettable"
  #-- -------------------------------------------------------------------------
  #++

  it "has a valid factory" do
    expect( create(:meeting_relay_result) ).to be_valid
  end

  # TODO same sections as MeetingIndividualResult spec
end
