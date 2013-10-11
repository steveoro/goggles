class CreateTableDataImportMeetingSessionsAndPrograms < ActiveRecord::Migration
  def change
    create_table :data_import_meeting_sessions do |t|
      t.primary_key :id
      t.integer     :lock_version,  :default => 0
      t.timestamps
                                                    # Adds the current data-import session unique identifier:
      t.references :data_import_session
                                                    # This will have a value != 0 only if a conflicting row id was found during the parsing phase
      t.integer :conflicting_meeting_session_id, :limit => 8, :default => 0
      t.string  :import_text, :null => false

      t.integer :session_order, :limit => 2, :null => false, :default => 0
      t.date :scheduled_date, :null => false
      t.time :warm_up_time
      t.time :begin_time
      t.text :notes

      t.references :data_import_meeting
      t.references :meeting

      t.references :swimming_pool
      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :data_import_meeting_sessions, :scheduled_date


    create_table :data_import_meeting_programs do |t|
      t.primary_key :id
      t.integer     :lock_version,  :default => 0
      t.timestamps
                                                    # Adds the current data-import session unique identifier:
      t.references :data_import_session
                                                    # This will have a value != 0 only if a conflicting row id was found during the parsing phase
      t.integer :conflicting_meeting_program_id, :limit => 8, :default => 0
      t.string  :import_text, :null => false

      t.integer :event_order, :limit => 3, :null => false, :default => 0
      t.time :begin_time

      t.references :data_import_meeting_session
      t.references :meeting_session

      t.references :event_type
      t.references :category_type
      t.references :gender_type
      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :data_import_meeting_programs, [:meeting_session_id, :event_order],       :name => 'meeting_order', :unique => true
    add_index :data_import_meeting_programs, [:meeting_session_id, :event_type_id],     :name => 'meeting_event_type'
    add_index :data_import_meeting_programs, [:meeting_session_id, :category_type_id],  :name => 'meeting_category_type'
    add_index :data_import_meeting_programs, [:meeting_session_id, :gender_type_id],    :name => 'meeting_gender_type'
  end
end
