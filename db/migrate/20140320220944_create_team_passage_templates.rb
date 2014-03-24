class CreateTeamPassageTemplates < ActiveRecord::Migration
  def change
    create_table :team_passage_templates do |t|
      t.integer :lock_version, :default => 0

      t.integer :part_order, :limit => 3, :null => false, :default => 0, :comment => "Overall order for this passage"

      t.boolean :has_subtotal, :null => false, :default => false, :comment => 'TRUE when the passage type has also subtotal timing'
      t.boolean :has_cycle_count, :null => false, :default => false, :comment => 'TRUE when the passage type has also cycle count'
      t.boolean :has_breath_count, :null => false, :default => false, :comment => 'TRUE when the passage type has also breath count'
      t.boolean :has_non_swam_part, :null => false, :default => false, :comment => 'TRUE when the passage type has also non swam part timing'
      t.boolean :has_non_swam_kick_count, :null => false, :default => false, :comment => 'TRUE when the passage type has also non swam kick count'
      t.boolean :has_passage_position, :null => false, :default => false, :comment => 'TRUE when the passage type has also the passage position for the heat'

      t.references :team
      t.references :event_type
      t.references :pool_type
      t.references :passage_type

      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end
  end
end
