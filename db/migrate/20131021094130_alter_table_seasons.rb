class AlterTableSeasons < ActiveRecord::Migration
  def change
    # ----------------- SEASONS -----------------------------------------------
    change_table(:seasons) do |t|
      t.string  :header_year, :limit => 9, :null => false, :comment => 'Additiona Meeting year grouping in the variable format "YY(YY)([/-]yy(yy))" and extracted from the data-import file or hand-filled'
      t.integer :edition, :limit => 3, :null => false, :default => 0, :comment => 'edition or challenge number'
      t.references :edition_type
    end

    remove_column :seasons, :must_use_time_standards
    remove_column :seasons, :max_points

    execute <<-SQL
      ALTER TABLE seasons
        ADD CONSTRAINT fk_seasons_edition_types
        FOREIGN KEY (edition_type_id)
        REFERENCES edition_types(id)
    SQL


    # ----------------- DATA IMPORT SEASONS -----------------------------------
    change_table(:data_import_seasons) do |t|
      t.string  :header_year, :limit => 9, :null => false, :comment => 'Additiona Meeting year grouping in the variable format "YY(YY)([/-]yy(yy))" and extracted from the data-import file or hand-filled'
      t.integer :edition, :limit => 3, :null => false, :default => 0, :comment => 'edition or challenge number'
      t.references :edition_type
    end

    remove_column :data_import_seasons, :must_use_time_standards
    remove_column :data_import_seasons, :max_points
  end
end
