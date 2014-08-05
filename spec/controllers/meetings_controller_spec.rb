require 'spec_helper'
require 'ffaker'
require 'wice_grid'


describe MeetingsController, :type => :controller do

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
      get action_sym, swimmer_id: @swimmer.id
    end
    it_behaves_like( "(response ok with index grid rendering)", action_sym )

    it "assigns a :preselected_swimmer_id" do
      expect( assigns(:preselected_swimmer_id) ).to eq( @swimmer.id )
    end
  end


  shared_examples_for "(GET search index with a preselected team_id)" do |action_sym|
    before(:each) do
      @team = create(:team)
      get action_sym, team_id: @team.id
    end
    it_behaves_like( "(response ok with index grid rendering)", action_sym )

    it "assigns a :preselected_team_id" do
      expect( assigns(:preselected_team_id) ).to eq( @team.id )
    end
  end


  shared_examples_for "(GET search index with a text added to the title)" do |action_sym|
    before(:each) do
      @text = Faker::Lorem.paragraph
      get action_sym, text: @text
    end
    it_behaves_like( "(response ok with index grid rendering)", action_sym )

    it "has a title text containing the specified sentence" do
      expect( assigns(:title) ).to include( @text )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #current]' do
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


  describe '[GET #simple_search]' do
    context "without parameters," do
      before(:each) { get :simple_search }
      it_behaves_like( "(response ok with index grid rendering)", :simple_search )
    end

    context "with valid parameters," do
      it_behaves_like( "(GET search index with a preselected swimmer_id)", :simple_search )
      it_behaves_like( "(GET search index with a preselected team_id)", :simple_search )
      it_behaves_like( "(GET search index with a text added to the title)", :simple_search )

      it "stores the search text in the session" do
        @text = Faker::Lorem.paragraph
        get :simple_search, text: @text, team_id: 1, swimmer_id: 142
        expect( session[:text] ).to include( @text )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #custom_search]' do
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


  describe '[GET #show_full]' do
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #show_ranking]' do
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #show_stats]' do
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #show_team_results]' do
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #show_swimmer_results]' do
  end
  #-- -------------------------------------------------------------------------
  #++

end
