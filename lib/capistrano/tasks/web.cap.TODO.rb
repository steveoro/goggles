# == Capistrano helper tasks ==
#
# - author: Steve A.
# - vers. : 4.00.223.20140415
#
# This requires Capistrano v. >= 3.1
require "erb"


namespace :web do

  # Appends a new Virtual Host definition to the Apache2 configuration.
  # (Or creates a new configuration file from scratch, if not existing)
  #
  desc <<-DESC
      Appends a new Virtual Host definition to the Apache2 configuration for this app.

      This should be executed just once, upon setup of the web server.
      Apache2 must be already installed and configured, otherwise the task will fail.

      This task is automatically invoked after a deploy:setup, unless the
      :skip_vhost_setup variable is set to true.

      The internal template used to build the vhost configuration file can be
      overridden placing a 'vhost.erb' file inside the 'config/deploy' subfolder.

      Remember to enable mod_rewrite in Apache2 configuration file for the
      'cap <servername> deploy:web:[enable|disable]' commands.
  DESC
  task :vhost_add, :roles => [:web], :except => { :no_release => true } do
    current_host = roles[:web].servers[0]
    default_template = <<-EOF
  ### #{application} ###
  #
  <VirtualHost *:#{web_server_port}>
    ServerName      #{current_host}
    ServerAdmin     #{scm_username}@#{current_host}
    DocumentRoot    #{deploy_to}/current/public
    ErrorLog        #{deploy_to}/current/log/error.log
    CustomLog       #{deploy_to}/current/log/access.log combined
    RewriteEngine   On
    RewriteCond     %{DOCUMENT_ROOT}/system/maintenance.html -f
    RewriteCond     %{SCRIPT_FILENAME} !maintenance.html
    RewriteRule     ^.*$ /system/maintenance.html [R]

    # This hides the release root folder from being readable:
    <Directory #{deploy_to}>
      AllowOverride None
      Options FollowSymLinks
      Order deny,allow
      Deny from all
    </Directory>

    # Enable mod_x_sendfile for downloading output files from rails app
    RequestHeader Set X-Sendfile-Type X-Sendfile
    XSendFile on
    XSendFilePath /

    # The actual web app. public root folder:
    <Directory #{deploy_to}/current/public>
      PassengerEnabled on
      PassengerResolveSymlinksInDocumentRoot on
      Allow from all
      Options -MultiViews
      Options FollowSymLinks
      Order allow,deny
    </Directory>

    # Pre-compiled assets with far-future headers for caching:
    <LocationMatch "^/assets/.*$">
      Header unset ETag
      FileETag None
      # RFC says only cache for 1 year
      ExpiresActive On
      ExpiresDefault "access plus 1 year"
    </LocationMatch>
  </VirtualHost>


    EOF

    location = fetch(:template_dir, "config/deploy") + '/vhost.erb'
    template = File.file?(location) ? File.read(location) : default_template

    config = ERB.new(template)

    put config.result(binding), "/tmp/yast2_vhosts.conf"
    run "#{try_sudo} cat /tmp/yast2_vhosts.conf >> /etc/apache2/vhosts.d/ip-based_vhosts.conf"
    run "#{try_sudo} rm /tmp/yast2_vhosts.conf"
  end


  # Erases the remote Apache2 vhost configuration file
  #
  desc <<-DESC
    Erases the remote Apache2 vhost configuration file.
  DESC
  task :vhost_erase, :role => [:db] do
      run "#{try_sudo} rm /etc/apache2/vhosts.d/ip-based_vhosts.conf"
  end
  # ---------------------------------------------------------------------------
end
