class AddEndDateToGoggleCup < ActiveRecord::Migration
  def change
    change_table :goggle_cups do |t|
      t.date :end_date
    end
  end
end
