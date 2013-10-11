class CreateTableDataImportMeetingIndividualResults < ActiveRecord::Migration
  def change
    create_table :data_import_meeting_individual_results do |t|
      t.primary_key :id
      t.integer     :lock_version,  :default => 0
      t.timestamps
                                                    # Adds the current data-import session unique identifier:
      t.references :data_import_session
                                                    # This will have a value != 0 only if a conflicting row id was found during the parsing phase
      t.integer :conflicting_meeting_individual_result_id, :limit => 8, :default => 0
      t.string  :import_text, :null => false

      t.string :athlete_name, :limit => 100, :null => false
      t.string :team_name, :limit => 60, :null => false

      t.string :athlete_badge_number, :limit => 40
      t.string :team_badge_number, :limit => 40

      t.integer :year_of_birth, :limit => 4, :null => false, :default => 1900
      t.integer :rank, :limit => 4, :null => false, :default => 0

      t.boolean :is_play_off, :null => false, :default => false
      t.boolean :is_out_of_race, :null => false, :default => false
      t.boolean :is_disqualified, :null => false, :default => false

      t.decimal :standard_points, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.decimal :meeting_points, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.integer :minutes, :limit => 3, :null => false, :default => 0
      t.integer :seconds, :limit => 2, :null => false, :default => 0
      t.integer :hundreds, :limit => 2, :null => false, :default => 0

      t.references :data_import_meeting_program
      t.references :meeting_program
      t.references :result_type

      t.references :data_import_swimmer
      t.references :data_import_team
      t.references :data_import_badge
      t.references :swimmer
      t.references :team
      t.references :badge

      # Used by the "updated_by" getter:
      t.references :user
    end
  end
end
