class AlterTableMeetingRelayResults < ActiveRecord::Migration
  def change
    execute <<-SQL
      ALTER TABLE meeting_relay_results
        DROP FOREIGN KEY fk_meeting_relay_results_meeting_programs
    SQL

    change_table(:meeting_relay_results) do |t|
      t.decimal :reaction_time, :precision => 5, :scale => 2, :default => 0.0, :null => false, :comment => "Measured reaction time (when available)"

      t.remove_references( :meeting_program )
      t.references :team_affiliation
      t.references :meeting_relay
    end

    execute <<-SQL
      ALTER TABLE meeting_relay_results
        ADD CONSTRAINT fk_meeting_relay_results_team_affiliations
        FOREIGN KEY (team_affiliation_id)
        REFERENCES team_affiliations(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relay_results
        ADD CONSTRAINT fk_meeting_relay_results_meeting_relays
        FOREIGN KEY (meeting_relay_id)
        REFERENCES meeting_relays(id)
    SQL

    # [Steve, 20131021] ER-SQL source:
    # CREATE TABLE `meeting_relay_results` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `relay_header` VARCHAR(60) NOT NULL,
        # `rank` INTEGER(11) NOT NULL DEFAULT '0',
        # `is_play_off` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0,
        # `is_out_of_race` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0,
        # `is_disqualified` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0,
        # `reaction_time` NUMERIC(5,2) COMMENT 'Tempo di stacco dal blooco',
        # `minutes` NUMERIC(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Minuti',
        # `seconds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Secondi',
        # `hundreds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Centesimi',
        # `standard_points` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
        # `meeting_points` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
        # `team_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `result_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `meeting_program_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `team_affiliationd_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `disqualification_code_type_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0,
        # `created_at` DATETIME NOT NULL COMMENT 'Data creazione record',
        # `updated_at` DATETIME NOT NULL COMMENT 'Data ultima modifica record',
        # CONSTRAINT `pk_meeting_relay_results` PRIMARY KEY (`id`)
    # )
     # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1  COMMENT = 'Risultati staffetta. Contiene il risultato finale di una staffetta.';

    # CREATE INDEX `fk_meeting_relay_results_teams` ON `meeting_relay_results` (`team_id`);
    # CREATE INDEX `fk_meeting_relay_results_result_types` ON `meeting_relay_results` (`result_type_id`);
    # CREATE INDEX `results_x_relay` ON `meeting_relay_results` (`meeting_program_id`,`rank`);
    # ALTER TABLE `meeting_relay_results` ADD
        # CHECK (is_play_off < 2);
    # ALTER TABLE `meeting_relay_results` ADD
        # CHECK (is_out_of_race < 2);
    # ALTER TABLE `meeting_relay_results` ADD
        # CHECK (is_disqualified < 2);
  end
end
