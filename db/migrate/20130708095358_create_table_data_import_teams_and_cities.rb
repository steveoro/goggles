class CreateTableDataImportTeamsAndCities < ActiveRecord::Migration
  def change
    create_table :data_import_cities do |t|
      t.primary_key :id
      t.integer     :lock_version,  :default => 0
      t.timestamps
                                                    # Adds the current data-import session unique identifier:
      t.references :data_import_session
                                                    # This will have a value != 0 only if a conflicting row id was found during the parsing phase
      t.integer :conflicting_id, :limit => 8, :default => 0
      t.string  :import_text, :null => false

      t.string :name,         :limit => 50, :null => false
      t.string :zip,          :limit => 6
      t.string :area,         :limit => 50
      t.string :country,      :limit => 50
      t.string :country_code, :limit => 10

      # Used by the "updated_by" getter:
      t.references :user
    end

    add_index :data_import_cities, :name
    add_index :data_import_cities, :zip


    create_table :data_import_teams do |t|
      t.primary_key :id
      t.integer     :lock_version,  :default => 0
      t.timestamps
                                                    # Adds the current data-import session unique identifier:
      t.references :data_import_session
                                                    # This will have a value != 0 only if a conflicting row id was found during the parsing phase
      t.integer :conflicting_id,    :limit => 8, :default => 0
      t.string  :import_text, :null => false
      t.string :name, :limit => 60, :null => false

      # XXX [Steve, 20130925] :badge_number can be used as a temporary storage
      # for a team_affiliations.number found during data-import parsing,
      # skipping the need for a dedicated team_affiliations temp. table:
      t.string :badge_number, :limit => 40, :comment => 'team badge number or code (can be null)'

      t.references :data_import_city
      t.references :city
      # Used by the "updated_by" getter:
      t.references :user
    end

    add_index :data_import_teams, :name
    add_index :data_import_teams, :city_id, name: :city_id
    add_index :data_import_teams, :data_import_city_id, name: :data_import_city_id
  end
end
