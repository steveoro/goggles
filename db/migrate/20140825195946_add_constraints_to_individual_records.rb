class AddConstraintsToIndividualRecords < ActiveRecord::Migration
  def up 
    execute <<-SQL
      ALTER TABLE individual_records
        ADD CONSTRAINT fk_individual_records_record_types
        FOREIGN KEY (record_type_id)
        REFERENCES record_types(id)
    SQL
  end

  def down  
    execute <<-SQL
      ALTER TABLE individual_records
        DROP FOREIGN KEY fk_individual_records_record_types
    SQL
  end    
end
