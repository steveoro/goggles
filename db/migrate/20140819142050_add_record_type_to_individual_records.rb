class AddRecordTypeToIndividualRecords < ActiveRecord::Migration
  def up
    change_table :individual_records do |t|
      t.references :record_type     
    end
  end
  # --------------------------------------------------------------------------- 

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # --------------------------------------------------------------------------- 
end
