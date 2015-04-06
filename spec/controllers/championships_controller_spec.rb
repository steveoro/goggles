require 'spec_helper'


describe ChampionshipsController, :type => :controller do

  shared_examples_for "(GET http action with or without parameters)" do |action_sym, fixture_id|

    before :each do
      # We need to set this to make the redirect_to(:back) pass the tests:
      request.env["HTTP_REFERER"] = root_path()
    end
    
    context "with an HTML request for a valid id," do
      before(:each) { get action_sym }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "assigns the tab title" do
        expect( assigns(:title) ).to be_an_instance_of( String )
      end
      it "renders the template" do
        expect(response).to render_template(action_sym)
      end
    end

    context "with an HTML request for a invalid id," do
      before(:each) { get action_sym, id: 0}
      
      it "handles the request with a redirect" do
        expect(response.status).to eq( 302 )
      end
      it "redirects to #root" do
        expect( response ).to redirect_to( request.env["HTTP_REFERER"] )
      end
    end

    context "with an HTML request for a valid id," do
      before(:each) { get action_sym, id: @fixture_id }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "assigns the tab title" do
        expect( assigns(:title) ).to be_an_instance_of( String )
      end
      it "renders the template" do
        expect(response).to render_template(action_sym)
      end
    end
  end
  # ===========================================================================


  describe '[GET #calendar_supermaster_fin]' do
    it_behaves_like( "(GET http action with or without parameters)", :calendar_supermaster_fin, 132 )
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #ranking_supermaster_fin]' do
    it_behaves_like( "(GET http action with or without parameters)", :ranking_supermaster_fin, 132 )
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #rules_supermaster_fin]' do
    it_behaves_like( "(GET http action with or without parameters)", :rules_supermaster_fin, 132 )
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #history_supermaster_fin]' do
    it_behaves_like( "(GET http action with or without parameters)", :history_supermaster_fin, 132 )
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #calendar_regional_er_csi]' do
    it_behaves_like( "(GET http action with or without parameters)", :calendar_regional_er_csi, 131 )

    it "assigns the required variables when invoked without parameters" do
      get :calendar_regional_er_csi
      expect( assigns(:season_meetings_calendar) ).to be_an_instance_of( Array )
      expect( assigns(:season_meetings_calendar) ).to all(be_an_instance_of( CalendarDAO ))
    end
    it "assigns the required variables when invoked with valid id" do
      get :calendar_regional_er_csi, id: 131
      expect( assigns(:season_meetings_calendar) ).to be_an_instance_of( Array )
      expect( assigns(:season_meetings_calendar) ).to all(be_an_instance_of( CalendarDAO ))
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #ranking_regional_er_csi]' do
    it_behaves_like( "(GET http action with or without parameters)", :ranking_regional_er_csi, 131 )

    it "assigns the required variables when invoked without parameters" do
      get :ranking_regional_er_csi
      expect( assigns(:championship_ranking) ).to be_an_instance_of( ChampionshipDAO )
    end
    it "assigns the required variables when invoked with valid id" do
      get :ranking_regional_er_csi, id: 131
      expect( assigns(:championship_ranking) ).to be_an_instance_of( ChampionshipDAO )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #rules_regional_er_csi]' do
    it_behaves_like( "(GET http action with or without parameters)", :rules_regional_er_csi, 141 )
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #history_regional_er_csi]' do
    it_behaves_like( "(GET http action with or without parameters)", :history_regional_er_csi, 131 )

    it "assigns the required variables when invoked without parameters" do
      get :history_regional_er_csi
      expect( assigns(:championship_history_manager) ).to be_an_instance_of( Array )
      expect( assigns(:seasons_hall_of_fame) ).to be_an_instance_of( Array )
      expect( assigns(:history_updated_at) ).to be_a_kind_of( Numeric )
    end
    it "assigns the required variables when invoked with valid id" do
      get :history_regional_er_csi, id: 131
      expect( assigns(:championship_history_manager) ).to be_an_instance_of( Array )
      expect( assigns(:seasons_hall_of_fame) ).to be_an_instance_of( Array )
      expect( assigns(:history_updated_at) ).to be_a_kind_of( Numeric )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #event_ranking_regional_er_csi]' do
    it_behaves_like( "(GET http action with or without parameters)", :event_ranking_regional_er_csi, 131 )

    it "assigns the required variables when invoked without parameters" do
      get :event_ranking_regional_er_csi
      expect( assigns(:category_types) ).to all(be_an_instance_of( CategoryType ))
      expect( assigns(:event_types) ).to all(be_an_instance_of( EventType ))
      expect( assigns(:ranking_updated_at) ).to be_a_kind_of( Numeric )
      expect( assigns(:season_ranking) ).to be_a_kind_of( Array )
    end
    it "assigns the required variables when invoked with valid id" do
      get :event_ranking_regional_er_csi, id: 131
      expect( assigns(:category_types) ).to all(be_an_instance_of( CategoryType ))
      expect( assigns(:event_types) ).to all(be_an_instance_of( EventType ))
      expect( assigns(:ranking_updated_at) ).to be_a_kind_of( Numeric )
      expect( assigns(:season_ranking) ).to be_a_kind_of( Array )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
