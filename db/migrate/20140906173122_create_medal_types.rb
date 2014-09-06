class CreateMedalTypes < ActiveRecord::Migration
  def change
    create_table :medal_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 1, :null => false
      # Virtual fields that need to use locales + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"

      t.timestamps

      t.integer :rank,            :default => 0
      t.integer :weigth,          :default => 0
    end
    add_index :medal_types, :code, :unique => true
    # -------------------------------------------------------------------------
  end
end
