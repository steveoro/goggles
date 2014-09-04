require 'spec_helper'


# describe "Swimmers radio tab", :type => :feature do
  # include ControllerMacros
#
  # let(:chosen_swimmer) { create(:swimmer) }
#
  # context "as an anonymous user," do
    # before(:each) do
      # visit swimmer_radio_path( id: chosen_swimmer.id )
    # end
#
    # it "shows successfully the detailed info for a chosen Swimmer" do
      # expect( page ).to have_content( chosen_swimmer.get_full_name_with_nickname )
      # expect( page ).to have_content( chosen_swimmer.year_of_birth.to_s )
    # end
#
# #    it "doesn't have a link to change the avatar image" do
# #      expect( page.html ).not_to have_content "gravatar.com" # I18n.t('radiography.link_to_gravatar_tooltip')
# #    end
  # end
  # #-- --------------------------------------------------------------------------
  # #++
#
#
  # context "when selecting a Swimmer corresponding to me," do
     # before(:each) do
      # login_user_with_capybara
      # @user.set_associated_swimmer( chosen_swimmer )
# # FIXME this ^^ should have the same effect that the whole bunch of rows below:
# # NOTE: ...But it doesn't, because of the current test-db set-up: we cannot use transactional fixtures on feature tests
# #       we either have to re-create from scratch the whole DB before the tests to get the seeds in place or use another approach!
      # chosen_swimmer.associated_user_id = @user.id
      # chosen_swimmer.save!
      # expect( chosen_swimmer.associated_user_id ).to eq( @user.id )
      # @user.swimmer_id = chosen_swimmer.id
      # @user.save!
      # expect( @user.swimmer_id ).to eq( chosen_swimmer.id )
#
      # visit swimmer_radio_path( id: chosen_swimmer.id )
    # end
#
    # it "shows successfully the detailed info for a chosen Swimmer" do
      # expect( page ).to have_content( chosen_swimmer.get_full_name_with_nickname )
      # expect( page ).to have_content( chosen_swimmer.year_of_birth.to_s )
    # end
#
# #    it "has a link to change the avatar image" do
# #      expect( page.html ).to have_content "gravatar.com" # I18n.t('radiography.link_to_gravatar_tooltip')
# #    end
  # end
  # #-- --------------------------------------------------------------------------
  # #++
# end
#-- ----------------------------------------------------------------------------
#++


# Sample alternative version using Capybara DSL -- Which one do you prefer?


feature "Swimmers radio tab" do
  include ControllerMacros

  given(:chosen_swimmer) { create(:swimmer) }
  #-- --------------------------------------------------------------------------
  #++

  scenario "An unlogged user shows the detailed info page for a Swimmer" do
    visit swimmer_radio_path( id: chosen_swimmer.id )
    expect( page ).to have_content( chosen_swimmer.get_full_name_with_nickname )
    expect( page ).to have_content( chosen_swimmer.year_of_birth.to_s )
  end
  #-- --------------------------------------------------------------------------
  #++

  scenario "An logged user shows the detailed info page for a Swimmer" do
    login_user_with_capybara
#    @user.set_associated_swimmer( chosen_swimmer )
    visit swimmer_radio_path( id: chosen_swimmer.id )
    expect( page ).to have_content( chosen_swimmer.get_full_name_with_nickname )
    expect( page ).to have_content( chosen_swimmer.year_of_birth.to_s )
  end
  #-- --------------------------------------------------------------------------
  #++
end
#-- ----------------------------------------------------------------------------
#++
