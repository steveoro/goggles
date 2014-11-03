## HOWTO: Use DelayedJob with queues

- Launch a mailer with delayed_job (do not use #deliver):

> NewsletterMailer.delay(queue: 'mailing').data_updates_mail( @user, meeting_array )
> NewsletterMailer.delay(queue: 'mailing').application_mail( @user, contents )



### Running jobs

- The jobs can be run anywhere, but the worker threads will keep polling the DB every 2 secs.

- There is the specific rake task that can be used to launch the workers:
    > rake jobs:work

- To launch specific queues, use the environment variable:
    > QUEUES=mailers,tasks rake jobs:work

- If you want to just run all available jobs and exit you can use:
    > rake jobs:workoff

- There are scripts to launch the worker threads too:
  Runs all available jobs and then exits
    > RAILS_ENV=production script/delayed_job start --exit-on-complete

  ...Or to run in the foreground
    > RAILS_ENV=production script/delayed_job run --exit-on-complete



### Monitoring jobs

- We're using a custom version of DJ-Mon, available on the same app-server as:

    http://localhost:3000/dj_mon
