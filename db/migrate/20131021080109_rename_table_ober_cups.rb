class RenameTableOberCups < ActiveRecord::Migration
  def change
    # ----------------- OBER CUP  ---------------------------------------------
    execute <<-SQL
      ALTER TABLE ober_cups
        DROP FOREIGN KEY fk_ober_cups_teams
    SQL
    # ----------------- OBER CUP STANDARDS  -----------------------------------
    execute <<-SQL
      ALTER TABLE ober_cup_standards
        DROP FOREIGN KEY fk_ober_cup_standards_ober_cups
    SQL

    change_table(:ober_cup_standards) do |t|
      t.remove_references( :ober_cup )
    end
    remove_index :ober_cups, :year
    rename_table :ober_cups, :goggle_cups


    change_table(:goggle_cups) do |t|
      t.rename :year, :season_year
    end
    # [Steve, 20131021] We now allow a team to define more than 1 "goggle cup" per season/year:
    add_index :goggle_cups, [ :season_year ], :name => :idx_season_year

    # [Steve, 20131021] ER-SQL source:
    # CREATE TABLE `goggle_cups` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `team_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `description` VARCHAR(60) NOT NULL,
        # `season_year` YEAR NOT NULL COMMENT 'Anno agonistico in cui si calcola la ober cup',
        # `max_points` NUMERIC(8,2) NOT NULL DEFAULT 1000,
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0,
        # `created_at` DATETIME NOT NULL COMMENT 'Data creazione record',
        # `updated_at` DATETIME NOT NULL COMMENT 'Data ultima modifica record',
        # CONSTRAINT `pk_goggle_cups` PRIMARY KEY (`id`),
        # CONSTRAINT `uk_goggle_cups_1` UNIQUE (`season_year`, `team_id`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Gestione Ober Cup';

    # ----------------- OBER CUP  ---------------------------------------------
    execute <<-SQL
      ALTER TABLE goggle_cups
        ADD CONSTRAINT fk_goggle_cups_teams
        FOREIGN KEY (team_id)
        REFERENCES teams(id)
    SQL
  end
end
