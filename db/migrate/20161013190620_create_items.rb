class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
    	t.string :name
    	t.integer :color_id
    	t.integer :material_id
    	t.integer :category_id
    	t.index :color_id
    	t.index :material_id
    	t.index :category_id
      t.timestamps
    end
  end
end
