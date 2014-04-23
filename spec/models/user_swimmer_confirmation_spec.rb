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
    # --------------------------------------------------------------------------

    it "self.confirm_for returns true when successful" do
      expect( UserSwimmerConfirmation.confirm_for(@user, @swimmer, @confirmator) ).to be_true
    end

    it "self.confirm_for returns true when adding a new confirmation" do
      confirmation = create( :user_swimmer_confirmation ) # (same user & swimmer, different confirmator)
      expect( UserSwimmerConfirmation.confirm_for(confirmation.user, confirmation.swimmer, @user) ).to be_true
    end

    it "self.confirm_for returns false when the same confirmation already exists" do
      confirmation = create( :user_swimmer_confirmation )
      expect( UserSwimmerConfirmation.confirm_for(confirmation.user, confirmation.swimmer, confirmation.confirmator) ).to be_false
    end

    it "self.confirm_for returns false on parameter error" do
      expect( UserSwimmerConfirmation.confirm_for( nil, @swimmer, @confirmator) ).to be_false
      expect( UserSwimmerConfirmation.confirm_for( @user, nil, @confirmator) ).to be_false
      expect( UserSwimmerConfirmation.confirm_for( @user, @swimmer, nil) ).to be_false
    end
    # --------------------------------------------------------------------------

    it "self.unconfirm_for returns true when the association exists" do
      confirmation = create( :user_swimmer_confirmation )
      expect( UserSwimmerConfirmation.unconfirm_for(confirmation.user, confirmation.swimmer, confirmation.confirmator) ).to be_true
    end

    it "self.unconfirm_for returns false when the association does not exist" do
      expect( UserSwimmerConfirmation.unconfirm_for(@user, @swimmer, @confirmator) ).to be_false
    end

    it "self.unconfirm_for returns false on parameter error" do
      confirmation = create( :user_swimmer_confirmation )
      expect( UserSwimmerConfirmation.unconfirm_for(nil, confirmation.swimmer, confirmation.confirmator) ).to be_false
      expect( UserSwimmerConfirmation.unconfirm_for(confirmation.user, nil, confirmation.confirmator) ).to be_false
      expect( UserSwimmerConfirmation.unconfirm_for(confirmation.user, confirmation.swimmer, nil) ).to be_false
    end
  end
  # ----------------------------------------------------------------------------


  context "[a well formed instance]" do

    it "is a valid istance" do
      confirmation = create( :user_swimmer_confirmation )
      confirmation.should be_valid
      confirmation.user.should be_valid
      confirmation.swimmer.should be_valid
      confirmation.confirmator.should be_valid
    end
  end
  # ----------------------------------------------------------------------------

end
