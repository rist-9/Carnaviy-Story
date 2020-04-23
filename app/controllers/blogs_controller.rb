class BlogsController < ApplicationController
  def index
    @blog = Blog.new
    @blogs = Blog.all
    @users = User.all
    @user = User.find(current_user.id)
  end

  def def show
    @blog = Blog.find(params[:id])
    @user = @blog.user
  end

  def create
    @blog = Blog.new(blog_params)
    @blogs = Blog.all
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blog_path(@blog)
      @user = current_user
      render 'index'
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
    # if @blog.save
    #   redirect_to blog_path(@blog)
    # else
    #   @user = current_user
    #   render 'index'
    # end
  end

  def destroy
      blog = Blog.find(params[:id])
      blog.destroy
      redirect_to blogs_path
  end

  private
    def blog_params
      params.require(:blog).permit(:title,:introduction,:image_id)
    end
end
