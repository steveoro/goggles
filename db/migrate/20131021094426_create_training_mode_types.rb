class CreateTrainingModeTypes < ActiveRecord::Migration
  def change
    create_table :training_mode_types do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :code, :limit => 5, :null => false
      # Virtual fields that need to use locales + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"
    end

    add_index :training_mode_types, :code, :unique => true

    # [Steve, 20131023] ER-SQL source:
    # CREATE TABLE `training_mode_types` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `code` VARCHAR(5) NOT NULL COMMENT 'Codice regime allenamento (A1, A2, B1, etc.)',
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_training_mode_types` PRIMARY KEY (`id`),
        # CONSTRAINT `uk_training_mode_types_1` UNIQUE (`code`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 COMMENT = 'Regimi allenamenti (A1, A2, B1, etc.)';
  end
  # ---------------------------------------------------------------------------
end
