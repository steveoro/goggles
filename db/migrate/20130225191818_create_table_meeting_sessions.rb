class CreateTableMeetingSessions < ActiveRecord::Migration
  def change
    create_table :meeting_sessions do |t|
      t.integer :lock_version, :default => 0
      t.integer :session_order, :limit => 2, :null => false, :default => 0
      t.date :scheduled_date, :null => false
      t.time :warm_up_datetime
      t.time :begin_datetime
      t.text :notes

      t.references :meeting
      t.references :swimming_pool
      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :meeting_sessions, :scheduled_date
  end
  # ---------------------------------------------------------------------------
end
