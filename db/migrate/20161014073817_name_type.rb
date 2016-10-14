class NameType < ActiveRecord::Migration[5.0]
  def change
  	change_column :colors, :name, :string
  	change_column :materials, :name, :string
  	change_column :categories, :name, :string
  end
end
