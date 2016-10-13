class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
    	t.integer :user_id
    	t.integer :color_id
    	t.integer :material_id
    	t.integer :category_id
    	t.index	:user_id
    	t.index :color_id
    	t.index :material_id
    	t.index :category_id
      t.timestamps
    end
  end
end
