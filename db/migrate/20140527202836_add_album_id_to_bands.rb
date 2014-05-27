class AddAlbumIdToBands < ActiveRecord::Migration
  def change
    add_column :bands, :album_id, :integer
  end
end
