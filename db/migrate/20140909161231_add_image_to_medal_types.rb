class AddImageToMedalTypes < ActiveRecord::Migration
  def change
    change_table(:medal_types) do |t|
      t.string :image_uri, limit: 50, :comment => 'Image URI for rendering purposes'
    end
  end
end
