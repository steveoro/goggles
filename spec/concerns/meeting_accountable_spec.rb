require 'spec_helper'


# Dummy class holder for the fields used by the module
class DummyMeetingAccountableIncludee < MeetingEvent
  include MeetingAccountable
end
# -----------------------------------------------------------------------------


describe DummyMeetingAccountableIncludee do
  shared_examples "shared_meeting_accountable_examples"

  xit "MUST USE CONCRETE CLASSES WITH VALID SEEDS" do
    it_behaves_like "MeetingAccountable"
  end
end
