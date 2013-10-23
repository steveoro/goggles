class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :title, :limit => 100, :null => false, :default => '', :comment => "Description or purposed scope of this training"
      t.text :description, :null => false, :default => '', :comment => "Description or purposed scope of this training"

      t.references :swimmer_level_type
      t.references :user
    end

    add_index :trainings, :title, :unique => true

    # [Steve, 20131023] ER-SQL source:
    # CREATE TABLE `trainings` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `title` VARCHAR(100),
        # `description` TEXT COMMENT 'Descrizione dello scopo o delle peculiarità dell''allenamento',
        # `swimmer_level_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Livello (minimo) suggerito',
        # `user_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Creatore dell''allenamento',
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_trainings` PRIMARY KEY (`id`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Allenamenti. Descrizione generale di un allenamento';
  end
  # ---------------------------------------------------------------------------
end
