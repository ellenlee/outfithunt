class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.integer :user_id
      t.integer :outfit_id
      t.index :user_id
      t.index :outfit_id
      t.timestamps
    end
  end
end
