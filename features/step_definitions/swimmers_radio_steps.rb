
Given(/^a swimmer$/) do
  @swimmer = FactoryGirl.create( :swimmer )
end

Given(/^an anonymous user$/) do
  @current_user = nil
end


When(/^I browse to the radio page$/) do
  # FIXME This will fail:
  pending
  visit "swimmer/radio/#{ @swimmer.id }"
end


Then(/^I expect to see the detailed info about the swimmer$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I expect not to be able to click on the avatar image to customize it$/) do
  pending # express the regexp above with the code you wish you had
end


Given(/^a current user associated to the same swimmer$/) do
  @current_user = FactoryGirl.create( :user )
  @current_user.set_associated_swimmer( @swimmer )
# FIXME
#  @request.env["devise.mapping"] = Devise.mappings[:user]
  visit '/users/sign_in' # new_user_session_path()
  fill_in "user_email", with: @current_user.email
  fill_in "user_password", with: @current_user.password
  # FIXME Why 2 different locale files? The default devise.en.yml does not contain the key devise.new_session_submit !
  click_button 'Sign in' # I18n.t('devise.new_session_submit')
# FIXME
#  expect( response.status ).to eq(200)
#  controller.stub current_user: @current_user
end


Then(/^I expect to be able to click on the avatar image to customize it$/) do
  pending # express the regexp above with the code you wish you had
end
