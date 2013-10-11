class CreateTypesTablesPart2 < ActiveRecord::Migration

  def up
    create_table :accreditation_time_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 1, :null => false

      # Virtual fields that need to use locales + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"

      t.timestamps
    end

    add_index :accreditation_time_types, :code, :unique => true
    # -------------------------------------------------------------------------


    create_table :passage_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 6, :null => false
      t.integer :length_in_meters, :limit => 3
      t.timestamps
    end

    add_index :passage_types, :code, :unique => true
    # -------------------------------------------------------------------------


    create_table :relay_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 10, :null => false

      t.integer :mixed_gender, :limit => 1, :default => 0
      t.integer :partecipants, :limit => 2, :default => 4
      t.integer :phases, :limit => 2, :default => 4
      t.integer :phase_length_in_meters, :limit => 3, :default => 50

      t.references :stroke_type
      t.timestamps
    end

    add_index :relay_types, :code, :unique => true
    execute <<-SQL
      ALTER TABLE relay_types
        ADD CONSTRAINT fk_relay_types_stroke_types
        FOREIGN KEY (stroke_type_id)
        REFERENCES stroke_types(id)
    SQL
    # -------------------------------------------------------------------------


    create_table :events_by_pool_types do |t|
      t.integer :lock_version, :default => 0

      t.references :pool_type
      t.references :event_type
      t.timestamps
    end
    execute <<-SQL
      ALTER TABLE events_by_pool_types
        ADD CONSTRAINT fk_events_by_pool_types_pool_types
        FOREIGN KEY (pool_type_id)
        REFERENCES pool_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE events_by_pool_types
        ADD CONSTRAINT fk_events_by_pool_types_event_types
        FOREIGN KEY (event_type_id)
        REFERENCES event_types(id)
    SQL
    # -------------------------------------------------------------------------


    create_table :result_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 10, :null => false

      # Virtual fields that need to use locales + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"

      t.integer :default_value, :limit => 1
      t.timestamps
    end

    add_index :result_types, :code, :unique => true
    # -------------------------------------------------------------------------
  end
  # ---------------------------------------------------------------------------


  def down
    execute <<-SQL
      ALTER TABLE relay_types
        DROP FOREIGN KEY fk_relay_types_stroke_types
    SQL
    drop_table :result_types

    execute <<-SQL
      ALTER TABLE events_by_pool_types
        DROP FOREIGN KEY fk_events_by_pool_types_pool_types
    SQL
    execute <<-SQL
      ALTER TABLE events_by_pool_types
        DROP FOREIGN KEY fk_events_by_pool_types_event_types
    SQL
    drop_table :events_by_pool_types

    drop_table :relay_types

    drop_table :passage_types
    drop_table :accreditation_time_types
  end
  # ---------------------------------------------------------------------------
end
