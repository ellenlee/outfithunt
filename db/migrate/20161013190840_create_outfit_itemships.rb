class CreateOutfitItemships < ActiveRecord::Migration[5.0]
  def change
    create_table :outfit_itemships do |t|
    	t.integer :outfit_id
    	t.integer :item_id
    	t.index	:outfit_id
    	t.index :item_id
      t.timestamps
    end
  end
end
