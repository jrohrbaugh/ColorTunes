class Playlist < ActiveRecord::Base

	has_and_belongs_to_many :songs
	has_one :color, :as => :colorable

	accepts_nested_attributes_for :color

	attr_accessor :redMin, :redMax, :greenMin, :greenMax, 
				  :blueMin, :blueMax, :color_range, :block_size, 
				  :total_songs, :songs_in_range, :songs_for_playlist

	def build
		@total_songs = Song.count
		@color_range = 10
		@block_size = 0

		while !self.good_size?
			self.set_ranges
			self.check_block
			@color_range += 10
		end

		self.get_songs_in_range
		@songs_in_range.shuffle

		if @songs_in_range.count < 20
			@songs_for_playlist = @songs_in_range
		else	
			@songs_for_playlist = @songs_in_range [0, 20]
		end
		self.songs << @songs_for_playlist
	end

	def set_ranges

		@redMin = self.color.red - color_range;
		if @redMin < 0
			@redMin = 0
		end	

  		@redMax = self.color.red + color_range;
  		if @redMax > 255
  			@redMax = 255
  		end	

		@greenMin = self.color.green - color_range;
		if @greenMin < 0
			@greenMin = 0
		end	

 		@greenMax = self.color.green + color_range;
 		if @greenMax > 255
 			@greenMax = 255
 		end	

		@blueMin = self.color.blue - color_range;
		if @blueMin < 0
			@blueMin = 0
		end	

		@blueMax = self.color.blue + color_range;
		if @blueMax > 255
			@blueMax = 255
		end	
	end

	def check_block
		self.get_songs_in_range
		@block_size = @songs_in_range.count
	end

	def good_size?
		if @block_size * 20 > @total_songs
			return true
		end
	end

	def get_songs_in_range
		@songs_in_range = Song.where(:avg_red => (@redMin)..(@redMax), 
									 :avg_green => (@greenMin)..(@greenMax), 								 	
									 :avg_blue => (@blueMin)..(@blueMax)) 	
	end
	
	def self.next_song
		redirect_to @playlist.songs.next
	end
	
end
