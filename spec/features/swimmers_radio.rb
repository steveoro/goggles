require 'spec_helper'


describe "Swimmers radio tab", :type => :feature do
  include ControllerMacros

  let(:chosen_swimmer) { create(:swimmer) }

  context "as an anonymous user," do
    before(:each) do
      visit swimmer_radio_path( id: chosen_swimmer.id )
    end

    it "shows successfully the detailed info for a chosen Swimmer" do
      expect( page ).to have_content( chosen_swimmer.get_full_name_with_nickname )
      expect( page ).to have_content( chosen_swimmer.year_of_birth.to_s )
      expect( page ).not_to have_content( I18n.t('radiography.link_to_gravatar_tooltip') )
    end

    it "doesn't have a link to change the avatar image" do

    end
  end
  #-- --------------------------------------------------------------------------
  #++


  context "when selecting a Swimmer corresponding to me," do
    before(:each) do
      login_user_with_capybara
      @user.set_associated_swimmer( chosen_swimmer )
      visit swimmer_radio_path( id: chosen_swimmer.id )
    end

    it "shows successfully the detailed info for a chosen Swimmer" do
      expect( page ).to have_content( chosen_swimmer.get_full_name_with_nickname )
      expect( page ).to have_content( chosen_swimmer.year_of_birth.to_s )
      expect( page ).to have_content( I18n.t('radiography.link_to_gravatar_tooltip') )
    end

    it "has a link to change the avatar image" do

    end
  end
  #-- --------------------------------------------------------------------------
  #++
end
#-- ----------------------------------------------------------------------------
#++


# Sample alternative version using Capybara DSL -- Which one do you prefer?


# feature "Swimmers radio tab" do
  # include ControllerMacros
#
  # given(:chosen_swimmer) { create(:swimmer) }
  # #-- --------------------------------------------------------------------------
  # #++
#
  # scenario "Show detailed info for a chosen Swimmer when not logged-in" do
    # visit swimmer_radio_path( id: chosen_swimmer.id )
    # expect( page ).to have_content( chosen_swimmer.get_full_name_with_nickname )
    # expect( page ).to have_content( chosen_swimmer.year_of_birth.to_s )
    # expect( page ).not_to have_content( I18n.t('radiography.link_to_gravatar_tooltip') )
  # end
  # #-- --------------------------------------------------------------------------
  # #++
#
  # scenario "Show detailed info for a chosen Swimmer corresponding to me" do
    # login_user_with_capybara
    # @user.set_associated_swimmer( chosen_swimmer )
    # visit swimmer_radio_path( id: chosen_swimmer.id )
    # expect( page ).to have_content( chosen_swimmer.get_full_name_with_nickname )
    # expect( page ).to have_content( chosen_swimmer.year_of_birth.to_s )
    # expect( page ).to have_content( I18n.t('radiography.link_to_gravatar_tooltip') )
  # end
  # #-- --------------------------------------------------------------------------
  # #++
# end
#-- ----------------------------------------------------------------------------
#++
