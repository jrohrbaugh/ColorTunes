class Playlist < ActiveRecord::Base

	attr_accessible :red, :blue, :green
	
    has_and_belongs_to_many :songs
	
	def self.build_playlist

	end
	
	def self.next_song
	end
	
	
	
end

