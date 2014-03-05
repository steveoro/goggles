require 'spec_helper'


# Dummy class holder for the fields used by the module
class Dummy
  include ICSwimmerInfo
  attr_accessor :comlete_name, :year_of_birth
end
# -----------------------------------------------------------------------------


describe ICSwimmerInfo do

  # Init dummy class instance to test instance methods
  def setup_dummy_instance
    Dummy.new() do
      # Use conplete_name instead of last_name and first_name
      complete_name  = ('FELPATI MICHELE')
      year_of_birth = (1904 + (rand * 100).to_i)
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
      expect( @dummy ).to respond_to( :complete_name )
      expect( @dummy ).to respond_to( :year_of_birth )
    end

    it "responds to get_swimmer_name()" do
      expect( @dummy ).to respond_to( :get_swimmer_name )
    end

    it "responds to get_year_of_birth()" do
      expect( @dummy ).to respond_to( :get_year_of_birth )
    end

    it "responds to get_swimmer_age()" do
      expect( @dummy ).to respond_to( :get_swimmer_age )
    end

    it "responds to get_swimmer_current_category()" do
      expect( @dummy ).to respond_to( :get_swimmer_current_category )
    end
  end
  # ---------------------------------------------------------------------------

  # Should retreives the complete athlete name (last name + ' ' + first_name)
  #
  describe "get_swimmer_name" do
    it "returns always a non-empty string" do
      expect( @dummy.get_swimmer_name ).not_to eq( '' )
      expect( @dummy.get_swimmer_name ).not_to eq( '?' )
      expect( @dummy.get_swimmer_name.size ).to be > 3
    end
  end
  # ---------------------------------------------------------------------------

  # Should retreives the year of birth of the swimmer
  #
  describe "get_year_of_birth" do
    it "returns always a year instance" do
      expect( @dummy.get_year_of_birth ).to be > 1900
      
      # Leega. TODO use current year - 8
      expect( @dummy.get_year_of_birth ).to be < 2004
    end
  end
  # ---------------------------------------------------------------------------

  # Should retreives the calculate age of the swimmer
  #
  describe "get_swimmer_age" do
    it "returns always a value between 8 and 120" do
      expect( @dummy.get_swimmer_age ).to be > 8
      expect( @dummy.get_swimmer_age ).to be < 120
    end
  end

  # Should retreives the current category of the swimmer
  # Needs season
  #
  # Leega. TODO Verify presence of season as requested parameter
  describe "get_swimmer_current_category" do
    it "returns always a valid category_type" do
      expect( @dummy.get_swimmer_current_category ).to be_an_instance_of( :category_type )
    end
  end
  # ---------------------------------------------------------------------------
end
