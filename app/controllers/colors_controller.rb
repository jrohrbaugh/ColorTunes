class ColorsController < ApplicationController

  def create
    @color = current_song.colors.build(params[:red, :blue, :green])
  end