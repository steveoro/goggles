require 'spec_helper'


# Dummy class holder for the fields used by the module
class Dummy
  include ICI18n
  attr_accessor :code

  def self.table_name;  'stroke_types'; end
  def table_name;       'stroke_types'; end
  def klass;            Dummy;          end
end
# -----------------------------------------------------------------------------


describe ICI18n do

  # Init dummy class instance to test instance methods
  def setup_dummy_instance
    dummy = Dummy.new()
    dummy.code = 'SL'
    dummy
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
      expect( @dummy ).to respond_to( :code )
      expect( @dummy ).to respond_to( :table_name )
    end

    it "responds to #i18n_short()" do
      expect( @dummy ).to respond_to( :i18n_short )
    end

    it "responds to #i18n_description()" do
      expect( @dummy ).to respond_to( :i18n_description )
    end

    it "responds to #i18n_alternate()" do
      expect( @dummy ).to respond_to( :i18n_alternate )
    end
  end
  # ---------------------------------------------------------------------------

  # Describes the required functionalities of this method
  # of the interface.
  #
  describe "i18n_short()" do
    it "returns always a non-empty string" do
      expect( @dummy.i18n_short ).not_to eq( '' )
      expect( @dummy.i18n_short.size ).to be > 0
    end
  end
  # ---------------------------------------------------------------------------

  # Describes the required functionalities of this method
  # of the interface.
  #
  describe "i18n_description()" do
    it "returns always a non-empty string" do
      expect( @dummy.i18n_description ).not_to eq( '' )
      expect( @dummy.i18n_description.size ).to be > 0
    end
  end
  # ---------------------------------------------------------------------------

  # Describes the required functionalities of this method
  # of the interface.
  #
  describe "i18n_alternate()" do
    it "returns always a non-empty string" do
      expect( @dummy.i18n_alternate ).not_to eq( '' )
      expect( @dummy.i18n_alternate.size ).to be > 0
    end
  end
  # ---------------------------------------------------------------------------
end
