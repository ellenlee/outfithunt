class AddImgIdToOutfit < ActiveRecord::Migration[5.0]
  def change
    add_column :outfits, :image_id, :integer
    add_index :outfits, :image_id, unique: true
  end
end
