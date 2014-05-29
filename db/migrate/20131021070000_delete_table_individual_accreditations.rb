class DeleteTableIndividualAccreditations < ActiveRecord::Migration
  def change
    execute <<-SQL
      ALTER TABLE individual_accreditations
        DROP FOREIGN KEY fk_individual_accreditations_meeting_programs
    SQL
    execute <<-SQL
      ALTER TABLE individual_accreditations
        DROP FOREIGN KEY fk_individual_accreditations_badges
    SQL
    execute <<-SQL
      ALTER TABLE individual_accreditations
        DROP FOREIGN KEY fk_individual_accreditations_accreditation_time_types
    SQL

    remove_index :individual_accreditations, name: :accreditations_x_badges
    drop_table :individual_accreditations
  end
end
