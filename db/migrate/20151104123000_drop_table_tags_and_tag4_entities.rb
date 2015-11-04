class DropTableTagsAndTag4Entities < ActiveRecord::Migration
  def up
    # ----------------- TAG 4 ENTITIES ----------------------------------------
    execute <<-SQL
      ALTER TABLE tag4_entities
        DROP FOREIGN KEY fk_tag4_entities_tags
    SQL
    remove_index :tag4_entities, name: :tag_id_entity_name_entity_id
    remove_index :tag4_entities, name: :entity_name_entity_id
    change_table :tag4_entities do |t|
      t.remove_references( :user )
      t.remove_references( :tag )
    end

    drop_table :tag4_entities

    # ----------------- TAGS ----------------------------------------
    remove_index :tags, name: :index_tags_on_name
    change_table :tags do |t|
      t.remove_references( :user )
    end

    drop_table :tags
  end
  # ---------------------------------------------------------------------------

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # ---------------------------------------------------------------------------
end
