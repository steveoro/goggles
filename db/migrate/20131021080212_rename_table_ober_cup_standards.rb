class RenameTableOberCupStandards < ActiveRecord::Migration
  def change
    # ----------------- OBER CUP STANDARDS  -----------------------------------
    execute <<-SQL
      ALTER TABLE ober_cup_standards
        DROP FOREIGN KEY fk_ober_cup_standards_badges
    SQL
    execute <<-SQL
      ALTER TABLE ober_cup_standards
        DROP FOREIGN KEY fk_ober_cup_standards_event_types
    SQL
    execute <<-SQL
      ALTER TABLE ober_cup_standards
        DROP FOREIGN KEY fk_ober_cup_standards_pool_types
    SQL

    rename_table :ober_cup_standards, :goggle_cup_standards


    change_table(:goggle_cup_standards) do |t|
      t.decimal :reaction_time, :precision => 5, :scale => 2, :default => 0.0, :null => false, :comment => "Measured reaction time (when available)"
      t.references :goggle_cup
    end

    # [Steve, 20131021] ER-SQL source:
    # CREATE TABLE `goggle_cup_standards` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `goggle_cup_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `badge_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `event_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `pool_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `reaction_time` NUMERIC(5,2) COMMENT 'Tempo di stacco dal blocco',
        # `minutes` NUMERIC(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Minuti',
        # `seconds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Secondi',
        # `hundreds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Centesimi',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0,
        # `created_at` DATETIME NOT NULL COMMENT 'Data creazione record',
        # `updated_at` DATETIME NOT NULL COMMENT 'Data ultima modifica record',
        # CONSTRAINT `pk_goggle_cup_standards` PRIMARY KEY (`id`),
        # CONSTRAINT `uk_goggle_cup_standards_1` UNIQUE (`pool_type_id`, `event_type_id`, `badge_id`, `goggle_cup_id`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Tempi base per calcolo punteggi ober cup';

    # ----------------- GOGGLE CUP STANDARDS  ---------------------------------
    execute <<-SQL
      ALTER TABLE goggle_cup_standards
        ADD CONSTRAINT fk_goggle_cup_standards_goggle_cups
        FOREIGN KEY (goggle_cup_id)
        REFERENCES goggle_cups(id)
    SQL
    execute <<-SQL
      ALTER TABLE goggle_cup_standards
        ADD CONSTRAINT fk_goggle_cup_standards_badges
        FOREIGN KEY (badge_id)
        REFERENCES badges(id)
    SQL
    execute <<-SQL
      ALTER TABLE goggle_cup_standards
        ADD CONSTRAINT fk_goggle_cup_standards_event_types
        FOREIGN KEY (event_type_id)
        REFERENCES event_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE goggle_cup_standards
        ADD CONSTRAINT fk_goggle_cup_standards_pool_types
        FOREIGN KEY (pool_type_id)
        REFERENCES pool_types(id)
    SQL
  end
end
