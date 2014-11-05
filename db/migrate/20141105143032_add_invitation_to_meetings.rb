class AddInvitationToMeetings < ActiveRecord::Migration
  def change
    change_table(:meetings) do |t|
      t.text :invitation, limit: 16777215, :comment => 'Meeting invitation'
    end
  end
end
