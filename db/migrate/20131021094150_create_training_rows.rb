class CreateTrainingRows < ActiveRecord::Migration
  def change
    create_table :training_rows do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.integer :part_order,      :limit => 3, :null => false, :default => 0, :comment => "Overall order for this exercise part"
      t.integer :times,           :limit => 3, :null => false, :default => 0, :comment => "Repetition number"
      t.integer :distance,        :limit => 4, :null => false, :default => 0, :comment => "Distance of a single repetition"
      t.integer :start_and_rest,  :limit => 4, :null => false, :default => 0, :comment => "Start-rest time interval in seconds; auto-computed when left empty"
      t.integer :pause,           :limit => 4, :null => false, :default => 0, :comment => "Rest pause interval in seconds in between repetitions"

      t.references :training
      t.references :exercise
      t.references :training_step_type
      t.references :user
    end

    add_index :training_rows, [:training_id, :part_order], :name => :idx_training_rows_part_order

    # [Steve, 20131023] ER-SQL source:
    # CREATE TABLE `training_rows` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `training_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `exercise_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `training_step_type_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `part_order` SMALLINT(2) NOT NULL,
        # `times` SMALLINT(2) NOT NULL DEFAULT 1 COMMENT 'Numero di ripetizioni serie',
        # `distance` SMALLINT(4) NOT NULL COMMENT 'Distanza singola serie',
        # `start_and_rest` SMALLINT(4) COMMENT 'Scatto e riposo in secondi. Se omesso viene calcolato dal sistema',
        # `pause` SMALLINT(4) COMMENT 'Pausa fra le ripetizioni (serie) dell''esercizio',
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_training_rows` PRIMARY KEY (`id`),
        # CONSTRAINT `uk_training_rows_1` UNIQUE (`part_order`, `training_id`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Esercfizi che copmpongono un allenamento';
  end
  # ---------------------------------------------------------------------------
end
