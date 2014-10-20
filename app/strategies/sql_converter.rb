# encoding: utf-8


=begin

= SqlConverter

  - Goggles framework vers.:  4.00.573
  - author: Steve A.

  Container module for methods or strategies to obtain complete SQL statements from
  ActiveRecord object instances.

=end
module SqlConverter

  # Re-creates an SQL INSERT statement using the attributes of the record instance specified.
  # (It assumes record.kind_of?(ActiveRecord::Base) is +true+).
  #
  def to_sql_insert( record )
    con = record.connection
    sql_text = "#{ get_sql_comment(record) }INSERT INTO #{ con.quote_column_name( record.class.table_name ) } "
    columns = []
    values  = []
    record.attributes
      .reject{ |key| key == 'lock_version' }
      .each do |key, value|
      columns << con.quote_column_name( key )
      values  << con.quote( value )
    end
    sql_text << "(#{ columns.join(', ') })\r\nVALUES (#{ values.join(', ') });\r\n\r\n"
    sql_text
  end


  # Re-creates an SQL UPDATE statement using the attributes of the record instance specified.
  # (It assumes record.kind_of?(ActiveRecord::Base) is +true+).
  #
  def to_sql_update( record )
    con = record.connection
    sql_text = "#{ get_sql_comment(record) }UPDATE #{ con.quote_column_name( record.class.table_name ) }\r\n"
    sets = []
    record.attributes
      .reject{ |key| key == 'id' || key == 'lock_version' }
      .each do |key, value|
      sets << "#{ con.quote_column_name(key) }=#{ con.quote(value) }"
    end
    sql_text << "SET #{ sets.join(', ') }\r\n"
    sql_text << "WHERE (#{ con.quote_column_name('id') }=#{ record.id });\r\n\r\n"
    sql_text
  end


  # Re-creates an SQL DELETE statement using the attributes of the record instance specified.
  # (It assumes record.kind_of?(ActiveRecord::Base) is +true+).
  #
  def to_sql_delete( record )
    con = record.connection
    sql_text = "#{ get_sql_comment(record) }DELETE FROM #{ con.quote_column_name( record.class.table_name ) } "
    columns = []
    values  = []
    sql_text << "WHERE (#{ con.quote_column_name('id') }=#{ record.id });\r\n\r\n"
    sql_text
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Returns a line of comment to be included in each resulting SQL operation
  # logged.
  def get_sql_comment( record )
    user = record if record.instance_of?( User )
    # For UserSwimmerConfirmation the active subject is the :confirmator, not
    # the :user. So we give it an higher precendence:
    user ||= record.confirmator if record.respond_to?( :confirmator )
    user ||= record.user if record.respond_to?( :user )
    "-- #{user}\r\n"
  end
end