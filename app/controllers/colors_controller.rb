class ColorsController < ApplicationController

  

  def create 
  	@song = Song.find(params[:song_id])
  
    @color = @song.colors.build(params[:color])
    
    if @color.save
      flash[:success] = "Success!"
      redirect_to @song
    else
      flash[:failure] = "Failure!"
      redirect_to @song
    end
  end
  
  def show
  	@color = Color.find(params[:id])
  end

end