class CreateTableMeetingRelays < ActiveRecord::Migration
  def change
    # == meeting_relays entity
    #
    # Stores just the relay header, with its type and its base time.
    #
    create_table :meeting_relays do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.integer :minutes, :limit => 3, :null => false, :default => 0, :comment => 'Base time'
      t.integer :seconds, :limit => 2, :null => false, :default => 0, :comment => 'Base time'
      t.integer :hundreds, :limit => 2, :null => false, :default => 0, :comment => 'Base time'

      t.references :meeting_program
      t.references :relay_type
      t.references :accreditation_time_type

      # Used by the "updated_by" getter:
      t.references :user
    end

    add_index :meeting_relays, [:meeting_program_id, :relay_type_id], :name => 'relays_x_meeting'
  end
end
