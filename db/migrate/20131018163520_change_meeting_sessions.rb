class ChangeMeetingSessions < ActiveRecord::Migration
  def change
    change_table(:meeting_sessions) do |t|
      t.references :day_part_type
    end

    # ----------------- MEETINGS SESSIONS -------------------------------------
    execute <<-SQL
      ALTER TABLE meeting_sessions
        ADD CONSTRAINT fk_meeting_sessions_day_part_types
        FOREIGN KEY (day_part_type_id)
        REFERENCES day_part_types(id)
    SQL

    # [Steve, 20131022] ER-SQL source:
    # CREATE TABLE `meeting_sessions` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `meeting_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `session_order` NUMERIC(2) NOT NULL COMMENT 'Ordine della sessione nella gara',
        # `swimming_pool_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `scheduled_date` DATE NOT NULL COMMENT 'Data sessione',
        # `warm_up_time` TIME COMMENT 'Orario del riscaldamento',
        # `begin_time` TIME COMMENT 'Inizio gare',
        # `notes` TEXT,
        # `description` VARCHAR(100),
        # `is_autofilled` SMALLINT(1) UNSIGNED DEFAULT 0,
        # `day_part_tipe_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_meeting_sessions` PRIMARY KEY (`id`),
        # CONSTRAINT `uk_meeting_sessions_1` UNIQUE (`meeting_id`, `session_order`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Parti di una gara';
#     
    # CREATE INDEX `GIOGAR` ON `meeting_sessions` (`meeting_id` ASC,`session_order` ASC);
    # CREATE INDEX `IDX_meeting_sessions_2` ON `meeting_sessions` (`meeting_id`);
    # CREATE INDEX `IDX_meeting_sessions_3` ON `meeting_sessions` (`swimming_pool_id`);
    # ALTER TABLE `meeting_sessions` ADD CONSTRAINT `CC_meeting_sessions_is_autofilled` 
        # CHECK (is_autofilled < 2);


    # ----------------- DATA IMPORT MEETINGS SESSIONS -------------------------
    change_table(:data_import_meeting_sessions) do |t|
      t.references :day_part_type
    end
  end
  # ---------------------------------------------------------------------------
end
