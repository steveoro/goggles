## HOWTO: Store text files into dedicated _text_ columns on the DB:

### Convert any .doc file to HTML with OpenOffice/LibreOffice:
From bash shell or any other prompt, assuming the file 'inv20141130csiprova1.doc'
is under current directory:

  > soffice --headless --convert-to html:"XHTML Writer File" ./inv20141130csiprova1.doc


### Store an (X)HTML file of a _Meeting.invitation_:
Use the rake task **db:store_meeting_invitation**:

  With Zeus server running:
  > zeus rake db:store_meeting_invitation meeting_id=<meeting_id> file=<path_to_file>
  Or:
  > bundle exec rake db:store_meeting_invitation meeting_id=<meeting_id> file=<path_to_file>

**=> USE the DEDICATED Capistrano task to REMOTELY execute a db:store_meeting_invitation task! <=**
For more info:
> cap -D db:remote:store_meeting_invitation

(It does almost everything in one step directly on the remote server, given an already
 existing or converted XHTML invitation file.)


### Store an (X)HTML file of a _Season.rules_:
Use the rake task **db:store_season_rules**:

  With Zeus server running:
  > zeus rake db:db:store_season_rules season_id=<season_id> file=<path_to_file>
  Or:
  > bundle exec rake db:db:store_season_rules season_id=<season_id> file=<path_to_file>
