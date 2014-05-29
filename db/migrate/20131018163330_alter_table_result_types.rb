class AlterTableResultTypes < ActiveRecord::Migration
  def change
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_result_types
    SQL
    execute <<-SQL
      ALTER TABLE meeting_individual_results
        DROP FOREIGN KEY fk_meeting_individual_results_result_types
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relay_results
        DROP FOREIGN KEY fk_meeting_relay_results_result_types
    SQL

    remove_index :result_types, name: :index_result_types_on_code
    rename_table :result_types, :heat_types

    remove_column :heat_types, :default_value

    change_table(:heat_types) do |t|
      t.boolean :is_default_value, :default => false, :null => false, :comment => "Set to true only for what must be used as default value for the data-import parser"
    end
    add_index :heat_types, [:code], name: :idx_heat_types_code, :unique => true

    # CREATE TABLE `heat_types` (
        # `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        # `code` VARCHAR(1) NOT NULL,
        # `is_default_value` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Indica il tipo risultato di default per il parser',
        # `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
        # `updated_at` DATETIME NOT NULL COMMENT 'Updated at',
        # `lock_version` INTEGER(11) UNSIGNED DEFAULT 0 COMMENT 'Internal row locking mechanism',
        # CONSTRAINT `pk_heat_types` PRIMARY KEY (`id`),
        # CONSTRAINT `uk_heat_types_1` UNIQUE (`code`)
    # )
    # ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 COMMENT = 'Tipologia di batteria (batterie, semifinali, finali)';

    # ALTER TABLE `heat_types` ADD CONSTRAINT `CC_heat_types_is_default_value` 
        # CHECK (is_default_value < 2);
  end
end
