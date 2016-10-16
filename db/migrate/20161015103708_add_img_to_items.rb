class AddImgToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :img, :string
  end
end
