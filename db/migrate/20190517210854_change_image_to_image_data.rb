class ChangeImageToImageData < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :image, :image_data
  end
end
