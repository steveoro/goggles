class CreateTableSwimmerResults < ActiveRecord::Migration
  def change
    create_table :swimmer_results do |t|
      t.integer :lock_version, :default => 0

      t.decimal :standard_points, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.decimal :obercup_points, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.integer :rank, :limit => 5, :null => false, :default => 0, :comment => 'Piazzamento nella singola gara'
      t.boolean :is_disqualified, :null => false, :default => false, :comment => 'Indicatore di squalifica'

      t.integer :minutes, :limit => 3, :null => false, :default => 0
      t.integer :seconds, :limit => 2, :null => false, :default => 0
      t.integer :hundreds, :limit => 2, :null => false, :default => 0

      t.references :swimmer
      t.references :badge

      t.references :meeting_program
      t.references :season_type
      t.references :category_type
      t.references :result_type
      t.references :pool_type
                                                    # Duplicate (shortcut) reference that may be filled-in at a later stage:
      t.references :meeting_individual_result

      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :swimmer_results, [:meeting_individual_result_id, :meeting_program_id, :rank], name: 'meeting_id_rank'
  end
end
