require 'spec_helper'

describe User do
  shared_examples "shared_drop_down_listable_examples"

  it_behaves_like "DropDownListable concern"

  context "[a well formed instance]" do
    before( :each ) do
      @user = create( :user )
    end

    it "is a valid istance" do
      @user.should be_valid
    end

    it "has a method to return the full description" do
      expect( @user ).to respond_to( :get_full_name )
    end

    it "has a method to convert the instance to a string" do
      expect( @user ).to respond_to( :to_s )
    end

    it "has an helper to check if it has an associated swimmer" do
      expect( @user ).to respond_to( :has_associated_swimmer? )
    end

    it "has a method to get the preferred (default) swimmer level ID" do
      expect( @user ).to respond_to( :get_preferred_swimmer_level_id )
    end

    it "has a method to get the current swimmer level type description" do
      expect( @user ).to respond_to( :get_swimmer_level_type )
    end
    # --------------------------------------------------------------------------

    it "#has_associated_swimmer? returns true if it has an associated swimmer" do
      @user.swimmer = create(:swimmer) 
      expect( @user.has_associated_swimmer? ).to be_true
    end

    it "#has_associated_swimmer? returns false if it has not an associated swimmer" do
      @user.swimmer = nil 
      expect( @user.has_associated_swimmer? ).to be_false
    end
  end
  # ----------------------------------------------------------------------------

end
