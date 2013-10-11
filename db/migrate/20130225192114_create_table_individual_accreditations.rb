class CreateTableIndividualAccreditations < ActiveRecord::Migration
  def change
    create_table :individual_accreditations do |t|
      t.integer :lock_version, :default => 0
      t.integer :minutes, :limit => 3, :null => false, :default => 0
      t.integer :seconds, :limit => 2, :null => false, :default => 0
      t.integer :hundreds, :limit => 2, :null => false, :default => 0
      t.text :notes

      t.references :meeting_program
      t.references :badge
      t.references :accreditation_time_type

      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :individual_accreditations, [:meeting_program_id, :badge_id], :name => 'accreditations_x_badges'
  end
end
