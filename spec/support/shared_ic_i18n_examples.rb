require 'spec_helper'


shared_examples_for "Interfaced Concern I18n" do

  before(:each) do
    @instance = described_class.new()
  end
  # ---------------------------------------------------------------------------

  # Describes the required functionalities of this method
  # of the interface.
  #
  describe "i18n_short()" do
    it "returns always a non-empty string" do
      expect( @instance.i18n_short ).not_to eq( '' )
      expect( @instance.i18n_short.size ).to be > 0
    end
  end
  # ---------------------------------------------------------------------------

  # Describes the required functionalities of this method
  # of the interface.
  #
  describe "i18n_description()" do
    it "returns always a non-empty string" do
      expect( @instance.i18n_description ).not_to eq( '' )
      expect( @instance.i18n_description.size ).to be > 0
    end
  end
  # ---------------------------------------------------------------------------
end
