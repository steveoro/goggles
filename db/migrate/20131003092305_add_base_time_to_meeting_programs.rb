class AddBaseTimeToMeetingPrograms < ActiveRecord::Migration
  def change
    change_table(:meeting_programs) do |t|
      t.integer :minutes, :limit => 3, :null => true, :default => 0, :comment => 'Base time'
      t.integer :seconds, :limit => 2, :null => true, :default => 0, :comment => 'Base time'
      t.integer :hundreds, :limit => 2, :null => true, :default => 0, :comment => 'Base time'
      t.references :accreditation_time_type
    end

    change_table(:data_import_meeting_programs) do |t|
      t.integer :minutes, :limit => 3, :null => true, :default => 0, :comment => 'Base time'
      t.integer :seconds, :limit => 2, :null => true, :default => 0, :comment => 'Base time'
      t.integer :hundreds, :limit => 2, :null => true, :default => 0, :comment => 'Base time'
      t.references :accreditation_time_type
    end
  end
end
