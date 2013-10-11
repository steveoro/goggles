class CreateTableMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :lock_version, :default => 0
      t.string :description, :limit => 100, :null => false
      t.date :entry_deadline
      t.boolean :has_warm_up_pool, :default => false
      t.boolean :is_under_25_admitted, :default => false

      t.string :reference_phone, :limit => 40
      t.string :reference_e_mail, :limit => 50
      t.string :reference_name, :limit => 50
      t.text :notes

      t.boolean :has_invitation, :default => false
      t.boolean :has_start_list, :default => false
      t.boolean :are_results_acquired, :default => false

      t.integer :max_individual_events, :limit => 1, :default => 2
      t.string :configuration_file, :limit => 255
      t.integer :challenge_number, :limit => 3, :default => 0, :comment => 'Numero prova per le gare che rientrano in un campionato'

      t.references :season
      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :meetings, :entry_deadline
  end
  # ---------------------------------------------------------------------------
end
