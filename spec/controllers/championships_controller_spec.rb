require 'spec_helper'
require 'ffaker'
require 'wice_grid'


describe ChampionshipsController, :type => :controller do

  describe '[GET #supermaster_fin]' do
    context "with an HTML request," do
      it "handles successfully the request" do
        get :supermaster_fin
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :supermaster_fin
        expect( assigns(:title) ).to be_an_instance_of( String )
      end
      it "renders the form template" do
        get :supermaster_fin
        expect(response).to render_template(:supermaster_fin)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #regional_er_csi]' do
    context "with an HTML request," do
      it "handles successfully the request" do
        get :regional_er_csi
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :regional_er_csi
        expect( assigns(:title) ).to be_an_instance_of( String )
      end
      it "renders the form template" do
        get :regional_er_csi
        expect(response).to render_template(:regional_er_csi)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #history]' do
    context "with an HTML request," do
      it "handles successfully the request" do
        get :history
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :history
        expect( assigns(:title) ).to be_an_instance_of( String )
      end
      it "renders the form template" do
        get :history
        expect(response).to render_template(:history)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

end
