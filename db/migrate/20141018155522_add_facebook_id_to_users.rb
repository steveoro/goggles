class AddFacebookIdToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.integer :facebook_uid, limit: 8
      t.integer :goggle_uid,   limit: 8
      t.integer :twitter_uid,  limit: 8
    end
  end


  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
