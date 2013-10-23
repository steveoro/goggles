class CreateBaseMovements < ActiveRecord::Migration
  def change
    create_table :base_movements do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :code, :limit => 6, :null => false
      t.boolean :is_arm_aux_allowed,    :null => false, :default => false
      t.boolean :is_kick_aux_allowed,   :null => false, :default => false
      t.boolean :is_body_aux_allowed,   :null => false, :default => false
      t.boolean :is_breath_aux_allowed, :null => false, :default => false

      t.references :movement_type
      t.references :stroke_type
      t.references :movement_scope_type

      t.references :user
    end

    add_index :base_movements, :code, :unique => true

    # [Steve, 20131023] ER-SQL source:
    # CREATE TABLE `base_movements` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `code` VARCHAR(6) NOT NULL,
        # `movement_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `stroke_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `movement_scope_type_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
        # `user_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Creatore dell''allenamento',
        # `arm_aux_allowed` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Consentito eseguirlo con ausili per le braccia (vedi arm_aux_types)',
        # `kick_aux_allowed` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Consentito eseguirlo con ausili per le gambe (vedi kick_aux_types)',
        # `body_aux_allowed` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Consentito eseguirlo con ausili per il corpo (vedi body_aux_types)',
        # `breath_aux_allowed` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Consentito eseguirlo con ausili per la respirazione (vedi breath_aux_types)',
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_base_movements` PRIMARY KEY (`id`),
        # CONSTRAINT `uk_base_movements_1` UNIQUE (`code`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT = 'Parte di un esercizio basata su un tipo di movimento omogeneo. Un esercizio è composto da tante parti che sommate lo descrivono.';

    # ALTER TABLE `base_movements` ADD CONSTRAINT `CC_base_movements_arm_aux_allowed` 
        # CHECK (arm_aux_allowed < 2);
    # ALTER TABLE `base_movements` ADD CONSTRAINT `CC_base_movements_kick_aux_allowed` 
        # CHECK (kick_aux_allowed < 2);
    # ALTER TABLE `base_movements` ADD CONSTRAINT `CC_base_movements_body_aux_allowed` 
        # CHECK (body_aux_allowed < 2);
    # ALTER TABLE `base_movements` ADD CONSTRAINT `CC_base_movements_breath_aux_allowed` 
        # CHECK (breath_aux_allowed < 2);
  end
  # ---------------------------------------------------------------------------
end
