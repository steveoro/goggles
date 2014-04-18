source 'https://rubygems.org'

gem 'rails', '~> 3.2.16'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'json'

# [Steve] Before enabling the following, most of the migrations must be revised
#         since they are still using legacy inline SQL code for foreign key generation:
# gem 'schema_plus'                                 # Adds automatic foreign-key support to ActiveRecord DSL

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery_datepicker'

gem 'execjs'                                        # This requires a local (package) install of node.js
#gem 'therubyracer', :platform => :ruby               # This seems to be the only one feasible on the EC2 micro instance
#gem 'therubyrhino', :platforms => :ruby

                                                    # [Steve, 20111216] Netzke:
gem 'netzke-core', '~> 0.7.7'			      #, :git => "git://github.com/skozlov/netzke-core.git"
gem 'netzke-basepack', '~> 0.7.7'		    #, :git => "git://github.com/skozlov/netzke-basepack.git"

gem 'i18n'                                          # [Steve, 20111216] Internationalization library

gem 'ruport', :git => 'https://github.com/ruport/ruport.git', :branch => 'ruby19-compat'
gem 'acts_as_reportable'
gem 'prawn', '~> 0.14'
                                                    # [Steve, 20130412] Custom Documatic version (used for Ooo exports):
gem 'documatic', :git => 'https://github.com/fasar-sw/documatic.git'

gem 'generator'

# To use uploads:
gem 'carrierwave'

gem 'zip'
gem 'rubyzip', :require => 'zip/zip'
                                                    # [Steve, 20130715] Goggles-specific:
gem 'devise'
gem 'devise-i18n'
gem 'simple_token_authentication'
gem 'rails_admin'
                                                    # [Steve, 20130801] Navigation gems for rendering menus & breadcrumbs:
gem "simple-navigation"
gem 'simple-navigation-bootstrap'

gem "fuzzy-string-match_pure"                       # [Steve, 20131106] Used for Team/Swimmer names comparison & existence checking

gem "wice_grid", '~> 3.3'
gem 'daemons'
gem 'delayed_job_active_record'
gem 'dj_mon', :git => 'https://github.com/fasar-sw/dj_mon.git'    # This version has more verbose exception reporting instead of YAML trace
gem 'amistad', :git => 'https://github.com/fasar-sw/amistad.git'  # [Steve] Customized version. For Facebook-like friendship management

gem 'country_select'
gem 'simple_form'
gem "cocoon"

gem 'draper', '~> 1.3'                              # [Steve] For Decorator pattern support
# Draper usage: "rails generate decorator Article" for existing models,
# or "rails generate resource Article" to scaffold a new resource;
#   Single instance => Article.first.decorate
#   Indirect        => ArticleDecorator.decorate( OtherCompatibleModel.first )
#   Collection      => ArticleDecorator.decorate_collection( Article.all )

gem "mechanize"                                     # [Steve, 20140306] For web-crawling tasks
gem "rest-client"
gem 'capistrano',  '~> 3.1'                         # Deploy with Capistrano


group :development do
  gem 'capistrano-rvm'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'seed_dump', '~> 0.5.3'                         # [Steve, 20130926] Version greater than this one are ment only for Rails 4!!
end


group :test do
  gem "rspec"
  gem "rspec-rails"
  gem "capybara"                                    # [Steve, 20140226] Used only in Feature Specs
  gem "factory_girl_rails"
  gem 'guard'
  gem 'guard-rspec'
  gem 'rspec_api_blueprint', require: false
                                                    # [Steve, 20140312] Added these to build test coverage stats reports (open: /goggles/coverage/index.html)
  gem 'simplecov', '~> 0.7.1', require: false
  gem "codeclimate-test-reporter", require: false   # [Steve, 20140321] CI/Test coverage via local test run
  gem 'coveralls', require: false                   # [Steve, 20140312] Uses simplecov to obtain test-coverage badge

  # For using this one, keep in mind http://rubydoc.info/gems/faker/1.3.0/frames
  gem 'ffaker', require: false                      # Adds dummy names & fixture generator 
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

gem 'rhc'                                           # [Steve, 20140426] For deployment to OpenShift (RedHat)

# To use debugger
#gem 'ruby-debug'

