require 'spec_helper'


# Dummy class holder for the fields used by the module
class Dummy
  include ICTimingFields
  attr_accessor :minutes, :seconds, :hundreds
end
# -----------------------------------------------------------------------------


describe ICTimingFields do

  # Init dummy class instance to test instance methods
  def setup_dummy_instance
    Dummy.new() do
      minutes  = ((rand * 100).to_i % 60)
      seconds  = ((rand * 100).to_i % 60)
      hundreds = ((rand * 100).to_i % 60)
    end
  end

  before(:each) do
    @dummy = setup_dummy_instance()
  end
  # ---------------------------------------------------------------------------


  # Describes the requistes of the including class
  # and the outcome of the module inclusion.
  #
  describe "module-includer class" do
    it "has all required fields" do
      expect( @dummy ).to respond_to( :minutes )
      expect( @dummy ).to respond_to( :seconds )
      expect( @dummy ).to respond_to( :hundreds )
    end

    it "responds to get_timing()" do
      expect( @dummy ).to respond_to( :get_timing )
    end

    it "responds to get_timing_instance()" do
      expect( @dummy ).to respond_to( :get_timing_instance )
    end
  end
  # ---------------------------------------------------------------------------

  # Describes the required functionalities of this method
  # of the interface.
  #
  describe "get_timing" do
    it "returns always a non-empty string" do
      expect( @dummy.get_timing ).not_to eq( '' )
      expect( @dummy.get_timing.size ).to be > 0
    end
  end
  # ---------------------------------------------------------------------------

  # Describes the required functionalities of this method
  # of the interface.
  #
  describe "get_timing_instance" do
    it "returns always a non-empty string" do
      expect( @dummy.get_timing_instance ).not_to eq( '' )
      expect( @dummy.get_timing_instance.size ).to be > 0
    end
  end
  # ---------------------------------------------------------------------------
end
