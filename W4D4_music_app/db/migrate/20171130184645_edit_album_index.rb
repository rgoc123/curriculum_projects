class EditAlbumIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index :albums, :band_id
    remove_index :albums, [:studio, :band_id]
    add_index :albums, [:title, :studio, :band_id], unique: true
    add_index :albums, :band_id
  end
end
