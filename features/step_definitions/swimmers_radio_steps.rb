
Given(/^a swimmer$/) do
  @swimmer = FactoryGirl.create( :swimmer )
end

Given(/^an anonymous user$/) do
  @current_user = nil
end


When(/^I browse to the radio page$/) do
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
end

Then(/^I expect to be able to click on the avatar image to customize it$/) do
  pending # express the regexp above with the code you wish you had
end
