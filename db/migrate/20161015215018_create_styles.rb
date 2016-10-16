class CreateStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :styles do |t|
      t.string :name
      t.index  :name, unique: true
      t.timestamps
    end
    remove_index :colors, :name
    remove_index :materials, :name
    remove_index :categories, :name
    remove_index :brands, :name
    add_index :colors, :name, unique: true
    add_index :materials, :name, unique: true
    add_index :categories, :name, unique: true
    add_index :brands, :name, unique: true
    add_index :images, :name, unique: true
  end
end
