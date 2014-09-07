=begin

= ControllerMacros

  - version:  1.02.000
  - author:   Steve A.

  Support module for RSpec for defining utility helpers for controller specs.

  Note that all the methods contained here are meant to be used at the instance
  level (that is inside a spec example or a block, like a before-hook body).
  This implies that this module must be included in RSpec configuration using
  #include (and not #extend).

=end
module ControllerMacros
  include Rails.application.routes.url_helpers

  # Default #url_for options override.
  def default_url_options( options = { locale: 'en', only_path: true } )
    @options = options
  end

  # Returns the #url_for the specified controller (using only its table name).
  # and action.
  #
  def url_to_action_for( table_name, action_name = 'index' )
    url_for(
      controller: table_name,
      action:     action_name,
      locale:     default_url_options[:locale],
      only_path:  default_url_options[:only_path]
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Logs-in an Admin instance created with FactoryGirl
  # before each test of the group when invoked.
  # Default RSpec version.
  #
  # Assigns an @admin User instance with the currently logged-in admin.
  #
  def login_admin
    @request.env["devise.mapping"] = :admin
    @admin = create(:admin)
    sign_in @admin
  end


  # Logs-in an Admin instance created with FactoryGirl
  # before each test of the group when invoked.
  # This version uses the Capybara stack for feature tests.
  #
  # Assigns an @admin User instance with the currently logged-in admin.
  #
  def login_admin_with_capybara( chosen_admin = nil )
    admin = chosen_admin || create(:admin)
    visit new_admin_session_path()
    fill_in "user_email", with: @admin.email
    fill_in "user_password", with: @admin.password
    click_button 'Sign in' # I18n.t('devise.new_session_submit')
#    expect(response.status).to eq(200)
#    controller.stub current_user: @admin
  end
  #-- -------------------------------------------------------------------------
  #++


  # Logs-in a User instance created with FactoryGirl
  # before each test of the group when invoked.
  # Default RSpec version with Devise-only authentication.
  #
  # Assigns an @user User instance with the currently logged-in user.
  #
  def login_user()
    @request.env["devise.mapping"] = :user
    @user = create(:user)
    sign_in @user
  end


  # Logs-in a User instance created with FactoryGirl
  # before each test of the group when invoked.
  # This version uses the Capybara stack for feature tests.
  #
  # Assigns an @user User instance with the currently logged-in user.
  #
  def login_user_with_capybara( chosen_user = nil )
    @user = chosen_user || create(:user)
    visit new_user_session_path()
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button 'Sign in' # I18n.t('devise.new_session_submit')
#    expect( response.status ).to eq(200)
#    controller.stub current_user: @user
  end
  #-- -------------------------------------------------------------------------
  #++


  # Login checker for GET actions only.
  #
  # GETs the specified <tt>action_sym</tt> (/:id) and
  # expects the response to redirect to the sign-in session page.
  #
  def get_action_and_check_if_its_the_login_page_for( action_sym, id = nil )
    get action_sym, id: id
    expect(response).to redirect_to '/users/sign_in' # new_user_session_path() => '/users/sign_in?locale=XX'
    expect(response.status).to eq( 302 )            # must redirect to the login page
  end
  #-- -------------------------------------------------------------------------
  #++
end