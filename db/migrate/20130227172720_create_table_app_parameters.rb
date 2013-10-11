class CreateTableAppParameters < ActiveRecord::Migration
  def change
    create_table :app_parameters do |t|
      t.integer :lock_version, :default => 0
      t.integer :code
      t.string :controller_name
      t.string :action_name
      t.boolean :is_a_post, :default => false, :null => false
      t.string :confirmation_text
      t.string :a_string
      t.boolean :a_bool
      t.integer :a_integer
      t.datetime :a_date
      t.decimal :a_decimal, :precision => 10, :scale => 2
      t.decimal :a_decimal_2, :precision => 10, :scale => 2
      t.decimal :a_decimal_3, :precision => 10, :scale => 2
      t.decimal :a_decimal_4, :precision => 10, :scale => 2
      t.integer :range_x, :limit => 8
      t.integer :range_y, :limit => 8
      t.string :a_name
      t.string :a_filename
      t.string :tooltip_text
      t.integer :view_height, :default => 0, :null => false
      t.integer :code_type_1, :limit => 8
      t.integer :code_type_2, :limit => 8
      t.integer :code_type_3, :limit => 8
      t.integer :code_type_4, :limit => 8
      t.text :free_text_1
      t.text :free_text_2
      t.text :free_text_3
      t.text :free_text_4
      t.boolean :free_bool_1
      t.boolean :free_bool_2
      t.boolean :free_bool_3
      t.boolean :free_bool_4
      t.text :description

      t.timestamps
    end

    add_index :app_parameters, :code, :unique => true
  end
end
