class AddImageDataToMangas < ActiveRecord::Migration[6.0]
  def change
    add_column :mangas, :image_data, :text
  end
end
