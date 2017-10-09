

=begin

 == Constants container for all the Capistrano tasks.

 In order to be loaded first, this file should be named accordingly.
 Put here anything that should be re-used among more than one task.

  @author Steve A.
  @build  2017.02.22

  (ASSUMES TO BE rakeD inside Rails.root)
 (p) FASAR Software 2007-2017

=end
#-- ---------------------------------------------------------------------------
#++


GOGGLES_ADMIN_PATH = File.absolute_path( File.join(Dir.pwd, File.join('..', 'goggles_admin')) ) unless defined? GOGGLES_ADMIN_PATH
GOGGLES_DOCS_BACKUP_DB_PATH = File.join("#{Dir.pwd}.docs", 'backup.db', 'history.gold') unless defined? GOGGLES_DOCS_BACKUP_DB_PATH

DB_DUMP_LOCAL_PATH = File.join( GOGGLES_ADMIN_PATH, 'db', 'dump' ) unless defined? DB_DUMP_LOCAL_PATH
DB_DIFFS_NEW_PATH  = File.join( GOGGLES_ADMIN_PATH, 'db', 'diff.new' ) unless defined? DB_DIFFS_NEW_PATH
DB_DIFFS_APPLIED_PATH = File.join( GOGGLES_ADMIN_PATH, 'db', 'diff.applied' ) unless defined? DB_DIFFS_APPLIED_PATH
#-- ---------------------------------------------------------------------------
#++


set(
  :ask_src_sql_file_path,
  ask(
    "\r\nEnter the local (source) full pathname to the compressed SQL script file to be uploaded and executed remotely: ",
    File.join( DB_DUMP_LOCAL_PATH, 'production.sql.bz2' )
  )
)


set(
  :ask_dest_sql_path,
  ask(
    "\r\nEnter the destination PATH (no filename) for the SQL dump file: ",
    GOGGLES_DOCS_BACKUP_DB_PATH
  )
)


set(
  :ask_src_dbdiff_file_path,
  ask(
    "\r\nEnter the local (source) directory to the SQL DB-Diff files to be uploaded and executed remotely: ",
    DB_DIFFS_NEW_PATH
  )
)
#-- ---------------------------------------------------------------------------
#++
