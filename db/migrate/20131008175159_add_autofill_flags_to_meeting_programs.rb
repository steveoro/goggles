class AddAutofillFlagsToMeetingPrograms < ActiveRecord::Migration
  def change
    change_table(:meeting_programs) do |t|
      t.boolean   :is_autofilled, :default => false, :null => false, :comment => "data-confirmation flag; set to true only when the values of the row have been guessed/filled by the data-import parser."
    end
  end
end
