class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :title, null: false
      t.integer :yr, null: false
      t.string :album_type, default: 'studio', null: false
      t.timestamps
    end

    add_index :albums, :band_id
  end
end
