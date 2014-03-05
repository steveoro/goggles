require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

require 'date'


describe 'log in' do
  before  {
    visit new_user_session_path()
    expect(page).to have_text( I18n.t('devise.new_session_title') )
    expect(page).to have_field( :user_email )
    expect(page).to have_field( :user_password )
  }
  subject { page }                                  # explicit subject for the feature tests

  describe 'user should be able to log in' do
    before do
      user = FactoryGirl.create(:user)
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_on 'Log in'
    end

    it { should have_link 'Log out' }
  end

end
# -----------------------------------------------------------------------------

