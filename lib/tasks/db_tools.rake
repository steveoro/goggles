# encoding: utf-8
require 'date'
require 'rubygems'
require 'fileutils'
require 'mechanize'
require File.join( Dir.pwd.to_s, 'config/environment' )

require 'framework/console_logger'
require 'parsers/data_importer'


=begin

= DB-utility tasks

  - Goggles framework vers.:  4.00.241.20140424
  - author: Steve A.

  (ASSUMES TO BE rakeD inside Rails.root)

=end
# -----------------------------------------------------------------------------


namespace :db do

  desc <<-DESC
  Scans a specific entity or the whole database for ActiveRecord
  validation errors on existing data.
  
  This method does not alter the database in anyway, it simply outputs
  a list of blamed row IDs with their JSON error message(s).

  Options: entity=[<entity_name_camelcase>|'Meeting']

  - entity_name_camelcase => Meeting, MeetingIndividualResult, ...
  DESC
  task :check_validations do |t|
    puts "\r\n*** db:check_validations ***"
    entity = ENV.include?("entity") ? ENV["entity"].to_s.camelize : 'Meeting'
    rails_config  = Rails.configuration             # Prepare & check configuration:
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    db_host       = rails_config.database_configuration[Rails.env]['host']
    klass = eval(entity.camelize)
                                                    # Display some info:
    puts "DB host: #{db_host}"
    puts "DB name: #{db_name}"
    puts "DB user: #{db_user}"
    puts "\r\nChecking validations for '#{klass.name}'..."
    puts "\r\n---------------- 8< -------------------"
    errors_found = 0
    klass.all.each do |row|
      if row.invalid?
        puts "ID: #{row.id} => #{row.errors().messages.to_json}"
        errors_found += 1
      end
    end
    puts "\r\n---------------- 8< -------------------"
    puts "\r\nTotal validation errors found: #{errors_found > 0 ? errors_found : 'NONE found! ...Yeay! Rejoyce and dance! :)'}"
    puts "\r\nDone."
  end
  # ---------------------------------------------------------------------------
end
# =============================================================================
