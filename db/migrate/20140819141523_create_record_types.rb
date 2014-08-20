class CreateRecordTypes < ActiveRecord::Migration
  def change
    create_table :record_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 3, :null => false
      # Virtual fields that need to use locales + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"

      t.timestamps

      t.boolean :is_for_swimmers, :null => false, :default => false
      t.boolean :is_for_teams,    :null => false, :default => false
      t.boolean :is_for_seasons,  :null => false, :default => false
    end
    add_index :record_types, :code, :unique => true
    # -------------------------------------------------------------------------
  end
end
