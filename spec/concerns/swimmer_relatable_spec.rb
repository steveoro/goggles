require 'spec_helper'


# Dummy class holder for the fields used by the module
class DummySwimmerRelatableIncludee < MeetingEntry
  include SwimmerRelatable
end


describe DummySwimmerRelatableIncludee do
  shared_examples "shared_swimmer_relatable_examples"
  it_behaves_like "SwimmerRelatable"
end
