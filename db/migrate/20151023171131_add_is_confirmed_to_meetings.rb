class AddIsConfirmedToMeetings < ActiveRecord::Migration
  def change
    change_table :meetings do |t|
      t.boolean :is_confirmed, :null => false, :default => false
    end
  end
end
