class AddMaxYearAndCategoryTypeToSwimmerAnalysisResults < ActiveRecord::Migration
  def change
    change_table :data_import_swimmer_analysis_results do |t|
      t.integer :max_year_of_birth, :limit => 4, :null => true

      t.references :category_type
    end
  end
end
