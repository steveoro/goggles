require 'rails_helper'
require 'ffaker'
require 'wice_grid'


describe MeetingsController, type: :controller do

  shared_examples_for "(response ok with index grid rendering)" do |action_sym|
    it "handles successfully the request" do
      expect(response.status).to eq( 200 )
    end
    it "assigns the required variables" do
      expect( assigns(:title) ).to be_an_instance_of( String )
      expect( assigns(:meetings_grid) ).to be_an_instance_of( Wice::WiceGrid )
    end
    it "renders the search template" do
      expect(response).to render_template( action_sym )
    end
  end


  shared_examples_for "(GET search index with a preselected swimmer_id)" do |action_sym|
    before(:each) do
      @swimmer = create(:swimmer)
      get action_sym, params: { swimmer_id: @swimmer.id }
    end
    it_behaves_like( "(response ok with index grid rendering)", action_sym )

    it "assigns a :preselected_swimmer_id" do
      expect( assigns(:preselected_swimmer_id) ).to eq( @swimmer.id )
    end
  end


  shared_examples_for "(GET search index with a preselected team_id)" do |action_sym|
    before(:each) do
      @team = create(:team)
      get action_sym, params: { team_id: @team.id }
    end
    it_behaves_like( "(response ok with index grid rendering)", action_sym )

    it "assigns a :preselected_team_id" do
      expect( assigns(:preselected_team_id) ).to eq( @team.id )
    end
  end


  shared_examples_for "(GET search index with a text added to the title)" do |action_sym|
    before(:each) do
      @text = FFaker::Lorem.paragraph[0..99]
      get action_sym, params: { text: @text }
    end
    it_behaves_like( "(response ok with index grid rendering)", action_sym )

    it "has a title text containing the specified sentence" do
      expect( assigns(:title) ).to include( @text )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  shared_examples_for "(GET http action with an invalid meeting id)" do |action_sym|
    before(:each) { get action_sym, params: { id: 0} }

    it "handles the request with a redirect" do
      expect(response.status).to eq( 302 )
    end
    it "redirects to meeting current path" do
      expect( response ).to redirect_to( controller: :meetings, action: :current )
      end
  end
  #-- -------------------------------------------------------------------------
  #++

  shared_examples_for "(GET http action with a valid meeting id)" do |action_sym, fixture_id|
    before(:each) { get action_sym, params: { id: fixture_id } }

    it "handles successfully the request" do
      expect(response.status).to eq( 200 )
    end
    it "assigns the meeting" do
      expect( assigns(:meeting) ).to be_an_instance_of( Meeting )
    end
    it "renders the template" do
      expect(response).to render_template(action_sym)
    end
  end
  # ===========================================================================


  describe 'GET #my' do
    context "as an unlogged user," do
      it "redirects to the login page" do
        get( :my )
        expect(response).to redirect_to( "/users/sign_in" )
      end
    end

    context "as a logged but not-associated user," do
      let(:user) { FactoryGirl.create(:user) }
      before(:each) do
        login_user( user )
        expect( subject.current_user ).to be_an_instance_of( User )
        expect( subject.current_user.id ).to eq( user.id )
        expect( subject.current_user.swimmer_id ).to be nil
        get( :my )
      end
      it "returns http success" do
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
        get( :my )
      end
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
      it "assigns a list of meetings" do
        expect( assigns(:meetings) ).to be_an( Array )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe 'GET #current' do
    context "without parameters," do
      before(:each) { get :current }
      it_behaves_like( "(response ok with index grid rendering)", :current )
    end

    context "with valid parameters," do
      it_behaves_like( "(GET search index with a preselected swimmer_id)", :current )
      it_behaves_like( "(GET search index with a preselected team_id)", :current )
      it_behaves_like( "(GET search index with a text added to the title)", :current )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe 'GET #simple_search' do
    context "without parameters," do
      before(:each) { get :simple_search }
      it_behaves_like( "(response ok with index grid rendering)", :simple_search )
    end

    context "with valid parameters," do
      it_behaves_like( "(GET search index with a preselected swimmer_id)", :simple_search )
      it_behaves_like( "(GET search index with a preselected team_id)", :simple_search )
      it_behaves_like( "(GET search index with a text added to the title)", :simple_search )

      it "stores the search text in the session" do
        @text = FFaker::Lorem.paragraph[0..99]
        get :simple_search, params: { text: @text, team_id: 1, swimmer_id: 142 }
        expect( session[:text] ).to include( @text )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe 'GET #custom_search' do
    context "without parameters," do
      before(:each) { get :custom_search }
      it_behaves_like( "(response ok with index grid rendering)", :custom_search )
    end

    context "with valid parameters," do
      it_behaves_like( "(GET search index with a preselected swimmer_id)", :custom_search )
      it_behaves_like( "(GET search index with a preselected team_id)", :custom_search )
      it_behaves_like( "(GET search index with a text added to the title)", :custom_search )
    end
  end
  #-- =========================================================================
  #++


  describe 'GET #show_invitation' do
    it_behaves_like( "(GET http action with an invalid meeting id)", :show_invitation )
    it_behaves_like( "(GET http action with a valid meeting id)", :show_invitation, 14101 )
  end
  #-- -------------------------------------------------------------------------
  #++

  describe 'GET #show_start_list' do
    it_behaves_like( "(GET http action with an invalid meeting id)", :show_start_list )
    it_behaves_like( "(GET http action with a valid meeting id)", :show_start_list, 13106 )

    before(:each) do
      #@meeting = create(:meeting)
      #get :show_start_list, params: { id: @meeting.id }
      get :show_start_list, params: { id: 13106 }
    end

    it "assigns the meeting event list" do
      expect( assigns(:meeting_events_list) ).to be_a_kind_of( ActiveRecord::Relation )
    end
    it "assigns the meeting event list" do
      expect( assigns(:meeting_events_list) ).to all(be_an_instance_of( MeetingEvent ))
    end
    it "assigns the max updated timestamp" do
      expect( assigns(:max_entry_updated_at) ).not_to be_nil
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe 'GET #show_team_entries' do
    it_behaves_like( "(GET http action with an invalid meeting id)", :show_team_entries )

    before(:each) do
      #@meeting = create(:meeting)
      #get :show_team_entries, params: { id: @meeting.id, team_id: @team.id }
      get :show_team_entries, params: { id: 13106, team_id: 1 }
    end

    it "assigns the meeting event list" do
      expect( assigns(:meeting_events_list) ).to be_a_kind_of( ActiveRecord::Relation )
    end
    it "assigns the meeting event list" do
      expect( assigns(:meeting_events_list) ).to all(be_an_instance_of( MeetingEvent ))
    end
    it "assigns the max updated timestamp" do
      expect( assigns(:max_entry_updated_at) ).not_to be_nil
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe 'GET #show_start_list_by_category' do
    it_behaves_like( "(GET http action with an invalid meeting id)", :show_start_list_by_category )
    it_behaves_like( "(GET http action with a valid meeting id)", :show_start_list_by_category, 13106 )

    before(:each) do
      #@meeting = create(:meeting)
      #get :show_start_list_by_category, params: { id: @meeting.id }
      get :show_start_list_by_category, params: { id: 13106 }
    end

    it "assigns the meeting event list" do
      expect( assigns(:meeting_events_list) ).to be_a_kind_of( ActiveRecord::Relation )
    end
    it "assigns the meeting event list" do
      expect( assigns(:meeting_events_list) ).to all(be_an_instance_of( MeetingEvent ))
    end
    it "assigns the max updated timestamp" do
      expect( assigns(:max_entry_updated_at) ).not_to be_nil
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe 'GET #show_full' do
    it_behaves_like( "(GET http action with an invalid meeting id)", :show_full )
    it_behaves_like( "(GET http action with a valid meeting id)", :show_full, 13106 )
  end
  #-- -------------------------------------------------------------------------
  #++

  describe 'GET #show_ranking' do
    it_behaves_like( "(GET http action with an invalid meeting id)", :show_ranking )
    it_behaves_like( "(GET http action with a valid meeting id)", :show_ranking, 13105 )
  end
  #-- -------------------------------------------------------------------------
  #++

  describe 'GET #show_stats' do
    it_behaves_like( "(GET http action with an invalid meeting id)", :show_stats )
    it_behaves_like( "(GET http action with a valid meeting id)", :show_stats, 13105 )

    before(:each) do
      @meeting = create(:meeting)
      get :show_stats, params: { id: @meeting.id }
    end

    it "assigns the meeting stats" do
      expect( assigns(:meeting_stats) ).to be_an_instance_of( MeetingStatDAO )
    end
    it "assigns the max updated timestamp" do
      expect( assigns(:max_mir_updated_at) ).not_to be_nil
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe 'GET #show_team_results' do
    it_behaves_like( "(GET http action with an invalid meeting id)", :show_team_results )
  end
  #-- -------------------------------------------------------------------------
  #++

  describe 'GET #show_swimmer_results' do
    it_behaves_like( "(GET http action with an invalid meeting id)", :show_swimmer_results )
  end
  #-- -------------------------------------------------------------------------
  #++
end
