# encoding: utf-8
require 'date'
require 'rubygems'
require 'fileutils'
require 'mechanize'

require 'framework/version'
require 'framework/application_constants'

require 'framework/console_logger'
require 'data_import/strategies/data_importer'


=begin

= DB-utility tasks

  - Goggles framework vers.:  4.00.489
  - author: Steve A.

  (ASSUMES TO BE rakeD inside Rails.root)

=end
#-- ---------------------------------------------------------------------------
#++


DB_SEED_DIR = File.join( Dir.pwd, 'db/seed' ) unless defined? DB_SEED_DIR


# Scans recursively the ActiveRecord row instance specified for validation errors,
# returning the full error message found.
#
# Whenever any errors are found, the standard error message is (as of Rails 3.2)
# in the format:
#
#   { 'invalid_member_name_1' => ['error_msg_1', 'error_msg_2', ...], ... }
#
# This allows us to perform a standard AI depth-first scan of the error keys,
# until no errors are found or the only members with errors are not of the
# ActiveRecord::Base kind (a leaf is reached).
#
def recursive_validation( member, error_msg = '' )
  if member.invalid?
    member.errors.messages.keys.each do | sub_member_sym |
      sub_member = member.send( sub_member_sym )
      if sub_member.kind_of?( ActiveRecord::Base )  # Recurse!
        # Go deep until we found a "leaf" (an atomic or non-active_record member)
        error_msg << recursive_validation( sub_member, "#{member.class.name} ID:#{member.id} => " )
      else                                          # Leaf reached!
        error_msg << "#{member.class.name} ID:#{member.id}, " <<
                     "#{sub_member_sym}: #{member.errors.messages[ sub_member_sym ].join(', ')}"
      end
    end
  end
  error_msg
end
#-- ---------------------------------------------------------------------------
#++


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
    puts "Requiring Rails environment to allow usage of any Model..."
    require 'rails/all'
    require File.join( Rails.root.to_s, 'config/environment' )
    klass = eval(entity.camelize)
                                                    # Display some info:
    puts "DB host: #{db_host}"
    puts "DB name: #{db_name}"
    puts "DB user: #{db_user}"
    puts "\r\nChecking validations for '#{klass.name}'..."
    puts "Total rows to be processed: #{klass.count}"
    puts "\r\n---------------- 8< -------------------"
    errors_found = 0
    prev_error_at = 0
    index = 0
    klass.find_each(batch_size: 250) do |row|
      if row.invalid?
        puts "" unless prev_error_at == index-1
        puts "ID: #{row.id} => #{row.errors().messages.to_json}"
        puts "Backtracing source of error..."
        puts '=> ' + recursive_validation( row, '' )
        puts ''
        errors_found += 1
        prev_error_at = index
      else
        putc '.'
      end
      index += 1
    end
    puts "\r\n---------------- 8< -------------------"
    puts "\r\nTotal validation errors found: #{errors_found > 0 ? errors_found : 'NONE found! ...Yeay! Rejoyce and dance! :)'}"
    puts "\r\nDone."
  end
  #-- -------------------------------------------------------------------------
  #++


desc <<-DESC
Creates several MySQL dump files of a specific group of tables,
divided by seed category inside a dedicated folder (overridable).

Options: [output_dir=#{DB_SEED_DIR}]
         [Rails.env=#{Rails.env}]

DESC
  task :seed_dump_sql => ['utils:script_status', 'utils:chk_needed_dirs'] do
    puts "*** Task: DB SEED dump SQL ***"
                                                    # Prepare & check configuration:
    rails_config  = Rails.configuration
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    db_host       = rails_config.database_configuration[Rails.env]['host']
    output_folder = ENV.include?("output_dir") ? ENV["output_dir"] : DB_SEED_DIR
                                                    # Display some info:
    puts "DB name:          #{db_name}"
    puts "DB user:          #{db_user}"

    # *** Training data ***
    seed_block_name = '010_training_data'
    table_list = "trainings training_rows user_trainings user_training_rows user_training_stories"
    dump_seed_group( output_folder, seed_block_name, table_list, db_name, db_user, db_pwd, db_host )

    # *** IndividualRecord data ***
    seed_block_name = '020_individual_records'
    table_list = "individual_records"
    dump_seed_group( output_folder, seed_block_name, table_list, db_name, db_user, db_pwd, db_host )

    # *** SwimmingPoolReview data ***
    seed_block_name = '030_swimming_pool_reviews'
    table_list = "swimming_pool_reviews"
    dump_seed_group( output_folder, seed_block_name, table_list, db_name, db_user, db_pwd, db_host )

    # *** NewsFeed, Article and Comment data ***
    seed_block_name = '040_news_feed_data'
    table_list = "news_feeds articles comments"
    dump_seed_group( output_folder, seed_block_name, table_list, db_name, db_user, db_pwd, db_host )

    # *** Achievement data ***
    # TODO

    puts "Dump(s) done.\r\n\r\n"
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++


# Creates an SQL dump file in the specified folder.
#
def dump_seed_group( output_folder, seed_block_name, table_list, db_name, db_user, db_pwd, db_host )
  file_name  = File.join( output_folder, "seed_#{seed_block_name}.sql" )
  puts "\r\n\r\n- Creating #{file_name} ...\r\n"
  sh "mysqldump --host=#{db_host} -u #{db_user} -p#{db_pwd} -c -e -t -i --no-autocommit --tables --single-transaction #{db_name} #{table_list} > #{file_name}"
end
#-- ---------------------------------------------------------------------------
#++
