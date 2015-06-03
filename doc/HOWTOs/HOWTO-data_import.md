## HOWTO: data-import steps ##

### Pre data-import: ###
  > zeus rake db:rebuild_from_dump


### Data-import: ###
- use [http://0.0.0.0:3000/goggles_data_import/en/step1_status]
    - team name analysis manual check
    - swimmer name analysis manual check
    - phase 2: check result pages, relay & team scores & commit if ok

- keep track of committed meeting id for later usage

- integrity check:
  > zeus rake db:check_dup_badges
  > zeus rake db:check_validations

- additional check:
  (*TODO/WARNING*: this will alter the current DB without creating diff files!
   Use only in case of actual errors!)
  > zeus rake db:check_dup_events meeting_ids=<meeting_id1, ...>


### Post data-import: ###
  > zeus rake dataimport:news_log meeting_ids=<meeting_id1, ...> custom_msg="any msg"
    (this will also add to the script: clear sessions, articles, maintenance mode
     OFF, and a new article with the data update news)

  > zeus rake db:update_records meeting=<meeting_id>
    (this may take several minutes to complete)

  > zeus rake db:goggle_cup goggle_cup=<cup_id> meeting=<meeting_id>


- *1)* IF data-import _CSI_:
  > zeus rake db:meeting_team_scores meeting=<meeting_id>


- *2)* IF data-import _FIN_:
  > ?


- *3)* IF end of season:
  _(Not sure about this:)_
  > zeus rake  db:save_season_team_ranking season_ids=<id_1, ...>

- zeus rake db:dump

- move all sql diff files from /log to db/diff.new

- commit & push
