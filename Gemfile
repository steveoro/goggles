if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

gem "mysql2"

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
gem 'therubyracer'
# gem 'therubyrhino', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# gem 'jquery_datepicker' # FIXME THIS SEEMS TO BE INCOMPATIBLE W/ RAILS 5
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem "json"
gem "haml"

gem "goggles_core", git: "git@github.com:steveoro/goggles_core", branch: "rails5"

# XXX [Steve, 20160920] Too many issues w/ SafeYAML, regarding ActiveRecord,
# Guard & DelayedJob (See https://github.com/dtao/safe_yaml#known-issues).
# gem "syck"                              # old-skool YAML interpreter used by some of our gems
# gem 'safe_yaml'
# XXX When using safe_yaml, these 2 must be set
# (but a warning persist anyway on the command line, since load_file is called internally by system requires)
# SafeYAML::OPTIONS[:default_mode] = :safe # or :unsafe
# SafeYAML::OPTIONS[:deserialize_symbols] = true

                                        # [Steve, 20130801] Navigation gems for rendering menus & breadcrumbs:
gem "simple-navigation"
gem 'simple-navigation-bootstrap'

gem "wice_grid"

# [Steve] Customized version. For Facebook-like friendship management
gem "amistad", git: "git@github.com:fasar-sw/amistad", branch: "rails5"
gem "ruport",  git: "git@github.com:ruport/ruport" #, branch: "ruby19-compat"
gem 'acts_as_reportable'
gem 'prawn' #, '~> 0.15'
                                                    # [Steve, 20130412] Custom Documatic version (used for Ooo exports):
gem 'documatic', git: "git@github.com:fasar-sw/documatic"

gem 'country_select'
gem 'simple_form'
gem "cocoon"
gem "nokogiri"                                      # Used for HTML DOCModel easy tampering
gem 'generator'
gem 'zip'
gem 'rubyzip', require: 'zip/zip'

gem 'rubocop', require: false                       # [Steve] For style checking


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
  gem 'capistrano',  '~> 3.4'                       # Deploy with Capistrano
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
end

# To use debugger
# gem 'ruby-debug'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
