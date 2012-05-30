class ColorsController < ApplicationController



  def show
    @color = Color.find(params[:id])
  end

  def new
    @color = Color.new
  end

  def create   
    @colorable = find_colorable
    @color = @colorable.colors.build(params[:color])
    
    if @color.save
      flash[:success] = "Success"
      if @color.colorable_id = "song"
        redirect_to :back
      else
        #path for playlists
        redirect_to :id => nil
      end

    else
      flash[:failure] = "Failure!"
        if @color.colorable_id = "song"
        redirect_to :back
        else
        #path for playlists
        redirect_to :id => nil
      end
    end
  end

  private

  def find_colorable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  


end