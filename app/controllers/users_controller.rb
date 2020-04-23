class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
      if current_user.id != @user.id
      redirect_to edit_user_path(current_user)
      end
  end

  def update
  end

end
