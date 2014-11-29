class AddSomeFlagsToSeasonsAndMeetings < ActiveRecord::Migration
  def up
    change_table :seasons do |t|
      t.boolean :has_individual_rank, :null => false, :default => true, :comment => 'TRUE when the season has an individual ranking'
    end
    
    change_table :meeting_entries do |t|
      t.boolean :is_no_time, :null => false, :default => false, :comment => 'TRUE when the entry is no-time entry'
    end

    change_table :meeting_events do |t|
      t.boolean :has_separate_gender_start_list, :null => false, :default => true, :comment => 'TRUE when the event start list is separate by gender'
      t.boolean :has_separate_category_start_list, :null => false, :default => false, :comment => 'TRUE when the event start list is separate by category'
    end
  end
  # ---------------------------------------------------------------------------

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # ---------------------------------------------------------------------------
end
