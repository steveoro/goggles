class AlterTableMeetingRelayResults < ActiveRecord::Migration
  def change
    # ----------------- MEETING RELAY RESULTS ---------------------------------
    change_table(:meeting_relay_results) do |t|
      t.remove_references( :result_type )

      t.string  :relay_header, :limit => 60, :null => false, :default => '' 
      t.decimal :reaction_time, :precision => 5, :scale => 2, :default => 0.0, :null => false, :comment => "Measured reaction time (when available)"

      t.integer :entry_minutes, :limit => 3, :comment => 'Accreditation entry time'
      t.integer :entry_seconds, :limit => 2, :comment => 'Accreditation entry time'
      t.integer :entry_hundreds, :limit => 2, :comment => 'Accreditation entry time'

      t.references :team_affiliation
      t.references :entry_time_type
    end

    execute <<-SQL
      ALTER TABLE meeting_relay_results
        ADD CONSTRAINT fk_meeting_relay_results_team_affiliations
        FOREIGN KEY (team_affiliation_id)
        REFERENCES team_affiliations(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relay_results
        ADD CONSTRAINT fk_meeting_relay_results_entry_time_types
        FOREIGN KEY (entry_time_type_id)
        REFERENCES entry_time_types(id)
    SQL

    # [Steve, 20131023] ER-SQL source:
    # CREATE TABLE `meeting_relay_results` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `relay_header` VARCHAR(60) NOT NULL,
        # `rank` INTEGER(11) NOT NULL DEFAULT '0',
        # `is_play_off` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0,
        # `is_out_of_race` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0,
        # `is_disqualified` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0,
        # `reaction_time` NUMERIC(5,2) COMMENT 'Tempo di reazione dal blocco o cambio per le staffette',
        # `minutes` NUMERIC(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Minuti',
        # `seconds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Secondi',
        # `hundreds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Centesimi',
        # `standard_points` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
        # `meeting_points` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
        # `team_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `meeting_program_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `team_affiliationd_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `disqualification_code_type_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `entry_time_type_id` INTEGER(11) UNSIGNED COMMENT 'Tipo tempo iscrizione',
        # `entry_minutes` NUMERIC(3) UNSIGNED,
        # `entry_seconds` NUMERIC(2) UNSIGNED,
        # `entry_hundreds` NUMERIC(2) UNSIGNED,
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_meeting_relay_results` PRIMARY KEY (`id`)
    # )
     # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1  COMMENT = 'Risultati staffetta. Contiene il risultato finale di una staffetta.';

    # CREATE INDEX `fk_meeting_relay_results_teams` ON `meeting_relay_results` (`team_id`);
    # CREATE INDEX `results_x_relay` ON `meeting_relay_results` (`meeting_program_id`,`rank`);
    # ALTER TABLE `meeting_relay_results` ADD
        # CHECK (is_play_off < 2);
    # ALTER TABLE `meeting_relay_results` ADD
        # CHECK (is_out_of_race < 2);
    # ALTER TABLE `meeting_relay_results` ADD
        # CHECK (is_disqualified < 2);
    # ALTER TABLE `meeting_relay_results` ADD CONSTRAINT `cc_meeting_relay_results_seconds` 
        # CHECK (seconds < 60);


    # ----------------- DATA IMPORT MEETING RELAY RESULTS ---------------------
    change_table(:data_import_meeting_relay_results) do |t|
      t.remove_references( :result_type )

      t.string  :relay_header, :limit => 60, :null => false, :default => '' 
      t.decimal :reaction_time, :precision => 5, :scale => 2, :default => 0.0, :null => false, :comment => "Measured reaction time (when available)"

      t.integer :entry_minutes, :limit => 3, :comment => 'Accreditation entry time'
      t.integer :entry_seconds, :limit => 2, :comment => 'Accreditation entry time'
      t.integer :entry_hundreds, :limit => 2, :comment => 'Accreditation entry time'

      t.references :team_affiliation
      t.references :entry_time_type
    end
  end
end
