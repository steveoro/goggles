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


  describe "#social_confirm_badge" do
    it "returns nil for an un-associated swimmer" do
      expect( helper.social_confirm_badge( @swimmer ) ).to be_nil
    end

    it "returns nil for a swimmer associated to the current user" do
      @user.set_associated_swimmer( @swimmer )
      expect( helper.social_confirm_badge( @swimmer ) ).to be_nil
    end

    xit "FIXME renders the link to confirm an indentity for an associated, unconfirmed swimmer" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      result = helper.social_confirm_badge( @swimmer )
      expect( result ).to include( I18n.t('social.menu_social_confirm') )
      expect( result ).to include( social_association_confirm_path(id: @swimming_buddy.id) )
    end

    xit "FIXME renders the link to un-confirm an indentity for an associated, confirmed swimmer" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      UserSwimmerConfirmation.confirm_for( @swimming_buddy, @swimmer, @user )
      result = helper.social_confirm_badge( @swimmer )
      expect( result ).to include( I18n.t('social.menu_social_unconfirm') )
      expect( result ).to include( social_association_unconfirm_path(id: @swimming_buddy.id) )
    end
  end
  # ---------------------------------------------------------------------------


  describe "#social_invite_badge" do
    it "returns nil for a un-associated swimmer" do
      expect( helper.social_invite_badge( @swimmer ) ).to be_nil
    end

    it "returns nil for a swimmer associated to the current user" do
      @user.set_associated_swimmer( @swimmer )
      expect( helper.social_invite_badge( @swimmer ) ).to be_nil
    end

    xit "FIXME renders the link to request a friendship for a friendable associated swimmer" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      result = helper.social_invite_badge( @swimmer )
      expect( result ).to include( I18n.t('social.menu_social_invite') )
      expect( result ).to include( social_invite_path(id: @swimming_buddy.id) )
    end

    xit "FIXME renders a static 'pending' badge for an already invited associated swimmer (from the perspective of the user/friendable that invited browsing a valid goggler invited)" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      @user.invite( @swimming_buddy )
      result = helper.social_invite_badge( @swimmer )
      expect( result ).to include( I18n.t('social.pending_invite') )
      expect( result ).not_to include( social_invite_path(id: @swimming_buddy.id) )
    end
  end
  # ---------------------------------------------------------------------------


  # describe "#approve_friendship_link" do
    # it "returns nil for a un-associated swimmer (non-valid goggler)" do
      # expect( helper.approve_friendship_link( @swimmer ) ).to be_nil
    # end
# 
    # it "returns nil for an associated swimmer (valid goggler) who has not sent an invite" do
      # @swimming_buddy.set_associated_swimmer( @swimmer )
      # expect( helper.approve_friendship_link( @swimmer ) ).to be_nil
    # end
# 
    # it "returns nil for a swimmer associated to the current user (same goggler)" do
      # @user.set_associated_swimmer( @swimmer )
      # expect( helper.approve_friendship_link( @swimmer ) ).to be_nil
    # end
