class AddImgToRequest < ActiveRecord::Migration[5.0]
  def change
  	add_column :requests, :img, :string
  end
end
