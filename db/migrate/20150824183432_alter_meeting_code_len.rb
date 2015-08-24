class AlterMeetingCodeLen < ActiveRecord::Migration
  def change
    change_column :meetings, :code, :string, :limit => 50
    change_column :data_import_meetings, :code, :string, :limit => 50
  end
end
