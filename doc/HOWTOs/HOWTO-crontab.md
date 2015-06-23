## HOWTO: Edit CRONTAB to execute rake tasks, with a mail message containing the output execution:

0) Log-in as root in the remote server
  > ssh root@vm-1


1) Create a file, for example in /root/crontab_script:
  > 
  > vi /root/crontab_script

----8<----[/root/crontab_script]
#!/bin/bash

# Agex5 backups & cleanup:
cd /var/www/vm-1.fasar/current
PWD=$(grep -m 1 -Po "(?<=password\:\s)(.+)" /var/www/vm-1.fasar/current/config/database.yml)
/usr/local/rvm/gems/ruby-1.9.3-p545/bin/bundle exec rake RAILS_ENV=production build:log_rotate db:sessions:clear build:log_rotate utils:clear_output utils:clear_uploads sql:dump 2>&1 | sed "s/$PWD/***/g"

# AmbGest3 backups & cleanup:
cd /var/www/ambgest/current
PWD=$(grep -m 1 -Po "(?<=password\:\s)(.+)" /var/www/ambgest/current/config/database.yml)
/usr/local/rvm/gems/ruby-1.9.3-p545/bin/bundle exec rake RAILS_ENV=production build:log_rotate db:sessions:clear build:log_rotate utils:clear_output utils:clear_uploads sql:dump 2>&1 | sed "s/$PWD/***/g"

unset PWD
----8<----


2) Make it executable:
  > chmod +x crontab_script


3) Edit the crontab:
  > crontab -e

----8<----
MAILTO=steve.alloro@gmail.com

# Main Goggles maintenance:
30 2 * * * /bin/bash -l /root/crontab_script

# Friday's notifications newsletter:
30 6 * * 5 /bin/bash -l -c "cd /var/www/goggles.org/current && /usr/local/rvm/gems/ruby-1.9.3-p545@goggles-1.00/bin/bundle exec rake RAILS_ENV=production mailer:job:community jobs:workoff"

# Setup/adjust NTPDATE
0  0 * * * /etc/network/if-up.d/ntpdate
----8<----

4) > service cron reload



### Explanation:

- To get the correct fullpath to launch rake or bundle with a command execution by crontab, use:
    > which rake
  (Example output on DigitalOcean:)
    /usr/local/rvm/gems/ruby-1.9.3-p545@goggles-1.00/bin/rake

    > which bundle
    /usr/local/rvm/gems/ruby-1.9.3-p545@global/bin/bundle

- To edit the crontab, log to the server w/ ssh and use:
    > crontab -e
    (it opens vim)


- Typical command line example (that has to be executed by crontab):
    > cd /var/www/goggles.org/current && /usr/local/rvm/gems/ruby-1.9.3-p545@goggles-1.00/bin/bundle exec rake RAILS_ENV=production  sql:dump

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

    - Sample entry for the above rake task execution (one-liner, no password protection):
----8<----
MAILTO=steve.alloro@gmail.com

# Main Goggles maintenance:
30 2 * * * /bin/bash -l -c "cd /var/www/goggles.org/current && /usr/local/rvm/gems/ruby-1.9.3-p545@goggles-1.00/bin/bundle exec rake RAILS_ENV=production sql:dump"
----8<----
