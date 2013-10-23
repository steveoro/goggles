class AlterTableSwimmerResults < ActiveRecord::Migration
  def change
    # ----------------- SWIMMER RESULTS ----------------------------------------
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_meeting_individual_results
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_pool_types
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_category_types
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_season_types
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_meeting_programs
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_badges
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_swimmers
    SQL

    rename_table :swimmer_results, :user_results

    change_table(:user_results) do |t|
      t.remove_references( :badge )
      t.remove_references( :meeting_program )
      t.remove_references( :season_type )
      t.remove_references( :result_type )
      t.rename :obercup_points, :meeting_points

      t.string  :description, :limit => 60, :null => false, :default => ''
      t.date    :event_date
      t.decimal :reaction_time, :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Measured reaction time (when available)"

      t.references :event_type
      # meeting_individual_result_id kept as reference, in case same entry gets somehow mapped to an official result
    end

    # [Steve, 20131023] ER-SQL source:
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
        # `hundreds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Centesimi',
        # `reaction_time` NUMERIC(5,2) COMMENT 'Tempo di reazione dal blocco o cambio per le staffette',
        # `minutes` NUMERIC(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Minuti',
        # `seconds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Secondi',
        # `user_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # CONSTRAINT `pk_user_results` PRIMARY KEY (`id`),
        # CONSTRAINT `uk_user_results_1` UNIQUE (`swimmer_id`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Risultati di gara individuali inseriti manualmente dagli utenti';
#     
    # CREATE INDEX `IDX_user_results_1` ON `user_results` (`swimmer_id`);
    # ALTER TABLE `user_results` ADD CONSTRAINT `cc_user_results_event_date` 
        # CHECK (event_date > 1900);
    # ALTER TABLE `user_results` ADD
        # CHECK (is_disqualified < 2);
    # ALTER TABLE `user_results` ADD CONSTRAINT `cc_user_results_seconds` 
        # CHECK (seconds < 60);


    # ----------------- USER RESULTS ------------------------------------------
    execute <<-SQL
      ALTER TABLE user_results
        ADD CONSTRAINT fk_user_results_swimmers
        FOREIGN KEY (swimmer_id)
        REFERENCES swimmers(id)
    SQL
    execute <<-SQL
      ALTER TABLE user_results
        ADD CONSTRAINT fk_user_results_category_types
        FOREIGN KEY (category_type_id)
        REFERENCES category_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE user_results
        ADD CONSTRAINT fk_user_results_pool_types
        FOREIGN KEY (pool_type_id)
        REFERENCES pool_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE user_results
        ADD CONSTRAINT fk_user_results_event_types
        FOREIGN KEY (event_type_id)
        REFERENCES event_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE user_results
        ADD CONSTRAINT fk_user_results_meeting_individual_results
        FOREIGN KEY (meeting_individual_result_id)
        REFERENCES meeting_individual_results(id)
    SQL
  end
end
