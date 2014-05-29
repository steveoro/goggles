class AddScoreComputationTypesToMeetings < ActiveRecord::Migration
  def change
    # ----------------- MEETINGS ----------------------------------------------
    change_table(:meetings) do |t|
      t.belongs_to( :individual_score_computation_type,
                  class_name: "ScoreComputationType", 
                  foreign_key: "individual_score_computation_type_id"
      )
      t.belongs_to( :relay_score_computation_type,
                  class_name: "ScoreComputationType", 
                  foreign_key: "relay_score_computation_type_id"
      )
      t.belongs_to( :team_score_computation_type,
                  class_name: "ScoreComputationType", 
                  foreign_key: "team_score_computation_type_id"
      )
    end

    execute <<-SQL
      ALTER TABLE meetings
        ADD CONSTRAINT fk_meetings_score_individual_score_computation_types
        FOREIGN KEY (individual_score_computation_type_id)
        REFERENCES score_computation_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE meetings
        ADD CONSTRAINT fk_meetings_score_relay_score_computation_types
        FOREIGN KEY (relay_score_computation_type_id)
        REFERENCES score_computation_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE meetings
        ADD CONSTRAINT fk_meetings_score_team_score_computation_types
        FOREIGN KEY (team_score_computation_type_id)
        REFERENCES score_computation_types(id)
    SQL

    # ----------------- DATA IMPORT MEETINGS ----------------------------------
    change_table(:data_import_meetings) do |t|
      t.belongs_to( :individual_score_computation_type,
                  class_name: "ScoreComputationType", 
                  foreign_key: "individual_score_computation_type_id"
      )
      t.belongs_to( :relay_score_computation_type,
                  class_name: "ScoreComputationType", 
                  foreign_key: "relay_score_computation_type_id"
      )
      t.belongs_to( :team_score_computation_type,
                  class_name: "ScoreComputationType", 
                  foreign_key: "team_score_computation_type_id"
      )
    end
  end
end
