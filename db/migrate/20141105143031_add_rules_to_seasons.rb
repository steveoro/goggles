class AddRulesToSeasons < ActiveRecord::Migration
  def change
    change_table(:seasons) do |t|
      t.text :rules, limit: 16777215, :comment => 'Seasons rules'
    end
  end
end
