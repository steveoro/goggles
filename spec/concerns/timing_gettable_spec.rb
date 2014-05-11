require 'spec_helper'


# Dummy class holder for the fields used by the module
class DummyTimingGettableIncludee < UserResult
  include TimingGettable
end


describe DummyTimingGettableIncludee do
  shared_examples "shared_timing_gettable_examples"
  it_behaves_like "TimingGettable"
end
