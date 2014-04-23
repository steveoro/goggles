class AddDetailsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :last_name,  limit: 50
      t.string :first_name, limit: 50
      t.integer :year_of_birth, limit: 4, default: 1900
    end

    change_column( :users, :description, :string, limit: 100 )
    add_index( :users, [:last_name, :first_name, :year_of_birth], name: :full_name )
  end
end
