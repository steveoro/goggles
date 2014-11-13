## HOWTO: Rolling Update!
...Or how to perform a local *rolling update* of the production DB with an update
on the app on the remote Server without losing your mind.

### Phase-0: Have a list of local DB-diffs, having opinionated attributes:

- Several SQL files, each to be executed as an atomic query, without any special
  assumption, except for the order of execution, given by the filename.

- Filename expected protocol:
   <timestamp ('yyyymmddhhmm', 12 digits)><['prod'|'dev'|'all']>_<any_description>.sql

- Files should be stored under 'db/diff.new'



### Phase-1: Get the current, remote dump:

1) Set the server in maintenance mode.
  > ROLES=app cap staging remote:maintenance_on

2) Get the dump and archive it.
  > ROLES=app cap staging db:remote:sql_dump
  (Default dir is ok; will store the dump under 'goggles.docs/backup.db/history.gold')


### Phase-2: Apply the dump locally:

3) Rebuild the local DB.
  With Zeus server running:
  > zeus rake db:rebuild_from_dump from=production to=production
  Or:
  > bundle exec rake db:rebuild_from_dump from=production to=production

3.1) Run any pending migration on production DB:
  > RAILS_ENV=production bundle exec rake db:migrate
  (Assuming migrations have been already executed and tested on Development DB. Do it also
   for Dev. DB, if not)

3.2) Re-update the DB dumps when using the **rebuild** option of the task:
  (See point (4) for an explanation -- currently the default is to skip the rebuild
   from the dumps)

  > RAILS_ENV=production bundle exec rake db:dump
  (Assuming dump has been already updated on Development DB. Do it also for Dev. DB, if not)

4) Apply the DB diffs created locally (on all DBs):
  With Zeus server running:
  > zeus rake db:diff_apply
  Or:
  > bundle exec rake db:diff_apply

  This will also move successfully applied files to the 'consumed' dir. 'diff.applied'
  and update the local production dump.

  Note that the _db:diff_apply_ task supports also the **rebuild** option, to force
  the initial rebuild_from_dump for all the involved databases. The default is to
  skip this phase, assuming the dumps are currently updated.


### Phase-3: Upload the updated dump and apply it remotely:

5) Upload the local production dump.
    > ROLES=app cap staging db:remote:dump_upload

    Explanation from the output description of the command:
    ---8<---
        > cap -D db:remote:dump_upload
    Uploads the local production recovery dump to the server and executes it.
    (The dump is assumed to be stored as 'db/dump/production.sql.bz2')

    This will in turn:
      - upload the local, compressed production dump;
      - stop Apache
      - expand the file
      - drop the production DB
      - recreate the empty DB
      - execute the uncompressed dump file on the new, empty, production DB
      - remove the temp. files
      - finally, start Apache

    This remote Capistrano task may prove useful each time a production dump has
    been updated locally but a new release of the app has not been scheduled for
    a while.

    *(The alternative method to upload a recovery dump is to commit it in the repo
    *and issue a cap deploy command + a separate remote db:rebuild_from_dump task*
    *afterwards.)*
    ---8<---


6) Exit from maintenance mode.
  > ROLES=app cap staging remote:maintenance_off


Eventually, run a mailer task if the data-update requires generating a news feed
update for the users.
