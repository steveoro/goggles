class AlterTableSwimmerResults < ActiveRecord::Migration
  def change
    # TODO remove meeting_program_id

    rename_table :swimmer_results, :user_results

    change_table(:user_results) do |t|
      t.rename :obercup_points, :meeting_points

      t.string  :description, :limit => 60, :null => false, :default => ''
      t.date    :event_date
      t.decimal :reaction_time, :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Measured reaction time (when available)"

      t.references :event_type
      # meeting_individual_result_id kept as reference, in case same entry gets somehow mapped to an official result
    end

    # [Steve, 20131022] ER-SQL source:
    # CREATE TABLE `user_results` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `swimmer_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `description` VARCHAR(60) NOT NULL,
        # `event_date` DATE,
        # `rank` NUMERIC(3) COMMENT 'Piazzamento nella gara',
        # `standard_points` NUMERIC(6,2) NOT NULL DEFAULT 0 COMMENT 'Punteggio calcolato sui tempi base',
        # `meeting_points` NUMERIC(6,2) COMMENT 'Punteggio OberCup',
        # `is_disqualified` SMALLINT(1) UNSIGNED DEFAULT 0 COMMENT 'Indicatore squalifica',
        # `event_type_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `category_type_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `pool_type_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `reaction_time` NUMERIC(5,2) COMMENT 'Tempo di stacco dal blooco',
        # `minutes` NUMERIC(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Minuti',
        # `seconds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Secondi',
        # `hundreds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Centesimi',
        # `user_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # CONSTRAINT `pk_user_results` PRIMARY KEY (`id`),
        # CONSTRAINT `uk_user_results_1` UNIQUE (`swimmer_id`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Risultati di gara individuali inseriti manualmente dagli utenti';

    # CREATE INDEX `IDX_user_results_1` ON `user_results` (`swimmer_id`);
    # ALTER TABLE `user_results` ADD CONSTRAINT `cc_user_results_event_date` 
        # CHECK (event_date > 1900);
    # ALTER TABLE `user_results` ADD
        # CHECK (is_disqualified < 2);
  end
end
