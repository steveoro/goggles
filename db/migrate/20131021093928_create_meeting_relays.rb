class CreateMeetingRelays < ActiveRecord::Migration
  def change
    # == meeting_relays entity
    #
    # Stores just the relay header, with its type and its subscrition/accreditation time.
    #
    create_table :meeting_relays do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string  :description, :limit => 60
      t.integer :minutes, :limit => 3, :null => false, :default => 0, :comment => 'Accreditation time'
      t.integer :seconds, :limit => 2, :null => false, :default => 0, :comment => 'Accreditation time'
      t.integer :hundreds, :limit => 2, :null => false, :default => 0, :comment => 'Accreditation time'

      t.references :team
      t.references :meeting_program
      t.references :relay_type
    end

    add_index :meeting_relays, [:meeting_program_id, :relay_type_id], :name => 'idx_relays_x_program'
  end
end
