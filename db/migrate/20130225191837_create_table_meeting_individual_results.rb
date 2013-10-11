class CreateTableMeetingIndividualResults < ActiveRecord::Migration
  def change
    create_table :meeting_individual_results do |t|
      t.integer :lock_version, :default => 0

      t.string :athlete_name, :limit => 100, :null => false, :comment => 'Filled-in either by data-import or Person relation'
      t.string :team_name, :limit => 60, :null => false, :comment => 'Filled-in either by data-import or Team relation'

      t.string :athlete_badge_number, :limit => 40
      t.string :team_badge_number, :limit => 40

      t.integer :year_of_birth, :limit => 4, :null => false, :default => 1900
      t.integer :rank, :limit => 4, :null => false, :default => 0

      t.boolean :is_play_off, :null => false, :default => false, :comment => 'Flag signaling a play-off result for the qualify heat'
      t.boolean :is_out_of_race, :null => false, :default => false, :comment => 'This athlete does not compete for score inside the result chart'
      t.boolean :is_disqualified, :null => false, :default => false, :comment => 'Disqualify flag'

      t.decimal :standard_points, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.decimal :meeting_points, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.integer :minutes, :limit => 3, :null => false, :default => 0
      t.integer :seconds, :limit => 2, :null => false, :default => 0
      t.integer :hundreds, :limit => 2, :null => false, :default => 0

      t.references :meeting_program
      t.references :result_type

      t.references :swimmer
      t.references :team
      t.references :badge

      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end
  end
end
