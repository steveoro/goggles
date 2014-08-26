class AddMaxPerformanceToGoggleCups < ActiveRecord::Migration
  def change
    change_table(:goggle_cups) do |t|
      t.integer :max_performance, :limit => 2, :null => false, :default => 5
    end
  end
end
