class CreateTimingTypes < ActiveRecord::Migration
  def change
    create_table :timing_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 1, :null => false
      # Virtual fields that need to use locales + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"

      t.timestamps
    end
    add_index :timing_types, :code, :unique => true
    # -------------------------------------------------------------------------
  end
end
