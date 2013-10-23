class CreateEditionTypesAndDayPartTypes < ActiveRecord::Migration

  def change
    create_table :edition_types do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :code, :limit => 1, :null => false
      # Virtual fields that need to use locales + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"
    end
    add_index :edition_types, :code, :unique => true
    # -------------------------------------------------------------------------

    create_table :day_part_types do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :code, :limit => 1, :null => false
      # Virtual fields that need to use locales + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"
    end
    add_index :day_part_types, :code, :unique => true
  end
  # ---------------------------------------------------------------------------
end
