# encoding: utf-8

# == Capistrano helper tasks ==
#
# - author: Steve A.
# - vers. : 6.005
#
# This requires Capistrano v. >= 3.6
require "erb"


namespace :app do
  namespace :setup do
    desc <<-DESC
      Creates a custom production environment file in shared path.

      This task searches and uses a template called 'production.rb.erb' that must
      be found inside the /config/deploy folder.

      If the template is found, the current /config/environments/production.rb is
      replaced with the result from the template (which is filled according to the
      internal parameters).

      Mail delivery method for current stage: #{fetch(:mail_delivery_method)}
    DESC
    task :prod_env do
      puts "      > Setup remote config/environments/production.rb..."
      on roles(:app) do |host|
        use_sendfile_header_for_apache = true
        secret_key_base      = fetch( :secret_key_base )
        recaptcha_site_key   = fetch( :recaptcha_site_key )
        recaptcha_secret_key = fetch( :recaptcha_secret_key )
        serve_static_assets  = false
        debug_assets         = false
        mail_delivery_method = fetch(:mail_delivery_method)
        perform_deliveries   = true
        application          = fetch(:application)
        mailer_default_host  = fetch(:mailer_default_host)
        web_server_port      = fetch(:web_server_port)
        agex_development_email = fetch( :agex_development_email )

        if ( mail_delivery_method == 'smtp' )
          smtp_setting_tls       = fetch( :smtp_setting_tls )
          smtp_setting_address   = fetch( :smtp_setting_address )
          smtp_setting_port      = fetch( :smtp_setting_port )
          smtp_setting_domain    = fetch( :smtp_setting_domain )
          smtp_setting_auth      = fetch( :smtp_setting_auth )
          smtp_setting_user      = fetch( :smtp_setting_user )
          smtp_setting_pwd       = fetch( :smtp_setting_pwd )
          smtp_setting_starttls  = fetch( :smtp_setting_starttls )
        end

        puts "\r\nprod_env -- current internal parameters:"
        puts "========================================"
        puts "- perform_deliveries             = #{perform_deliveries}"
        puts "- delivery_method                = #{mail_delivery_method}"
        puts "- serve_static_assets            = #{serve_static_assets}"
        puts "- debug_assets                   = #{debug_assets}"
        puts "- use_sendfile_header_for_apache = #{use_sendfile_header_for_apache}"
        puts ""
        puts "- agex_development_email         = #{agex_development_email}"
        if ( mail_delivery_method == 'smtp' )
          puts "- smtp_setting_tls               = #{smtp_setting_tls}"
          puts "- smtp_setting_address           = #{smtp_setting_address}"
          puts "- smtp_setting_port              = #{smtp_setting_port}"
          puts "- smtp_setting_domain            = #{smtp_setting_domain}"
          puts "- smtp_setting_auth              = #{smtp_setting_auth}"
          puts "- smtp_setting_user              = #{smtp_setting_user}"
          puts "- smtp_setting_starttls          = #{smtp_setting_starttls}"
        end
        puts ""
                                                    # *** production.rb "rebuild" ***
        location = 'config/deploy/production.rb.erb'
        if ( File.file?(location) )                 # Do nothing unless the template file is found
          template = File.read(location)
          config = ERB.new(template)
          run_locally do                            # Render the template to a temp file:
            File.open('/tmp/production.rb', 'w') do |file|
              file.puts config.result(binding)
            end
          end
          within shared_path do
            as( user: :root ) do
              execute :mkdir, "-p config; mkdir -p config/environments"
            end
          end
          upload! '/tmp/production.rb', "#{shared_path}/config/environments/production.rb"
          run_locally do                            # Remove the local temp file:
            puts "      > Removing local temp file..."
            execute :rm, "/tmp/production.rb"
          end
        else
          info "Environment template file not found locally: skipping 'production.rb' rebuild."
        end
                                                    # *** secrets.yml "rebuild" ***
        location = 'config/deploy/secrets.yml.erb'
        if ( File.file?(location) )                 # Do nothing unless the template file is found
          template = File.read(location)
          config = ERB.new(template)
          run_locally do                            # Render the template to a temp file:
            File.open('/tmp/secrets.yml', 'w') do |file|
              file.puts config.result(binding)
            end
          end
          upload! '/tmp/secrets.yml', "#{shared_path}/config/secrets.yml"
          run_locally do                            # Remove the local temp file:
            puts "      > Removing local temp file..."
            execute :rm, "/tmp/secrets.yml"
          end
        else
          info "Secret key base template file not found locally: skipping 'secrets.yml' rebuild."
        end
      end
    end
    # --------------------------------------------------------------------------


    desc <<-DESC
      Checks and adds other shared directories to the deployment tree
      (only when these are not found).

      It is safe to run this task on servers that have already been set up; it
      will not destroy any deployed revisions or data.
    DESC
    task :common_output do
      on roles(:app) do |host|
        # mkdir -p is making sure that the directories are there for some SCM's that don't
        # save empty folders:
        within File.join(shared_path, "public") do
          as( user: :root ) do
            execute :mkdir, "-p output"
            execute :chmod, "-R 0777 output"
            execute :chown, "-R #{fetch(:runner_user)}:#{fetch(:runner_group)} output"
            execute :mkdir, "-p uploads"
            execute :chmod, "-R 0777 uploads"
            execute :chown, "-R #{fetch(:runner_user)}:#{fetch(:runner_group)} uploads"
          end
        end
        # [Steve, 20140928] Allow custom log file to be written by nobody:nogroup.
        # (Inside the log dir, make sure to "chmod 0665" anything else).
        within shared_path do
          # FIXME [Steve, 20161105] Correct permissions should be these:
          #
          # execute :chmod, "0755 log"
          # execute :chmod, "0666 log/*.log" if test("[ -e \"log/*.log\" ]")
          #
          # Unfortunately, since currently there's a separate process for serializing
          # each *U*ser *G*enerated *C*ontent in dedicated "ugc_XXX.log" files,
          # we need the (excessively) relaxed 0777 permission to allow for creation
          # and writing by "nobody:nogroup" in the same destination (log) directory.
          #
          # See also cap task app:setup:common_output.
          #
          as( user: :root ) do
            execute :chown, "-R #{fetch(:runner_user)}:#{fetch(:runner_group)} log"
            execute :chmod, "0755 log"
            execute :chown, "-R #{fetch(:runner_user)}:#{fetch(:runner_group)} tmp"
          end
        end
        within File.join(shared_path, "tmp") do
          as( user: :root ) do
            execute :chown, "-R #{fetch(:runner_user)}:#{fetch(:runner_group)} cache"
            execute :chmod, "777 cache"
          end
        end
      end
    end
    # --------------------------------------------------------------------------
  end
  # ============================================================================
end


# Custom hooks:
before 'deploy:check:linked_files', 'app:setup:prod_env'
# [Steve, 20160810] This is no more required for Goggles version5:
# before 'deploy:check:linked_files', 'app:setup:shared_extjs'

before 'deploy:check:linked_files', 'app:setup:common_output'

# [Steve, 20141201] Warning: this may lead to errors on "cold" deploys, where the creation
# of the DB has been somehow skipped volontarily.
# Commented-out since we now clear the DB directly on the backup dump and we rebuild
# the whole DB with the solution below.
#
# before 'deploy:restart', 'remote:db_sessions_clear'

#-- ---------------------------------------------------------------------------
#++
