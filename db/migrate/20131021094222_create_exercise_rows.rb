class CreateExerciseRows < ActiveRecord::Migration
  def change
    create_table :exercise_rows do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :code, :limit => 6, :null => false

      t.integer :part_order,      :limit => 3, :null => false, :default => 0, :comment => "Overall order for this exercise part"
      t.integer :percentage,      :limit => 3, :null => false, :default => 0, :comment => "Percentage of the overall distance for this single exercise part"
      t.integer :start_and_rest,  :limit => 4, :null => false, :default => 0, :comment => "Start-rest time interval in seconds; auto-computed when left empty"
      t.integer :pause,           :limit => 4, :null => false, :default => 0, :comment => "Rest pause interval in seconds"

      t.references :exercise
      t.references :base_movement
      t.references :training_mode_type
      t.references :arm_aux_type
      t.references :kick_aux_type
      t.references :body_aux_type
      t.references :breath_aux_type
    end

    add_index :exercise_rows, :code, :unique => true
    add_index :exercise_rows, [:exercise_id, :part_order], name: :idx_exercise_rows_part_order

    # [Steve, 20131023] ER-SQL source:
    # CREATE TABLE `exercise_rows` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `exercise_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Esercizio di cui questa riga è una parte',
        # `base_movement_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Descrizione del movimento (gesto) da eseguire',
        # `part_order` SMALLINT(2) NOT NULL DEFAULT 1 COMMENT 'Ordine in cui la parte va eseguita per comporre l''esercizio',
        # `percentage` SMALLINT(3) UNSIGNED NOT NULL DEFAULT 100 COMMENT 'Indica per quanta parte dell''esercizio va ripetuta questa parte. Si riferisce alla distanza in metri o alla durata se non spefiificata',
        # `start_and_rest` SMALLINT(4) COMMENT 'Esecuzione scatto e riposo della parte fissa. Se omesso dipenderà invece dai tempi generali dell''esercizio. In secondi',
        # `pause` SMALLINT(4) COMMENT 'Pausa al termine della parte di esercizio. Se omessa significa che la prosisma parte dell''esercizio è attacata a questa. In secondi.',
        # `training_mode_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Indica come va eseguita la parte (regime)',
        # `arm_aux_type_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `kick_aux_type_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `body_aux_type_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `breath_aux_type_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_exercise_rows` PRIMARY KEY (`id`),
        # CONSTRAINT `uk_exercise_rows_1` UNIQUE (`part_order`, `exercise_id`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Parti che compongono un esercizio';

    # ALTER TABLE `exercise_rows` ADD
        # CHECK (percentage <= 100);
  end
  # ---------------------------------------------------------------------------
end
