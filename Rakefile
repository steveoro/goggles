# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

# [Steve A.] Launch any fixture-related task prefixing it with the dedicated ":factories"
# task in order to import the definitions before the task execution.
# When done by hand (for example, on the console), simply import the factories
# directly from core engine by typing:
#
# $> FactoryGirl.definition_file_paths = ["#{ GogglesCore::Engine.root }/spec/factories"]
# $> FactoryGirl.reload
