class AlterTableMeetingEntries < ActiveRecord::Migration
  def change    
    remove_column :meeting_entries, :entry_minutes      
    remove_column :meeting_entries, :entry_seconds      
    remove_column :meeting_entries, :entry_hundreds

    change_table :meeting_entries do |t|
      t.integer :minutes, :limit => 3, :null => true
      t.integer :seconds, :limit => 2, :null => true
      t.integer :hundreds, :limit => 2, :null => true
    end
  end
end
