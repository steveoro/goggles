class CreateTableSwimmingPoolReviews < ActiveRecord::Migration
  def change
    create_table :swimming_pool_reviews do |t|
      t.integer :lock_version, :default => 0
      t.string :title, :limit => 100, :null => false
      t.text :entry_text, :null => false

      t.references :user
      t.references :swimming_pool
      t.timestamps
    end

    add_index :swimming_pool_reviews, :title
  end
end
