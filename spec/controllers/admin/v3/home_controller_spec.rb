require 'spec_helper'


describe Admin::V3::MaintenanceController, :type => :controller do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create( :user )
  end


  describe '[GET data_import/index]' do
    context "as an unlogged user," do
      it "refuses the request"
    end


    context "as a logged-in admin," do
# TODO:
#     it_behaves_like( "(Admin-Controllers, successful GET action)", "index" )

      context "with some existing data-import session," do
        it "has the full list of existing data-import sessions"
      end
    end
  end


  # TODO

  #-- -------------------------------------------------------------------------
  #++
end
