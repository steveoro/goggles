class CreateBodyAuxTypes < ActiveRecord::Migration
  def change
    create_table :body_aux_types do |t|

      t.timestamps
    end
  end
end
