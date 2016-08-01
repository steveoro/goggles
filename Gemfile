if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
source 'https://rubygems.org'

gem "rails", "3.2.22.2"

gem "mysql2", "~> 0.3.11"


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery_datepicker'

gem "json"
gem "haml", "~> 4.0.5"

gem "goggles_core", git: "git://github.com/steveoro/goggles_core.git"

gem 'execjs'
gem 'therubyracer'
# gem 'therubyrhino', platforms: :ruby

gem "syck"                              # old-skool YAML interpreter used by some of our gems
gem 'safe_yaml'
                                        # [Steve, 20130801] Navigation gems for rendering menus & breadcrumbs:
gem "simple-navigation"
gem 'simple-navigation-bootstrap'

gem "wice_grid"

# [Steve] Customized version. For Facebook-like friendship management
gem "amistad", git: "git://github.com/fasar-sw/amistad.git", branch: "version5"
gem "ruport",  git: "git://github.com/ruport/ruport.git", branch: "ruby19-compat"
gem 'acts_as_reportable'
gem 'prawn', '~> 0.15'

gem 'country_select'
gem 'simple_form'
gem "cocoon"
gem "nokogiri"                                      # Used for HTML DOCModel easy tampering
                                                    # [Steve, 20130412] Custom Documatic version (used for Ooo exports):
gem 'documatic', git: "git://github.com/fasar-sw/documatic.git"
gem 'generator'
gem 'zip'
gem 'rubyzip', :require => 'zip/zip'

gem 'rubocop', require: false                       # [Steve] For style checking


group :development do
  gem "better_errors", '~> 1.1.0'
  gem "binding_of_caller"
  gem 'rails_best_practices'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-shell'
#  gem 'rspec_api_blueprint', require: false
#  gem "airbrussh", :require => false

  # Although Capistrano + seed_dump are strictly development-related gems,
  # including them into the test environment also allows Semaphore CI to
  # perform automated deployment from a test build without changing the current
  # Rails environment.
  gem 'capistrano',  '~> 3.4'                       # Deploy with Capistrano
  gem 'capistrano-rvm'
  gem 'capistrano-bundler' #, '~> 1.1.2'
  gem 'capistrano-rails' #, '~> 1.1'
  gem 'capistrano-passenger'
  gem 'seed_dump', '~> 0.5.3'                       # [Steve, 20130926] Version greater than this one are ment only for Rails 4!!
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
