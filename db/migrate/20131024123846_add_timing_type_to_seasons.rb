class AddTimingTypeToSeasons < ActiveRecord::Migration
  def change
    # ----------------- SEASONS -----------------------------------------------
    change_table(:seasons) do |t|
      t.references :timing_type
    end

    execute <<-SQL
      ALTER TABLE seasons
        ADD CONSTRAINT fk_seasons_timing_types
        FOREIGN KEY (timing_type_id)
        REFERENCES timing_types(id)
    SQL


    # ----------------- DATA IMPORT SEASONS -----------------------------------
    change_table(:data_import_seasons) do |t|
      t.references :timing_type
    end
  end
end
