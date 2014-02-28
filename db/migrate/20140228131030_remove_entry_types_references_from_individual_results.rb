class RemoveEntryTypesReferencesFromIndividualResults < ActiveRecord::Migration
  def change
    change_table :meeting_individual_results do |t|
      t.remove_references( :entry_time_type )
    end
    remove_column :meeting_individual_results, :entry_minutes      
    remove_column :meeting_individual_results, :entry_seconds      
    remove_column :meeting_individual_results, :entry_hundreds      

    change_table :data_import_meeting_individual_results do |t|
      t.remove_references( :entry_time_type )
    end
    remove_column :data_import_meeting_individual_results, :entry_minutes      
    remove_column :data_import_meeting_individual_results, :entry_seconds      
    remove_column :data_import_meeting_individual_results, :entry_hundreds      
  end
end
