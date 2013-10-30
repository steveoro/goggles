# encoding: utf-8
require 'date'
require 'rubygems'
require 'find'
require 'fileutils'

require 'rails/all'
require File.join( Rails.root.to_s, 'config/environment' )

require 'framework/console_logger'
require 'parsers/data_importer'


=begin

= Data-Import Helper tasks

  - Goggles framework vers.:  4.00.78.20131030
  - author: Steve A.

  Data-Import rake tasks. 

=end
namespace :dataimport do

  desc <<-DESC
  Executes the data-import process as a batch, delayed job.
All files found in the designated directory will be enqued, processed
and consumed.
  DESC
  task :batch do |t|
    puts "*** Data-Import batch execution ***"
    rails_config  = Rails.configuration             # Prepare & check configuration:
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
                                                    # Display some info:
    puts "DB name:      #{db_name}"
    puts "DB user:      #{db_user}"
    puts "\r\nTODO..."
#    Rake::Task['db:drop'].invoke
#    puts "\r\nRecreating DB..."
#    sh "mysql --user=#{db_user} --password=#{db_pwd} --execute=\"create database #{db_name}\""
  end
  # ---------------------------------------------------------------------------
end
# =============================================================================


