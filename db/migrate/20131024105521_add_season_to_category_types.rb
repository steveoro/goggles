class AddSeasonToCategoryTypes < ActiveRecord::Migration
  def change
    # ----------------- CATEGORY TYPES ----------------------------------------
    execute <<-SQL
      ALTER TABLE category_types
        DROP FOREIGN KEY fk_category_types_season_types
    SQL
    remove_index :category_types, :name => :season_type_and_code

    change_table(:category_types) do |t|
      t.remove_references( :season_type )

      t.references :season
    end

    add_index :category_types, [:season_id, :is_a_relay, :code], :name => :season_and_code, :unique => true

    execute <<-SQL
      ALTER TABLE category_types
        ADD CONSTRAINT fk_category_types_seasons
        FOREIGN KEY (season_id)
        REFERENCES seasons(id)
    SQL
    # CREATE TABLE `category_types` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `code` VARCHAR(7) NOT NULL,
        # `description` VARCHAR(100) NOT NULL,
        # `short_name` VARCHAR(40),
        # `season_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `federation_code` VARCHAR(2) COMMENT 'Codice della categoria per la federazione cui appartiene',
        # `group_name` VARCHAR(50) NOT NULL COMMENT 'Descrizione della categoria generale cui appartiene la categoria specifica. Non ho fatto una tipologica per non complicare la cosa',
        # `age_begin` SMALLINT(3) UNSIGNED,
        # `age_end` SMALLINT(3) UNSIGNED COMMENT 'Età fine categoria',
        # `is_a_relay` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0,
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_category_types` PRIMARY KEY (`id`),
        # CONSTRAINT `uk_category_types_1` UNIQUE (`code`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Tipologie di categoria in cui vengono suddivise le classifiche individuali';

    # CREATE INDEX `idx_category_types_1` ON `category_types` (`code` ASC);
    # ALTER TABLE `category_types` ADD CONSTRAINT `cc_category_types_is_a_relay` 
        # CHECK (is_a_relay < 2);
  end
end
