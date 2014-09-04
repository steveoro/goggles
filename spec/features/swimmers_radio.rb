require 'spec_helper'

describe "Swimmers radio tab", :type => :feature do
  include ControllerMacros

  let(:chosen_swimmer) { create(:swimmer) }

  context "as an anonymous user," do
    before(:each) do
      visit swimmer_radio_path( id: chosen_swimmer.id )
    end

    it "shows successfully the detailed info for a chosen Swimmer" do
      expect(page).to include( chosen_swimmer.get_full_name_with_nickname )
      expect(page).to include( chosen_swimmer.year_of_birth )
    end

    it "doesn't have a link to change the avatar image" do

    end
  end
  #-- --------------------------------------------------------------------------
  #++


  context "when selecting a Swimmer corresponding to me," do
    before(:each) do
      login_user_with_capybara
      visit swimmer_radio_path( id: chosen_swimmer.id )
    end

    it "shows successfully the detailed info for a chosen Swimmer" do
      expect(page).to include( chosen_swimmer.get_full_name_with_nickname )
      expect(page).to include( chosen_swimmer.year_of_birth )
    end

    it "has a link to change the avatar image" do

    end
  end
  #-- --------------------------------------------------------------------------
  #++
end
#-- ----------------------------------------------------------------------------
#++



# feature "Swimmers radio tab" do

#  background do
#    login_user
#    User.make(:email => 'user@example.com', :password => 'caplin')
#  end

#  given(:chosen_swimmer) { create(:swimmer) }
  #-- --------------------------------------------------------------------------
  #++


#  scenario "Show detailed info for a chosen Swimmer when not logged-in" do
#    visit '/sessions/new'
#    within("#session") do
#      fill_in 'Email', :with => 'user@example.com'
#      fill_in 'Password', :with => 'caplin'
#    end
#    click_button 'Sign in'
#    expect(page).to have_content 'Success'

#    visit swimmer_radio_path( chosen_swimmer )
#  end
  #-- --------------------------------------------------------------------------
  #++


#  scenario "Show detailed info for a chosen Swimmer corresponding to me" do
#    login_user_with_capybara
#    visit '/users/sign_in' # new_user_session_path()
#    within("#session") do
#      fill_in "user_email",    with: @user.email
#      fill_in "user_password", with: @user.password
#    end
#    click_button 'Sign in'

#    expect(page).to have_content 'Invalid email or password'

#    visit swimmer_radio_path( chosen_swimmer )
#  end
  #-- --------------------------------------------------------------------------
  #++
# end
#-- ----------------------------------------------------------------------------
#++
