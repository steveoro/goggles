class AlterMeetingProgramsIndex < ActiveRecord::Migration
  def up                                            # remove the "unique=true" versions of the index:
    remove_index :meeting_programs, name: :meeting_order
    remove_index :data_import_meeting_programs, name: :meeting_order

    add_index :meeting_programs, [:meeting_session_id, :event_order], name: :meeting_order
    add_index :data_import_meeting_programs, [:meeting_session_id, :event_order], name: :meeting_order
  end

  def down
    remove_index :meeting_programs, name: :meeting_order
    remove_index :data_import_meeting_programs, name: :meeting_order

    add_index :meeting_programs, [:meeting_session_id, :event_order], name: :meeting_order, :unique => true
    add_index :data_import_meeting_programs, [:meeting_session_id, :event_order], name: :meeting_order, :unique => true
  end
end
