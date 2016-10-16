class ChangeImageFilePath < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :img, :file_path
  end
end
