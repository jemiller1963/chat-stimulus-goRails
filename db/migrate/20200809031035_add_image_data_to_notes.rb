class AddImageDataToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :image_data, :text
  end
end
