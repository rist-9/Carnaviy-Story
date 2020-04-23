class HomeController < ApplicationController
  def top
  end

  def creare
    @blog = Blog.new(blog_params) #Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
    @blogs = Blog.all
    @blog.user_id = current_user.id
    if @blog.save #入力されたデータをdbに保存する。
      redirect_to blog_path(@blog), notice: "successfully created book!"#保存された場合の移動先を指定。
    else
      @user = current_user
      render 'index'
    end
  end
end
