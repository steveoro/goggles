if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

gem 'mysql2'
gem 'activerecord-session_store' # Needed to include a DB-based session store in Rails 4+

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'execjs'
gem 'therubyracer', platforms: :ruby
# gem 'therubyrhino', platforms: :ruby

# [Steve, 20161005] Font Awesome is used by WiceGrid instead of the old icons:
gem 'font-awesome-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem "json"
gem "haml-rails"

# XXX When using ssh key use the protocol below:
#gem "goggles_core", git: "git@github.com:steveoro/goggles_core", branch: "rails5"
gem "goggles_core", git: "https://github.com/steveoro/goggles_core"

# XXX [Steve, 20160920] DO NOT USE SafeYAML. Too many issues w/ ActiveRecord,
# Guard & DelayedJob (See https://github.com/dtao/safe_yaml#known-issues).

                                        # [Steve, 20130801] Navigation gems for rendering menus & breadcrumbs:
gem "simple-navigation"
gem 'simple-navigation-bootstrap'

gem "wice_grid", git: "https://github.com/fasar-sw/wice_grid", branch: "rails5"
# (original master is located at /leikind/wice_grid)

# [Steve] Customized version. For Facebook-like friendship management
# XXX When using ssh key use the protocol below:
#gem "amistad", git: "git@github.com:fasar-sw/amistad", branch: "rails5"
gem "amistad", git: "https://github.com/fasar-sw/amistad", branch: "rails5"
gem 'acts_as_reportable'
gem 'prawn', '~> 2.1'
gem 'prawn-table'

# [Steve, 20130412] Custom Documatic version (used for Ooo exports):
# XXX When using ssh key use the protocol below:
#gem 'documatic', git: "git@github.com:fasar-sw/documatic"
gem 'documatic', git: "https://github.com/fasar-sw/documatic"

gem 'country_select'
gem 'simple_form'
gem "cocoon"
gem "nokogiri"                                      # Used for HTML DOCModel easy tampering
gem 'generator'
gem 'zip'

# [Steve, 20171117] Fix for potential vulnerability w/ specific version:
gem 'rubyzip', '~> 1.2.1', require: 'zip/zip'
gem 'rubocop', '~> 0.49.0', require: false                       # [Steve] For style checking

gem "recaptcha", require: "recaptcha/rails"
gem "rest-client"                                   # For api/v1/meetings/download

group :development do
  gem "better_errors" #, '~> 1.1.0'
  gem "binding_of_caller"
  gem 'rails_best_practices'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-shell'
#  gem 'rspec_api_blueprint', require: false
#  gem "airbrussh", require: false

  # Although Capistrano + seed_dump are strictly development-related gems,
  # including them into the test environment also allows Semaphore CI to
  # perform automated deployment from a test build without changing the current
  # Rails environment.
  gem 'capistrano',  '~> 3.6'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  # [Steve, 20160919] Do we still need the following one anymore? Really?
#  gem 'seed_dump' #, '~> 0.5.3'                       # [Steve, 20130926] Version greater than this one are ment only for Rails 4!!

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'

  # [Steve, 20160919] Spring disabled, since we're already using Zeus:
  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
#  gem 'spring'
#  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem "rspec"
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "ffaker"                                      # Adds dummy names & fixture generator
  # The driver for browser testing may be switched back to the default (:rack_test,
  # without Javascript support) with: > Capybara.use_default_driver
  #gem 'selenium-webdriver'                          # Full browser simulation => Capybara.current_driver = :selenium
  # FIXME not working on Leega workstation:
#  gem 'capybara-webkit'                             # Headless browser simulation (faster) => Capybara.current_driver = :webkit
  gem "letter_opener"

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end


group :test do
  gem "zeus", require: false
  # FIXME (Low-pri) This is required by Draper inside the core engine, probably due to some wrong setting:
  gem "test-unit"
  gem "capybara"                                    # [Steve, 20140226] Used only in Feature Specs
  # The driver for browser testing may be switched back to the default (:rack_test,
  # without Javascript support) with: > Capybara.use_default_driver
  #gem 'selenium-webdriver'                          # Full browser simulation => Capybara.current_driver = :selenium
  # FIXME not working on Leega workstation:
#  gem 'capybara-webkit'                             # Headless browser simulation (faster) => Capybara.current_driver = :webkit
                                                    # [Steve, 20140312] Added these to build test coverage stats reports (open: /goggles/coverage/index.html)
  gem 'simplecov', require: false
  gem "codeclimate-test-reporter", require: false   # [Steve, 20140321] CI/Test coverage via local test run
  gem 'coveralls', require: false                   # [Steve, 20140312] Uses simplecov to obtain test-coverage badge
  gem 'pullreview-coverage', require: false         # [Steve, 20160801] Updated coverage by PullReview

  # FIXME High-priority: remove usage of 'assigns' & 'render_template' in tests
  gem 'rails-controller-testing'
end

# To use debugger
# gem 'ruby-debug'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
