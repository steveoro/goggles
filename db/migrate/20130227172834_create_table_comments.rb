class CreateTableComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :lock_version, :default => 0
      t.string :entry_text, :null => false

      t.references :user
      t.references :swimming_pool_review
      t.references :comment
      t.timestamps
    end
  end
end
