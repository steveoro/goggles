class CreateMeetingEntries < ActiveRecord::Migration
  def change
    create_table :meeting_entries do |t|
      t.integer :lock_version, :default => 0
      t.timestamps
      
      t.integer :entry_minutes, :limit => 3, :null => true
      t.integer :entry_seconds, :limit => 2, :null => true
      t.integer :entry_hundreds, :limit => 2, :null => true
      t.integer :start_list_number, :limit => 4, :null => true
      t.integer :lane_number, :limit => 2, :null => true
      t.integer :heat_number, :limit => 4, :null => true
      t.integer :heat_arrival_order, :limit => 2, :null => true
      
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
