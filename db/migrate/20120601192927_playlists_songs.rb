class PlaylistsSongs < ActiveRecord::Migration
  def up
	create_table :playlists_songs, :id => false do |t|
  		t.references :playlist, :null => false
  		t.references :song, :null => false
	end
	add_index :playlists_songs, [:playlist_id, :song_id], :unique => true
  end

  def down
  	drop_table :playlists_songs
  	remove_index :playlists_songs, [:playlist_id, :song_id], :unique => true
  end
end
