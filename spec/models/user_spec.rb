require 'spec_helper'


describe User do
  shared_examples "shared_drop_down_listable_examples"

  it_behaves_like "DropDownListable concern"

  context "[a well formed instance]" do
    before( :each ) do
      @user = create( :user )
    end

    it "is a valid istance" do
      expect( @user ).to be_valid
    end
    it "has a method to return the full description" do
      expect( @user ).to respond_to( :get_full_name )
    end
    it "has a method to convert the instance to a string" do
      expect( @user ).to respond_to( :to_s )
    end

    it "has a method to get the first and last name as an array" do
      expect( @user ).to respond_to( :get_first_and_last_name )
    end
    it "has a method to get the preferred (default) swimmer level ID" do
      expect( @user ).to respond_to( :get_preferred_swimmer_level_id )
    end
    it "has a method to get the current swimmer level type description" do
      expect( @user ).to respond_to( :get_swimmer_level_type )
    end

    it "has a method to set the associated swimmer" do
      expect( @user ).to respond_to( :set_associated_swimmer )
    end
    it "has an helper to check if it has an associated swimmer" do
      expect( @user ).to respond_to( :has_associated_swimmer? )
    end
    it "has an helper to check if it has any swimmer confirmations" do
      expect( @user ).to respond_to( :has_swimmer_confirmations? )
    end
    it "has an helper to check if it has any swimmer confirmations for a specific user" do
      expect( @user ).to respond_to( :find_any_confirmation_given_to )
    end
    # --------------------------------------------------------------------------

    describe "#get_first_and_last_name" do
      it "returns an array with 2 elements" do
        result = @user.get_first_and_last_name
        expect( result ).to be_an_instance_of( Array )
        expect( result.size ).to eq(2)
      end

      it "returns names extracted from the description" do
        result = @user.get_first_and_last_name
        expect( Regexp.new(result[0]) ).to match( @user.description )
        expect( Regexp.new(result[1]) ).to match( @user.description )
      end

      it "returns names extracted from the dedicated fields, when present" do
        @user.first_name = Faker::Name.first_name
        @user.last_name  = Faker::Name.last_name
        result = @user.get_first_and_last_name
        expect( Regexp.new(result[0]) ).to match( @user.first_name )
        expect( Regexp.new(result[1]) ).to match( @user.last_name )
      end
    end
    # --------------------------------------------------------------------------

    describe "#set_associated_swimmer" do
      it "returns true when invoked successfully" do
        swimmer = create(:swimmer)
        expect( @user.set_associated_swimmer(swimmer) ).to be_true
      end

      it "updates both the user and the swimmer with the corresponding (new) IDs when invoked successfully (if both are available for association)" do
        swimmer = create(:swimmer)
        @user.set_associated_swimmer(swimmer)
        expect( @user.swimmer_id ).to eq( swimmer.id )
        expect( swimmer.associated_user_id ).to eq( @user.id )
      end

      it "returns false when invoked for an already associated swimmer" do
        swimmer = create(:swimmer)
        another_user = create(:user)
        another_user.set_associated_swimmer(swimmer)
        expect( @user.set_associated_swimmer(swimmer) ).to be_false
      end

      it "does nothing when invoked for an already associated swimmer" do
        swimmer = create(:swimmer)
        another_user = create(:user)
        another_user.set_associated_swimmer(swimmer)
        @user.set_associated_swimmer(swimmer)
        expect( @user.swimmer ).to be_nil
        expect( another_user.swimmer_id ).to eq( swimmer.id )
        expect( swimmer.associated_user_id ).to eq( another_user.id )
      end

      it "returns true when called with nil on an already associated user" do
        @user.set_associated_swimmer(create(:swimmer))
        expect( @user.set_associated_swimmer() ).to be_true
      end

      it "clears both the user and the swimmer when called with nil on an already associated user" do
        swimmer = create(:swimmer)
        @user.set_associated_swimmer(swimmer)
        expect( @user.set_associated_swimmer() ).to be_true
        @user.reload
        swimmer.reload
        expect( @user.swimmer_id ).to be_nil
        expect( swimmer.associated_user_id ).to be_nil
      end

      it "returns true when called with a new-swimmer for association and the user already associated to an old-swimmer" do
        old_swimmer = create(:swimmer)
        @user.set_associated_swimmer(old_swimmer)
        new_swimmer = create(:swimmer)
        expect( @user.set_associated_swimmer(new_swimmer) ).to be_true
      end

      it "updates correctly the user, an old-swimmer and a new-swimmer when called with a new-swimmer for association and the user already associated to an old-swimmer" do
        old_swimmer = create(:swimmer)
        @user.set_associated_swimmer(old_swimmer)
        new_swimmer = create(:swimmer)
        @user.set_associated_swimmer(new_swimmer)
        old_swimmer.reload
        @user.reload
        new_swimmer.reload
        expect( old_swimmer.associated_user_id ).to be_nil
        expect( @user.swimmer_id ).to eq( new_swimmer.id )
        expect( new_swimmer.associated_user_id ).to eq( @user.id )
      end
    end
    # --------------------------------------------------------------------------

    describe "#has_associated_swimmer?" do
      it "returns true if it has an associated swimmer" do
        @user.swimmer = create(:swimmer) 
        expect( @user.has_associated_swimmer? ).to be_true
      end

      it "returns false if it has not an associated swimmer" do
        @user.swimmer = nil 
        expect( @user.has_associated_swimmer? ).to be_false
      end
    end
    # --------------------------------------------------------------------------

    describe "#has_swimmer_confirmations?" do
      it "returns true if the association is confirmed" do
        confirmation = create( :user_swimmer_confirmation )
        user = confirmation.user
        expect( user.has_swimmer_confirmations? ).to be_true
      end

      it "returns false if the association is not confirmed" do
        @user.swimmer = create(:swimmer) 
        expect( @user.has_swimmer_confirmations? ).to be_false
      end
    end
    # --------------------------------------------------------------------------

    describe "#find_any_confirmation_given_to" do
      it "returns nil when no confirmations are found" do
        another_user = create(:user)
        expect( @user.find_any_confirmation_given_to(another_user) ).to be_nil
      end

      it "returns the first confirmation row found for a user" do
        confirmation = create( :user_swimmer_confirmation, confirmator: @user )
        expect( @user.find_any_confirmation_given_to(confirmation.user) ).to be_an_instance_of( UserSwimmerConfirmation )
      end
    end
    # --------------------------------------------------------------------------

    describe "#given_confirmations" do
      it "enlists all the confirmations given by the user" do
        confirmation1 = create( :user_swimmer_confirmation, confirmator: @user )
        confirmation2 = create( :user_swimmer_confirmation, confirmator: @user )
        confirmation3 = create( :user_swimmer_confirmation, confirmator: @user )
        expect( @user.given_confirmations.size == 3 ).to be_true
      end
    end
    # --------------------------------------------------------------------------

  end
  # ----------------------------------------------------------------------------
end
