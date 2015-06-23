class CreateDataImportMeetingRelaySwimmers < ActiveRecord::Migration
  def change
    # == :data_import_meeting_relay_swimmers entity
    #
    # Temporary table for data-import; counter-part of meeting_relay_swimmers;
    # stores each swimmer enrolled in a relay, when available or found.
    #
    create_table :data_import_meeting_relay_swimmers do |t|
      t.integer :lock_version, :default => 0
      t.timestamps
                                                    # Adds the current data-import session unique identifier:
      t.references :data_import_session
                                                    # This will have a value != 0 only if a conflicting row id was found during the parsing phase
      t.integer :conflicting_id, :limit => 8, :default => 0
      t.string  :import_text, :null => false

      t.integer :conflicting_id, :limit => 3, :default => 0

      t.decimal :reaction_time, :precision => 5, :scale => 2
      t.integer :minutes, :limit => 3, :null => true
      t.integer :seconds, :limit => 2, :null => true
      t.integer :hundreds, :limit => 2, :null => true
      t.integer :relay_order, :limit => 3, :default => 0

      t.references :data_import_swimmer
      t.references :data_import_team
      t.references :data_import_badge

      t.references :swimmer
      t.references :badge

      t.references :stroke_type
      t.references :meeting_relay_result

      t.references :user
    end
  end
end
