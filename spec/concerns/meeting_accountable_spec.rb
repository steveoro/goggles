require 'spec_helper'


# Dummy class holder for the fields used by the module
class DummyMeetingAccountableIncludee < MeetingEvent
  include MeetingAccountable
end
# -----------------------------------------------------------------------------


describe DummyMeetingAccountableIncludee do
  it_behaves_like "MeetingAccountable"
end
