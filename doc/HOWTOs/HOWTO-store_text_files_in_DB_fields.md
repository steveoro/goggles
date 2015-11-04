## HOWTO: Store text files into dedicated _text_ columns on the DB:

### Convert any .doc file to HTML with OpenOffice/LibreOffice:
From bash shell or any other prompt, assuming the file 'inv20141130csiprova1.doc'
is under current directory:

  > soffice --headless --convert-to html:"XHTML Writer File" ./inv20141130csiprova1.doc


### Store an (X)HTML file of a _Meeting.invitation_:
Use the rake task **db:store_meeting_invitation**:

  With Zeus server running (only for development DB):
  > zeus rake db:store_meeting_invitation meeting_id=<meeting_id> file=<path_to_file>
  Or:
  > bundle exec rake db:store_meeting_invitation meeting_id=<meeting_id> file=<path_to_file>

Launch the rake task twice (once for development and one for production) if both
DBs need to be updated.


- DO NOT USE the DEDICATED Capistrano task to REMOTELY execute a db:store_meeting_invitation task because the upload! of HTML has not been reliable enough for the current version of Capistrano

For more info:
> cap -D db:remote:store_meeting_invitation

(It does almost everything in one step directly on the remote server, given an already
 existing or converted XHTML invitation file -- but the task is currently **disabled**,
 see update below.)

(Steve, Update 20150420)
Beware of big files that may yield disconnection errors during the execution of the
above task.

** FOR IMPROVED RELAYABILITY, ALWAYS RUN EVERY THE RAKE TASK ON A LOCAL COPY OF THE REMOTE
PRODUCTION DB, AND USE THE REMOTE UPLOAD TASK TO PERFORM THE ACTUAL UPDATE. **


### Store an (X)HTML file of a _Season.rules_:
Use the rake task **db:store_season_rules**:

  With Zeus server running:
  > zeus rake db:db:store_season_rules season_id=<season_id> file=<path_to_file>
  Or:
  > bundle exec rake db:db:store_season_rules season_id=<season_id> file=<path_to_file>
