class Color < ActiveRecord::Base
  attr_accessible :red, :green, :blue, :song_id

  belongs_to :song
end
