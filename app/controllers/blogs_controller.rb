class BlogsController < ApplicationController

  before_action :authenticate_user! , only:[:edit, :show]

  def index
    @blog = Blog.new
    if params[:query].present?
      genre_ids = Genre.where('name LIKE ?', "%#{params[:query]}%").pluck(:id)
      @blogs = Blog.where(genre_id: genre_ids).page(params[:page]).per(5)
    else
      @blogs = Blog.all.page(params[:page]).per(5)
    end
    @users = User.all
    @user = User.find(current_user.id)
  end

  def show
    @blog = Blog.find(params[:id])
    @blog_comment = BlogComment.new
    @genre = @blog.genre
  end

  def create
    @blog = Blog.new(blog_params)
    @blogs = Blog.all
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blog_path(@blog)
      @user = current_user
    else
      render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.new
    if @blog.save
      redirect_to blog_path(@blog)
     else
       @user = current_user
       render 'index'
    end
  end

  def new
    @blog = Blog.new
  end

  def destroy
      blog = Blog.find(params[:id])
      blog.destroy
      redirect_to blogs_path
  end

  private
    def blog_params
      params.require(:blog).permit(:title,:introduction,:image,:genre_id)
    end
end
