class RemoveImagesFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :image_file_name, :string
    remove_column :products, :image_content_type, :string
    remove_column :products, :image_file_size, :string
    remove_column :products, :image_updated_at, :string
  end
end
