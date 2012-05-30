class PlaylistsController < ApplicationController


  def show
  	@playlist = Playlist.find(params[:id])
    redirect_to @playlist.songs.first
  end

  def create
  	@playlist = Playlist.new(params[:playlist])
  	
    if @playlist.save
      flash[:success] = "Success!"
      redirect_to @playlist.songs.first
    else
      flash[:failure] = "Failure!"
      render 'home'
    end
  end
  

end
