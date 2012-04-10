class SongsController < ApplicationController
  
  def show
  	@song = Song.find(params[:id])
  	@player = @song.link
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
      @title = "Sign up"
      render 'new'
    end
  end

end
