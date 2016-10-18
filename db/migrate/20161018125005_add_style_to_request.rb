class AddStyleToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :style_id, :integer
    add_index :requests, :style_id
  end
end
