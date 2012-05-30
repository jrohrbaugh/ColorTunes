class Color < ActiveRecord::Base
  attr_accessible :red, :green, :blue, :colorable_id, :colorable_type

  belongs_to :colorable, :polymorphic => true
end
