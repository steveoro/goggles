class CreateMeetingReservations < ActiveRecord::Migration
  def change
    create_table :meeting_reservations do |t|
      t.belongs_to :meeting
      t.belongs_to :team
      t.belongs_to :swimmer
      t.belongs_to :badge
      t.belongs_to :meeting_event
      t.belongs_to :user

      t.integer :suggested_minutes, :limit => 3, :comment => 'Desired entry time'
      t.integer :suggested_seconds, :limit => 2, :comment => 'Desired entry time'
      t.integer :suggested_hundreds, :limit => 2, :comment => 'Desired entry time'
      t.text :notes

      t.timestamps
    end

    add_index :meeting_reservations, :meeting_id
    add_index :meeting_reservations, :team_id
    add_index :meeting_reservations, :swimmer_id
    add_index :meeting_reservations, :badge_id
    add_index :meeting_reservations, :meeting_event_id
    add_index :meeting_reservations, :user_id
  end
end
