class AddTableConstraintsPart4 < ActiveRecord::Migration
  def up
    # ----------------- MEETING RELAYS ----------------------------------------
    execute <<-SQL
      ALTER TABLE meeting_relays
        ADD CONSTRAINT fk_meeting_relays_meeting_programs
        FOREIGN KEY (meeting_program_id)
        REFERENCES meeting_programs(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relays
        ADD CONSTRAINT fk_meeting_relays_relay_types
        FOREIGN KEY (relay_type_id)
        REFERENCES relay_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relays
        ADD CONSTRAINT fk_meeting_relays_accreditation_time_types
        FOREIGN KEY (accreditation_time_type_id)
        REFERENCES accreditation_time_types(id)
    SQL

    # ----------------- MEETING RELAY RESULTS ---------------------------------
    execute <<-SQL
      ALTER TABLE meeting_relay_results
        ADD CONSTRAINT fk_meeting_relay_results_meeting_relays
        FOREIGN KEY (meeting_relay_id)
        REFERENCES meeting_relays(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relay_results
        ADD CONSTRAINT fk_meeting_relay_results_teams
        FOREIGN KEY (team_id)
        REFERENCES teams(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relay_results
        ADD CONSTRAINT fk_meeting_relay_results_result_types
        FOREIGN KEY (result_type_id)
        REFERENCES result_types(id)
    SQL

    # ----------------- MEETING RELAY SWIMMERS --------------------------------
    execute <<-SQL
      ALTER TABLE meeting_relay_swimmers
        ADD CONSTRAINT fk_meeting_relay_swimmers_meeting_relays
        FOREIGN KEY (meeting_relay_id)
        REFERENCES meeting_relays(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relay_swimmers
        ADD CONSTRAINT fk_meeting_relay_swimmers_swimmers
        FOREIGN KEY (swimmer_id)
        REFERENCES swimmers(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relay_swimmers
        ADD CONSTRAINT fk_meeting_relay_swimmers_badges
        FOREIGN KEY (badge_id)
        REFERENCES badges(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relay_swimmers
        ADD CONSTRAINT fk_meeting_relay_swimmers_stroke_types
        FOREIGN KEY (stroke_type_id)
        REFERENCES stroke_types(id)
    SQL
  end
  # ---------------------------------------------------------------------------



  def down
    # ----------------- MEETING RELAYS ----------------------------------------
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

    # ----------------- MEETING RELAY RESULTS ---------------------------------
    execute <<-SQL
      ALTER TABLE meeting_relay_results
        DROP FOREIGN KEY fk_meeting_relay_results_meeting_relays
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relay_results
        DROP FOREIGN KEY fk_meeting_relay_results_teams
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relay_results
        DROP FOREIGN KEY fk_meeting_relay_results_result_types
    SQL

    # ----------------- MEETING RELAY SWIMMERS --------------------------------
    execute <<-SQL
      ALTER TABLE meeting_relay_swimmers
        DROP FOREIGN KEY fk_meeting_relay_swimmers_meeting_relays
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relay_swimmers
        DROP FOREIGN KEY fk_meeting_relay_swimmers_swimmers
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relay_swimmers
        DROP FOREIGN KEY fk_meeting_relay_swimmers_badges
    SQL
    execute <<-SQL
      ALTER TABLE meeting_relay_swimmers
        DROP FOREIGN KEY fk_meeting_relay_swimmers_stroke_types
    SQL
  end
  # ---------------------------------------------------------------------------
end
