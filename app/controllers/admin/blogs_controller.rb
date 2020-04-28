class Admin::BlogsController < ApplicationController

  before_action :authenticate_admin! , only:[:index, :show, :edit]

  def index
    @blogs = Blog.all.page(params[:page]).per(5)
  end

end
