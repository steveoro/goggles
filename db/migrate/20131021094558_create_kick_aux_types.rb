class CreateKickAuxTypes < ActiveRecord::Migration
  def change
    create_table :kick_aux_types do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :code, :limit => 5, :null => false
      # Virtual fields that need to use locales + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"
    end

    add_index :kick_aux_types, :code, :unique => true

    # [Steve, 20131023] ER-SQL source:
    # CREATE TABLE `kick_aux_types` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `code` VARCHAR(5) NOT NULL,
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_kick_aux_types` PRIMARY KEY (`id`),
        # CONSTRAINT `uk_kick_aux_types_1` UNIQUE (`code`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 COMMENT = 'Ausili per le gambe (pinne, pull, etc.)';
  end
  # ---------------------------------------------------------------------------
end
