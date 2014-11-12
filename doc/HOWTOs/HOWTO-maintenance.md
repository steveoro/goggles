## HOWTO: Toggle MAINTENANCE Mode on the remote server:

### Maintenance mode **ON**, with custom end_date:

    > ROLES=app cap staging remote:rake
    _(wait for console prompt)_

    > RAILS_ENV=production build:maintenance end_date="2014-11-13 13:00"


### Maintenance mode **OFF**:

    > ROLES=app cap staging remote:rake
    _(wait for console prompt)_

    > RAILS_ENV=production build:maintenance mode=0
