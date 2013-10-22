class AlterTableMeetingIndividualResults < ActiveRecord::Migration
  def change
    change_table(:meeting_individual_results) do |t|
      t.decimal :goggle_cup_points, :precision => 5, :scale => 2, :default => 0.0, :null => false
      t.decimal :reaction_time, :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Measured reaction time (when available)"
    end

    # [Steve, 20131021] ER-SQL source:
    # CREATE TABLE `meeting_individual_results` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `result_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `rank` NUMERIC(3) NOT NULL DEFAULT 0,
        # `is_play_off` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Indicatore risultato di uno spareggio per le qualificazioni',
        # `is_out_of_race` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Atlte ache ha gareggiato come fuori gara o fuori classifica',
        # `is_disqualified` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Atleta squalificato',
        # `standard_points` NUMERIC(6,2) NOT NULL DEFAULT 0 COMMENT 'Punteggio calcolato sui tempi base',
        # `meeting_points` NUMERIC(6,2) NOT NULL DEFAULT 0 COMMENT 'Punteggio calcolato sui punteggi speciali della gara',
        # `goggle_cup_points` NUMERIC(6,2) NOT NULL DEFAULT 0 COMMENT 'Punteggio calcolato sui punteggi speciali della gara',
        # `reaction_time` NUMERIC(5,2) COMMENT 'Tempo di stacco dal blooco',
        # `minutes` NUMERIC(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Minuti',
        # `seconds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Secondi',
        # `hundreds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Centesimi',
        # `meeting_program_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `swimmer_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `team_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `badge_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `disqualication_code_type_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0,
        # `created_at` DATETIME NOT NULL COMMENT 'Data creazione record',
        # `updated_at` DATETIME NOT NULL COMMENT 'Data ultima modifica record',
        # CONSTRAINT `pk_meeting_individual_results` PRIMARY KEY (`id`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Risultati gare individuali';

    # ALTER TABLE `meeting_individual_results` ADD CONSTRAINT `CC_meeting_individual_results_is_play_off` 
        # CHECK (is_play_off < 2);
    # ALTER TABLE `meeting_individual_results` ADD CONSTRAINT `CC_meeting_individual_results_is_out_of_race` 
        # CHECK (is_out_of_race < 2);
    # ALTER TABLE `meeting_individual_results` ADD CONSTRAINT `CC_meeting_individual_results_is_disqualified` 
        # CHECK (is_disqualified < 2);
  end
end
