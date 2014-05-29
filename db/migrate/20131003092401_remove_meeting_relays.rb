class RemoveMeetingRelays < ActiveRecord::Migration
  def up
    # ----------------- FK & IDX: MEETING RELAYS
    execute <<-SQL
      ALTER TABLE meeting_relays
        DROP FOREIGN KEY fk_meeting_relays_meeting_programs
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relays
        DROP FOREIGN KEY fk_meeting_relays_relay_types
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relays
        DROP FOREIGN KEY fk_meeting_relays_accreditation_time_types
    SQL

    remove_index :meeting_relays, name: :relays_x_meeting

    # ----------------- FK & IDX: MEETING RELAY RESULTS
    execute <<-SQL
      ALTER TABLE meeting_relay_results
        DROP FOREIGN KEY fk_meeting_relay_results_meeting_relays
    SQL

    remove_index :meeting_relay_results, name: :results_x_relay

    remove_column :data_import_meeting_relay_results, :data_import_meeting_relay_id
    remove_column :data_import_meeting_relay_results, :meeting_relay_id
    remove_column :meeting_relay_results, :meeting_relay_id

    # ----------------- FK & IDX: MEETING RELAY SWIMMERS
    execute <<-SQL
      ALTER TABLE meeting_relay_swimmers
        DROP FOREIGN KEY fk_meeting_relay_swimmers_meeting_relays
    SQL

    remove_index :meeting_relay_swimmers, name: :relay_order

    remove_column :meeting_relay_swimmers, :meeting_relay_id

    # ----------------- DROP: MEETING RELAYS
    drop_table :data_import_meeting_relays
    drop_table :meeting_relays
    # -------------------------------------------------------------------------


    # ----------------- ALTER: MEETING PROGRAMS, link to :accreditation_time_types
    execute <<-SQL
      ALTER TABLE meeting_programs
        ADD CONSTRAINT fk_meeting_programs_accreditation_time_types
        FOREIGN KEY (accreditation_time_type_id)
        REFERENCES accreditation_time_types(id)
    SQL

    # ----------------- ALTER: MEETING RELAY RESULTS, link to :meeting_program
    change_table(:meeting_relay_results) do |t|
      t.references :meeting_program
    end
    add_index :meeting_relay_results, [:meeting_program_id, :rank], name: 'results_x_relay'

    change_table(:data_import_meeting_relay_results) do |t|
      t.references :data_import_meeting_program
      t.references :meeting_program
    end

    execute <<-SQL
      ALTER TABLE meeting_relay_results
        ADD CONSTRAINT fk_meeting_relay_results_meeting_programs
        FOREIGN KEY (meeting_program_id)
        REFERENCES meeting_programs(id)
    SQL

    # ----------------- ALTER: MEETING RELAY SWIMMERS, link to :meeting_program
    change_table(:meeting_relay_swimmers) do |t|
      t.references :meeting_program
    end
    add_index :meeting_relay_swimmers, [:meeting_program_id, :relay_order], name: 'relay_order'

    execute <<-SQL
      ALTER TABLE meeting_relay_swimmers
        ADD CONSTRAINT fk_meeting_relay_swimmers_meeting_programs
        FOREIGN KEY (meeting_program_id)
        REFERENCES meeting_programs(id)
    SQL
  end
  # ---------------------------------------------------------------------------


  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
  # ---------------------------------------------------------------------------
end
