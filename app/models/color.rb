class Color < ActiveRecord::Base
  attr_accessible :red, :green, :blue, :colorable_id, :colorable_type

  belongs_to :colorable, :polymorphic => true

  after_save do
  	  if self.colorable_type == "Song"
	  	@song = Song.where(:id =>self.colorable_id).first
	  	@song.avg_red = @song.colors.average(:red).to_i
	  	@song.avg_green = @song.colors.average(:green).to_i
	  	@song.avg_blue = @song.colors.average(:blue).to_i
	  	@song.save!
	  end
  end
end
