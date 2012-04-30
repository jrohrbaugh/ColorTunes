class SongsController < ApplicationController
  
  def show
  	@song = Song.find(params[:id])
  	@player = @song.link
  	@color = @song.colors.build
  end
  
  def new
  	@song = Song.new
    @title = "Submit a Song"
  end
  
  def create
    @song = Song.new(params[:song])
    if @song.save
      flash[:success] = "Success!"
      redirect_to @song
    else
      @title = "Submit a song"
      render 'new'
    end
  end
  
end
