require 'capistrano/setup'                          # Load DSL and Setup Up Stages
require 'capistrano/deploy'                         # Includes default deployment tasks
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/console'

# [Steve, 20150325] Custom formatter for Capistrano output: CURRENTLY BROKEN
# require "airbrussh/capistrano"

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#
# require 'capistrano/rbenv'
# require 'capistrano/chruby'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.r*').each { |r| import r }
