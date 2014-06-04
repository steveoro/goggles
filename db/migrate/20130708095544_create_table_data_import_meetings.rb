class CreateTableDataImportMeetings < ActiveRecord::Migration
  def change
    create_table :data_import_meetings do |t|
      t.primary_key :id
      t.integer     :lock_version,  :default => 0
      t.timestamps
                                                    # Adds the current data-import session unique identifier:
      t.references :data_import_session
                                                    # This will have a value != 0 only if a conflicting row id was found during the parsing phase
      t.integer :conflicting_id, :limit => 8, :default => 0
      t.string  :import_text, :null => false

      t.string :description, :limit => 100
      t.date :entry_deadline
      t.boolean :has_warm_up_pool, :default => false
      t.boolean :is_under_25_admitted, :default => false

      t.string :reference_phone, :limit => 40
      t.string :reference_e_mail, :limit => 50
      t.string :reference_name, :limit => 50
      t.text :notes
      t.string :tag, :limit => 20

      t.boolean :has_invitation, :default => false
      t.boolean :has_start_list, :default => false
      t.boolean :are_results_acquired, :default => false

      t.integer :max_individual_events, :limit => 1, :default => 2
      t.string :configuration_file, :limit => 50
      t.integer :challenge_number, :limit => 3, :default => 0, :comment => 'Numero prova per le gare che rientrano in un campionato'

      t.references :data_import_season
      t.references :season
      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :data_import_meetings, :entry_deadline
  end
  # ---------------------------------------------------------------------------
end
