class Admin::BlogsController < ApplicationController

  before_action :authenticate_admin! , only:[:index, :show, :edit]

  def index
    @blogs = Blog.all.page(params[:page]).per(5)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def update
    @blog = Blog.new
    if @blog.update(blog_params)
      redirect_to admin_blogs_path(@blog)
     else
       @user = current_user
       render 'admin/blogs/index'
    end
  end

  def destroy
      blog = Blog.find(params[:id])
      blog.destroy
      redirect_to admin_blogs_path
  end

  private
    def blog_params
      params.require(:blog).permit(:title,:introduction,:image,:genres_id)
    end

end
