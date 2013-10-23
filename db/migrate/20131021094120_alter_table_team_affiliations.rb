class AlterTableTeamAffiliations < ActiveRecord::Migration
  def change
    change_table(:team_affiliations) do |t|
      t.rename :must_compute_ober_cup, :must_calculate_goggle_cup
    end

    # [Steve, 20131021] ER-SQL source:
    # CREATE TABLE `team_affiliations` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `team_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `season_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `number` VARCHAR(15) NOT NULL,
        # `name` VARCHAR(60) NOT NULL,
        # `must_calculate_goggle_cup` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Indicatore per calcolo ober cup abilitato per il tipo di stagione',
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_team_affiliations` PRIMARY KEY (`id`),
        # CONSTRAINT `uk_team_affiliations_1` UNIQUE (`team_id`, `season_id`),
        # CONSTRAINT `uk_team_affiliations_2` UNIQUE (`season_id`, `number`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Affiliazione delle squadre di nuoto ai vari campionati di nuoto';

    # CREATE INDEX `IDX_team_affiliations_1` ON `team_affiliations` (`season_id`);
    # CREATE INDEX `IDX_team_affiliations_2` ON `team_affiliations` (`team_id`);
    # ALTER TABLE `team_affiliations` ADD CONSTRAINT `CC_team_affiliations_must_calculate_goggle_cup` 
        # CHECK (must_calculate_goggle_cup < 2);
  end
end
