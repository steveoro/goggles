require 'spec_helper'


describe User do
  it_behaves_like "DropDownListable"

  context "[a well formed instance]" do
    subject { create(:user) }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end

    context "[general methods]" do
      it_behaves_like( "(the existance of a method)", [ 
        :get_full_name,
        :to_s,
        :get_first_and_last_name,
        :get_preferred_swimmer_level_id,
        :get_swimmer_level_type,
        :set_associated_swimmer,
        :has_associated_swimmer?,
        :has_swimmer_confirmations?,
        :find_any_confirmation_given_to
      ])
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#get_first_and_last_name" do
      it "returns an array with 2 elements" do
        result = subject.get_first_and_last_name
        expect( result ).to be_an_instance_of( Array )
        expect( result.size ).to eq(2)
      end
      it "returns names extracted from the description" do
        result = subject.get_first_and_last_name
        expect( Regexp.new(result[0]) ).to match( subject.description )
        expect( Regexp.new(result[1]) ).to match( subject.description )
      end
      it "returns names extracted from the dedicated fields, when present" do
        subject.first_name = Faker::Name.first_name
        subject.last_name  = Faker::Name.last_name
        result = subject.get_first_and_last_name
        expect( Regexp.new(result[0]) ).to match( subject.first_name )
        expect( Regexp.new(result[1]) ).to match( subject.last_name )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#set_associated_swimmer" do
      it "returns true when invoked successfully" do
        swimmer = create(:swimmer)
        expect( subject.set_associated_swimmer(swimmer) ).to be_true
      end

      it "updates both the user and the swimmer with the corresponding (new) IDs when invoked successfully (if both are available for association)" do
        swimmer = create(:swimmer)
        subject.set_associated_swimmer(swimmer)
        expect( subject.swimmer_id ).to eq( swimmer.id )
        expect( swimmer.associated_user_id ).to eq( subject.id )
      end

      it "returns false when invoked for an already associated swimmer" do
        swimmer = create(:swimmer)
        another_user = create(:user)
        another_user.set_associated_swimmer(swimmer)
        expect( subject.set_associated_swimmer(swimmer) ).to be_false
      end

      it "does nothing when invoked for an already associated swimmer" do
        swimmer = create(:swimmer)
        another_user = create(:user)
        another_user.set_associated_swimmer(swimmer)
        subject.set_associated_swimmer(swimmer)
        expect( subject.swimmer ).to be_nil
        expect( another_user.swimmer_id ).to eq( swimmer.id )
        expect( swimmer.associated_user_id ).to eq( another_user.id )
      end

      it "returns true when called with nil on an already associated user" do
        subject.set_associated_swimmer(create(:swimmer))
        expect( subject.set_associated_swimmer() ).to be_true
      end

      it "clears both the user and the swimmer when called with nil on an already associated user" do
        swimmer = create(:swimmer)
        subject.set_associated_swimmer(swimmer)
        expect( subject.set_associated_swimmer() ).to be_true
        subject.reload
        swimmer.reload
        expect( subject.swimmer_id ).to be_nil
        expect( swimmer.associated_user_id ).to be_nil
      end

      it "returns true when called with a new-swimmer for association and the user already associated to an old-swimmer" do
        old_swimmer = create(:swimmer)
        subject.set_associated_swimmer(old_swimmer)
        new_swimmer = create(:swimmer)
        expect( subject.set_associated_swimmer(new_swimmer) ).to be_true
      end

      it "updates correctly the user, an old-swimmer and a new-swimmer when called with a new-swimmer for association and the user already associated to an old-swimmer" do
        old_swimmer = create(:swimmer)
        subject.set_associated_swimmer(old_swimmer)
        new_swimmer = create(:swimmer)
        subject.set_associated_swimmer(new_swimmer)
        old_swimmer.reload
        subject.reload
        new_swimmer.reload
        expect( old_swimmer.associated_user_id ).to be_nil
        expect( subject.swimmer_id ).to eq( new_swimmer.id )
        expect( new_swimmer.associated_user_id ).to eq( subject.id )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#has_associated_swimmer?" do
      it "returns true if it has an associated swimmer" do
        subject.swimmer = create(:swimmer) 
        expect( subject.has_associated_swimmer? ).to be_true
      end

      it "returns false if it has not an associated swimmer" do
        subject.swimmer = nil 
        expect( subject.has_associated_swimmer? ).to be_false
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#has_swimmer_confirmations?" do
      it "returns true if the association is confirmed" do
        confirmation = create( :user_swimmer_confirmation )
        user = confirmation.user
        expect( user.has_swimmer_confirmations? ).to be_true
      end

      it "returns false if the association is not confirmed" do
        subject.swimmer = create(:swimmer) 
        expect( subject.has_swimmer_confirmations? ).to be_false
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#find_any_confirmation_given_to" do
      it "returns nil when no confirmations are found" do
        another_user = create(:user)
        expect( subject.find_any_confirmation_given_to(another_user) ).to be_nil
      end

      it "returns the first confirmation row found for a user" do
        confirmation = create( :user_swimmer_confirmation, confirmator: subject )
        expect( subject.find_any_confirmation_given_to(confirmation.user) ).to be_an_instance_of( UserSwimmerConfirmation )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#given_confirmations" do
      it "enlists all the confirmations given by the user" do
        confirmation1 = create( :user_swimmer_confirmation, confirmator: subject )
        confirmation2 = create( :user_swimmer_confirmation, confirmator: subject )
        confirmation3 = create( :user_swimmer_confirmation, confirmator: subject )
        expect( subject.given_confirmations.size == 3 ).to be_true
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
