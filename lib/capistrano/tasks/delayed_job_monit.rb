# Place this in your lib/capistrano/tasks folder.
namespace :delayed_job do
  # Retrieves the DJ args. Defaults to the string "-i 0". (1 worker process, with index 0)
  # Use 'set :delayed_job_args, <role>' to (re-)define it.
  #
  def args
    fetch(:delayed_job_args, "-i 0")
  end

  # Retrieves the DJ Capistrano role(s). Defaults to :app when not defined.
  # Use 'set :delayed_job_server_role, <role>' to (re-)define it.
  #
  def delayed_job_roles
    fetch(:delayed_job_server_role, :app)
  end


  desc 'Stop the DelayedJob process'
  task :stop do
    on roles(delayed_job_roles) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :'bin/delayed_job', args, :stop
        end
      end
    end
  end


  desc 'Start the ActiveJob/DelayedJob process'
  task :start do
    on roles(delayed_job_roles) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :'bin/delayed_job', args, :start
          # [Steve, 20180726] This should be more generic, but for the moment we stick to
          # the DJ script, that has more flexibility:
#          execute :bundle, :exec, :'bin/rails', 'jobs:work'
        end
      end
    end
  end


  desc 'Restart the DelayedJob process'
  task :restart do
    on roles(delayed_job_roles) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :'bin/delayed_job', args, :restart
        end
      end
    end
  end
end
#-- ---------------------------------------------------------------------------
#++



namespace :monit do
  desc 'Generate and push the monit config file for the application'
  task :deploy_config do
    on roles( delayed_job_roles ) do
      set :remote_bundle, extract_correct_bundle()
      puts "      > Correct Bundle script extracted for remote usage: '#{ fetch(:remote_bundle) }'"

      template = ERB.new( File.new(Dir.pwd + '/config/deploy/monit.erb').read ).result( binding )
      upload!( StringIO.new(template), "/tmp/#{ fetch(:application) }" )
      execute( "sudo mv /tmp/#{ fetch(:application) } /etc/monit/conf.d/#{ fetch(:application) }" )
    end
  end


  desc 'UnMonitor the application'
  task :unmonitor do
    on roles( delayed_job_roles ) do
      (0..(fetch(:delayed_job_workers, 1).to_i) - 1).each do |idx|
        execute( "sudo monit unmonitor #{ fetch(:application) }_djob_#{ idx }", raise_on_non_zero_exit: false )
      end
    end
  end


  desc 'Monitor the application'
  task :monitor do
    on roles( delayed_job_roles ) do
      (0..(fetch(:delayed_job_workers, 1).to_i) - 1).each do |idx|
        execute( "sudo monit monitor #{fetch(:application)}_djob_#{idx}", raise_on_non_zero_exit: false )
      end
    end
  end


  desc 'Reload Monit in order to see any updated jobs'
  task :reload do
    on roles( delayed_job_roles ) do
      execute( "sudo monit reload", raise_on_non_zero_exit: false )
    end
  end


  desc 'Status report for Monit'
  task :status do
    on roles( delayed_job_roles ) do
      execute( "sudo monit status", raise_on_non_zero_exit: false )
    end
  end
end
#-- ---------------------------------------------------------------------------
#++


# Make sure the monitors shut off while you are deploying and reloaded.

# [Steve, 20180730] For 1st-time deploys, comment out the 2 "before 'deploy'" statements
# that will fail when there's no service to unmonitor and the DelayedJob has not yet been started.
# before  'deploy', 'monit:unmonitor'
# before  'deploy', 'delayed_job:stop'
after   'deploy', 'delayed_job:restart'

before  'delayed_job:stop', 'monit:unmonitor'
before  'delayed_job:start', 'monit:monitor'
after   'delayed_job:restart', 'monit:reload'

after   'monit:reload', 'monit:monitor'
#-- ---------------------------------------------------------------------------
#++



private



# Returns the correct Bundle script to be used remotely.
#
def extract_correct_bundle
  within fetch(:deploy_to) do
    capture_remote_command( "which bundle" )
  end
end


# Returns the correct PassengerRuby value taken directlyfrom the output of passenger-config.
#
def extract_correct_ruby
  within fetch(:deploy_to) do
    which_passenger_config = capture_remote_command( "which passenger-config" )
    ruby_command_output    = capture_remote_command( "#{ which_passenger_config } --ruby-command" )
    # Extract the correct PassengerRuby value to be put into vhost template directly from
    # the output of passenger-config:
    ruby_command_output.split(/\n/).select{ |line| line =~ /PassengerRuby/ui }.first.split(/Apache:\s/).last
  end
end


# Returns the output text captured from the specified remote_command.
#
def capture_remote_command( remote_command )
  capture( :bash, "-lc \"#{ remote_command }\"" )
end
#-- -----------------------------------------------------------------------
#++
