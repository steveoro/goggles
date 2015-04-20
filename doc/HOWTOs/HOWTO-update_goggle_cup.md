## HOWTO: update Goggle Cup for a specific season/cup:

Use the dedicated rake task and launch it in each environment in need of an update.

Always launch the rake task on a local copy of the databases and push the updated
backup dump to the remote server when done.


#### For info, see:

    > zeus rake -D db:goggle_cup


#### Example for GoggleCup 9, DEVELOPMENT DB:

    > zeus rake db:goggle_cup recalculate=false goggle_cup=9


#### Example for GoggleCup 9, PRODUCTION DB:

    > RAILS_ENV=production bundle exec rake db:goggle_cup recalculate=false goggle_cup=9

    > RAILS_ENV=production build:maintenance mode=0
