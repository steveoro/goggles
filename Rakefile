#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require File.expand_path('../config/application', __FILE__)
Goggles::Application.load_tasks

# [Steve A.] Launch any fixture-related task prefixing it with the dedicated ":factories"
# task in order to import the definitions before the task execution.
#
# When done by hand (for example, on the console), simply import the factories
# directly from core engine by typing:
#
# $> FactoryGirl.definition_file_paths = ["#{ GogglesCore::Engine.root }/spec/factories"]
# $> FactoryGirl.reload
