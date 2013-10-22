class AlterTableMeetingRelaySwimmers < ActiveRecord::Migration
  def change
    execute <<-SQL
      ALTER TABLE :meeting_relay_swimmers
        DROP FOREIGN KEY fk_meeting_relay_swimmers_meeting_programs
    SQL

    change_table(:meeting_relay_swimmers) do |t|
      t.decimal :goggle_cup_points, :precision => 5, :scale => 2, :default => 0.0, :null => false
      t.decimal :reaction_time, :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Measured reaction time (when available)"

      t.remove_references( :meeting_program )
      t.references :meeting_relay
    end

    execute <<-SQL
      ALTER TABLE meeting_relay_swimmers
        ADD CONSTRAINT fk_meeting_relay_swimmers_meeting_relays
        FOREIGN KEY (meeting_relay_id)
        REFERENCES meeting_relays(id)
    SQL

    # [Steve, 20131021] ER-SQL source:
    # CREATE TABLE `meeting_relay_swimmers` (
        # `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
        # `relay_order` TINYINT(4) NOT NULL DEFAULT '0',
        # `badge_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `stroke_type_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `meeting_relay_result_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `reaction_time` NUMERIC(5,2) COMMENT 'Tempo di stacco dal blooco',
        # `minutes` NUMERIC(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Minuti',
        # `seconds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Secondi',
        # `hundreds` NUMERIC(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT 'Centesimi',
        # `user_id` INTEGER(11) UNSIGNED DEFAULT 0,
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0,
        # `created_at` DATETIME NOT NULL COMMENT 'Data creazione record',
        # `updated_at` DATETIME NOT NULL COMMENT 'Data ultima modifica record',
        # CONSTRAINT `pk_meeting_relay_swimmers` PRIMARY KEY (`id`)
    # )
     # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1  COMMENT = 'Nuotatori che compongono una staffetta (attraverso i cartellini dei nuotatori)';

    # CREATE INDEX `fk_meeting_relay_swimmers_badges` ON `meeting_relay_swimmers` (`badge_id`);
    # CREATE INDEX `fk_meeting_relay_swimmers_stroke_types` ON `meeting_relay_swimmers` (`stroke_type_id`);
    # CREATE INDEX `relay_order` ON `meeting_relay_swimmers` (`relay_order`);
  end
end
