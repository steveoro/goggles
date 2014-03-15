require 'spec_helper'


shared_examples "ActiveRecord extension" do

  before(:each) do
    @instance = described_class.new()
  end
  # ---------------------------------------------------------------------------


  # Describes the requistes of the including class
  # and the outcome of the module inclusion.
  #
  describe "Interface" do
    it "has all required fields" do
      expect( @instance.class ).to respond_to( :get_label_symbol )
      expect( @instance ).to respond_to( :id )
    end

    it "responds to self.to_dropdown()" do
      expect( @instance.class ).to respond_to( :to_dropdown )
    end
  end
  # ---------------------------------------------------------------------------

  # Should retreives the complete athlete name (last name + ' ' + first_name)
  #
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

  # Should retreives the complete athlete name (last name + ' ' + first_name)
  #
  describe "#to_dropdown()" do
    it "always returns an array" do
      result = @instance.class.to_dropdown()
      expect( result ).to be_an_instance_of( Array )
    end
  end
  # ---------------------------------------------------------------------------
end
