class CreateSwimmers < ActiveRecord::Migration
  def change
    create_table :swimmers do |t|

      t.timestamps
    end
  end
end
