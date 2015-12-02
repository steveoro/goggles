class AddIsUndividedToCategoryTypes < ActiveRecord::Migration
  def change
    change_table :category_types do |t|
      t.boolean :is_undivided, :null => false, :default => false
    end
  end
end
