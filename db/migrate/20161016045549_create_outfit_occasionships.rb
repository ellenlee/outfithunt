class CreateOutfitOccasionships < ActiveRecord::Migration[5.0]
  def change
    create_table :outfit_occasionships do |t|
      t.integer :outfit_id
      t.integer :occasion_id
      t.index :outfit_id
      t.index :occasion_id
      t.timestamps
    end
  end
end
