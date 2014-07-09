class CreateIndividualRecords < ActiveRecord::Migration
  def change
    create_table :individual_records do |t|
      t.integer :lock_version, default: 0
      t.timestamps

      t.references :meeting_individual_result

      t.boolean :is_team_record,       null: false, default: false
      t.boolean :is_season_record,     null: false, default: false
      t.boolean :is_federation_record, null: false, default: false

      t.references :pool_type
      t.references :event_type
      t.references :category_type
      t.references :gender_type

      t.references :swimmer
      t.references :team
      t.references :season_type
      t.references :federation_type
    end
  end
end
