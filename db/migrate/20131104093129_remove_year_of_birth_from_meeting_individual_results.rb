class RemoveYearOfBirthFromMeetingIndividualResults < ActiveRecord::Migration
  def change
    remove_column :meeting_individual_results, :year_of_birth
  end
end
