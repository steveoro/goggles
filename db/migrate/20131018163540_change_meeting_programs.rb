class ChangeMeetingPrograms < ActiveRecord::Migration
  def change
    # ----------------- MEETING PROGRAMS --------------------------------------
    execute <<-SQL
      ALTER TABLE meeting_programs
        DROP FOREIGN KEY fk_meeting_programs_meeting_sessions
    SQL
    execute <<-SQL
      ALTER TABLE meeting_programs
        DROP FOREIGN KEY fk_meeting_programs_event_types
    SQL
    execute <<-SQL
      ALTER TABLE meeting_programs
        DROP FOREIGN KEY fk_meeting_programs_accreditation_time_types
    SQL

    change_table(:meeting_programs) do |t|
      t.remove( :begin_time, :minutes, :seconds, :hundreds )
      t.remove_references( :meeting_session, :event_type )
      t.remove_references( :accreditation_time_type )

      t.boolean :is_out_of_race, :null => false, :default => false, :comment => 'This event does not compete for score inside the result chart'
      t.time :begin_time

      references :meeting_event
      references :pool_type
      references :time_standard
    end

    execute <<-SQL
      ALTER TABLE meeting_programs
        ADD CONSTRAINT fk_meeting_programs_meeting_events
        FOREIGN KEY (meeting_event_id)
        REFERENCES meeting_events(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_programs
        ADD CONSTRAINT fk_meeting_programs_pool_types
        FOREIGN KEY (pool_type_id)
        REFERENCES pool_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_programs
        ADD CONSTRAINT fk_meeting_programs_time_standards
        FOREIGN KEY (time_standard_id)
        REFERENCES time_standards(id)
    SQL

    # [Steve, 20131021] ER-SQL source:
    # CREATE TABLE `meeting_programs` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `meeting_events_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `gender_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `category_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `pool_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Replichiamo il tipo vasca per poter accedere più rapidamente all''informazione. ANrà sincronizzato con il tipo vasca dalla piscina delal sessione padre del meeting program',
        # `event_order` NUMERIC(2) NOT NULL,
        # `begin_time` TIME,
        # `time_standard_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `is_out_of_race` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Specalità non in classifica',
        # `is_autofilled` SMALLINT(1) UNSIGNED DEFAULT 0,
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0,
        # `created_at` DATETIME NOT NULL COMMENT 'Data creazione record',
        # `updated_at` DATETIME NOT NULL COMMENT 'Data ultima modifica record',
        # CONSTRAINT `pk_meeting_programs` PRIMARY KEY (`id`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Specialità in programma nelle varie parti delle gare con distinzione di categoria e sesso';
    # ALTER TABLE `meeting_programs` ADD CONSTRAINT `CC_meeting_programs_is_out_of_race` 
        # CHECK (is_out_of_race < 2);
    # ALTER TABLE `meeting_programs` ADD CONSTRAINT `CC_meeting_programs_is_autofilled` 
        # CHECK (is_autofilled < 2);


    # ----------------- DATA IMPORT MEETING PROGRAMS --------------------------
    change_table(:data_import_meeting_programs) do |t|
      t.remove_references( :accreditation_time_type )

      t.boolean :is_out_of_race, :null => false, :default => false, :comment => 'This event does not compete for score inside the result chart'

      references :heat_type
      references :time_standard
    end
  end
  # ---------------------------------------------------------------------------
end
