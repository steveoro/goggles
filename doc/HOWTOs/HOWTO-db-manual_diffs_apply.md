## HOWTO: *Goggles* - Apply/Merge DB diff to production DB

### Abstract
To perform any data-import task or to update the remote prod DB with updated seeds,
usually you need to apply them locally by first obtaining a remote dump via Capistrano:
  > ROLES=app cap ocean db:remote:sql_dump
  ('ocean' is the server config name)

...Or by manually applying a remote daily-diff, obtained by the dedicated HOWTO
procedure on file ("daily_diff_apply"), which involves copying locally the remote
backup ugc_* logs and using the other dedicated Capistrano task:
  > ROLES=app cap ocean db:remote:sql_diff_dump

For most of the cases, the first solution is preferred and the only one really needed.
Use the second one only for manual rebuild worst-case scenarios, where typically
only a db:rebuild_from_scratch could guarantee an up-to-date DB structure.


### Procedure
1) Rebuild locally the remote production DB
  1.1) Get the current remote production DB via Capistrano:
       > ROLES=app cap ocean db:remote:sql_dump
         => reply to destination dir w/ correct history/backup dir, e.g.:
         ../goggles.docs/backup.db/history.gold/

  1.2) Copy obtained file to db/dump directory, to update the repository's version
       of the dump file (remove timestamp & overwrite existing production dump)

  1.3) Actually rebuild the local production DB via the dedicated rake task:
      With Zeus server running:
      > zeus rake db:rebuild_from_dump from=production to=production
      Or:
      > bundle exec rake db:rebuild_from_dump from=production to=production


2) Apply pending migrations:
   > RAILS_ENV=production bundle exec rake db:migrate

3) Edit or delete old/unused Articles (via MySQL):
   > DELETE FROM articles;

4) Manually clean-up possibile conflicting rows, via MySQL (check out status of news_feeds,
   friendships, user_swimmer_confirmations, swimmers, users, ...)

5) Load & execute via SQL any pending training seeds or diffs

6) Update the repository's version of the production dump:
   > RAILS_ENV=production bundle exec rake db:dump
   > git commit -m "Production DB update"
   > git push origin

7) Load the updated dump to production DB via remote rake task (db:rebuild_from_dump)
   > ROLES=app cap ocean remote:rake
     > RAILS_ENV=production db:rebuild_from_dump from=production to=production

8) (Additional step) Article creation to signal the user for application update:
   (Useful only for major app updates, not simple DB-diff merges)
   > ROLES=app cap ocean remote:rake
     > RAILS_ENV=production build:news_feeds

9) (Additional step) Delayed job to signal the users for production data update:
   (Useful only for data-import updates, not simple DB-diff merges)
   > ROLES=app cap ocean remote:rake
     > RAILS_ENV=production mailer:job:data_update [meetings=<id_1>[,<id_2>,...] ]
