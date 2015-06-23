class CreateDataImportPassages < ActiveRecord::Migration
  def change
    # == :data_import_passages entity
    #
    # Temporary table for data-import; counter-part of passages entity;
    # stores each passage lap timing available for a specific individual result found
    # during the data-import procedure.
    #
    create_table :data_import_passages do |t|
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

      t.integer  :stroke_cycles,            :limit => 3
      t.integer  :not_swam_part_seconds,    :limit => 2
      t.integer  :not_swam_part_hundreds,   :limit => 2
      t.integer  :not_swam_kick_number,     :limit => 2
      t.integer  :breath_number,            :limit => 3
      t.integer  :position,                 :limit => 3
      t.integer  :minutes_from_start,       :limit => 3
      t.integer  :seconds_from_start,       :limit => 2
      t.integer  :hundreds_from_start,      :limit => 2
      t.boolean  :is_native_from_start,     :default => false

      t.references :passage_type

      t.references :data_import_meeting_program
      t.references :data_import_meeting_individual_result
      t.references :data_import_meeting_entry
      t.references :data_import_swimmer
      t.references :data_import_team

      t.references :meeting_program
      t.references :meeting_individual_result
      t.references :meeting_entry
      t.references :swimmer
      t.references :team

      t.references :user
    end
  end
end
