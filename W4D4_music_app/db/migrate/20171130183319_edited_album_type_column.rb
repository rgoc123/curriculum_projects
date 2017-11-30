class EditedAlbumTypeColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :album_type
    add_column :albums, :studio, :boolean, default: true, null: false
    add_index :albums, [:studio, :band_id, :studio], unique: true
  end
end
