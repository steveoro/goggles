require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

require 'date'


describe 'Log in' do
  before  {
    visit new_user_session_path()
    expect(page).to have_text( I18n.t('devise.new_session_title') )
    expect(page).to have_field( :user_email )
    expect(page).to have_field( :user_password )
  }
  subject { page }                                  # explicit subject for the feature tests

  describe '[AUTH user]' do
    it 'submits valid credentials' do
      user = FactoryGirl.create(:user)
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_on I18n.t('devise.new_session_submit')
      # TODO eventually identify & test other common features for the log-in process (i.e.: planned Avatar image display and so on...)
    end
  end

end
# -----------------------------------------------------------------------------

