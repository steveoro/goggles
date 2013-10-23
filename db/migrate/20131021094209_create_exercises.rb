class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :code, :limit => 6, :null => false
      # Virtual fields that need to use locales + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"

      t.references :training_step_type
      t.references :user
    end

    add_index :exercises, :code, :unique => true

    # [Steve, 20131023] ER-SQL source:
    # CREATE TABLE `exercises` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `code` VARCHAR(6) NOT NULL COMMENT 'Codice generale esercizio (testata)',
        # `training_step_type_id` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Indica se l''esercizio è specifico per una certa parte dell''allenamento o può essere generico',
        # `user_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Creatore dell''allenamento',
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_exercises` PRIMARY KEY (`id`),
        # CONSTRAINT `uk_exercises_1` UNIQUE (`code`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Parte generale dell''esercizio. Contiene sostanzialmente la descrizione generale.';
  end
  # ---------------------------------------------------------------------------
end