# 
    # it "renders the link to approve a pending friendship for a valid goggler who sent an invite" do
      # @swimming_buddy.set_associated_swimmer( @swimmer )
      # @swimming_buddy.invite( @user )
      # result = helper.approve_friendship_link( @swimmer )
      # expect( result ).to include( I18n.t('social.menu_social_approve') )
      # expect( result ).to include( social_approve_path(id: @swimming_buddy.id) )
    # end
  # end
  # ---------------------------------------------------------------------------


  describe "#social_block_badge" do
    it "returns nil for a un-associated swimmer (non-valid goggler)" do
      expect( helper.social_block_badge( @swimmer ) ).to be_nil
    end

    it "returns nil for a valid goggler who's not a friend yet" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      expect( helper.social_block_badge( @swimmer ) ).to be_nil
    end

    it "returns nil for a swimmer associated to the current user (same goggler)" do
      @user.set_associated_swimmer( @swimmer )
      expect( helper.social_block_badge( @swimmer ) ).to be_nil
    end

    it "returns nil for a swimmer with a pending friendship" do
      @user.set_associated_swimmer( @swimmer )
      @swimming_buddy.invite( @user )
      expect( helper.social_block_badge( @swimmer ) ).to be_nil
    end

    it "renders the link to block an existing friendship with a valid goggler" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      @swimming_buddy.invite( @user )
      @user.approve( @swimming_buddy )
      result = helper.social_block_badge( @swimmer )
      expect( result ).to include( I18n.t('social.menu_social_block') )
      expect( result ).to include( social_block_path(id: @swimming_buddy.id) )
    end

    it "renders the link to un-block an existing, blocked friendship with a valid goggler" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      @swimming_buddy.invite( @user )
      @user.approve( @swimming_buddy )
      @user.block( @swimming_buddy )
      result = helper.social_block_badge( @swimmer )
      expect( result ).to include( I18n.t('social.menu_social_unblock') )
      expect( result ).to include( social_unblock_path(id: @swimming_buddy.id) )
    end
  end
  # ---------------------------------------------------------------------------


  describe "#social_remove_badge" do
    def check_correct_outcome
      result = helper.social_remove_badge( @swimmer )
      expect( result ).to include( I18n.t('social.menu_social_remove') )
      expect( result ).to include( social_remove_path(id: @swimming_buddy.id) )
    end

    it "returns nil for a un-associated swimmer (non-valid goggler)" do
      expect( helper.social_remove_badge( @swimmer ) ).to be_nil
    end

    it "returns nil for a valid goggler who's not a friend yet" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      expect( helper.social_remove_badge( @swimmer ) ).to be_nil
    end

    it "returns nil for a swimmer associated to the current user (same goggler)" do
      @user.set_associated_swimmer( @swimmer )
      expect( helper.social_remove_badge( @swimmer ) ).to be_nil
    end

    it "renders the link to remove an existing pending friendship with a valid goggler" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      @swimming_buddy.invite( @user )
      check_correct_outcome()
    end

    it "renders the link to remove an existing approved friendship with a valid goggler" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      @swimming_buddy.invite( @user )
      @user.approve( @swimming_buddy )
      check_correct_outcome()
    end

    it "renders the link to remove an existing blocked friendship with a valid goggler" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      @swimming_buddy.invite( @user )
      @user.approve( @swimming_buddy )
      @user.block( @swimming_buddy )
      check_correct_outcome()
    end
  end
  # ---------------------------------------------------------------------------


  describe "#social_edit_badge" do
    def check_correct_outcome
      result = helper.social_edit_badge( @swimmer )
      expect( result ).to include( I18n.t('social.menu_social_edit') )
      expect( result ).to include( social_edit_path(id: @swimming_buddy.id) )
    end

    it "returns nil for a un-associated swimmer (non-valid goggler)" do
      expect( helper.social_edit_badge( @swimmer ) ).to be_nil
    end

    it "returns nil for a valid goggler who's not a friend yet" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      expect( helper.social_edit_badge( @swimmer ) ).to be_nil
    end

    it "returns nil for a swimmer associated to the current user (same goggler)" do
      @user.set_associated_swimmer( @swimmer )
      expect( helper.social_edit_badge( @swimmer ) ).to be_nil
    end

    it "renders the link to remove an existing pending friendship with a valid goggler" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      @swimming_buddy.invite( @user )
      check_correct_outcome()
    end

    it "renders the link to remove an existing approved friendship with a valid goggler" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      @swimming_buddy.invite( @user )
      @user.approve( @swimming_buddy )
      check_correct_outcome()
    end

    it "renders the link to remove an existing blocked friendship with a valid goggler" do
      @swimming_buddy.set_associated_swimmer( @swimmer )
      @swimming_buddy.invite( @user )
      @user.approve( @swimming_buddy )
      @user.block( @swimming_buddy )
      check_correct_outcome()
    end
  end
  # ---------------------------------------------------------------------------
end
