require 'spec_helper'

describe UserSwimmerConfirmation do
  context "[class]" do
    before( :each ) do
      @swimmer = create( :swimmer )
      @user = create( :user )
      @confirmator = create( :user )
    end

    it "has a method to confirm a swimmer association for a user" do
      expect( UserSwimmerConfirmation ).to respond_to( :confirm_for )
    end
    it "has a method to unconfirm a swimmer association for a user" do
      expect( UserSwimmerConfirmation ).to respond_to( :unconfirm_for )
    end

    it "has a :find_for_user scope" do
      expect( UserSwimmerConfirmation ).to respond_to( :find_for_user )
    end
    it "has a :find_for_confirmator scope" do
      expect( UserSwimmerConfirmation ).to respond_to( :find_for_confirmator )
    end
    it "has a :find_any_between scope" do
      expect( UserSwimmerConfirmation ).to respond_to( :find_any_between )
    end
    # -------------------------------------------------------------------------

    describe "self.confirm_for()" do
      it "returns an instance of the confirmation row when successful" do
        expect( UserSwimmerConfirmation.confirm_for(@user, @swimmer, @confirmator) ).to be_an_instance_of(UserSwimmerConfirmation)
      end

      it "adds a row when successful" do
        expect{
          UserSwimmerConfirmation.confirm_for( @user, @swimmer, @confirmator )
        }.to change{ UserSwimmerConfirmation.count }.by(1)
      end

      it "returns the added row when successful" do
        result = UserSwimmerConfirmation.confirm_for(@user, @swimmer, @confirmator)
        expect( result ).to be_an_instance_of(UserSwimmerConfirmation)
        expect( result.user_id ).to eq(@user.id)
        expect( result.swimmer_id ).to eq(@swimmer.id)
        expect( result.confirmator_id ).to eq(@confirmator.id)
      end

      it "sucessfully adds a new, different confirmation" do
        confirmation = create( :user_swimmer_confirmation ) # (same user & swimmer, different confirmator)
        expect( UserSwimmerConfirmation.confirm_for(confirmation.user, confirmation.swimmer, @user) ).to be_an_instance_of(UserSwimmerConfirmation)
      end

      it "returns nil when the same confirmation already exists" do
        confirmation = create( :user_swimmer_confirmation )
        expect( UserSwimmerConfirmation.confirm_for(confirmation.user, confirmation.swimmer, confirmation.confirmator) ).to be_nil
      end

      it "returns nil on parameter error" do
        expect( UserSwimmerConfirmation.confirm_for( nil, @swimmer, @confirmator) ).to be_nil
        expect( UserSwimmerConfirmation.confirm_for( @user, nil, @confirmator) ).to be_nil
        expect( UserSwimmerConfirmation.confirm_for( @user, @swimmer, nil) ).to be_nil
      end
    end
    # -------------------------------------------------------------------------

    describe "self.unconfirm_for()" do
      it "returns true when the association exists" do
        confirmation = create( :user_swimmer_confirmation )
        expect( UserSwimmerConfirmation.unconfirm_for(confirmation.user, confirmation.swimmer, confirmation.confirmator) ).to be_true
      end

      it "removes a row when successful" do
        confirmation = create( :user_swimmer_confirmation )
        expect{
          UserSwimmerConfirmation.unconfirm_for(confirmation.user, confirmation.swimmer, confirmation.confirmator)
        }.to change{ UserSwimmerConfirmation.count }.by(-1)
      end

      it "returns false when the association does not exist" do
        expect( UserSwimmerConfirmation.unconfirm_for(@user, @swimmer, @confirmator) ).to be_false
      end

      it "returns false on parameter error" do
        confirmation = create( :user_swimmer_confirmation )
        expect( UserSwimmerConfirmation.unconfirm_for(nil, confirmation.swimmer, confirmation.confirmator) ).to be_false
        expect( UserSwimmerConfirmation.unconfirm_for(confirmation.user, nil, confirmation.confirmator) ).to be_false
        expect( UserSwimmerConfirmation.unconfirm_for(confirmation.user, confirmation.swimmer, nil) ).to be_false
      end
    end
    # -------------------------------------------------------------------------


    describe "self.find_for_user() scope" do
      before( :each ) do
        @swimmer2 = create( :swimmer )
        @user2    = create( :user )
        @confirmator2 = create( :user )
        @confirmation1a = UserSwimmerConfirmation.confirm_for(@user, @swimmer, @confirmator)
        @confirmation1b = UserSwimmerConfirmation.confirm_for(@user, @swimmer, @confirmator2)
        @confirmation1c = UserSwimmerConfirmation.confirm_for(@user, @swimmer, @user2)
      end

      it "returns a list of UserSwimmerConfirmation having the specified user" do
        scoped_rows = UserSwimmerConfirmation.find_for_user( @user )
        expect( scoped_rows ).to respond_to( :size )
        expect( scoped_rows.size ).to eq(3)
        expect( scoped_rows[0] ).to be_an_instance_of( UserSwimmerConfirmation )
        expect( scoped_rows[1] ).to be_an_instance_of( UserSwimmerConfirmation )
        expect( scoped_rows[2] ).to be_an_instance_of( UserSwimmerConfirmation )
      end

      it "returns an empty list with a not found user" do
        scoped_rows = UserSwimmerConfirmation.find_for_user( @confirmator )
        expect( scoped_rows ).to be_empty
      end
    end
    # -------------------------------------------------------------------------

    describe "self.find_for_confirmator() scope" do
      before( :each ) do
        @swimmer2 = create( :swimmer )
        @user2    = create( :user )
        @confirmator2 = create( :user )
        @confirmation1a = UserSwimmerConfirmation.confirm_for(@user, @swimmer, @confirmator)
        @confirmation1b = UserSwimmerConfirmation.confirm_for(@user, @swimmer, @confirmator2)
        @confirmation1c = UserSwimmerConfirmation.confirm_for(@user, @swimmer, @user2)
      end

      it "returns a list of UserSwimmerConfirmation having the specified confirmator" do
        scoped_rows = UserSwimmerConfirmation.find_for_confirmator( @confirmator )
        expect( scoped_rows ).to respond_to( :size )
        expect( scoped_rows.size ).to eq(1)
        expect( scoped_rows[0] ).to be_an_instance_of( UserSwimmerConfirmation )
      end

      it "returns an empty list with a not found confirmator" do
        scoped_rows = UserSwimmerConfirmation.find_for_confirmator( @user )
        expect( scoped_rows ).to be_empty
      end
    end
    # -------------------------------------------------------------------------

    describe "self.find_any_between() scope" do
      before( :each ) do
        @confirmation1a = UserSwimmerConfirmation.confirm_for(@user, @swimmer, create(:user))
        @confirmation1b = UserSwimmerConfirmation.confirm_for(@user, @swimmer, @confirmator)
        @confirmation1c = UserSwimmerConfirmation.confirm_for(create(:user), create(:swimmer), @confirmator)
      end

      it "returns a list with a single UserSwimmerConfirmation found for an existing key tuple" do
        scoped_rows = UserSwimmerConfirmation.find_any_between( @user, @confirmator )
        expect( scoped_rows ).to respond_to( :size )
        expect( scoped_rows.size ).to eq(1)
        expect( scoped_rows[0] ).to be_an_instance_of( UserSwimmerConfirmation )
      end

      it "returns an empty list with an invalid key tuple" do
        scoped_rows = UserSwimmerConfirmation.find_any_between( @confirmator, @user )
        expect( scoped_rows ).to be_empty
      end
    end
    # -------------------------------------------------------------------------
  end
  # ---------------------------------------------------------------------------


  context "[a well formed instance]" do

    it "is a valid istance" do
      confirmation = create( :user_swimmer_confirmation )
      expect( confirmation ).to be_valid
      expect( confirmation.user ).to be_valid
      expect( confirmation.swimmer ).to be_valid
      expect( confirmation.confirmator ).to be_valid
    end
  end
  # ----------------------------------------------------------------------------

end
