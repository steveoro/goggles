class CreateTableMeetingPrograms < ActiveRecord::Migration
  def change
    create_table :meeting_programs do |t|
      t.integer :lock_version, :default => 0

      t.integer :event_order, :limit => 3, :null => false, :default => 0
      t.datetime :begin_time

      t.references :meeting_session

      t.references :event_type
      t.references :category_type
      t.references :gender_type
      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :meeting_programs, [:meeting_session_id, :event_order], :name => 'meeting_order', :unique => true
    add_index :meeting_programs, [:meeting_session_id, :event_type_id], :name => 'meeting_event_type'
    add_index :meeting_programs, [:meeting_session_id, :category_type_id], :name => 'meeting_category_type'
    add_index :meeting_programs, [:meeting_session_id, :gender_type_id],    :name => 'meeting_gender_type'
  end
end
