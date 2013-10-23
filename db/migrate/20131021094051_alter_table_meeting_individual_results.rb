class AlterTableMeetingIndividualResults < ActiveRecord::Migration
  def change
    # ----------------- MEETING INDIVIDUAL RESULTS ----------------------------
    change_table(:meeting_individual_results) do |t|
      t.remove( :athlete_name, :team_name, :athlete_badge_number, :team_badge_number )
      t.remove_references( :result_type )

      t.decimal :goggle_cup_points, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.decimal :reaction_time, :precision => 5, :scale => 2, :default => 0.0, :null => false, :comment => "Measured reaction time (when available)"

      t.integer :entry_minutes, :limit => 3, :comment => 'Accreditation entry time'
      t.integer :entry_seconds, :limit => 2, :comment => 'Accreditation entry time'
      t.integer :entry_hundreds, :limit => 2, :comment => 'Accreditation entry time'

      t.references :entry_time_type
    end

    execute <<-SQL
      ALTER TABLE meeting_individual_results
        ADD CONSTRAINT fk_meeting_individual_results_entry_time_types
        FOREIGN KEY (entry_time_type_id)
        REFERENCES entry_time_types(id)
    SQL

    # [Steve, 20131023] ER-SQL source:
    # CREATE TABLE `meeting_individual_results` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `rank` NUMERIC(3) NOT NULL DEFAULT 0,
        # `is_play_off` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Indicatore risultato di uno spareggio per le qualificazioni',
        # `is_out_of_race` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Atlte ache ha gareggiato come fuori gara o fuori classifica',
        # `is_disqualified` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Atleta squalificato',
        # `standard_points` NUMERIC(6,2) NOT NULL DEFAULT 0 COMMENT 'Punteggio calcolato sui tempi base',
        # `meeting_points` NUMERIC(6,2) NOT NULL DEFAULT 0 COMMENT 'Punteggio calcolato sui punteggi speciali della gara',
        # `goggle_cup_points` NUMERIC(6,2) NOT NULL DEFAULT 0 COMMENT 'Punteggio calcolato sui punteggi speciali della gara',
        # `reaction_time` NUMERIC(5,2) COMMENT 'Tempo di reazione dal blocco o cambio per le staffette',
        # `minutes` NUMERIC(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Minuti',
        # `seconds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Secondi',
        # `hundreds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Centesimi',
        # `meeting_program_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `swimmer_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `team_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `badge_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `disqualication_code_type_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `entry_time_type_id` INTEGER(11) UNSIGNED COMMENT 'Tipo tempo iscrizione',
        # `entry_minutes` NUMERIC(3) UNSIGNED,
        # `entry_seconds` NUMERIC(2) UNSIGNED,
        # `entry_hundreds` NUMERIC(2) UNSIGNED,
        # `user_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_meeting_individual_results` PRIMARY KEY (`id`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Risultati gare individuali';

    # ALTER TABLE `meeting_individual_results` ADD CONSTRAINT `CC_meeting_individual_results_is_play_off` 
        # CHECK (is_play_off < 2);
    # ALTER TABLE `meeting_individual_results` ADD CONSTRAINT `CC_meeting_individual_results_is_out_of_race` 
        # CHECK (is_out_of_race < 2);
    # ALTER TABLE `meeting_individual_results` ADD CONSTRAINT `CC_meeting_individual_results_is_disqualified` 
        # CHECK (is_disqualified < 2);
    # ALTER TABLE `meeting_individual_results` ADD CONSTRAINT `cc_meeting_individual_results_seconds` 
        # CHECK (seconds < 60);


    # ----------------- DATA IMPORT MEETING INDIVIDUAL RESULTS ----------------
    change_table(:data_import_meeting_individual_results) do |t|
      t.remove_references( :result_type )

      t.decimal :goggle_cup_points, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.decimal :reaction_time, :precision => 5, :scale => 2, :default => 0.0, :null => false, :comment => "Measured reaction time (when available)"

      t.integer :entry_minutes, :limit => 3, :comment => 'Accreditation entry time'
      t.integer :entry_seconds, :limit => 2, :comment => 'Accreditation entry time'
      t.integer :entry_hundreds, :limit => 2, :comment => 'Accreditation entry time'

      t.references :entry_time_type
    end
  end
end
