# encoding: utf-8

require_relative '../../../app/strategies/sql_converter'


=begin

= DataImportEntityCommitter

  - Goggles framework vers.:  4.00.581
  - author: Steve A.

  Service/DSL implementation oriented to commit data-import entities, required
  by the "phase 3" of the data-import procedure.


=== Typical usage:

TODO


=== Example (for DataImportSwimmer commit):

TODO specify parameters to the block for the commit

  swimmer_committer = DataImportEntityCommitter.new( data_import_session, DataImportSwimmer, 6 )

  swimmer_committer.commit do
    Swimmer.transaction do
      committed_row = Swimmer.new(
        last_name:      di_row.last_name,
        first_name:     di_row.first_name,
        complete_name:  di_row.complete_name,
        year_of_birth:  di_row.year_of_birth,
        gender_type_id: di_row.gender_type_id,
        user_id:        di_row.user_id
      )
      committed_row.save!
    end
                                              # Update dependancies:
    DataImportBadge.where(
      data_import_swimmer_id: di_row.id
    ).update_all( swimmer_id: committed_row.id )

    DataImportMeetingIndividualResult.where(
      data_import_swimmer_id: di_row.id
    ).update_all( swimmer_id: committed_row.id )

    committed_row
  end

=end
class DataImportEntityCommitter
  include SqlConverter

  attr_reader :data_import_session, :committed_data_rows, :last_error
  #-- -------------------------------------------------------------------------
  #++

# TODO logger needed?

  # Creates a new instance.
  #
  def initialize( data_import_session, entity, phase_num )
    @data_import_session = data_import_session
    # TODO Require entity to be kind_of something?
    @entity     = entity
    @phase_num  = phase_num
    @last_error = nil
    @committed_data_rows = 0
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns +true+ if the current status doesn't have any associated error.
  #
  def is_ok?
    @last_error.nil?
  end


  # Commits all the detail rows found for the current Entity.
  # Returns +true+ on success, +false+ on error.
  #
  def commit( &block )
    # TODO Require block existance?
    is_ok = true
    di_records = @entity.where( data_import_session_id: @data_import_session.id )
    di_records.each do |di_row|
      begin
        @committed_row = instance_eval( &block )
      rescue
        is_ok = false
        @data_import_session.phase_2_log << "\r\n#{ di_row.class.name } commit: exception caught during save!\r\n"
        if $!
          @last_error = $!
          @data_import_session.phase_2_log << "#{ $!.to_s }\r\n" if $!
        end
      else
# DEBUG
#        logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.complete_name}'." )
        @data_import_session.phase_2_log << "Committed #{ @committed_row.class.name }, #{ @committed_row.inspect }.\r\n"
        @data_import_session.sql_diff    << to_sql_insert( @committed_row )
        @committed_data_rows += 1
      end
      data_import_session.phase_3_log = "COMMIT:#{ @phase_num }/10"
      data_import_session.save!
      is_ok
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
