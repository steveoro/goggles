class CreateUserSwimmerConfirmations < ActiveRecord::Migration
  def change
    create_table :user_swimmer_confirmations do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.references :swimmer
      t.references :user
      t.belongs_to( :confirmator, :class_name  => "User", :foreign_key => "confirmator_id" )
    end

    add_index :user_swimmer_confirmations, :confirmator_id   
    add_index :user_swimmer_confirmations, [:user_id, :swimmer_id, :confirmator_id], :name => 'user_swimmer_confirmator', :unique => true   

    execute <<-SQL
      ALTER TABLE user_swimmer_confirmations
        ADD CONSTRAINT fk_user_swimmer_confirmations_confirmators
        FOREIGN KEY (confirmator_id)
        REFERENCES users(id)
    SQL
  end
end
