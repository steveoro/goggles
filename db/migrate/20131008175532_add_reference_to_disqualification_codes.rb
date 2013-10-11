class AddReferenceToDisqualificationCodes < ActiveRecord::Migration
  def change
    change_table(:meeting_individual_results) do |t|
      t.references :disqualification_code_type
    end

    change_table(:data_import_meeting_individual_results) do |t|
      t.references :disqualification_code_type
    end

    change_table(:meeting_relay_results) do |t|
      t.references :disqualification_code_type
    end

    change_table(:data_import_meeting_relay_results) do |t|
      t.references :disqualification_code_type
    end

    change_table(:swimmer_results) do |t|
      t.references :disqualification_code_type
    end
  end
end
