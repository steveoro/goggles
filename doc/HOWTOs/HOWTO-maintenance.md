## HOWTO: Toggle MAINTENANCE Mode on the remote server:
Maintenance mode toggled this way will simply re-direct all traffic to a single
view displaying an 'end_date' message for the users about the allegedly supposed
end of the maintenance mode.

Maintenance mode is NOT toggled off by default. The message is only for information
purposes.


### Maintenance mode **ON**, with NO end_date:
This toggles on maintenance mode, with the default 2h end_date message:
(See lib/tasks/local_deploy, build:maintenance)

    > ROLES=app cap ocean remote:maintenance_on


### (Manual) Maintenance mode **ON**, with custom end_date:
This toggles on maintenance mode, with a custom end_date message:

    > ROLES=app cap ocean remote:rake
    _(wait for console prompt)_

    > RAILS_ENV=production build:maintenance end_date="2015-03-26 08:00"


                            --- O ---


### Maintenance mode **OFF**:
This toggles off maintenance mode:

    > ROLES=app cap ocean remote:maintenance_off


### (Manual) Maintenance mode **OFF**:
This, also, toggles off maintenance mode:

    > ROLES=app cap ocean remote:rake
    _(wait for console prompt)_

    > RAILS_ENV=production build:maintenance mode=0
