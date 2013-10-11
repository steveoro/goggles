class CreateTableSwimmingPoolsAndLookups < ActiveRecord::Migration
  def change
    create_table :shower_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 3, :null => false
      # Virtual fields that need to use locale + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"
      t.timestamps
    end
    add_index :shower_types, :code, :unique => true

    create_table :hair_dryer_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 3, :null => false
      # Virtual fields that need to use locale + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"
      t.timestamps
    end
    add_index :hair_dryer_types, :code, :unique => true

    create_table :locker_cabinet_types do |t|
      t.integer :lock_version, :default => 0
      t.string :code, :limit => 3, :null => false
      # Virtual fields that need to use locale + i18n translation:
#      t.string :i18n_short = "i18n_short_#{ code }"
#      t.string :i18n_description = "i18n_description_#{ code }"
      t.timestamps
    end
    add_index :locker_cabinet_types, :code, :unique => true


    create_table :swimming_pools do |t|
      t.integer :lock_version,  :default => 0
      t.string :name,           :limit => 100, :null => false
      t.string :address,        :limit => 100
      t.string :zip,            :limit => 6, :comment => 'used to override the generic city zip code (can be null)'
      t.string :nick_name,      :limit => 50, :null => false

      t.string :phone_number,   :limit => 40
      t.string :fax_number,     :limit => 40
      t.string :e_mail,         :limit => 100
      t.string :contact_name,   :limit => 100

      t.string :maps_uri, :comment => 'Google Maps URI or similar'

      t.integer :lanes_number, :limit => 2, :null => false, :default => 8
      t.boolean :has_multiple_pools, :null => false, :default => false
      t.boolean :has_open_area, :null => false, :default => false
      t.boolean :has_bar, :null => false, :default => false
      t.boolean :has_restaurant_service, :null => false, :default => false
      t.boolean :has_gym_area, :null => false, :default => false
      t.boolean :has_children_area, :null => false, :default => false
      t.text :notes

      t.references :city
      t.references :pool_type
      t.references :shower_type
      t.references :hair_dryer_type
      t.references :locker_cabinet_type
      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :swimming_pools, :nick_name, :unique => true
    add_index :swimming_pools, :name
  end
end
