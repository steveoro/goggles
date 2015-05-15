## HOWTO: Deploy the Application on the remote server:

Capistrano "v. ~> 3" allows to define several configuration roles under _config/deploy_.

These files contain sensitive information and are read automatically when the **cap**
command is executed, thus they should be always _excluded_ from the public repository.
(Together with the crypto key to access remotely the EC2 instance.)

Always exclude the DB role when deploying because it's not currently possibile to
connect through _ssh_ to the DB Server (which is an Amazon RDS instance).


### Standard deploy:

The role required is just _app_. (No _db_ or _web_)

1) **Maintenance**
   Toggle Maintenance mode ON (see proper HOWTO).
   It can be done in a couple of ways with Capistrano, or directly setting the
   proper flag into the production DB.

2) **Deploy**
   Deploy the current version with Capistrano:
    > ROLES=app cap ocean deploy

   At the end of the deployment, all db:sessions and tmp/cache is cleared out
   automatically before Apache server restart.

3) **Newslog update with Maintenance off**
    Create an additional, standard news-log row to notify the users of the update:
    > ROLES=app cap ocean remote:rake
    _(wait for console prompt)_

    > RAILS_ENV=production build:news_log build:maintenance mode=0

4) **Cache rebuild**
   Wait at least 5 minutes and force a cache rebuild with the dedicated local rake
   task. This will perform several remote server requests to initialize the cache
   with the most common searched pages.

   The environment must be production (assuming a recent dump has been rebuilt),
   so that the current users, teams and meetings can be looked-up.

   By specifying a user e-mail & password, pages behind the login wall will be
   accessed using the login API. The task will automatically perform a logout at
   the end.

   > RAILS_ENV=production bundle exec rake cache:rebuild user_email=<user_email> user_pwd=<user_password>

