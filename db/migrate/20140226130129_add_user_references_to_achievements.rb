class AddUserReferencesToAchievements < ActiveRecord::Migration
  def change
    change_table :achievements do |t|
      t.references :user
    end
  end
end
