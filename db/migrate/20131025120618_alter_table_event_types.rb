class AlterTableEventTypes < ActiveRecord::Migration
  def change
    change_table(:event_types) do |t|
      t.boolean :is_mixed_gender, :default => false, :null => false
      t.integer :partecipants, :limit => 2, :default => 4
      t.integer :phases, :limit => 2, :default => 4
      t.integer :phase_length_in_meters, :limit => 3, :default => 50
    end
  end
end
