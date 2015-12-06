class AddAreRecordsToMeetingIndividualResults < ActiveRecord::Migration
  def change
    change_table :meeting_individual_results do |t|
      t.boolean :is_personal_best, :null => false, :default => false
      t.boolean :is_season_type_best, :null => false, :default => false
    end
  end
end
