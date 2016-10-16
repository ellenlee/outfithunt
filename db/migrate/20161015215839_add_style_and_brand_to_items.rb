class AddStyleAndBrandToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :style_id, :integer
    add_column :items, :brand_id, :integer
  end
end
