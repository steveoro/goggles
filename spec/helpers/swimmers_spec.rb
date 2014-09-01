require 'spec_helper'


describe SwimmersHelper, :type => :helper do
  include Devise::TestHelpers

  before :each do
    @request.env["devise.mapping"] = :user
    @current_user = create(:user, swimmer: nil)
    sign_in @current_user                                   # @current_user will be the only one logged-in)
    @swimmer = create(:swimmer, associated_user: nil)
    @swimming_buddy = create(:user, swimmer: nil)
  end


  describe "#avatar_url" do
    context "without an associated swimmer," do
      it "returs the default image url" do
        expect( helper.avatar_url(@swimmer) ).to eq( 'img_radiography.jpg' )
      end
    end

    context "with an associated swimmer" do
      before(:each) { @current_user.set_associated_swimmer( @swimmer ) }
      it "returs the default image url" do
        expect( helper.avatar_url(@swimmer) ).to include( 'http://gravatar.com/avatar' )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # ----------------------------------------------------------------------------
  # Other badge-related method specs:
  # ----------------------------------------------------------------------------


  context "[not logged-in]" do
    [
      :social_confirm_badge, :social_invite_badge, :social_block_badge,
      :social_remove_badge, :social_edit_badge
    ].each do |method_name|
      it "returns always nil" do
        expect( helper.send(method_name.to_sym, @swimmer) ).to be_nil
      end
    end
  end
  # ----------------------------------------------------------------------------
  # (unlogged user END)
  # ----------------------------------------------------------------------------


  shared_examples_for "(rendering badge for unallowed, unassociated or same-users, that always returns nil)" do |method_name_array|
    method_name_array.each do |method_name|
      context "(the same current user)," do
        before(:each) { @current_user.set_associated_swimmer( @swimmer ) }
        it "returns nil for a confirmable swimmer" do
          expect( helper.send(method_name.to_sym, @swimmer) ).to be_nil
        end
        it "returns a nil for an unconfirmable swimmer" do
          UserSwimmerConfirmation.confirm_for( @current_user, @current_user.swimmer, @swimming_buddy )
          expect( helper.send(method_name.to_sym, @swimmer) ).to be_nil
        end
      end

      context "(an unassociated current user)," do
        it "returns nil for a unassociated swimmer" do
          expect( helper.send(method_name.to_sym, @swimmer) ).to be_nil
        end
        it "returns nil for an (associated &) confirmable swimmer" do
          @swimming_buddy.set_associated_swimmer( @swimmer )
          expect( helper.send(method_name.to_sym, @swimmer) ).to be_nil
        end
        it "returns nil for an (associated &) unconfirmable swimmer" do
          @swimming_buddy.set_associated_swimmer( @swimmer )
          UserSwimmerConfirmation.confirm_for( @swimming_buddy, @swimmer, @current_user )
          @swimming_buddy.set_associated_swimmer(nil)
          expect( helper.send(method_name.to_sym, @swimmer) ).to be_nil
        end
      end
    end
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  context "[logged-in user]" do
    it_behaves_like(
        "(rendering badge for unallowed, unassociated or same-users, that always returns nil)",
        [
          :social_confirm_badge, :social_invite_badge, :social_block_badge,
          :social_remove_badge, :social_edit_badge
        ]
    )

    describe "#social_confirm_badge" do
      before(:each) {
        @swimming_buddy.set_associated_swimmer( @swimmer )
        @current_user.set_associated_swimmer( create(:swimmer) )
      }
      it "returns the html badge to confirm an indentity for an associated, unconfirmed swimmer" do
        result = helper.social_confirm_badge( @swimmer )
        expect( result ).to include( I18n.t('social.menu_social_confirm') )
        expect( result ).to include( social_association_confirm_path(id: @swimming_buddy.id) )
      end
      it "returns the html badge to un-confirm an indentity for an associated, confirmed swimmer" do
        UserSwimmerConfirmation.confirm_for( @swimming_buddy, @swimmer, @current_user )
        result = helper.social_confirm_badge( @swimmer )
        expect( result ).to include( I18n.t('social.menu_social_unconfirm') )
        expect( result ).to include( social_association_unconfirm_path(id: @swimming_buddy.id) )
      end
    end
    # -------------------------------------------------------------------------

    describe "#social_invite_badge" do
      before(:each) {
        @swimming_buddy.set_associated_swimmer( @swimmer )
        @current_user.set_associated_swimmer( create(:swimmer) )
      }
      it "returns the html badge for a new friendable swimmer (non-existing friendship)" do
        result = helper.social_invite_badge( @swimmer )
        expect( result ).to include( I18n.t('social.menu_social_invite') )
        expect( result ).to include( social_invite_path(id: @swimming_buddy.id) )
      end
      it "returns the html badge for a pending invited swimmer (friendship invite sent)" do
        @current_user.invite( @swimming_buddy )
        result = helper.social_invite_badge( @swimmer )
        expect( result ).to include( I18n.t('social.pending_invite') )
        expect( result ).not_to include( social_invite_path(id: @swimming_buddy.id) )
      end
      it "returns the html badge for an approvable friendship (friendship invite received)" do
        @swimming_buddy.invite( @current_user )
        result = helper.social_invite_badge( @swimmer )
        expect( result ).to include( I18n.t('social.menu_social_approve') )
        expect( result ).to include( social_approve_path(id: @swimming_buddy.id) )
      end
      it "returns nil for a pending current user approved by the friend" do
        @current_user.invite( @swimming_buddy )
        @swimming_buddy.approve( @current_user )
        expect( helper.social_invite_badge(@swimmer) ).to be_nil
      end
      it "returns nil for a pending friend approved by the current user" do
        @swimming_buddy.invite( @current_user )
        @current_user.approve( @swimming_buddy )
        expect( helper.social_invite_badge(@swimmer) ).to be_nil
      end
    end
    # -------------------------------------------------------------------------

    describe "#social_block_badge" do
      before(:each) {
        @swimming_buddy.set_associated_swimmer( @swimmer )
        @current_user.set_associated_swimmer( create(:swimmer) )
      }
      it "returns nil for a new friendable swimmer (non-existing friendship)" do
        expect( helper.social_block_badge( @swimmer ) ).to be_nil
      end
      it "returns nil for a pending invited swimmer (friendship invite sent)" do
        @current_user.invite( @swimming_buddy )
        expect( helper.social_block_badge( @swimmer ) ).to be_nil
      end
      it "returns the html badge for an approvable (& blockable) friendship (friendship invite received)" do
        @swimming_buddy.invite( @current_user )
        result = helper.social_block_badge( @swimmer )
        expect( result ).to include( I18n.t('social.menu_social_block') )
        expect( result ).to include( social_block_path(id: @swimming_buddy.id) )
      end
      it "returns the html badge for an approved (blockable) friend swimmer" do
        @swimming_buddy.invite( @current_user )
        @current_user.approve( @swimming_buddy )
        result = helper.social_block_badge( @swimmer )
        expect( result ).to include( I18n.t('social.menu_social_block') )
        expect( result ).to include( social_block_path(id: @swimming_buddy.id) )
      end
      it "returns the html badge for a blocked (unblockable) friend swimmer" do
        @swimming_buddy.invite( @current_user )
        @current_user.approve( @swimming_buddy )
        @current_user.block( @swimming_buddy )
        result = helper.social_block_badge( @swimmer )
        expect( result ).to include( I18n.t('social.menu_social_unblock') )
        expect( result ).to include( social_unblock_path(id: @swimming_buddy.id) )
      end
    end
    # -------------------------------------------------------------------------

    describe "[Friendship remove/editing badge]" do
      before(:each) {
        @swimming_buddy.set_associated_swimmer( @swimmer )
        @current_user.set_associated_swimmer( create(:swimmer) )
      }

      def check_expected_outcome(method_name, swimmer, label, path)
        result = helper.send(method_name.to_sym, swimmer)
        expect( result ).to include( label )
        expect( result ).to include( send(path, id: @swimming_buddy.id) )
      end

      shared_examples_for "(editing a valid friend)" do |method_name_array, label_array, path_array|
        method_name_array.each_with_index do |method_name, index|
          describe "##{method_name}" do
            it "returns nil for a new friendable swimmer (non-existing friendship)" do
              expect( helper.send(method_name.to_sym, @swimmer) ).to be_nil
            end
            it "returns a String for a pending invited swimmer (friendship invite sent)" do
              @current_user.invite( @swimming_buddy )
              check_expected_outcome(method_name, @swimmer, label_array[index], path_array[index])
            end
            it "returns the html badge for an approvable friendship (friendship invite received)" do
              @swimming_buddy.invite( @current_user )
              check_expected_outcome(method_name, @swimmer, label_array[index], path_array[index])
            end
            it "returns the html badge for an approved friend swimmer (friendship invite accepted)" do
              @current_user.invite( @swimming_buddy )
              @swimming_buddy.approve( @current_user )
              check_expected_outcome(method_name, @swimmer, label_array[index], path_array[index])
            end
          end
        end
      end

      context "(a different user)," do
        it_behaves_like(
          "(editing a valid friend)",
          [ :social_remove_badge, :social_edit_badge ],
          [ I18n.t('social.menu_social_remove'), I18n.t('social.menu_social_edit') ],
          [ :social_remove_path, :social_edit_path ]
        )
      end
    end
    # -------------------------------------------------------------------------
  end
  # ---------------------------------------------------------------------------
  # (logged-in user END)
  # ---------------------------------------------------------------------------
end
