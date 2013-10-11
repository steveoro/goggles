class CreateTableTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :lock_version, :default => 0
      t.string :name, :limit => 40, :null => false

      # Used for "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :tags, :name, :unique => true
  end
end
