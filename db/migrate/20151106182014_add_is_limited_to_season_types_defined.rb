class AddIsLimitedToSeasonTypesDefined < ActiveRecord::Migration
  def change
    change_table :goggle_cups do |t|
      t.boolean :is_limited_to_season_types_defined, :null => false, :default => false
    end
  end
end
