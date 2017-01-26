require 'rails_helper'


RSpec.describe TaggingsController, type: :controller do

  let(:meeting) { FactoryGirl.create(:meeting) }
  let(:swimmer) { FactoryGirl.create(:swimmer) }

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "[POST #meeting_for_user]" do
    context "as an unlogged user," do
      it "returns http unauthorized" do
        post( :meeting_for_user, xhr: true, params: { id: meeting.id } )
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "as a logged but not-associated user," do
      let(:user) { FactoryGirl.create(:user) }
      before(:each) do
        login_user( user )
        expect( subject.current_user ).to be_an_instance_of( User )
        expect( subject.current_user.id ).to eq( user.id )
        expect( subject.current_user.swimmer_id ).to be nil
      end

      it "returns http success" do
        post( :meeting_for_user, xhr: true,
          params: { id: meeting.id }
        )
        expect(response).to have_http_status(:success)
      end
    end

    context "as a logged and swimmer-associated user," do
      let(:user) { FactoryGirl.create(:user, swimmer: create(:swimmer)) }
      before(:each) do
        login_user( user )
        expect( subject.current_user ).to be_an_instance_of( User )
        expect( subject.current_user.id ).to eq( user.id )
        expect( subject.current_user.swimmer_id ).not_to be nil
      end

      it "returns http success" do
        post( :meeting_for_user, xhr: true,
          params: { id: meeting.id }
        )
        expect(response).to have_http_status(:success)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "[POST #meeting_for_team]" do
    context "as an unlogged user," do
      it "returns http unauthorized" do
        post( :meeting_for_team, xhr: true, params: { id: meeting.id } )
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "as a logged but not-associated user," do
      let(:user) { FactoryGirl.create(:user) }
      before(:each) do
        login_user( user )
        expect( subject.current_user ).to be_an_instance_of( User )
        expect( subject.current_user.id ).to eq( user.id )
        expect( subject.current_user.swimmer_id ).to be nil
      end

      it "returns http success" do
        post( :meeting_for_team, xhr: true,
          params: { id: meeting.id }
        )
        expect(response).to have_http_status(:success)
      end
    end

    context "as a logged and swimmer-associated user," do
      let(:user) { FactoryGirl.create(:user, swimmer: create(:swimmer)) }
      before(:each) do
        login_user( user )
        expect( subject.current_user ).to be_an_instance_of( User )
        expect( subject.current_user.id ).to eq( user.id )
        expect( subject.current_user.swimmer_id ).not_to be nil
      end

      it "returns http success" do
        post( :meeting_for_team, xhr: true,
          params: { id: meeting.id }
        )
        expect(response).to have_http_status(:success)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "[POST #swimmer_for_user]" do
    context "as an unlogged user," do
      it "returns http unauthorized" do
        post( :swimmer_for_user, xhr: true, params: { id: meeting.id } )
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "as a logged but not-associated user," do
      let(:user) { FactoryGirl.create(:user) }
      before(:each) do
        login_user( user )
        expect( subject.current_user ).to be_an_instance_of( User )
        expect( subject.current_user.id ).to eq( user.id )
        expect( subject.current_user.swimmer_id ).to be nil
      end

      it "returns http success" do
        post( :swimmer_for_user, xhr: true,
          params: { id: meeting.id }
        )
        expect(response).to have_http_status(:success)
      end
    end

    context "as a logged and swimmer-associated user," do
      let(:user) { FactoryGirl.create(:user, swimmer: create(:swimmer)) }
      before(:each) do
        login_user( user )
        expect( subject.current_user ).to be_an_instance_of( User )
        expect( subject.current_user.id ).to eq( user.id )
        expect( subject.current_user.swimmer_id ).not_to be nil
      end

      it "returns http success" do
        post( :swimmer_for_user, xhr: true,
          params: { id: meeting.id }
        )
        expect(response).to have_http_status(:success)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
