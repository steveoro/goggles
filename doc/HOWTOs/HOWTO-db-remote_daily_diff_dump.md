## HOWTO: *Goggles* - gather DB daily diff data from staging/prod

### Abstract
Each night (at about 4:30 AM Italy time) the cron job on the prod server creates a
backup of all the logs created under current/log.

The backup of the log is stored under:
  /srv/www/htdocs/goggles/releases/<release_number>.docs/backup.log (directory)

There's 1 backup file for each type (access, error, production & various ugc_* tables).
The max backup kept are usually 30 x file type, or about a month's worth of history.

The various ugc_* logs store the user interactions with any of the table with with
the user can interact via the main web app.

By executing all the ugc_* logs into the local production dump, is possibile to recreate
the same production DB available on staging/prod.

The only excluded tables from ugc_* logging are:
  - friendships
  - articles
  - admins
  - news_feeds


### Procedure
1) Log on to the server:
  > ssh -i goggles-aws.pem root@master-goggles.org
  > cd /srv/www/htdocs/goggles/releases/

2) Get the list of files to be copied from staging to development:
  > ls -a *.docs/backup.log/ugc*
  > exit

3) Copy them locally (from your workstation):
  > scp -i goggles-aws.pem root@master-goggles.org:/srv/www/htdocs/goggles/releases/*.docs/backup.log/ugc* ../backup.log
  (Substitute the *.docs with an actual release number to choose a specific release)

4) If the list of backups includes already processed days, exclude them or select
   the interesting ones manually.

5) Get the current DB-diff dump via the dedicated remote cap task:
  > ROLES=app cap ocean db:remote:sql_diff_dump

6) For each backup, open the bzipped tar, edit & merge the contents to obtain a
   single SQL executable file.

7) Execute/apply the file on the current, local production dump (either via mysql
   console or phpMySqlAdmin).

8) (Additional step) Verify integrity & validations where possible. For example,
   with:
  > RAILS_ENV=production bundle exec rake db:check_validations entity=Meeting
