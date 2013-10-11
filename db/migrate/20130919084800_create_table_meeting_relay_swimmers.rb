class CreateTableMeetingRelaySwimmers < ActiveRecord::Migration
  def change
    # == meeting_relay_swimmers entity
    #
    # Stores each team member partecipating in a meeting relay.
    # Either the swimmer name or the badge number is not always available during data-import.
    #
    create_table :meeting_relay_swimmers do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.integer :relay_order, :limit => 1, :null => false, :default => 0

      t.references :meeting_relay
      t.references :swimmer
      t.references :badge

      t.references :stroke_type

      # Used by the "updated_by" getter:
      t.references :user
    end

    add_index :meeting_relay_swimmers, [:meeting_relay_id, :relay_order], :name => 'relay_order'
  end
end
