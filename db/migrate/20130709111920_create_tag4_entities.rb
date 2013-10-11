class CreateTag4Entities < ActiveRecord::Migration
  def change
    create_table :tag4_entities do |t|
      t.timestamps
      t.string  :entity_name, :null => false
      t.integer :entity_id,   :null => false

      t.references :tag
      t.references :user
    end

    add_index :tag4_entities, ["tag_id", "entity_name", "entity_id"], :name => "tag_id_entity_name_entity_id", :unique => true
    add_index :tag4_entities, ["entity_name", "entity_id"], :name => "entity_name_entity_id"
    add_index :tag4_entities, ["user_id"], :name => "user_id"
  end
end
