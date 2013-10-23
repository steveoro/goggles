class CreateMeetingEvents < ActiveRecord::Migration
  def change
    # == meeting_events entity
    #
    # Stores just the meeting event_type header, common to a group
    # of meeting_programs rows.
    #
    create_table :meeting_events do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.integer :event_order, :limit => 3, :null => false, :default => 0
      t.time    :begin_time
      t.boolean :is_out_of_race, :null => false, :default => false, :comment => 'This event does not compete for score inside the result chart'
      t.boolean :is_autofilled, :default => false, :null => false, :comment => "data-confirmation flag; set to true only when the values of the row have been guessed/filled by the data-import parser."
      t.text    :notes

      t.references :meeting_session
      t.references :event_type
      t.references :heat_type
      t.references :user
    end

    # ----------------- MEETING EVENTS ----------------------------------------
    execute <<-SQL
      ALTER TABLE meeting_events
        ADD CONSTRAINT fk_meeting_events_meeting_sessions
        FOREIGN KEY (meeting_session_id)
        REFERENCES meeting_sessions(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_events
        ADD CONSTRAINT fk_meeting_events_event_types
        FOREIGN KEY (event_type_id)
        REFERENCES event_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_events
        ADD CONSTRAINT fk_meeting_events_heat_types
        FOREIGN KEY (heat_type_id)
        REFERENCES heat_types(id)
    SQL

    # [Steve, 20131022] ER-SQL source:
    # CREATE TABLE `meeting_events` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `meeting_session_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `event_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `heat_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Tipo batterie (batterie, semifinali, finali)',
        # `event_order` NUMERIC(2) NOT NULL,
        # `begin_time` TIME,
        # `is_out_of_race` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Specalità non in classifica',
        # `is_autofilled` SMALLINT(1) UNSIGNED DEFAULT 0,
        # `notes` TEXT,
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_meeting_events` PRIMARY KEY (`id`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Specialità in programma nelle varie parti delle gare, senza distinzione di categoria e sesso';

    # ALTER TABLE `meeting_events` ADD CONSTRAINT `CC_meeting_events_is_out_of_race` 
        # CHECK (is_out_of_race < 2);
    # ALTER TABLE `meeting_events` ADD CONSTRAINT `CC_meeting_events_is_autofilled` 
        # CHECK (is_autofilled < 2);
  end
end
