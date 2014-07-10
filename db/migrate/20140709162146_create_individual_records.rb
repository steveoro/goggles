class CreateIndividualRecords < ActiveRecord::Migration
  def change
    create_table :individual_records do |t|
      t.integer :lock_version, default: 0
      t.timestamps

      # Always validated at insertion:
      t.references :pool_type
      t.references :event_type
      t.references :category_type
      t.references :gender_type

      t.integer :minutes,  limit: 3, null: false, default: 0
      t.integer :seconds,  limit: 2, null: false, default: 0
      t.integer :hundreds, limit: 2, null: false, default: 0

      t.boolean :is_team_record, null: false, default: false

      # Always validated at insertion:
      t.references :swimmer
      t.references :team
      t.references :season
      t.references :federation_type

      # May be null:
      t.references :meeting_individual_result
    end
  end
end
