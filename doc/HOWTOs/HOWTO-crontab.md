## HOWTO: Edit CRONTAB to execute rake tasks, with a mail message containing the output execution:

- To get the correct fullpath to launch rake or bundle with a command execution by crontab, use:
    > which rake
  (Example output on EC2:)
    /usr/local/rvm/gems/ruby-1.9.3-p545@goggles-1.00/bin/rake

    > which bundle
    /usr/local/rvm/gems/ruby-1.9.3-p545@global/bin/bundle

- To edit the crontab, log to the server w/ ssh and use:
    > crontab -e
    (it opens vim)


- Typical command line example (that has to be executed by crontab):
    > cd /srv/www/htdocs/goggles/current && /usr/local/rvm/gems/ruby-1.9.3-p545@global/bin/bundle exec rake RAILS_ENV=production build:log_rotate db:sessions:clear

- To load the bash environment (otherwise the bundle exec command won't work) use:
    > /bin/bash -l -c "<comando da eseguire>"

- Cronjob timing based upon:
    minute hour day month weekday
  Ex:
    15 * * * *
    => run the 15th minute of every hour of every day,
	for every month, every day of weekday

    00,15,30 * * * *
    => as above, but on the 0th, 15th and 30th minute of every hour

    - Typical entry for the above rake task execution (on an EC2 Ireland instance, timezone -2h):
----8<----
MAILTO=steve.alloro@gmail.com
30 2 * * * /bin/bash -l -c "cd /srv/www/htdocs/goggles/current && /usr/local/rvm/gems/ruby-1.9.3-p545@global/bin/bundle exec rake RAILS_ENV=production db:sessions:clear build:log_rotate"
30 6 * * 5 /bin/bash -l -c "cd /srv/www/htdocs/goggles/current && /usr/local/rvm/gems/ruby-1.9.3-p545@global/bin/bundle exec rake RAILS_ENV=production mailer:job:community jobs:workoff"
----8<----
