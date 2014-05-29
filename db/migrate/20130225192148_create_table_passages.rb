class CreateTablePassages < ActiveRecord::Migration
  def change
    create_table :passages do |t|
      t.integer :lock_version, :default => 0
      t.integer :minutes, :limit => 3, :null => false, :default => 0
      t.integer :seconds, :limit => 2, :null => false, :default => 0
      t.integer :hundreds, :limit => 2, :null => false, :default => 0

      t.references :meeting_program
      t.references :badge
      t.references :passage_type
      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :passages, [:meeting_program_id, :badge_id], name: 'passages_x_badges'
  end
end
