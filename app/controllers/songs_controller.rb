class SongsController < ApplicationController
  # index
  def index
    @songs = Song.all
  end

  # new
  def new
    @song = Song.new
    @artist = Artist.find(params[:artist_id])
  end

  # create
  def create
    @artist = Artist.find(params[:artist_id])
    @artist.songs.create!(song_params)

    redirect_to artist_path(@artist)
  end

  #show
  def show
    @song = Song.find(params[:id])
    @artist = Artist.find(params[:artist_id])
  end

  # edit
  def edit
    @song = Song.find(params[:id])
    @artist = Artist.find(params[:artist_id])
  end

  # update
  def update
    @song = Song.find(params[:id])
    @song.update(song_params)

    redirect_to songs_path(@song)
  end

  # destroy
  def destroy
    @song = Song.find(params[:id])
    @artist = Artist.find(params[:artist_id])
    @song.destroy

    redirect_to songs_path
  end

  private
  def song_params
    params.require(:song).permit(:title, :album, :preview_url, :artist_id)
  end
end
