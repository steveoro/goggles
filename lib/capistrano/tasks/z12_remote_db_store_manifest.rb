# encoding: utf-8

# == Capistrano helper tasks ==
#
# - author: Steve A.
# - vers. : 6.145
#
# This requires Capistrano v. >= 3.4


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
    warm_up_time  = ENV.include?("warm_up") ? ENV["warm_up"] : nil
    begin_time    = ENV.include?("begin") ? ENV["begin"] : nil
    day_part_type_code = ENV.include?("day_part") ? ENV["day_part"] : 'P'

    run_locally do
      puts "\r\n*** remote:db_store_manifest ***"
      unless meeting_id > 0 && ENV.include?("file") && File.exists?( full_pathname )
        puts("This task needs at least a valid 'meeting_id' and 'file' parameters.")
        exit
      end
      text_file_contents = File.read( full_pathname )

      # Display some info:
      puts "Meeting ID...............: #{ meeting_id }"
      puts "warm_up_time.............: #{ warm_up_time }"
      puts "begin_time...............: #{ begin_time }"
      puts "day_part_type_code ......: #{ day_part_type_code }"
      puts "Processed Manifest.......: #{ full_pathname } (size: #{ text_file_contents.size })"
      puts "DB Dump Download phase...: #{ skip_download ? 'OFF' : '(enabled)' }"
    end

    # === UPLOAD phase: ===

    on roles(:app) do
      info "\r\nUploading file #{ full_pathname } ..."
      # Upload the SQL DB-Diff file:
      upload! full_pathname, '/tmp/temp_manifest.html'
      # Run the rake task to store the manifest:
      within release_path do
        with rails_env: :production do
          options = "db:store_meeting_manifest meeting_id=#{ meeting_id } file=\"/tmp/temp_manifest.html\""
          options << " warm_up=\"#{ warm_up_time }\"" if warm_up_time.to_s.size > 0
          options << " begin=\"#{ begin_time }\"" if begin_time.to_s.size > 0
          options << " day_part=\"#{ day_part_type_code }\"" if day_part_type_code.to_s.size > 0
          rake options
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
