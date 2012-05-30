class Playlist < ActiveRecord::Base

	has_and_belongs_to_many :songs
	has_one :color, :as => :colorable
	
	def self.build_playlist

	end
	
	def self.next_song
	end
	
end
