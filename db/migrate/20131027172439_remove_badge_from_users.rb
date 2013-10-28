class RemoveBadgeFromUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.remove_references( :badge )
    end
  end
end
