class AlterMeetingSessionsTimeFields < ActiveRecord::Migration
  def up
    change_table(:meeting_sessions) do |t|
      t.rename   :warm_up_datetime, :warm_up_time
      t.rename   :begin_datetime, :begin_time
    end
  end

  def down
      t.rename   :warm_up_time, :warm_up_datetime
      t.rename   :begin_time, :begin_datetime
  end
end
