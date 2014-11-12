## HOWTO: Deploy the Application on the remote server:

Capistrano "v. ~> 3" allows to define several configuration roles under _config/deploy_.

These files contain sensitive information and are read automatically when the **cap**
command is executed, thus they should be always _excluded_ from the public repository.
(Together with the crypto key to access remotely the EC2 instance.)

Always exclude the DB role when deploying because it's not currently possibile to
connect through _ssh_ to the DB Server (which is an Amazon RDS instance).


### Standard deploy:

The role required is just _app_. (No _db_ or _web_)

- Toggle Maintenance mode ON (see proper HOWTO)

- Deploy current version:
    > ROLES=app cap staging deploy

- Create an additional, standard news-log row to notify the users of the update:
    > ROLES=app cap staging remote:rake
    _(wait for console prompt)_

    > RAILS_ENV=production build:news_log
