class CreateTableMeetingRelayResults < ActiveRecord::Migration
  def change
    # == meeting_relay_results entity
    #
    # Stores each team results for each meeting relay.
    # For swimmers partecipating in the relay, take a look at meeting_relay_swimmers.
    #
    create_table :meeting_relay_results do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.integer :rank, :limit => 4, :null => false, :default => 0

      t.boolean :is_play_off, :null => false, :default => false
      t.boolean :is_out_of_race, :null => false, :default => false
      t.boolean :is_disqualified, :null => false, :default => false

      t.decimal :standard_points, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.decimal :meeting_points, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.integer :minutes, :limit => 3, :null => false, :default => 0
      t.integer :seconds, :limit => 2, :null => false, :default => 0
      t.integer :hundreds, :limit => 2, :null => false, :default => 0

      t.references :meeting_relay
      t.references :team
      t.references :result_type

      # Used by the "updated_by" getter:
      t.references :user
    end

    add_index :meeting_relay_results, [:meeting_relay_id, :rank], name: 'results_x_relay'
  end
end
