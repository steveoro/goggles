require 'spec_helper'


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
      login_user_with_capybara( create(:user) )
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


describe "Swimmers misc tab", type: :feature, wip: true do
  include ControllerMacros

  let(:chosen_swimmer) { create(:swimmer) }

  context "as an authorized user," do
    before(:each) do
      login_user_with_capybara( create(:user) )
      visit swimmer_misc_path( id: chosen_swimmer.id )
    end

    it "shows the score computation page for a chosen Swimmer" do
      expect( page ).to have_content( chosen_swimmer.get_full_name )
    end
  end
end
#-- ----------------------------------------------------------------------------
#++
