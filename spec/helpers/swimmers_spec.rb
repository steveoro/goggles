require 'spec_helper'


describe SwimmersHelper do
  include Devise::TestHelpers

  before :each do
    @request.env["devise.mapping"] = :user
    @user = create(:user)
    sign_in @user
    @swimmer = create( :swimmer )
    @swimming_buddy = create( :user )
  end


  describe "#ask_confirm_link" do
    it "returns nil for an un-associated swimmer" do
      expect( helper.ask_confirm_link( @swimmer ) ).to be_nil
    end

    it "returns nil for a swimmer associated to the current user" do
      @user.set_associated_swimmer( @swimmer )
      expect( helper.ask_confirm_link( @swimmer ) ).to be_nil
    end

    it "renders the link to confirm an indentity for an associated, unconfirmed swimmer" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      result = helper.ask_confirm_link( @swimmer )
      expect( result ).to include( I18n.t('social.menu_social_confirm') )
      expect( result ).to include( social_association_confirm_path(id: @swimmer.id) )
    end

    it "renders the link to un-confirm an indentity for an associated, confirmed swimmer" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      UserSwimmerConfirmation.confirm_for( @swimming_buddy, @swimmer, @user )
      result = helper.ask_confirm_link( @swimmer )
      expect( result ).to include( I18n.t('social.menu_social_unconfirm') )
      expect( result ).to include( social_association_unconfirm_path(id: @swimmer.id) )
    end
  end
  # ---------------------------------------------------------------------------


  describe "#ask_friendship_link" do
    it "returns nil for a un-associated swimmer" do
      expect( helper.ask_friendship_link( @swimmer ) ).to be_nil
    end

    it "returns nil for a swimmer associated to the current user" do
      @user.set_associated_swimmer( @swimmer )
      expect( helper.ask_confirm_link( @swimmer ) ).to be_nil
    end

    it "renders the link to request a friendship for an associated swimmer" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      result = helper.ask_confirm_link( @swimmer )
      expect( result ).to include( I18n.t('social.menu_social_invite') )
      expect( result ).to include( social_invite_path(id: @swimmer.id) )
    end
  end
  # ---------------------------------------------------------------------------
end
