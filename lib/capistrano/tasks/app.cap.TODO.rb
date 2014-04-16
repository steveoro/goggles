# == Capistrano helper tasks ==
#
# - author: Steve A.
# - vers. : 4.00.223.20140415
#
# This requires Capistrano v. >= 3.1
require "erb"


namespace :app do

	desc <<-DESC
	  Creates a custom production environment file in shared path.

	  This task searches and uses a template called 'production.rb.erb' that must
	  be found inside the /config/deploy folder.
	  If the template is found, the current /config/environments/production.rb is
	  replaced with the result from the template (which is filled according to the
	  internal parameters).
	
	  Main internal parameter:
	  ========================
	  - perform deliveries = #{delivery_mails}
	  - delivery method    = #{delivery_method}
	DESC
	task :setup_prod_env, :role => [:app], :except => { :no_release => true } do
	  serve_static_assets = false
	  debug_assets = false
	  perform_deliveries = delivery_mails
	  use_sendfile_header_for_apache = true
	
	  if ( delivery_method == 'smtp' )              # Using SMTP for "remote" e-mail:
	  	#
	  	# FIXME PASS HERE config/env variables!!!
	  	#
	  else                                          # Using local sendmail:
	    agex_development_email = "<steve@#{deploy_server_name}>"
	  end
	
	  puts "setup_prod_env -- current internal parameters:"
	  puts "=============================================="
	  puts "- perform_deliveries             = #{perform_deliveries}"
	  puts "- delivery_method                = #{delivery_method}"
	  puts "- serve_static_assets            = #{serve_static_assets}"
	  puts "- debug_assets                   = #{debug_assets}"
	  puts "- use_sendfile_header_for_apache = #{use_sendfile_header_for_apache}"
	  puts ""
	  puts "- agex_development_email         = #{agex_development_email}"
	  if ( delivery_method == 'smtp' )
	    puts "- smtp_setting_tls               = #{smtp_setting_tls}"
	    puts "- smtp_setting_address           = #{smtp_setting_address}"
	    puts "- smtp_setting_port              = #{smtp_setting_port}"
	    puts "- smtp_setting_domain            = #{smtp_setting_domain}"
	    puts "- smtp_setting_auth              = #{smtp_setting_auth}"
	    puts "- smtp_setting_user              = #{smtp_setting_user}"
	    puts "- smtp_setting_pwd               = #{smtp_setting_pwd}"
	    puts "- smtp_setting_starttls          = #{smtp_setting_starttls}"
	  end
	  puts ""
	
	  location = 'config/deploy/production.rb.erb'
	  if ( File.file?(location) )                   # Do nothing unless the template file is found
	    template = File.read(location)
	    config = ERB.new(template)
	
	    run "#{try_sudo} mkdir -p #{shared_path}/config"
	    run "#{try_sudo} mkdir -p #{shared_path}/config/environments"
	    put config.result(binding), "#{shared_path}/config/environments/production.rb"
	  end
	end
  	# -------------------------------------------------------------------------


	desc <<-DESC
	  [Internal] Recreates the symlink for production.rb file for the newly deployed release.
	DESC
	task :create_symlink_for_prod_env, :except => { :no_release => true } do
	  run "ln -nfs #{shared_path}/config/environments/production.rb #{release_path}/config/environments/production.rb"
	end
  	# -------------------------------------------------------------------------


	desc <<-DESC
	  [Internal] Checks and adds shared ExtJS lib files to the deployment tree
	  (only when these are not found).
	
	  It is safe to run this task on servers that have already been set up; it \
	  will not destroy any deployed revisions or data.
	DESC
	task :setup_shared_extjs, :roles => :app, :except => { :no_release => true } do
	  lib_dir = File.join(shared_path, "extjs")
	  puts "Checking '#{lib_dir}' existance..."
	  result = ''
	
	  transaction do				# Since the output is streamed char-by-char, just store the first char:
	    run "if test -e '#{lib_dir}/ext-all.js' ; then echo 0 ; else echo 1 ; fi" do |channel, stream, out|
	      puts "Remote test result = #{out.inspect}"
	      result = out if result.empty?
	    end
	  end
							# Proceed with the actual check:
	  transaction do
	    puts "Check result = #{result.strip}, length=#{result.strip.length}"
	
	    if ( result.strip.to_i > 0 )      # Directory or contents NOT found?
	      puts "Safely (re)creating directory before adding missing contents..."
	      run "#{try_sudo} mkdir -p #{lib_dir}"
	      puts "Uploading directory contents..."
	      if use_pem_certificate
	        run_locally "scp -i #{ssh_options[:keys].first} -Cpr public/extjs/* root@#{deploy_server_name}:#{lib_dir}"
	      else
	        run_locally "scp -Cpr public/extjs/* root@#{deploy_server_name}:#{lib_dir}"
	      end
	
	    else
	      puts "Directory contents found: assuming contents are still valid."
	    end
	  end
	
	  puts "Done."
	end
  	# -------------------------------------------------------------------------



	desc <<-DESC
	  [Internal] Checks and adds other shared directories to the deployment tree
	  (only when these are not found).
	
	  It is safe to run this task on servers that have already been set up; it \
	  will not destroy any deployed revisions or data.
	DESC
	task :setup_common_output, :roles => :app, :except => { :no_release => true } do
	  output_dir = File.join(shared_path, "output")
	  # mkdir -p is making sure that the directories are there for some SCM's that don't
	  # save empty folders:
	  run "#{try_sudo} mkdir -p #{output_dir} && chmod -R 0775 #{output_dir} && chown -R #{runner}:www #{output_dir}"
	
	  output_dir = File.join(shared_path, "uploads")
	  run "#{try_sudo} mkdir -p #{output_dir} && chmod -R 0775 #{output_dir} && chown -R #{runner}:www #{output_dir}"
	end
  	# -------------------------------------------------------------------------



	desc <<-DESC
	  [internal] Changes ownership for some of the released code. \
	  It is called after finalize_update and before the deployment finishes. \
	
	  It assumes a Rails project was deployed, so if you are deploying \
	  something else, you may want to override this task with your own \
	  environment's requirements.
	
	  This task will set the ownage of the public (Document) dir and some of its \
	  subfolders.
	DESC
	task :setup_public_dirs, :roles => :web, :except => { :no_release => true } do
	  # Make a link also for the added common output folder:
	  run <<-CMD
	    rm -rf #{latest_release}/public/output &&
	    ln -s #{shared_path}/output #{latest_release}/public/output &&
	    rm -rf #{latest_release}/public/uploads &&
	    ln -s #{shared_path}/uploads #{latest_release}/public/uploads
	  CMD
	
	  run "#{try_sudo} chown -R wwwrun:www #{shared_path}/log"
	# TODO Missing check on log existance; if log is missing rake should be invoked to create it
	  run "if test -e #{shared_path}/log/production.log ; then #{try_sudo} chmod -R 0666 #{shared_path}/log/production.log ; fi"
	
	  extjs_dir = File.join(shared_path, "extjs")
	  puts "Recreating ExtJS symlink inside release path '#{release_path}'..."
	  run "#{try_sudo} ln -nfs #{extjs_dir} #{release_path}/public/extjs ; chown -R #{runner}:www #{latest_release}/public"
	end
  	# -------------------------------------------------------------------------


end
