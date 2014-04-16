require 'spec_helper'
require 'date'

require 'swimmer_relatable'


describe SwimmerRelatable do

  # Init dummy class instance to test instance methods
  def setup_dummy_instance( full_name, year_of_birth )
    dummy = MeetingEntry.new()                      # (Any SwimmerRelatable includee will fit)
    dummy.swimmer = Swimmer.new(
      complete_name: full_name,
      year_of_birth: year_of_birth
    )
    dummy
  end

  before(:each) do
    @dummy = setup_dummy_instance( 'FELPATI MICHELE', 1904 + (rand * 100).to_i )
  end
  # ---------------------------------------------------------------------------


  # Describes the requistes of the including class
  # and the outcome of the module inclusion.
  #
  describe "module-includer class" do
    it "has all required fields" do
      expect( @dummy ).to respond_to( :swimmer )
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

  # Should retrieve the complete athlete name (last name + ' ' + first_name)
  #
  describe "get_swimmer_name" do
    it "returns always a non-empty string" do
      expect( @dummy.get_swimmer_name ).not_to eq( '' )
      expect( @dummy.get_swimmer_name ).not_to eq( '?' )
      expect( @dummy.get_swimmer_name.size ).to be > 3
    end
  end
  # ---------------------------------------------------------------------------

  # Should retrieve the year of birth of the swimmer
  #
  describe "get_year_of_birth" do
    it "returns always a valid year" do
      expect( @dummy.get_year_of_birth ).to be > 1900
      expect( @dummy.get_year_of_birth ).to be < (Date.today.year - 8)
    end
  end
  # ---------------------------------------------------------------------------

  # Should retrieve the computed swimmer age
  #
  describe "get_swimmer_age" do
    it "returns always a value between 8 and 120" do
      expect( @dummy.get_swimmer_age ).to be > 8
      expect( @dummy.get_swimmer_age ).to be < 120
    end
  end

  # Should retrieve the array of all recent & available categories for
  # which the swimmer is eligible of association, using only the defined
  # year of birth.
  # (Does not need any valid association on the Swimmer side).
  #
  # TODO 
  # Leega: Verify presence of season as requested parameter
  # Steve: I skipped the need of any season parameter; we can do a dedicated method instead, if you think this is required
  describe "get_swimmer_current_category_type_codes" do
    it "returns always a valid array" do
      expect( @dummy.get_swimmer_current_category_type_codes ).to be_an_instance_of( Array )
    end
  end

  # Should retrieve the last among all recent & available categories for
  # which the swimmer is eligible of association, using only the defined
  # year of birth.
  # (Does not need any valid association on the Swimmer side).
  #
  # TODO 
  # Leega: Verify presence of season as requested parameter
  # Steve: I skipped the need of any season parameter; we can do a dedicated method instead, if you think this is required
  describe "get_swimmer_current_category" do
    it "returns always a valid category_type" do
      expect( @dummy.get_swimmer_current_category ).to be_an_instance_of( String )
      expect(
        CategoryType.select(:code).all.uniq.any?{ |row| row.code == @dummy.get_swimmer_current_category }
      ).to be_true
    end
  end
  # ---------------------------------------------------------------------------
end
