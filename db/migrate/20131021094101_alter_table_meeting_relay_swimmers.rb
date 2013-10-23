class AlterTableMeetingRelaySwimmers < ActiveRecord::Migration
  def change
    # ----------------- MEETING RELAY SWIMMERS --------------------------------
    execute <<-SQL
      ALTER TABLE meeting_relay_swimmers
        DROP FOREIGN KEY fk_meeting_relay_swimmers_meeting_programs
    SQL

    change_table(:meeting_relay_swimmers) do |t|
      t.change  :relay_order, :integer, :limit => 3, :default => 0, :null => true

      t.decimal :reaction_time, :precision => 5, :scale => 2, :default => 0.0, :null => false, :comment => "Measured reaction time (when available)"
      t.integer :minutes, :limit => 3, :default => 0, :null => false
      t.integer :seconds, :limit => 2, :default => 0, :null => false
      t.integer :hundreds, :limit => 2, :default => 0, :null => false

      t.remove_references( :meeting_program )
      # [Steve, 20131023] swimmer_id reference left in place for "ease of reference" purposes (we'll have to fill-in both badge & swimmer IDs)
      t.references :meeting_relay_result
    end

    execute <<-SQL
      ALTER TABLE meeting_relay_swimmers
        ADD CONSTRAINT fk_meeting_relay_swimmers_meeting_relay_results
        FOREIGN KEY (meeting_relay_result_id)
        REFERENCES meeting_relay_results(id)
    SQL

    # [Steve, 20131023] ER-SQL source:
    # CREATE TABLE `meeting_relay_swimmers` (
        # `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
        # `relay_order` TINYINT(4) NOT NULL DEFAULT '0',
        # `badge_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `stroke_type_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `meeting_relay_result_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `reaction_time` NUMERIC(5,2) COMMENT 'Tempo di reazione dal blocco o cambio per le staffette',
        # `minutes` NUMERIC(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Minuti',
        # `seconds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Secondi',
        # `hundreds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Centesimi',
        # `user_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_meeting_relay_swimmers` PRIMARY KEY (`id`)
    # )
     # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1  COMMENT = 'Nuotatori che compongono una staffetta (attraverso i cartellini dei nuotatori)';
#     
    # CREATE INDEX `fk_meeting_relay_swimmers_badges` ON `meeting_relay_swimmers` (`badge_id`);
    # CREATE INDEX `fk_meeting_relay_swimmers_stroke_types` ON `meeting_relay_swimmers` (`stroke_type_id`);
    # CREATE INDEX `relay_order` ON `meeting_relay_swimmers` (`relay_order`);
    # ALTER TABLE `meeting_relay_swimmers` ADD CONSTRAINT `cc_meeting_relay_swimmers_seconds` 
        # CHECK (seconds < 60);
  end
end
