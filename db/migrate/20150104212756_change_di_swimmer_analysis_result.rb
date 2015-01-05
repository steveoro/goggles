class ChangeDiSwimmerAnalysisResult < ActiveRecord::Migration
  def change
    remove_index  :data_import_swimmer_analysis_results, name: :idx_di_session_name_and_season
    remove_column :data_import_swimmer_analysis_results, :desired_season_id

    change_table :data_import_swimmer_analysis_results do |t|
      t.integer :desired_year_of_birth, :limit => 4, :null => false, :default => 1900
      t.integer :desired_gender_type_id, :limit => 8
    end

    add_index :data_import_swimmer_analysis_results, [:data_import_session_id, :searched_swimmer_name, :desired_year_of_birth, :desired_gender_type_id], name: :idx_di_session_swimmer_name, unique: true
    add_index :data_import_swimmer_analysis_results, [:desired_gender_type_id], name: :idx_di_swimmer_gender_type
  end
end
