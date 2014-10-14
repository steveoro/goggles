require 'spec_helper'


describe DataImportMeetingProgram, :type => :model do
  it_behaves_like "TimingGettable"

  # TODO
  # describe "[a non-valid instance]" do
    # it_behaves_like( "(missing required values)", [ :number ])
  # end
  #-- -------------------------------------------------------------------------
  #++

  it "has a valid factory for individual result" do
    expect( create(:data_import_meeting_program_individual) ).to be_valid
  end
  it "has a valid factory for relay result" do
    expect( create(:data_import_meeting_program_relay) ).to be_valid
  end

  context "[a well formed instance]" do
    subject { create(:data_import_meeting_program) }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end

    # TODO
    # Validated relations:
    # it_behaves_like( "(belongs_to required models)", [
      # :team,
      # :season,
      # :swimmer,
      # :category_type,
      # :entry_time_type
    # ])
  end
  #-- -------------------------------------------------------------------------
  #++
end
