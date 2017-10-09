# encoding: utf-8

# == Capistrano helper tasks ==
#
# - author: Steve A.
# - vers. : 6.099
#
# This requires Capistrano v. >= 3.1


namespace :remote do


  # Remote DB:Diff_apply task
  #
  desc <<-DESC
  Works similarly to the local db:store_meeting_invitation task but for a remote DB.

Uploads a copy of a Meeting Manifest (assumed to be already in HTML/XHTML format)
from a local directory to the remote server. Then, the db:store_meeting_invitation
is invoked remotely to store the invitation/manifest into the remote DB.

At the end, the remote DB is dumped and downloaded, unless the +skip_download+
option is used.


  === OPTIONS ===

  Options: meeting_id=<meeting_id>
           file=<path_to_file>
           [warm_up=<warm_up_time> begin=<begin_time> [day_part=<day_part_type.code>]]
           [skip_download=<0>|1]

  DESC
  task :db_store_manifest do
    # Environment setup
    meeting_id    = ENV["meeting_id"].to_i
    full_pathname = ENV["file"]
    skip_download = ENV.include?("skip_download") && (ENV["skip_download"].to_i > 0)

    run_locally do
      puts "\r\n*** remote:db_store_manifest ***"
      unless Meeting.find_by_id( meeting_id ).instance_of?( Meeting ) &&
             ENV.include?("file") &&
             File.exists?( full_pathname )
        puts("This task needs at least a valid 'meeting_id' and 'file' parameters.")
        exit
      end
      text_file_contents = File.read( full_pathname )

      # Display some info:
      puts "Meeting ID...............: #{ meeting_id }"
      puts "Processed Manifest.......: #{ full_pathname } (size: #{ text_file_contents.size })"
      puts "DB Dump Download phase...: #{ skip_download ? 'OFF' : '(enabled)' }"
    end

    # === UPLOAD phase: ===

    on roles(:app) do
      stderr_file_name = '/tmp/std_err_log.txt'         # Store STDERR on this temp file
      info "\r\nUploading file #{ full_pathname } ..."
      # Upload the SQL DB-Diff file:
      upload! full_pathname, '/tmp/temp_manifest.html'
      # Run the rake task to store the manifest:
      within release_path do
        with rails_env: :production do
          rake "db:store_meeting_invitation meeting_id=#{ meeting_id } file=\"/tmp/temp_manifest.html\" 2> #{ stderr_file_name }"
        end
      end

      # Intercept errors or warnings on the std_err output:
      if test("[ -s #{ stderr_file_name } ]")
        file_lines = capture( :cat, stderr_file_name ).split("\n")
        errors   = file_lines.select{ |line| line =~ /Error/i }
        warnings = file_lines.select{ |line| line =~ /Warning/i }
        if errors.size > 0
          puts "\r\nError(s) intercepted!"
          puts "---------8<----------"
          errors.each{ |e| puts e }
          puts "---------8<----------"
          puts "\r\nAborting..."
          exit(1)
        end
        if warnings.size > 0
          puts "\r\nWarning(s) intercepted:"
          puts "---------8<----------"
          warnings.each{ |w| puts w }
          puts "---------8<----------"
          puts "\r\nIgnoring..."
        end
      end

      # After execution remove temp files on dest host:
      info "Removing remote temp files..."
      execute :rm, stderr_file_name
      execute :rm, '/tmp/temp_manifest.html'
    end

    unless skip_download
      puts "\r\nAlmost done: getting an updated remote PRODUCTION dump...\r\n"
      invoke "db:remote:sql_dump"
    else
      puts "\r\nRemote PRODUCTION dump download skipped by request.\r\nDone.\r\n"
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
