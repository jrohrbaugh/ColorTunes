class Playlist < ActiveRecord::Base

	has_and_belongs_to_many :songs
	has_one :color, :as => :colorable
end
