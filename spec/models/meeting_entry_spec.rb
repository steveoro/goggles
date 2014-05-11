require 'spec_helper'


describe MeetingEntry do
  shared_examples "shared_swimmer_relatable_examples"
  shared_examples "shared_timing_gettable_examples"

  it_behaves_like "SwimmerRelatable"
  it_behaves_like "TimingGettable"
  # ---------------------------------------------------------------------------

  context "association vs event_type" do
    it "has a method to return id"

    it "has a method to return description"
    
    it "has a method to return code"
  end  
  # ---------------------------------------------------------------------------
end
