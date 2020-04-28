class UsersController < ApplicationController

  before_action :authenticate_user! , only:[:edit, :show, :confirm]

  def new
  	@user = User.new
  end

  def index
    @users = User.all.page(params[:page]).per(5)
    @user = User.find(current_user.id)
    @blog = Blog.new
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs
  end

  def edit
    @user = User.find(params[:id])
      if current_user.id != @user.id
      redirect_to edit_user_path(current_user)
      end
  end

  def update
    @user = User.find(params[:id])
    if params[:status] == "false"
      @user.update_columns(status: false)
      sign_out_and_redirect(current_user)
    else
      if @user.update(user_params)
        sign_in(@user, :bypass => true)
        redirect_to user_path(@user.id)
      else
        render :edit
      end
    end
  end

  def search
    
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :telephone, :password, :status, :profile_image)
  end

end
