class AddAvatarToUsers < ActiveRecord::Migration
  def change
    change_table( :users ) do |t|
      t.string  :avatar_resource_filename, :limit => 250
    end
  end
end
