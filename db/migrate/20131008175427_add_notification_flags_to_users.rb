class AddNotificationFlagsToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.boolean   :use_email_data_updates_notify, :default => true, :null => false
      t.boolean   :use_email_achievements_notify, :default => true, :null => false
      t.boolean   :use_email_newsletter_notify,   :default => true, :null => false
      t.boolean   :use_email_community_notify,    :default => true, :null => false
    end
  end
end
