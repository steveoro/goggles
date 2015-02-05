class CreateDataImportMeetingEntries < ActiveRecord::Migration
  def change
    # == :data_import_meeting_entries entity
    #
    # Temporary table for data-import; counter-part of meeting_entries;
    # stores each single meeting entry row, when available.
    #
    create_table :data_import_meeting_entries do |t|
      t.integer :lock_version, :default => 0
      t.timestamps
                                                    # Adds the current data-import session unique identifier:
      t.references :data_import_session
                                                    # This will have a value != 0 only if a conflicting row id was found during the parsing phase
      t.integer :conflicting_id, :limit => 8, :default => 0
      t.string  :import_text, :null => false

      t.string  :athlete_name,         :limit => 100
      t.string  :team_name,            :limit => 60
      t.string  :athlete_badge_number, :limit => 40
      t.string  :team_badge_number,    :limit => 40
      t.integer :year_of_birth,        :default => 1900

      t.integer :minutes, :limit => 3, :null => true
      t.integer :seconds, :limit => 2, :null => true
      t.integer :hundreds, :limit => 2, :null => true

      t.boolean :is_no_time, :default => false
      t.integer :start_list_number, :limit => 4, :null => true
      t.integer :lane_number, :limit => 2, :null => true
      t.integer :heat_number, :limit => 4, :null => true
      t.integer :heat_arrival_order, :limit => 2, :null => true

      t.references :data_import_meeting_program
      t.references :data_import_swimmer
      t.references :data_import_team
      t.references :data_import_badge

      t.references :meeting_program
      t.references :swimmer
      t.references :team
      t.references :team_affiliation
      t.references :badge
      t.references :entry_time_type
      t.references :user
    end
  end
end
