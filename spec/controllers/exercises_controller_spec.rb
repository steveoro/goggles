require 'rails_helper'

require 'date'
require 'common/format'


describe ExercisesController, type: :controller do

  describe '[AJAX #json_list]' do
    context "unlogged user" do
      it "displays always the Login page" do
        get( :json_list, xhr: true )
        expect(response.status).to eq( 401 )            # invalid request / not found
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "logged-in user" do
      before(:each) { login_user() }

      it "handles successfully the request" do
        get( :json_list, xhr: true )
        expect(response.status).to eq(200)     # 302 (redirect) means the user is not logged in
      end
      it "retrieves a list of rows" do
        get( :json_list, xhr: true )
        expect( response.body ).not_to be_nil
        # FIXME this does not check that the response contains an actual JSON array of rows
        expect( response.body ).to include( 'label', 'value', 'tot_distance', 'tot_secs' )
        expect( response.body ).to include(
          'is_arm_aux_allowed', 'is_kick_aux_allowed',
          'is_body_aux_allowed', 'is_breath_aux_allowed'
        )
      end

      it "retrieves a single row with details" do
        get( :json_list, xhr: true, params: { id: 1 } )
        expect( response.body ).not_to be_nil
        # FIXME this does not check that the response contains just a JSONified row
        expect( response.body ).to include( 'label', 'value', 'tot_distance', 'tot_secs' )
        expect( response.body ).to include(
          'is_arm_aux_allowed', 'is_kick_aux_allowed',
          'is_body_aux_allowed', 'is_breath_aux_allowed'
        )
      end
    end
  end
  # ===========================================================================
end
