require 'spec_helper'


describe SwimmerDecorator do
  before :each do
    @user = create( :user )
    @user2 = create( :user )
    @user_not_associated = create( :user )
    @swimmer = create( :swimmer )
    @user.set_associated_swimmer( @swimmer )
    @swimmer2 = create( :swimmer )
    @user2.set_associated_swimmer( @swimmer2 )
    @decorated_swimmer = SwimmerDecorator.decorate( @swimmer )
  end

  subject { @decorated_swimmer }

  context "[implemented methods]" do
    it_behaves_like "(the existance of a method returning either String or nil)", [
      :get_confirm_label_text_for, 
      :get_confirm_tooltip_text_for,
      :get_confirm_path_for,
      :get_invite_label_text_for, 
      :get_invite_tooltip_text_for,
      :get_invite_path_for,
      :get_block_label_text_for, 
      :get_block_tooltip_text_for,
      :get_block_path_for,
      :get_remove_label_text_for, 
      :get_remove_tooltip_text_for,
      :get_remove_path_for,
      :get_edit_label_text_for, 
      :get_edit_tooltip_text_for,
      :get_edit_path_for
    ],
    @user2
  end
  # ---------------------------------------------------------------------------


  shared_examples_for "(an action allowed only to associated and different users, that always returns nil)" do |method_name_array|
    method_name_array.each do |method_name|
      context "(the same current user)," do
        it "returns nil for a confirmable swimmer" do
          expect( subject.send(method_name.to_sym, @user) ).to be_nil
        end
        it "returns a nil for an unconfirmable swimmer" do
          UserSwimmerConfirmation.confirm_for( @user, @user.swimmer, @user2 )
          expect( subject.send(method_name.to_sym, @user) ).to be_nil
        end
      end
  
      context "(an unassociated user)," do
        it "returns nil for a confirmable swimmer" do
          expect( subject.send(method_name.to_sym, @user_not_associated) ).to be_nil
        end
        it "returns a nil for an unconfirmable swimmer" do
          @user_not_associated.set_associated_swimmer( create(:swimmer) )
          UserSwimmerConfirmation.confirm_for( @user, @user.swimmer, @user_not_associated )
          # If the User-not-associated becomes unassociated again,
          # then he should not be able to de-confirm an already confirmed swimmer:
          @user_not_associated.set_associated_swimmer(nil)
          expect( subject.send(method_name.to_sym, @user_not_associated) ).to be_nil
        end
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe "#get_confirm_label_text_for" do
    context "(a different user)," do
      it "returns a String for a confirmable swimmer" do
        expect( subject.get_confirm_label_text_for(@user2) ).to be_an_instance_of(String)
      end
      it "returns a String for an unconfirmable swimmer" do
        UserSwimmerConfirmation.confirm_for( @user, @swimmer, @user2 )
        expect( subject.get_confirm_label_text_for(@user2) ).to be_an_instance_of(String)
      end
    end
    it_behaves_like(
      "(an action allowed only to associated and different users, that always returns nil)",
      [:get_confirm_label_text_for]
    )
  end


  describe "#get_confirm_tooltip_text_for" do
    context "(a different user)," do
      it "returns a String for a confirmable swimmer" do
        expect( subject.get_confirm_tooltip_text_for(@user2) ).to be_an_instance_of(String)
      end
      it "returns a String for an unconfirmable swimmer" do
        UserSwimmerConfirmation.confirm_for( @user, @swimmer, @user2 )
        expect( subject.get_confirm_tooltip_text_for(@user2) ).to be_an_instance_of(String)
      end
    end
    it_behaves_like(
      "(an action allowed only to associated and different users, that always returns nil)",
      [:get_confirm_tooltip_text_for]
    )
  end


  describe "#get_confirm_path_for" do
    context "(a different user)," do
      it "returns a String for a confirmable swimmer" do
        expect( subject.get_confirm_path_for(@user2) ).to be_an_instance_of(String)
      end
      it "returns a String for an unconfirmable swimmer" do
        UserSwimmerConfirmation.confirm_for( @user, @swimmer, @user2 )
        expect( subject.get_confirm_path_for(@user2) ).to be_an_instance_of(String)
      end
    end
    it_behaves_like(
      "(an action allowed only to associated and different users, that always returns nil)",
      [:get_confirm_path_for]
    )
  end
  # ---------------------------------------------------------------------------


  describe "#get_invite_label_text_for" do
    context "(a different user)," do
      it "returns a String for a new friendable swimmer" do
        expect( subject.get_invite_label_text_for(@user2) ).to be_an_instance_of(String)
      end
      it "returns a String for a pending invited swimmer" do
        @user2.invite( @user )
        expect( subject.get_invite_label_text_for(@user2) ).to be_an_instance_of(String)
      end
      it "returns a String for an approvable friendship" do
        @user.invite( @user2 )
        expect( subject.get_invite_label_text_for(@user2) ).to be_an_instance_of(String)
      end
      it "returns nil for an approved friend swimmer" do
        @user.invite( @user2 )
        @user2.approve( @user )
        expect( subject.get_invite_label_text_for(@user2) ).to be_nil
      end
    end
    it_behaves_like(
      "(an action allowed only to associated and different users, that always returns nil)",
      [:get_invite_label_text_for]
    )
  end


  shared_examples_for "(inviting a valid swimmer)" do |method_name_array|
    method_name_array.each do |method_name|
      it "returns a String for a new friendable swimmer (non-existing friendship)" do
        expect( subject.send(method_name.to_sym, @user2) ).to be_an_instance_of(String)
      end
      it "returns nil for a pending invited swimmer (friendship invite sent)" do
        @user2.invite( @user )
        expect( subject.send(method_name.to_sym, @user2) ).to be_nil
      end
      it "returns a String for an approvable friendship (friendship invite received)" do
        @user.invite( @user2 )
        expect( subject.send(method_name.to_sym, @user2) ).to be_an_instance_of(String)
      end
      it "returns nil for an approved friend swimmer" do
        @user.invite( @user2 )
        @user2.approve( @user )
        expect( subject.send(method_name.to_sym, @user2) ).to be_nil
      end
    end
  end

  describe "#get_invite_tooltip_text_for" do
    context "(a different user)," do
      it_behaves_like "(inviting a valid swimmer)", [:get_invite_tooltip_text_for]
    end
    it_behaves_like(
      "(an action allowed only to associated and different users, that always returns nil)",
      [:get_invite_tooltip_text_for]
    )
  end

  describe "#get_invite_path_for" do
    context "(a different user)," do
      it_behaves_like "(inviting a valid swimmer)", [:get_invite_path_for]
    end
    it_behaves_like(
      "(an action allowed only to associated and different users, that always returns nil)",
      [:get_invite_path_for]
    )
  end
  # ---------------------------------------------------------------------------


  shared_examples_for "(blocking a valid swimmer)" do |method_name_array|
    method_name_array.each do |method_name|
      it "returns nil for a new friendable swimmer (non-existing friendship)" do
        expect( subject.send(method_name.to_sym, @user2) ).to be_nil
      end
      it "returns nil for a pending invited swimmer (friendship invite sent)" do
        @user2.invite( @user )
        expect( subject.send(method_name.to_sym, @user2) ).to be_nil
      end
      it "returns a String for an approvable friendship (friendship invite received)" do
        @user.invite( @user2 )
        expect( subject.send(method_name.to_sym, @user2) ).to be_an_instance_of(String)
      end
      it "returns a String for an approved (blockable) friend swimmer" do
        @user.invite( @user2 )
        @user2.approve( @user )
        expect( subject.send(method_name.to_sym, @user2) ).to be_an_instance_of(String)
      end
    end
  end

  describe "#get_block_label_text_for" do
    context "(a different user)," do
      it_behaves_like "(blocking a valid swimmer)", [:get_block_label_text_for]
    end
    it_behaves_like(
      "(an action allowed only to associated and different users, that always returns nil)",
      [:get_block_label_text_for]
    )
  end

  describe "#get_block_tooltip_text_for" do
    context "(a different user)," do
      it_behaves_like "(blocking a valid swimmer)", [:get_block_tooltip_text_for]
    end
    it_behaves_like(
      "(an action allowed only to associated and different users, that always returns nil)",
      [:get_block_tooltip_text_for]
    )
  end

  describe "#get_block_path_for" do
    context "(a different user)," do
      it_behaves_like "(blocking a valid swimmer)", [:get_block_path_for]
    end
    it_behaves_like(
      "(an action allowed only to associated and different users, that always returns nil)",
      [:get_block_path_for]
    )
  end
  # ---------------------------------------------------------------------------


  shared_examples_for "(editing a valid friend)" do |method_name_array|
    method_name_array.each do |method_name|
      describe "##{method_name}" do
        it "returns nil for a new friendable swimmer (non-existing friendship)" do
          expect( subject.send(method_name.to_sym, @user2) ).to be_nil
        end
        it "returns a String for a pending invited swimmer (friendship invite sent)" do
          @user2.invite( @user )
          expect( subject.send(method_name.to_sym, @user2) ).to be_an_instance_of(String)
        end
        it "returns a String for an approvable friendship (friendship invite received)" do
          @user.invite( @user2 )
          expect( subject.send(method_name.to_sym, @user2) ).to be_an_instance_of(String)
        end
        it "returns a String for an approved (blockable) friend swimmer" do
          @user.invite( @user2 )
          @user2.approve( @user )
          expect( subject.send(method_name.to_sym, @user2) ).to be_an_instance_of(String)
        end
      end
    end
  end

  describe "[Friendship editing]" do
    context "(a different user)," do
      it_behaves_like "(editing a valid friend)", [:get_remove_label_text_for, :get_edit_label_text_for]
    end
    it_behaves_like(
      "(an action allowed only to associated and different users, that always returns nil)",
      [:get_remove_label_text_for, :get_edit_label_text_for]
    )
  end

  describe "#get_remove_tooltip_text_for" do
    context "(a different user)," do
      it_behaves_like "(editing a valid friend)", [:get_remove_tooltip_text_for, :get_edit_tooltip_text_for]
    end
    it_behaves_like(
      "(an action allowed only to associated and different users, that always returns nil)",
      [:get_remove_tooltip_text_for, :get_edit_tooltip_text_for]
    )
  end

  describe "#get_remove_path_for" do
    context "(a different user)," do
      it_behaves_like "(editing a valid friend)", [:get_remove_path_for, :get_edit_path_for]
    end
    it_behaves_like(
      "(an action allowed only to associated and different users, that always returns nil)",
      [:get_remove_path_for, :get_edit_path_for]
    )
  end
  # ---------------------------------------------------------------------------
end
