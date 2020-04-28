class Admin::GenresController < ApplicationController

  before_action :authenticate_admin! , only:[:index, :edit]

	def index
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
    @genre = Genre.new(params_genre)
  	if @genre.save
  		redirect_to admin_genres_path
  	else
  		@genres = Genre.all
  		render "admin/genres/index"
  	end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
  end

  private
  def params_genre
    params.require(:genre).permit(:name)
  end

end
