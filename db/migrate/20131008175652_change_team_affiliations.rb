class ChangeTeamAffiliations < ActiveRecord::Migration
  def up                                            # remove the "unique=true" versions of the index:
    remove_index :team_affiliations, name: :index_team_affiliations_on_number
    add_index :team_affiliations, [:number], name: :index_team_affiliations_on_number

    change_table(:team_affiliations) do |t|         # number can be null when auto-filled by data-import
      t.change  :number, :string, :limit => 20, :null => true

      t.boolean :is_autofilled, :default => false, :null => false, :comment => "data-confirmation flag; set to true only when the values of the row have been guessed/filled by the data-import parser."
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
