class PlaylistsController < ApplicationController


    def new
        @playlist = Playlist.new
        @title = "Create a Playlist"
    end

    def show
        @playlist = Playlist.find(params[:id])
        redirect_to @playlist.songs_for_playlist
    end

    def create
        @playlist = Playlist.new(params[:playlist])
  	
        if @playlist.save
            flash[:success] = "Success!"
            @playlist.build
            redirect_to @playlist.songs.first
        else
            flash[:failure] = "Failure!"
            render 'home'
        end
    end
end
