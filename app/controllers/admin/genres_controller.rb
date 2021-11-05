class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def create
    @genre = Genre.new
    if @genre.save
      redirect_to edit_admin_genres_path
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre.params)
      redirect_to genres_path
    end
  end

  private
  def
    params.require(:genre).permit(:name)
  end
end


