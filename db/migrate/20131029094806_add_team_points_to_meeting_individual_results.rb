class AddTeamPointsToMeetingIndividualResults < ActiveRecord::Migration
  def change
    # ----------------- MEETING INDIVIDUAL RESULTS ----------------------------
    change_table(:meeting_individual_results) do |t|
      t.decimal :team_points, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.rename :meeting_points,  :meeting_individual_points
    end

    # ----------------- DATA IMPORT MEETING INDIVIDUAL RESULTS ----------------
    change_table(:data_import_meeting_individual_results) do |t|
      t.decimal :team_points, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.rename :meeting_points,  :meeting_individual_points
    end
  end
end
