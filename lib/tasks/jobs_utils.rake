# encoding: utf-8

require 'date'
require 'common/format'


=begin

= ActiveJob utility tasks

  - (p) FASAR Software 2007-2018
  - Goggles framework vers.:  6.364
  - author: Steve A.

  (ASSUMES TO BE rakeD inside Rails.root)

=end


namespace :jobs do

  desc <<-DESC
Printout the currently created job list status.

    Options: [Rails.env=#{Rails.env}]
DESC
  task( status: [:environment] ) do
    jobs_queues_hash = Delayed::Job.group(:queue, "failed_at IS NULL").count
    # Resulting example => {["edit", 0]=>1, ["edit", 1]=>12}

    pending_sql_map = AppParameter.where('code > 100000').select(:free_text_1).map{ |row| row.free_text_1 }
    # Result => ['UPDATE ...'] # (Array of SQL statements text)

    # Printout the job queues with the job count:
    puts "\r\n\r\n  *** ActiveJob / DelayedJob status ***"
    puts "\r\n"
    puts "+#{ ''.center(22, '-') }+--------+---------+"
    puts "| #{ 'QUEUE'.center(20) } | STATUS | JOB TOT |"
    puts "+#{ ''.center(22, '-') }+--------+---------+"
    jobs_queues_hash.each do |queue_key, job_count_value|
      queue_name = queue_key.first
      failed_description = queue_key.last.to_i > 0 ? "  OK  " : "FAILED"
      puts "| #{ queue_name.center(20) } | #{ failed_description } | #{ job_count_value.to_s.rjust(7) } |"
    end
    puts "+#{ ''.center(22, '-') }+--------+---------+"

    puts "\r\n\r\n  *** Pending SQL modifications ***"
    puts "\r\n"
    puts "8<".center(80, '-')
    pending_sql_map.each do |sql_statement|
      puts sql_statement
      puts "\r\n"
    end
    puts "8<".center(80, '-')
    puts "\r\n\r\n"
  end
  #-- -------------------------------------------------------------------------
  #++
end
# ==============================================================================
