class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string  :track_name, presence: true
      t.integer :album_id
      t.string  :lyrics

      t.timestamps
    end
  end
end
