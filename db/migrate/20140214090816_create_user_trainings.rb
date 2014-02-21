class CreateUserTrainings < ActiveRecord::Migration
  def change
    create_table :user_trainings do |t|

      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :description, :limit => 250, :null => false, :default => '', :comment => "Description or purposed scope of this training"

      t.references :user
    end

    add_index :user_trainings, [:user_id, :description], :unique => true, :type => :fulltext   
  end
end
