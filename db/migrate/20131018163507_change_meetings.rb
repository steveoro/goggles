class ChangeMeetings < ActiveRecord::Migration
  def change
    # ----------------- MEETINGS ----------------------------------------------
    change_table(:meetings) do |t|
      t.date    :header_date
      t.string  :code,        :limit => 20, :null => false, :comment => 'Meeting code extracted from data-import file or hand-filled'
      t.string  :header_year, :limit => 9, :null => false, :comment => 'Additiona Meeting year grouping in the variable format "YY(YY)([/-]yy(yy))" and extracted from the data-import file or hand-filled'
      t.integer :max_individual_events_per_session, :limit => 2,   :default => 2
      t.boolean :is_out_of_season, :null => false, :default => false, :comment => 'This whole meeting does not compete for the overall season score'

      t.rename :challenge_number, :edition

      t.references :edition_type
      t.references :timing_type
    end

    change_column( :meetings, :edition, :integer, :limit => 3, :null => false, :default => 0, :comment => 'Progressive edition of the same meeting (usually 1 each year)' )
    add_index :meetings, :header_date, name: :idx_meetings_header_date
    add_index :meetings, [:code, :edition], name: :idx_meetings_code

    execute <<-SQL
      ALTER TABLE meetings
        ADD CONSTRAINT fk_meetings_edition_types
        FOREIGN KEY (edition_type_id)
        REFERENCES edition_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE meetings
        ADD CONSTRAINT fk_meetings_timing_types
        FOREIGN KEY (timing_type_id)
        REFERENCES timing_types(id)
    SQL

    # [Steve, 20131022] ER-SQL source:
    # CREATE TABLE `meetings` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `code` VARCHAR(20) COMMENT 'Nome interno del meeting (abbreviazione intuitiva che unita alla data diventa univoca)',
        # `description` VARCHAR(60) NOT NULL,
        # `header_date` DATE COMMENT 'Data del meeting (della prima sessione in caso di più sessioni)',
        # `season_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `entry_deadline` DATE,
        # `has_warm_up_pool` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0,
        # `is_under_25_admitted` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0,
        # `reference_phone` VARCHAR(15),
        # `reference_email` VARCHAR(40),
        # `reference_name` VARCHAR(50),
        # `notes` TEXT,
        # `has_invitation` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0,
        # `has_start_list` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0,
        # `are_results_acquired` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0,
        # `max_individual_events` NUMERIC(2) UNSIGNED NOT NULL DEFAULT 2 COMMENT 'Numero massimo di eventi a cui un nuotatore può iscriversi',
        # `max_individual_events_per_session` NUMERIC(2) UNSIGNED NOT NULL DEFAULT 2 COMMENT 'Numero di eventi (specialità) che un nuotatore può disputare in una stessa sessione. Ci sono gare in cui il numero è limitato (es: campionati italiani in cui si può disputare al massimo una specialità per sessione)',
        # `configuration_file` VARCHAR(8),
        # `is_autofilled` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0,
        # `edition` NUMERIC(3) COMMENT 'Numero edizione del meeting',
        # `header_year` VARCHAR(9) COMMENT 'Anno del meeting (fomati ammessi aaaa, aaaa/aaaa, aa/aa)',
        # `edition_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Indica come usare il numero di edizione o l''anno per creare il titolo del meeting',
        # `timeing_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Indica il tipo di cronometraggio usato per la gara',
        # `user_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_meetings` PRIMARY KEY (`id`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Gare di nuoto';

    # CREATE INDEX `IDX_meetings_1` ON `meetings` (`season_id`);
    # ALTER TABLE `meetings` ADD
        # CHECK (has_warm_up_pool < 2);
    # ALTER TABLE `meetings` ADD
        # CHECK (is_under_25_admitted < 2);
    # ALTER TABLE `meetings` ADD
        # CHECK (has_invitation < 2);
    # ALTER TABLE `meetings` ADD
        # CHECK (has_start_list < 2);
    # ALTER TABLE `meetings` ADD
        # CHECK (are_results_acquired < 2);
    # ALTER TABLE `meetings` ADD CONSTRAINT `CC_meetings_is_autofilled` 
        # CHECK (is_autofilled < 2);

    # ----------------- DATA IMPORT MEETINGS ----------------------------------
    change_table(:data_import_meetings) do |t|
      t.date    :header_date
      t.string  :code,        :limit => 20, :null => false, :comment => 'Meeting code extracted from data-import file or hand-filled'
      t.string  :header_year, :limit => 9, :null => false, :comment => 'Additiona Meeting year grouping in the variable format "YY(YY)([/-]yy(yy))" and extracted from the data-import file or hand-filled'
      t.integer :max_individual_events_per_session, :limit => 2,   :default => 2
      t.boolean :is_out_of_season, :null => false, :default => false, :comment => 'This whole meeting does not compete for the overall season score'

      t.rename :challenge_number, :edition

      t.references :edition_type
      t.references :timing_type
    end

    change_column( :data_import_meetings, :edition, :integer, :limit => 3, :null => false, :default => 0, :comment => 'Progressive edition of the same meeting (usually 1 each year)' )
    add_index :data_import_meetings, :header_date, name: :idx_di_meetings_header_date
    add_index :data_import_meetings, [:code, :edition], name: :idx_di_meetings_code

    # CREATE TABLE `data_import_meetings` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `data_import_session_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `conflicting_id` BIGINT(20) DEFAULT 0,
        # `import_text` VARCHAR(255) NOT NULL,
        # `description` VARCHAR(100),
        # `entry_deadline` DATE,
        # `has_warm_up_pool` SMALLINT(1) UNSIGNED DEFAULT 0,
        # `is_under_25_admitted` SMALLINT(1) UNSIGNED DEFAULT 0,
        # `reference_phone` VARCHAR(40),
        # `reference_e_mail` VARCHAR(50),
        # `reference_name` VARCHAR(50),
        # `notes` TEXT,
        # `tag` VARCHAR(20),
        # `has_invitation` SMALLINT(1) UNSIGNED DEFAULT 0,
        # `has_start_list` SMALLINT(1) UNSIGNED DEFAULT 0,
        # `are_results_acquired` SMALLINT(1) UNSIGNED DEFAULT 0,
        # `max_individual_events` TINYINT(4) DEFAULT 2,
        # `configuration_file` VARCHAR(50),
        # `challenge_number` MEDIUMINT(9) DEFAULT 0,
        # `data_import_season_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `season_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `user_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # `edition` NUMERIC(3) COMMENT 'Numero edizione del meeting',
        # `edition_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Indica come usare il numero di edizione o l''anno per creare il titolo del meeting',
        # `header_date` DATE COMMENT 'Data del meeting (della prima sessione in caso di più sessioni)',
        # `header_year` VARCHAR(9) COMMENT 'Anno del meeting (fomati ammessi aaaa, aaaa/aaaa, aa/aa)',
        # `max_individual_events_per_session` TINYINT(4) DEFAULT 2,
        # CONSTRAINT `pk_data_import_meetings` PRIMARY KEY (`id`)
    # )
     # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
    # CREATE INDEX `index_data_import_meetings_on_entry_deadline` ON `data_import_meetings` (`entry_deadline`);
  end
  # ---------------------------------------------------------------------------
end
