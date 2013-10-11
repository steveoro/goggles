class CreateTableUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :lock_version, :default => 0
      t.string  :name, :null => false
      t.string  :description, :limit => 50
#      t.string  :hashed_pwd
#      t.string  :salt
#      t.integer :authorization_level

      # Used by the "updated_by" getter:
#      t.references :user

      t.references :swimmer
      t.references :badge
      t.timestamps
    end

    add_index :users, :name, :unique => true
  end
end
