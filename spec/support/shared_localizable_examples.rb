require 'spec_helper'


shared_examples_for "Localizable" do

  # Describes the requistes of the including class
  # and the outcome of the module inclusion.
  #
  context "by including this concern" do
    it "responds to #code" do
      expect( subject ).to respond_to( :code )
    end
    it "responds to self.table_name()" do
      expect( subject.class ).to respond_to( :table_name )
    end

    it "responds to #i18n_short" do
      expect( subject ).to respond_to( :i18n_short )
    end
    it "responds to #i18n_description" do
      expect( subject ).to respond_to( :i18n_description )
    end
    it "responds to #i18n_alternate" do
      expect( subject ).to respond_to( :i18n_alternate )
    end
  end
  # ---------------------------------------------------------------------------

  describe "#i18n_short" do
    it "returns always a non-empty string" do
      expect( subject.i18n_short ).not_to eq( '' )
      expect( subject.i18n_short.size ).to be > 0
    end
  end
  # ---------------------------------------------------------------------------

  describe "#i18n_description" do
    it "returns always a non-empty string" do
      expect( subject.i18n_description ).not_to eq( '' )
      expect( subject.i18n_description.size ).to be > 0
    end
  end
  # ---------------------------------------------------------------------------

  describe "#i18n_alternate" do
    it "returns always a non-empty string" do
      expect( subject.i18n_alternate ).not_to eq( '' )
      expect( subject.i18n_alternate.size ).to be > 0
    end
  end
  # ---------------------------------------------------------------------------
end
