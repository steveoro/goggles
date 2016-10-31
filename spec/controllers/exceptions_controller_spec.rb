require 'rails_helper'

RSpec.describe ExceptionsController, type: :controller do

  describe '[(no route) #render_error]' do
    # FIXME (not tested / untestable w/ current routes)

#    subject { ExceptionsController.action(:render_error).call( Rails.env ) }

    # it "displays the status_code" do
      # status_code = ActionDispatch::ExceptionWrapper.new( Rails.env, Exception.new("Test") ).status_code
      # expect( subject.body ).to include( status_code )
    # end
  end
  #-- -------------------------------------------------------------------------
  #++
end
