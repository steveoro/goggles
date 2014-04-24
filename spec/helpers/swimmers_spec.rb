require 'spec_helper'


describe SwimmersHelper do
  before :each do
    @user = create( :user )
    @swimmer = create( :swimmer )
  end

  describe "#ask_friendship_link" do
    it "returns nil for an un-associated swimmer" do
      expect( helper.ask_friendship_link( @swimmer ) ).to be_nil
    end

    it "renders the link to request a friendship for an associated swimmer" do
      @user.swimmer = @swimmer
      @swimmer.associated_user = @user
      expect( helper.ask_friendship_link( @swimmer ) ).to include( I18n.t('social.menu_social_invite') )
      expect( helper.ask_friendship_link( @swimmer ) ).to include( social_invite_path(id: @swimmer.id) )
    end
  end
end
