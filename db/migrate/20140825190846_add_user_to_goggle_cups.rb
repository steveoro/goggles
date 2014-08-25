class AddUserToGoggleCups < ActiveRecord::Migration
  def change
    change_table(:goggle_cups) do |t|
      t.references :user
    end
  end
end
