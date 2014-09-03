
Given( /^a "(.*?)"$/ ) do |fixture_object|
  @selected_fixture_object = FactoryGirl.create( fixture_object.to_sym )
end


Given( /^I am not signed-in$/ ) do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test # :selenium
    # Devise uses DELETE for sign_out while Cucumber wants to test only
    # GET requests. So we do this directly, instead:
    page.driver.submit :delete, "/users/sign_out", {}
  ensure
    Capybara.current_driver = current_driver
  end
end


Given( /^I am an authenticated user$/ ) do
  @current_user = FactoryGirl.create( :user )
  visit '/users/sign_in' # new_user_session_path()
  fill_in "user_email",    with: @current_user.email
  fill_in "user_password", with: @current_user.password
  click_button "Sign in"
end


Given( /^my user is associated to the swimmer$/ ) do
  @current_user.set_associated_swimmer( @selected_fixture_object )
end
#-- ----------------------------------------------------------------------------
#++


When( /^I browse to the radio page$/ ) do
  # FIXME This will fail:
#  pending
  visit "swimmer/radio/#{ @selected_fixture_object.id }"
end
#-- ----------------------------------------------------------------------------
#++


Then( /^I expect to see the detailed info about the swimmer$/ ) do
  pending # express the regexp above with the code you wish you had
end


Then( /^I expect not to be able to click on the avatar image to customize it$/ ) do
  pending # express the regexp above with the code you wish you had
end


Then( /^I expect to be able to click on the avatar image to customize it$/ ) do
  pending # express the regexp above with the code you wish you had
end
#-- ----------------------------------------------------------------------------
#++
