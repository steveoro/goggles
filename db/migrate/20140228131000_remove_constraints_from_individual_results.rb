class RemoveConstraintsFromIndividualResults < ActiveRecord::Migration
  def up 
    execute <<-SQL
      ALTER TABLE meeting_individual_results
        DROP FOREIGN KEY fk_meeting_individual_results_entry_time_types
    SQL
  end

  def down  
    raise ActiveRecord::IrreversibleMigration
  end      
end
