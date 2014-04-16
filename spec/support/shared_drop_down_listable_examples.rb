require 'spec_helper'


shared_examples "DropDownListable concern" do

  before(:each) do
    @instance = described_class.new()
  end
  # ---------------------------------------------------------------------------

  # Describes the requisites of the including class
  # and the outcome of the module inclusion.
  #
  describe "including instance" do
    it "has all required fields" do
      expect( @instance ).to respond_to( :id )
    end

    it "responds to self.get_label_symbol()" do
      expect( @instance.class ).to respond_to( :get_label_symbol )
    end

    it "responds to self.to_dropdown()" do
      expect( @instance.class ).to respond_to( :to_dropdown )
    end
  end
  # ---------------------------------------------------------------------------

  describe "#get_label_symbol()" do
    it "always returns a Symbol" do
      expect( @instance.class.get_label_symbol() ).to be_an_instance_of( Symbol )
    end

    it "refers to an existing method" do
      method_sym = @instance.class.get_label_symbol()
      expect( @instance ).to respond_to( method_sym )
    end
  end
  # ---------------------------------------------------------------------------


  describe "#to_dropdown()" do
    it "always returns an array" do
      result = @instance.class.to_dropdown()
      expect( result ).to be_an_instance_of( Array )
    end
  end
  # ---------------------------------------------------------------------------
end
