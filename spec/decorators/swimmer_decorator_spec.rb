require 'spec_helper'

describe SwimmersDecorator do
  before :each do
    @user = create( :user )
    @user2 = create( :user )
    @swimmer = create( :swimmer )
    @user.set_associated_swimmer( @swimmer )
    @swimmer2 = create( :swimmer )
    @user2.set_associated_swimmer( @swimmer2 )
    @decorated_swimmer = SwimmersDecorator.decorate( @swimmer )
  end

  subject { @decorated_swimmer }

  context "[implemented methods]" do
    it_behaves_like "(the existance of a method returning boolean values)", [
      :is_associated_to_somebody_else_than, 
      :is_confirmable_by,
      :is_unconfirmable_by,
      :is_invitable_by,
      :is_pending_by,
      :is_blockable_by,
      :is_unblockable_by,
      :is_editable_by
    ],
    @user
  end


  describe "#is_associated_to_somebody_else_than" do
    context "(for a different user)," do
      it "returns true" do
        expect( subject.is_associated_to_somebody_else_than(@user2) ).to be_true
      end
    end
    context "(for the same user)," do
      it "returns false" do
        expect( subject.is_associated_to_somebody_else_than(@user) ).to be_false
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe "#is_confirmable_by" do
    context "as a different user," do
      it "returns true for an unconfirmed swimmer" do
        expect( subject.is_confirmable_by(@user2) ).to be_true
      end
      it "returns false for an already confirmed swimmer" do
        UserSwimmerConfirmation.confirm_for( @user, @swimmer, @user2 )
        expect( subject.is_confirmable_by(@user2) ).to be_false
      end
    end
    context "as the same current user," do
      it "returns false for an unconfirmed swimmer" do
        expect( subject.is_confirmable_by(@user) ).to be_false
      end
      it "returns false for an already confirmed swimmer" do
        UserSwimmerConfirmation.confirm_for( @user, @swimmer, @user2 )
        expect( subject.is_confirmable_by(@user) ).to be_false
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe "#is_unconfirmable_by" do
    context "as a different user," do
      it "returns false for an unconfirmed swimmer" do
        expect( subject.is_unconfirmable_by(@user2) ).to be_false
      end
      it "returns true for an already confirmed swimmer" do
        UserSwimmerConfirmation.confirm_for( @user, @swimmer, @user2 )
        expect( subject.is_unconfirmable_by(@user2) ).to be_true
      end
    end
    context "as the same current user," do
      it "returns false for an unconfirmed swimmer" do
        expect( subject.is_unconfirmable_by(@user) ).to be_false
      end
      it "returns false for an already confirmed swimmer" do
        UserSwimmerConfirmation.confirm_for( @user, @swimmer, @user2 )
        expect( subject.is_unconfirmable_by(@user) ).to be_false
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe "#is_invitable_by" do
    context "as a different user," do
      it "returns true for a new friendable swimmer" do
        expect( subject.is_invitable_by(@user2) ).to be_true
      end
      it "returns false for a pending invited swimmer" do
        @user2.invite( @user )
        expect( subject.is_invitable_by(@user2) ).to be_false
      end
      it "returns false for an approved friend swimmer" do
        @user2.invite( @user )
        @user.approve( @user2 )
        expect( subject.is_invitable_by(@user2) ).to be_false
      end
    end
    context "as the same current user," do
      it "returns false for the same associated swimmer" do
        expect( subject.is_invitable_by(@user) ).to be_false
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe "#is_pending_by" do
    context "as a different user," do
      it "returns false for a new friendable swimmer" do
        expect( subject.is_pending_by(@user2) ).to be_false
      end
      it "returns true for a pending invited swimmer" do
        @user.invite( @user2 )
        expect( subject.is_pending_by(@user2) ).to be_true
      end
      it "returns false for a received pending invite from another user" do
        @user2.invite( @user )
        expect( subject.is_pending_by(@user2) ).to be_false
      end
      it "returns false for an approved friend swimmer" do
        @user2.invite( @user )
        @user.approve( @user2 )
        expect( subject.is_pending_by(@user2) ).to be_false
      end
    end
    context "as the same current user," do
      it "returns false for the same associated swimmer" do
        expect( subject.is_pending_by(@user) ).to be_false
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe "#is_blockable_by" do
    context "as a different user," do
      it "returns false for a un-associated swimmer (non-valid goggler)" do
        expect( subject.is_blockable_by(create(:user)) ).to be_false
      end
      it "returns false for a valid goggler who's not a friend yet" do
        expect( subject.is_blockable_by(@user2) ).to be_false
      end
      it "returns true for a swimmer with a pending friendship" do
        @user.invite( @user2 )
        expect( subject.is_blockable_by(@user2) ).to be_true
      end
      it "returns true for an approved friendship with a valid goggler" do
        @user2.invite( @user )
        @user.approve( @user2 )
        expect( subject.is_blockable_by(@user2) ).to be_true
      end
    end
    context "as the same current user," do
      it "returns false for the same associated swimmer" do
        expect( subject.is_blockable_by(@user) ).to be_false
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe "#is_unblockable_by" do
    context "as a different user," do
      it "returns false for a un-associated swimmer (non-valid goggler)" do
        expect( subject.is_unblockable_by(create(:user)) ).to be_false
      end
      it "returns false for a valid goggler who's not a friend yet" do
        expect( subject.is_unblockable_by(@user2) ).to be_false
      end
      it "returns false for a swimmer with a pending friendship" do
        @user.invite( @user2 )
        expect( subject.is_unblockable_by(@user2) ).to be_false
      end
      it "returns false for an approved friendship with a valid goggler" do
        @user2.invite( @user )
        @user.approve( @user2 )
        expect( subject.is_unblockable_by(@user2) ).to be_false
      end
      it "returns true for the blocker of blocked friendship (with a valid goggler)" do
        @user2.invite( @user )
        @user.approve( @user2 ) # user approves
        @user2.block( @user )   # the other user changes idea
        expect( subject.is_unblockable_by(@user2) ).to be_true
      end
      it "returns false for the blocked friend of blocked friendship" do
        @user2.invite( @user )
        @user.approve( @user2 ) # user approves
        @user2.block( @user )   # the other user changes idea
        expect( subject.is_unblockable_by(@user) ).to be_false
      end
    end
    context "as the same current user," do
      it "returns false for the same associated swimmer" do
        expect( subject.is_unblockable_by(@user) ).to be_false
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe "#is_editable_by" do
    context "as a different user," do
      it "returns false for a non-existing frienship" do
        expect( subject.is_editable_by(@user2) ).to be_false
      end
      it "returns true for a pending friendship request" do
        @user2.invite( @user )
        expect( subject.is_editable_by(@user2) ).to be_true
      end
      it "returns true for an approved friendship" do
        @user2.invite( @user )
        @user.approve( @user2 )
        expect( subject.is_editable_by(@user2) ).to be_true
      end
    end
    context "as the same current user," do
      it "returns false for the same associated swimmer" do
        expect( subject.is_editable_by(@user) ).to be_false
      end
    end
  end
  # ---------------------------------------------------------------------------
end
