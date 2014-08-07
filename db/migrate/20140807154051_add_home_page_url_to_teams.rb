class AddHomePageUrlToTeams < ActiveRecord::Migration
  def up
    change_table :teams do |t|
      t.string :home_page_url, limit: 150, :comment => 'The URL of Team home page'
    end
  end
  # --------------------------------------------------------------------------- 

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # --------------------------------------------------------------------------- 
end
