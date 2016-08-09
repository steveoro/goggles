require 'rails_helper'


describe "Swimmers index/search", type: :feature, wip: true do
  include ControllerMacros

  context "as an anonymous user," do
    before(:each) do
      visit swimmers_path()
    end

    it "shows successfully the search grid" do
      expect( page ).to have_content( I18n.t('swimmers.complete_name') )
    end
  end
end
#-- ----------------------------------------------------------------------------
#++


describe "Swimmers radio tab", type: :feature, wip: true do
  include ControllerMacros

  let(:chosen_swimmer) { create(:swimmer) }

  context "as an anonymous user," do
    before(:each) do
      visit swimmer_radio_path( id: chosen_swimmer.id )
    end

    it "shows successfully the detailed info for a chosen Swimmer" do
      expect( page ).to have_content( chosen_swimmer.get_full_name_with_nickname )
      expect( page ).to have_content( chosen_swimmer.year_of_birth.to_s )
    end
  end
end
#-- ----------------------------------------------------------------------------
#++


describe "Swimmers medals tab", type: :feature, wip: true do
  include ControllerMacros

  let(:chosen_swimmer) { create(:swimmer) }

  context "as an authorized user," do
    before(:each) do
      # Login User using Capybara:
      @user = create(:user)
      visit new_user_session_path()
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button I18n.t('devise.new_session_submit')
      # Visit the actual test path:
      visit swimmer_medals_path( id: chosen_swimmer.id )
    end

    it "shows successfully the medal count for a chosen Swimmer" do
      expect( page ).to have_content( I18n.t('radiography.total_gold_medals') )
      expect( page ).to have_content( I18n.t('radiography.total_silver_medals') )
      expect( page ).to have_content( I18n.t('radiography.total_bronze_medals') )
    end
  end
end
#-- ----------------------------------------------------------------------------
#++


describe "Swimmers best-timings tab", type: :feature, wip: true do
  include ControllerMacros

  let(:chosen_swimmer) { create(:swimmer) }

  context "as an authorized user," do
    before(:each) do
      # Login User using Capybara:
      @user = create(:user)
      visit new_user_session_path()
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button I18n.t('devise.new_session_submit')
      # Visit the actual test path:
      visit swimmer_best_timings_path( id: chosen_swimmer.id )
    end

    it "shows the best-timings page for a chosen Swimmer" do
      expect( page ).to have_content( I18n.t('radiography.best_timings_tab') )
    end
  end
end
#-- ----------------------------------------------------------------------------
#++


describe "Swimmers full_history_1 tab", type: :feature, wip: true do
  include ControllerMacros

  let(:chosen_swimmer) { create(:swimmer) }

  context "as an authorized user," do
    before(:each) do
      # Login User using Capybara:
      @user = create(:user)
      visit new_user_session_path()
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button I18n.t('devise.new_session_submit')
      # Visit the actual test path:
      visit swimmer_full_history_1_path( id: chosen_swimmer.id )
    end

    it "shows the full_history_by_date page for a chosen Swimmer" do
      expect( page ).to have_content( I18n.t('radiography.full_history_by_date') )
    end
  end
end
#-- ----------------------------------------------------------------------------
#++


describe "Swimmers full_history_2 tab", type: :feature, wip: true do
  include ControllerMacros

  let(:chosen_swimmer) { create(:swimmer) }

  context "as an authorized user," do
    before(:each) do
      # Login User using Capybara:
      @user = create(:user)
      visit new_user_session_path()
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button I18n.t('devise.new_session_submit')
      # Visit the actual test path:
      visit swimmer_full_history_2_path( id: chosen_swimmer.id )
    end

    it "shows the full_history_by_event page for a chosen Swimmer" do
      expect( page ).to have_content( I18n.t('radiography.full_history_by_event') )
    end
  end
end
#-- ----------------------------------------------------------------------------
#++

# TODO [Steve 20141207] Either remove all these feature tests completely or find a suitable
#      configuration to them work with the rest of the examples.

# describe "Swimmers trainings tab", type: :feature, wip: true do
  # include ControllerMacros
#
  # let(:chosen_swimmer) { create(:swimmer) }
#
  # context "as an authorized user," do
    # before(:each) do
      # # We need to set this to make the redirect_to(:back) pass the tests:
# #      request.env["HTTP_REFERER"] = swimmers_path()
      # login_user( create(:user) )
      # visit swimmer_trainings_path( id: chosen_swimmer.id )
    # end
#
    # it "shows the page of trainings for the chosen Swimmer" do
      # expect( page ).to have_content( chosen_swimmer.get_full_name )
    # end
  # end
# end
# #-- ----------------------------------------------------------------------------
# #++
