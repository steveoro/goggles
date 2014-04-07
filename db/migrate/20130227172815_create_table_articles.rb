class CreateTableArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :lock_version, :default => 0
      t.string :title, :limit => 80, :null => false
      t.text :body, :null => false
      t.boolean :is_sticky, :default => false, :null => false

      t.references :user
      t.timestamps
    end

    add_index :articles, :title
  end
end
