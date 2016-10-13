class CreateColors < ActiveRecord::Migration[5.0]
  def change
    create_table :colors do |t|
    	t.integer :name
    	t.index :name, unique: true
      t.timestamps
    end
  end
end
