class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :band_id, presence: true
      t.string :album_name, presence: true

      t.timestamps
    end
  end
end
