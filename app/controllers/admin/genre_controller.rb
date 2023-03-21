class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def new
    @genre = new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path(@genre), notice: "You have created book successfully."
    else
      @genre = Genre.all
      render 'index'
    end
  end

  def update
     @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path(@genre), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def edit
     @genre = Genre.find(params[:id])
  end

   private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
