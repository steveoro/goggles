module ControllerMacros

  # Logs-in an Admin instance created with FactoryGirl
  # before each test of the group when invoked.
  # Default RSpec version.
  #
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = :admin
      @admin = create(:admin)
      sign_in @admin
    end
  end


  # Logs-in an Admin instance created with FactoryGirl
  # before each test of the group when invoked.
  # This version uses the Capybara stack for feature tests.
  #
  def login_admin_with_capybara
    before(:each) do
      admin = create(:admin)
      visit new_admin_session_path()
      fill_in "user_email", :with => admin.email
      fill_in "user_password", :with => admin.password
      click_button I18n.t('devise.new_session_submit')
      expect(response.status).to eq(200)
      controller.stub :current_admin => admin
    end
  end
  # ---------------------------------------------------------------------------


  # Logs-in a User instance created with FactoryGirl
  # before each test of the group when invoked.
  # Default RSpec version with Devise-only authentication.
  #
  def login_user()
    before(:each) do
      @request.env["devise.mapping"] = :user
      @user = create(:user)
      sign_in @user
    end
  end


  # Logs-in a User instance created with FactoryGirl
  # before each test of the group when invoked.
  # This version uses the Capybara stack for feature tests.
  #
  def login_user_with_capybara
    before(:each) do
      @user = create(:user)
# Not really required right now:
#      @request.env["devise.mapping"] = Devise.mappings[:user]
      visit new_user_session_path()
      fill_in "user_email", :with => @user.email
      fill_in "user_password", :with => @user.password
      click_button I18n.t('devise.new_session_submit')
      expect(response.status).to eq(200)
      controller.stub :current_user => @user
    end
  end
  # ---------------------------------------------------------------------------

end