class AlterTableCategoryTypes < ActiveRecord::Migration
  def change
    change_column( :category_types, :code, :string, :limit => 7, :null => false )
  end
end
