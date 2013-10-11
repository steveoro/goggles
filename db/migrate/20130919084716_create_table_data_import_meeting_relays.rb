class CreateTableDataImportMeetingRelays < ActiveRecord::Migration
  def change
    # == data_import_meeting_relays entity
    #
    # Temporary table for data-import; counter-part of meeting_relays;
    # stores just the relay header, with its type and its base time.
    #
    create_table :data_import_meeting_relays do |t|
      t.primary_key :id
      t.integer :lock_version, :default => 0
      t.timestamps
                                                    # Adds the current data-import session unique identifier:
      t.references :data_import_session
                                                    # This will have a value != 0 only if a conflicting row id was found during the parsing phase
      t.integer :conflicting_meeting_relay_id, :limit => 8, :default => 0
      t.string  :import_text, :null => false

      t.integer :minutes, :limit => 3, :null => false, :default => 0, :comment => 'Accreditation time'
      t.integer :seconds, :limit => 2, :null => false, :default => 0, :comment => 'Accreditation time'
      t.integer :hundreds, :limit => 2, :null => false, :default => 0, :comment => 'Accreditation time'

      t.references :data_import_meeting_program
      t.references :meeting_program

      t.references :relay_type
      t.references :accreditation_time_type

      # Used by the "updated_by" getter:
      t.references :user
    end
  end
end
