class CreateTableSwimmers < ActiveRecord::Migration
  def change
    create_table :swimmers do |t|
      t.integer :lock_version, :default => 0
      t.string :last_name,  :limit => 50
      t.string :first_name, :limit => 50
      t.integer :year_of_birth, :limit => 4, :null => false, :default => 1900

      t.string :phone_mobile, :limit => 40
      t.string :phone_number, :limit => 40
      t.string :e_mail, :limit => 100
      t.string :nickname, :limit => 25, :default => '', :comment => 'This will default to the user name when the swimmer data is associated to a user instance'

      t.integer :associated_user_id, :limit => 8

      t.references :gender_type
      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :swimmers, [:last_name, :first_name, :nickname], name: :name_and_nick, :unique => true
    add_index :swimmers, [:last_name, :first_name], name: :full_name
    add_index :swimmers, :nickname
    add_index :swimmers, :associated_user_id
  end
end
