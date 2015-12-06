class AddFinalRankToBadges < ActiveRecord::Migration
  def change
    change_table :badges do |t|
      t.integer :final_rank
    end
  end
end
