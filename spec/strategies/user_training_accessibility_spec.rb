require 'spec_helper'


describe UserTrainingAccessibility do
  before :each do
    @user = create( :user )
    @non_shared_fixture = create( :user_training )
    @owned_fixture = create( :user_training, user: @user )
    @shared_fixture = create( :user_training )
    @shared_fixture.user.invite( @user, true, true, true )   # he wants to share everything
    @user.approve( @shared_fixture.user, true, true, true )  # the current user approves
  end


  context "[any user]" do                                         # (no admin override)
    subject { UserTrainingAccessibility.new( @user, @non_shared_fixture, false ) }

    [
      :is_owned,
      :is_visible
    ].each do |method_name|
      it "responds to ##{method_name}" do
        expect( subject ).to respond_to(method_name)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "[any logged-in user, w/o shared or owned content]" do
    subject { UserTrainingAccessibility.new( @user, @non_shared_fixture, false ) }

    describe "#is_owned()" do
      it "returns false" do
        expect( subject.is_owned() ).to be false
      end
    end
    describe "#is_visible()" do
      it "returns true" do
        expect( subject.is_visible() ).to be false
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "[any logged-in user, w/ owned content]" do
    subject { UserTrainingAccessibility.new( @user, @owned_fixture, false ) }

    describe "#is_owned()" do
      it "returns true" do
        expect( subject.is_owned() ).to be true
      end
    end
    describe "#is_visible()" do
      it "returns true" do
        expect( subject.is_visible() ).to be true
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "[any logged-in user, w/ shared content]" do
    subject { UserTrainingAccessibility.new( @user, @shared_fixture, false ) }

    describe "#is_owned()" do
      it "returns true" do
        expect( subject.is_owned() ).to be false
      end
    end
    describe "#is_visible()" do
      it "returns true" do
        expect( subject.is_visible() ).to be true
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
