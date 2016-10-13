class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
    	t.integer :name
    	t.index :name, unique: true
      t.timestamps
    end
  end
end
