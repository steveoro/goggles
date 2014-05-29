class CreateTypesTablesPart1 < ActiveRecord::Migration

  def up
    create_table :gender_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 1, :null => false

      # Virtual fields that need to use locales + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"

      t.timestamps
    end

    add_index :gender_types, :code, :unique => true
    # -------------------------------------------------------------------------


    create_table :presence_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 1, :null => false

      # Virtual fields that need to use locale + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"

      t.integer :value, :limit => 3
      t.timestamps
    end

    add_index :presence_types, :code, :unique => true
    # -------------------------------------------------------------------------


    create_table :pool_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 3, :null => false

      t.integer :length_in_meters, :limit => 3
      t.timestamps
    end

    add_index :pool_types, :code, :unique => true
    # -------------------------------------------------------------------------


    create_table :federation_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 4, :null => false
      t.string :description, :limit => 100
      t.string :short_name, :limit => 10
      t.timestamps
    end

    add_index :federation_types, :code, :unique => true
    # -------------------------------------------------------------------------


    create_table :season_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 10, :null => false
      t.string :description, :limit => 100
      t.string :short_name, :limit => 40

      t.references :federation_type
      t.timestamps
    end

    add_index :season_types, :code, :unique => true
    execute <<-SQL
      ALTER TABLE season_types
        ADD CONSTRAINT fk_season_types_federation_types
        FOREIGN KEY (federation_type_id)
        REFERENCES federation_types(id)
    SQL
    # -------------------------------------------------------------------------


    create_table :stroke_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 2, :null => false

      # Virtual fields that need to use locale + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"

      t.timestamps
    end

    add_index :stroke_types, :code, :unique => true
    # -------------------------------------------------------------------------


    create_table :event_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 10, :null => false
      t.integer :length_in_meters, :limit => 5, :comment => 'Total length of the event'
      t.boolean :is_a_relay, :null => false, :default => false

      t.references :stroke_type
      t.timestamps
    end

    add_index :event_types, [:is_a_relay, :code], name: :code, :unique => true
    add_index :event_types, :is_a_relay

    execute <<-SQL
      ALTER TABLE event_types
        ADD CONSTRAINT fk_event_types_stroke_types
        FOREIGN KEY (stroke_type_id)
        REFERENCES stroke_types(id)
    SQL
    # -------------------------------------------------------------------------


    create_table :category_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 6, :null => false
      t.string :federation_code, :limit => 2, :null => false
      t.string :description, :limit => 100
      t.string :short_name, :limit => 50
      t.string :group_name, :limit => 50
      t.integer :age_begin, :limit => 3
      t.integer :age_end, :limit => 3
      t.boolean :is_a_relay, :null => false, :default => false

      t.references :season_type
      t.timestamps
    end

    add_index :category_types, [:season_type_id, :is_a_relay, :code], name: :season_type_and_code, :unique => true
    add_index :category_types, [:federation_code, :is_a_relay], name: :federation_code

    execute <<-SQL
      ALTER TABLE category_types
        ADD CONSTRAINT fk_category_types_season_types
        FOREIGN KEY (season_type_id)
        REFERENCES season_types(id)
    SQL
    # -------------------------------------------------------------------------
  end
  # ---------------------------------------------------------------------------


  def down
    execute <<-SQL
      ALTER TABLE category_types
        DROP FOREIGN KEY fk_category_types_season_types
    SQL

    execute <<-SQL
      ALTER TABLE event_types
        DROP FOREIGN KEY fk_event_types_stroke_types
    SQL

    execute <<-SQL
      ALTER TABLE season_types
        DROP FOREIGN KEY fk_season_types_federation_types
    SQL

    drop_table :gender_types

    drop_table :category_types

    drop_table :event_types
    drop_table :stroke_types

    drop_table :season_types
    drop_table :federation_types

    drop_table :pool_types
    drop_table :presence_types
  end
  # ---------------------------------------------------------------------------
end
