class CreateTablesTeamsAndCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :lock_version, :default => 0
      t.string :name,         :limit => 50, :null => false
      t.string :zip,          :limit => 6
      t.string :area,         :limit => 50, :null => false
      t.string :country,      :limit => 50, :null => false
      t.string :country_code, :limit => 10, :null => false
      t.timestamps
    end

    add_index :cities, :name
    add_index :cities, :zip


    create_table :teams do |t|
      t.integer :lock_version, :default => 0
      t.string :name, :limit => 60, :null => false, :comment => 'registered name (not user-editable); used as a verbose key during data-import (which should also create new records)'
      t.string :editable_name, :limit => 60, :null => false, :comment => 'user-editable copy of name (name should not be changed by any user)'

      t.string :address,      :limit => 100
      t.string :zip,          :limit => 6, :comment => 'used to override the generic city zip code (can be null)'
      t.string :phone_mobile, :limit => 40
      t.string :phone_number, :limit => 40
      t.string :fax_number,   :limit => 40
      t.string :e_mail,       :limit => 100
      t.string :contact_name, :limit => 100
      t.text :notes
      t.text :name_variations, :comment => '(not user-editable) used to store in a comma separated list all naming variations recorded during each sport season'

      t.references :city
      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :teams, :name
    add_index :teams, :editable_name
  end
end
