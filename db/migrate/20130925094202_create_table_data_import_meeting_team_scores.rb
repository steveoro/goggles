class CreateTableDataImportMeetingTeamScores < ActiveRecord::Migration
  def change
    create_table :data_import_meeting_team_scores do |t|
      t.primary_key :id
      t.integer     :lock_version,  :default => 0
      t.timestamps
                                                    # Adds the current data-import session unique identifier:
      t.references :data_import_session
                                                    # This will have a value != 0 only if a conflicting row id was found during the parsing phase
      t.integer :conflicting_challenge_score_id, :limit => 8, :default => 0
      t.string  :import_text, :null => false

      t.decimal :total_individual_points, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.decimal :total_relay_points, :precision => 10, :scale => 2, :default => 0.0, :null => false

      t.references :data_import_team                # this entity acts as temp table for both teams and team_affiliations
      t.references :data_import_meeting
      t.references :team
      t.references :meeting
      t.timestamps
    end
  end
end
