class CreateItemImageships < ActiveRecord::Migration[5.0]
  def change
    create_table :item_imageships do |t|
    	t.integer :item_id
    	t.integer :image_id
    	t.index		:item_id
    	t.index   :image_id
      t.timestamps
    end
  end
end
